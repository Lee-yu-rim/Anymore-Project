package com.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/about/*")
public class aboutController {
	@GetMapping("/introduce")
	public void introduce() {
		
	}
	
	@GetMapping("/map")
	public void map() {
		
	}
	
	@GetMapping("/facility")
	public void facility() {
		
	}
	
	@GetMapping("/support")
	public void support() {
		
	}
}
