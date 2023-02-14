package com.zerock.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.zerock.domain.CriteriaAR;
import com.zerock.service.ARService;
import com.zerock.service.ProtectAnimalService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class indexController {
	
	@Setter(onMethod_= @Autowired)
	private ProtectAnimalService protectService;
	
	@Setter(onMethod_= @Autowired)
	private ARService service;
	
	@Setter(onMethod_= @Autowired)
	private ARService ar;
	
	@GetMapping("/index")
	public void home2(Model model, CriteriaAR cri) {
		
		// 보호중 아이들 이미지 보여주기
		model.addAttribute("animal_file", protectService.imageAnimalList());
//		log.info("메인 보호중 아이들 이미지 : " + protectService.imageAnimalList());
		// 보호중 아이들 목록 보여주기
		model.addAttribute("animal_list", protectService.animalList());
//		log.info("메인 보호중 아이들 내용 : " + protectService.animalList());
		
		// 입양후기 이미지 보여주기
		model.addAttribute("ar_img", service.imageList());
//		log.info("메인 입양 후기 이미지 파일 : " + service.imageList());
		// 입양 후기 글 내용 보여주기
		model.addAttribute("ar_list", service.getARList());
//		log.info("메인 입양 후기 내용 : " + service.getARList());
		
		//입양완료 카운트
		model.addAttribute("count1", ar.getTotal(cri));
		log.info(ar.getTotal(cri));
		
		//보호중 아이들 카운트
		model.addAttribute("count2", protectService.getTotal(cri));
		log.info(protectService.getTotal(cri));
		
	}
	
	
}
 