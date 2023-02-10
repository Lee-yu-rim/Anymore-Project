package com.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zerock.domain.Criteria;
import com.zerock.domain.PageDTO;
import com.zerock.domain.QNAVO;
import com.zerock.domain.ReplyVO;
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
		if(qna.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/customerService/qna";
	}
	
//	@PostMapping("/get")
//	public String registerReply(ReplyVO reply) {
//		log.info("Post Get...");
//		
//		// 등록 작업
//		qnaReply.registerReply(reply);
//		
//		return "redirect:/customerService/get?bno=" + reply.getBno();
//	}
	
	
//	// 댓글 목록 ajax
//	@ResponseBody
//	@GetMapping(value = "/get/replyList")
//	public List<ReplyVO> getReplyList(@RequestParam("bno") Long bno) throws Exception {
//		 log.info("get reply list");
//		   
//		 List<ReplyVO> reply = qnaReply.getList(bno);
//		 
//		 return reply;
//		} 
//	
//	// 댓글 쓰기 ajax
//	@ResponseBody
//	@PostMapping(value = "/get/registerReply")
//	public void registerReply(ReplyVO reply) {
//		log.info("register Reply...");
//		
//		qnaReply.registerReply(reply);
//	}
//	
//	// 댓글 삭제 ajax
//	@ResponseBody
//	@PostMapping("/get/deleteReply")
//	public void deleteReply(ReplyVO reply) {
//		log.info("delete Reply");
//		qnaReply.deleteReply(reply);
//	}

}
