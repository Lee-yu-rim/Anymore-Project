package com.zerock.controller;

import javax.servlet.http.HttpServletRequest;

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
import com.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class joinController {
	
	private MemberService service;
	
	//회원가입 - 메인
	@RequestMapping(value = "/join/join_main", method = RequestMethod.GET)
    public String join_main() {
       log.info("go join_main");
      
       return "/join/join_main";
   
    }
	
	//회원가입 - 약관 동의 페이지로 이동
	@RequestMapping(value = "join/join_terms", method = RequestMethod.GET)
    public String join_terms() {
       log.info("go join_terms");
      
       return "/join/join_terms";
   
    }
	
	//회원가입 - 정보 입력 페이지로 이동
	@RequestMapping(value = "/join/join_form", method = RequestMethod.POST)
    public String join_form() {
       log.info("go join_form");
      
       return "/join/join_form";
   
    }
	
	/////////////////////////////////////////////////////////////////////////프로세스
	
	//회원 목록 가져오기
	@RequestMapping(value = "/join/member_list", method = RequestMethod.GET)
	public void list(Model model) {
		log.info("member_list");
		
		model.addAttribute("list", service.getList());
	}
	
	//회원가입 처리(회원 등록) - 회원 가입 완료 페이지로 이동
	@RequestMapping(value = "/join/join_complete", method = RequestMethod.POST)
    public String register(MemberVO member) {
       log.info("register: " + member);
       
       service.register(member);
      
       return "/join/join_complete";
    }
	
	//회원 정보 상세보기
	@RequestMapping(value = "/join/member_info", method = RequestMethod.GET)
	public void get(@RequestParam("id") String id, Model model) {
		log.info("/member_info");
		model.addAttribute("member", service.get(id));
	}
	
	//회원 정보 수정
	@RequestMapping(value = "/join/member_modify", method = RequestMethod.POST)
	public String modify(MemberVO member) {
		log.info("modify: " + member);
		service.modify(member);
		return "/join/member_modify";
	}
	
	//회원 정보 삭제
	@RequestMapping(value = "/join/member_remove", method = RequestMethod.POST)
	public String remove(@RequestParam("id") String id) {
		log.info("remove......" + id);
		service.remove(id);
		//나중에 메인페이지로 바꾸기
		return "/join/member_remove";
	}
	
	//회원가입 - 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idChecking(HttpServletRequest request) {
		log.info("id check..........");
		
		String user_id = request.getParameter("id");
		
		MemberVO idCheck =  service.idCheck(user_id);
		 
		int result = 0;
		 
		if(idCheck != null) {
		  result = 1;
		} 
		 
		return result;
	}
	
	

}
