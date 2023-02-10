package com.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zerock.domain.ARPageDTO;
import com.zerock.domain.ARVO;
import com.zerock.domain.Criteria;
import com.zerock.domain.CriteriaAR;
import com.zerock.service.ARService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/community/*")
@AllArgsConstructor
public class ARController {
	
private ARService service;
	
	// 입양후기 목록처리
	@GetMapping("/adoptionReview")
	public void list(CriteriaAR cri, Model model) {
		log.info("adoptionReview : " + cri);
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new ARPageDTO(cri, total));
	}
	
	// 입양후기 등록하기
	@GetMapping("/registerAR")
	public void register() {
		
	}
	
	// 입양후기 등록처리
	@PostMapping("/registerAR")
	public String register(ARVO adoptionReview, RedirectAttributes rttr) {
		
		log.info("register : " + adoptionReview);
		
		service.register(adoptionReview);
		
		rttr.addFlashAttribute("result", adoptionReview.getBno()); 
		
		return "redirect:/community/adoptionReview";
	}
	
	
	// 입양후기 조회
	@GetMapping("/getAR")		
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/getAR");
		
		service.updateVisitCnt(bno);
		
		model.addAttribute("adoptionReview", service.get(bno));
	}
	
	// 입양후기 수정 처리
	@GetMapping("/modifyAR")		
	public void modify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/modifyAR");
		
		model.addAttribute("adoptionReview", service.get(bno));
	}
	
	// 입양후기 수정처리
	@PostMapping("/modifyAR")
	public String modify(ARVO adoptionReview, @ModelAttribute("cri") CriteriaAR cri, RedirectAttributes rttr) {
		
		log.info("modify : " + adoptionReview);
		
		if(service.modify(adoptionReview)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/community/adoptionReview";
	}
	
	
	// 입양후기 삭제처리
	@PostMapping("/removeAR")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") CriteriaAR cri, RedirectAttributes rttr) {
		
		log.info("removeAR..." + bno);
		
		//List<BoardAttachVO> attachList = service.getAttachList(bno);	
		
		if(service.remove(bno)) {
			
			//deleteFiles(attachList);	// 여기에서 호출해야 삭제처리 오류시 롤백이 가능하다.
			
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/community/adoptionReview";
	}
	
}
