package com.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zerock.domain.ReserVO;
import com.zerock.service.ReserService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/reservation/*")
@AllArgsConstructor
public class reserController {
	
	@Setter(onMethod_= @Autowired)
	private ReserService service;
	
	// 방문예약
	@GetMapping("/visit")
	public void visit() {
		
	}
	
	// 방문예약 등록
	@PostMapping("/visit")
	public String registerVisit(ReserVO reser, Model model, RedirectAttributes rttr) {
		
		log.info("visit : " + reser);
		
		service.register(reser);

		Long num = reser.getNum();
		
		log.info(num);

		
		rttr.addAttribute("num", num);
		
		return "redirect:/reservation/completed";
		
	}
	
	
	// 방문예약 확인
	@GetMapping("/completed")
	public void getVisit(@RequestParam("num") Long num, Model model) {
		
		model.addAttribute("reserVisit", service.get(num));
		
	}
	
	
	

	
	///////////////////////////////////////////////////////////////////////
	
	
	// 봉사활동 예약
	@GetMapping("/volunteer")
	public void volunteer() {
		
	}
	
	

	

	

}