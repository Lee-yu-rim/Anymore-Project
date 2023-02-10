package com.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zerock.domain.Criteria;
import com.zerock.domain.FAQAttachVO;
import com.zerock.domain.NoticeAttachVO;
import com.zerock.domain.PageDTO;
import com.zerock.domain.QNAFileUploadVO;
import com.zerock.domain.QNAVO;
import com.zerock.service.FAQService;
import com.zerock.service.NoticeService;
import com.zerock.service.QNAReplyService;
import com.zerock.service.QNAService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/customerService/*")
public class CustomerController {
	
	@Setter(onMethod_= @Autowired)
	private NoticeService notice;
	
	@Setter(onMethod_= @Autowired)
	private QNAService qna;
	
	@Setter(onMethod_= @Autowired)
	private FAQService faq;
	
	@Setter(onMethod_= @Autowired)
	private QNAReplyService qnaReply;

	
	
	// 공지사항 전체 목록 보여주기
	@GetMapping("/notice")
	public void noticeList(Criteria cri, Model model) {
		log.info("Notice List : " + cri);
		
		model.addAttribute("list", notice.getList(cri));
		
		int total = notice.getTotal(cri);
		log.info("Notice total:" + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// 공지사항 상세글 보여주기
	@GetMapping("/noticeget")
	public void noticeget(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("Notice get.....");
		// 조회수 카운트
		notice.viewCount(bno);
		model.addAttribute("noticeget", notice.get(bno));		
	}
	
////////////////////////////////////////////////////////////////////////////////////////
	
	// FAQ 전체 목록 보여주기
	@GetMapping("/faq")
	public void faqList(Criteria cri, Model model) {
		log.info("FAQ List : " + cri);
		
		model.addAttribute("list", faq.getList(cri));
		
		int total = faq.getTotal(cri);
		log.info("FAQ total:" + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// FAQ 상세글 보여주기
	@GetMapping("/faqget")
	public void faqget(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("faqget....");
		// 조회수 카운트
		faq.viewCount(bno);
		model.addAttribute("faqget", faq.get(bno));		
	}
	
	
////////////////////////////////////////////////////////////////////////////////////////

	
	// 문의하기(qna) 전체 목록 보여주기 + 페이지처리 + 전체 글 가져오기
	@GetMapping("/qna")
	public void list(Criteria cri, Model model) {
		log.info("QNA List : " + cri);
		
		model.addAttribute("list", qna.getList(cri));
		// model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total = qna.getTotal(cri);
		log.info("QNA total:" + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	
	// 문의하기(qna) 글쓰기 폼 띄우기
	@GetMapping("/register")
	public void register() {
		
	}
	
	// 문의하기(qna) 글쓰고 반영되게
	@PostMapping("/register")
	public String register(QNAVO vo, RedirectAttributes rttr) {
		log.info("register..." + vo);
		
		log.info("============================");
		if(vo.getQnaAttachList() != null) { 
			vo.getQnaAttachList().forEach(attach -> log.info(attach));
		}
		log.info("============================");
		
		qna.register(vo);
		rttr.addFlashAttribute("result", vo.getBno());
		
		return "redirect:/customerService/qna";
	}
	
	// 문의하기(qna) 게시글 읽기 + 수정하기 버튼
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		// 조회수 카운트
		qna.viewCount(bno);
		//model.addAttribute("replylist", qnaReply.getList());
		model.addAttribute("board", qna.get(bno));
	}
	
	// 문의하기(qna) 게시글 수정 처리
	@PostMapping("/modify")
	public String modify(QNAVO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify...:" + vo);
		if(qna.modify(vo)) {
			rttr.addAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/customerService/qna";
	}
	
	// 문의하기(qna) 게시글 삭제 처리
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove : " + bno);
		
		// 삭제가 되기 전에 파일의 정보를 가져와야 하기 때문에 service.getAttachList를 호출하여 bno에 관련된 파일 정보를 가져올 수 있다.
		List<QNAFileUploadVO> attachList = qna.qnaGetAttachList(bno);
		
		if(qna.remove(bno)) {
			qnaDeleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/customerService/qna";
	}
	
	
	// ------------------------------------- 파일업로드 ----------------------------------
	
	// notice - 특정한 게시물 번호를 이용해서 첨부파일과 관련된 데이터를 JSON으로 반환
	@GetMapping(value = "/noticeGetAttachList",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<NoticeAttachVO>> noticeGetAttachList(Long bno){
		log.info("noticeGetAttachList : " + bno);
		return new ResponseEntity<List<NoticeAttachVO>>(notice.getAttachList(bno), HttpStatus.OK);
	}		
	
	// faq - 특정한 게시물 번호를 이용해서 첨부파일과 관련된 데이터를 JSON으로 반환
	@GetMapping(value = "/faqGetAttachList",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<FAQAttachVO>> faqGetAttachList(Long bno){
		log.info("faqGetAttachList : " + bno);
		return new ResponseEntity<List<FAQAttachVO>>(faq.getAttachList(bno), HttpStatus.OK);
	}	

	
	
	// 물리적인 경로에서 해당파일을 삭제(테이블에서 데이터가 정확하게 삭제된 이후에)
	private void qnaDeleteFiles(List<QNAFileUploadVO> attachList) {
		
		if(attachList == null || attachList.size() == 0) {
			
			return;
		}
		
		log.info("delete attach files..............");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
		        Path file  = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid()+"_"+ attach.getFileName());
		        
		        Files.deleteIfExists(file);
		        
		        if(Files.probeContentType(file).startsWith("image")) {
		        
		          Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid()+"_"+ attach.getFileName());
		          
		          Files.delete(thumbNail);
		        }
		        
			} catch(Exception e) {
				log.error("delete file error" + e.getMessage());
			}
		});
	}	
	
	
	// qna - 특정한 게시물 번호를 이용해서 첨부파일과 관련된 데이터를 JSON으로 반환
	@GetMapping(value = "/qnaGetAttachList",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<QNAFileUploadVO>> qnaGetAttachList(Long bno){
		log.info("qnaGetAttachList : " + bno);
		return new ResponseEntity<List<QNAFileUploadVO>>(qna.qnaGetAttachList(bno), HttpStatus.OK);
	}	
	
	

}
