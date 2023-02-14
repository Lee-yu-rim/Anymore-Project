package com.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

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
import com.zerock.domain.PageDTO;
import com.zerock.domain.UIAttachVO;
import com.zerock.domain.UIVO;
import com.zerock.service.UIService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/community/*")
@AllArgsConstructor
public class UIController {
	
private UIService service;
	
	// 중고거래 목록처리
	@GetMapping("/usedItems")
	public void list(Criteria cri, Model model) {
		log.info("usedItems : " + cri);
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// 중고거래 등록하기
	@GetMapping("/registerUI")
	public void register() {
		
	}
	
	// 중고거래 등록처리
	@PostMapping("/registerUI")
	public String register(UIVO usedItems, RedirectAttributes rttr) {
		
		log.info("register : " + usedItems);
		
		if(usedItems.getAttachList() != null){
			
			usedItems.getAttachList().forEach(attach -> log.info(attach));
		}
		
		service.register(usedItems);
		
		rttr.addFlashAttribute("result", usedItems.getBno()); 
		
		return "redirect:/community/usedItems";
	}
	
	
	// 중고거래 조회
	@GetMapping("/getUI")		
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/getUI");
		
		service.updateVisitCnt(bno);
		
		model.addAttribute("usedItems", service.get(bno));
	}
	
	// 중고거래 수정 처리
	@GetMapping("/modifyUI")		
	public void modify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/modifyUI");
		
		model.addAttribute("usedItems", service.get(bno));
	}
	
	// 중고거래 수정처리
	@PostMapping("/modifyUI")
	public String modify(UIVO usedItems, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("modify : " + usedItems);
		
		if(service.modify(usedItems)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/community/usedItems";
	}
	
	
	// 중고거래 삭제처리
	@PostMapping("/removeUI")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("removeUI..." + bno);
		
		List<UIAttachVO> attachList = service.getAttachList(bno);	
		
		if(service.remove(bno)) {
			
			deleteFiles(attachList);	
			
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/community/usedItems";
	}
	
	// 중고거래 첨부파일
	@GetMapping(value = "/getAttachListUI", produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<UIAttachVO>> getAttachList(Long bno){
		log.info("getAttachList " + bno);
		
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	
	// 중고거래 첨부파일 삭제
	private void deleteFiles(List<UIAttachVO> attachList) {	// 물리적인 경로에서 해당파일을 삭제하는 역할
			
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("delete attach files..............");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid() + "_" + attach.getFileName());
				// Paths.get : 특정 경로의 파일 정보를 가져온다.
				Files.deleteIfExists(file);
				// 파일이 존재하는 경우 삭제하고, 파일이 존재하지 않으면 false를 리턴한다.
				
				if(Files.probeContentType(file).startsWith("image")) {	// mime 타입이 image로 시작한다면 썸네일을 지워준다.
					Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid() + "_" + attach.getFileName());
					
					Files.delete(thumbNail);
					// 메소드를 사용하여 파일 또는 디렉토리 삭제. 대상이 없으면 NoSuchFileException 에러 발생
				}
				
			}catch(Exception e) {
				log.error("delete file error" + e.getMessage());
			}
		});
		
	}
	
}
