package com.zerock.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zerock.domain.MemberVO;
import com.zerock.domain.PassFindVO;
import com.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class memberController {
	
	private MemberService service;
	
	//로그인 페이지 이동
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String go_login() {
		log.info("login......");
		return "/member/login";
	}
	
	//사용자 로그인 처리
	@RequestMapping(value = "/login_go", method = RequestMethod.POST)
	public String login_go(MemberVO member, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		log.info("login......");
		
		HttpSession session = request.getSession();
		
		MemberVO loginvo = service.login(member);
		
		if(loginvo == null) {
			session.setAttribute("loginfail", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/login";
		}else {
			session.setAttribute("member", loginvo);
			return "/index";
		}
    }
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		log.info("logout.........");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "redirect:/index";
	}
	
	//비밀번호 찾기 페이지 이동
	@RequestMapping(value = "/member/pass_find", method = RequestMethod.GET)
	public String go_passfind() {
		log.info("passfind......");
		return "/member/pass_find";
	}
	
	//비밀번호 찾기 처리
	@ResponseBody
	@RequestMapping(value = "/pass_find_result", method = RequestMethod.POST)
	public String f_pass(PassFindVO vo) {
		log.info("password find....");
		
		PassFindVO result = service.pass_find(vo);
		
		return result.getPassword();
		
	}
}
