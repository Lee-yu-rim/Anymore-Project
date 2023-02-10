package com.zerock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zerock.domain.MemberVO;
import com.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class KakaoController {
	
	private MemberService service;
	
	//카카오 회원 가입
	@RequestMapping(value = "/member/kakao_login", method = RequestMethod.POST)
    public String kakao_register(MemberVO member, String kakao_email, HttpServletRequest request, RedirectAttributes rttr) {
		
       MemberVO kakaoChk = service.kakao_check(kakao_email);
       
       //카카오 회원가입 여부 체크
       if(kakaoChk == null) { //카카오 이메일이 없다면 회원가입 진행 후 로그인
    	   log.info("kakao register: " + member);
           service.kakao_insert(member);

           try {
    		   
    		   HttpSession session = request.getSession();
    		   MemberVO loginvo = service.login(member);
    			
    			if(loginvo == null) {
    				session.setAttribute("loginfail", null);
    				rttr.addFlashAttribute("msg", false);
    				return "redirect:/member/login";
    			}else {
    				session.setAttribute("member", loginvo);
    				return "redirect:/index";
    			}
    			
    	   } catch (Exception e) {
    		   e.printStackTrace();
    	   }
           
       }else {  //카카오 이메일이 있다면 로그인 진행
    	   log.info("kakao login");
    	   
    	   try {
    		   
    		   HttpSession session = request.getSession();
    		   MemberVO loginvo = service.login(member);
    			
    			if(loginvo == null) {
    				session.setAttribute("loginfail", null);
    				rttr.addFlashAttribute("msg", false);
    				return "redirect:/member/login";
    			}else {
    				session.setAttribute("member", loginvo);
    				return "redirect:/index";
    			}
    			
    	   } catch (Exception e) {
    		   e.printStackTrace();
    	   }
    	   
       }
       
	return "redirect:/member/login";
      
    }
	
}
