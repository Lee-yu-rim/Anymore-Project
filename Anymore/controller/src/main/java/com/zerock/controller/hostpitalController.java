package com.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/hospital/*")
public class hostpitalController {
	@GetMapping("/animal_hospital")
	public void animal_hospital() {
		
	}
}
