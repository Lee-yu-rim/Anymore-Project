package com.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zerock.domain.Criteria;
import com.zerock.domain.PageDTO;
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
		
		//List<BoardAttachVO> attachList = service.getAttachList(bno);	
		
		if(service.remove(bno)) {
			
			//deleteFiles(attachList);	// 여기에서 호출해야 삭제처리 오류시 롤백이 가능하다.
			
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/community/usedItems";
	}
	
}
