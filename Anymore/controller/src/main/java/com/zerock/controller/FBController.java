package com.zerock.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zerock.domain.Criteria;
import com.zerock.domain.FBVO;
import com.zerock.domain.PageDTO;
import com.zerock.service.FBService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/community/*")
@AllArgsConstructor
public class FBController {
	

	private FBService service;
	
	// 자유게시판 목록처리
	@GetMapping("/freeBoard")
	public void list(Criteria cri, Model model) {
		log.info("freeBoard : " + cri);
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// 자유게시판 등록하기
	@GetMapping("/registerFB")
	public void registerFB() {
		
	}
	
	// 자유게시판 등록처리
	@PostMapping("/registerFB")
	public String register(FBVO freeBoard, RedirectAttributes rttr) {
		
		log.info("register : " + freeBoard);
		
		service.register(freeBoard);
		
		rttr.addFlashAttribute("result", freeBoard.getBno()); 
		
		return "redirect:/community/freeBoard";
	}
	
	
	// 자유게시판 조회
	@GetMapping("/getFB")		
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/getFB");
		
		service.updateVisitCnt(bno);
		
		model.addAttribute("freeBoard", service.get(bno));
	}
	
	// 자유게시판 수정 처리
	@GetMapping("/modifyFB")		
	public void modify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/modifyFB");
		
		model.addAttribute("freeBoard", service.get(bno));
	}
	
	// 자유게시판 수정처리
	@PostMapping("/modifyFB")
	public String modify(FBVO freeBoard, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("modify : " + freeBoard);
		
		if(service.modify(freeBoard)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/community/freeBoard";
	}
	
	
	// 자유게시판 삭제처리
	@PostMapping("/removeFB")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("removeFB..." + bno);
		
		//List<BoardAttachVO> attachList = service.getAttachList(bno);	
		
		if(service.remove(bno)) {
			
			//deleteFiles(attachList);	// 여기에서 호출해야 삭제처리 오류시 롤백이 가능하다.
			
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/community/freeBoard";
	}
	
	

	

	
	
	
}
