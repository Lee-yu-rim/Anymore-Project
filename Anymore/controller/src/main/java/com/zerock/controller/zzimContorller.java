package com.zerock.controller;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zerock.domain.ZzimVO;
import com.zerock.service.ZzimService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adopt/animalDetails/*")
public class zzimContorller {

	@Setter(onMethod_= @Autowired)
	private ZzimService service;
	
	// 찜하기
	@ResponseBody
	@PostMapping("/zzim")
	public void zzim(@RequestBody ZzimVO zzimvo) {
		
		System.out.println(zzimvo);
		
		service.zzimGood(zzimvo);
		
		log.info("zzim Success...!!");
	}
	
	// 찜삭제
	@ResponseBody
	@DeleteMapping("/zzimDelete")
	public void zzimDelete(@RequestBody ZzimVO zzimvo) {
		System.out.println(zzimvo);
		
		service.deleteZzim(zzimvo);
		
		log.info("zzim Delete....!!");
	}

	
}
