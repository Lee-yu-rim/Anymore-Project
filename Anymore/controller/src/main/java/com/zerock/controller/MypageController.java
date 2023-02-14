	package com.zerock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zerock.domain.CriteriaMypage;
import com.zerock.domain.MemberVO;
import com.zerock.domain.VisitFormPageVO;
import com.zerock.service.MemberService;
import com.zerock.service.MypageService;
import com.zerock.service.ProtectAnimalService;
import com.zerock.service.ZzimService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/myPage/*")
@AllArgsConstructor
public class MypageController {
	
	@Setter(onMethod_= @Autowired)
	private MypageService mpService;
	
	@Setter(onMethod_= @Autowired)
	private MemberService service;
	
	@Setter(onMethod_= @Autowired)
	private ZzimService Zzimservice;
	
	@Setter(onMethod_= @Autowired)
	private ProtectAnimalService protectService;
	
	//마이페이지 : 방문신청 폼
	@GetMapping("/visit_reg_form")
	public void visit_reg_form(CriteriaMypage cri, Model model, HttpSession session) {
		
		// 사용자 아이디 불러오기
		String id = "";
		
		if(session.getAttribute("member") == null) {
			log.info("로그인 하지 않은 사용자 인식");
			return;
		} else {
			MemberVO member = (MemberVO)session.getAttribute("member");
			id = member.getId();
			log.info("로그인 된 아이디 인식 :" + id);
		}
		
		cri.setId(id);
		
//		List<ReserVO> info = service.getList(id);
		
		// 작성한 방문신청 폼 목록 가져온 후 모델 객체에 저장
		model.addAttribute("visitFormList", mpService.getList_visit(cri));
		
		int total = mpService.getTotal_visit(cri);
		
		log.info("list: " + total);
		model.addAttribute("pageMaker", new VisitFormPageVO(cri, total));
	}
	
	//마이페이지 : 방문예약확인 상세페이지
	@GetMapping("/visit_reg_form_view")
	public void visit_reg_form_view(@RequestParam("num") Long num, Model model) {
		model.addAttribute("visitView", mpService.get_visit(num));
	}
	//마이페이지 : 입양신청 폼
	@GetMapping("/adopt_reg_form")
	public void adopt_reg_form(CriteriaMypage cri, Model model, HttpSession session) {
		// 사용자 아이디 불러오기
		String id = "";
				
				if(session.getAttribute("member") == null) {
					log.info("로그인 하지 않은 사용자 인식");
					return;
				} else {
					MemberVO member = (MemberVO)session.getAttribute("member");
					id = member.getId();
					log.info("로그인 된 아이디 인식 :" + id);
				}
				
				cri.setId(id);
				
				// 작성한 방문신청 폼 목록 가져온 후 모델 객체에 저장
				model.addAttribute("adoptFormList", mpService.getList_adopt(cri));
				
				int total = mpService.getTotal_adopt(cri);

				log.info("list: " + total);				
				model.addAttribute("pageMaker", new VisitFormPageVO(cri, total));
	}
	//마이페이지 :  입양신청확인 상세페이지
	@GetMapping("/adopt_reg_form_view")
	public void adopt_reg_form_view(@RequestParam("num") Long num, Model model) {
  
		model.addAttribute("adoptView", mpService.get_adopt(num));
	}
	
	//마이페이지 - 구매내역
	@GetMapping("/order_list")
    public void order_list(CriteriaMypage cri, Model model, HttpSession session) {
		// 사용자 아이디 불러오기
		String id = "";
				
		if(session.getAttribute("member") == null) {
			log.info("로그인 하지 않은 사용자 인식");
			return;
		} else {
			MemberVO member = (MemberVO)session.getAttribute("member");
			id = member.getId();
			log.info("로그인 된 아이디 인식 :" + id);
		}
				
		cri.setId(id);
		
		int total = mpService.getTotal_perchase(cri);
		
		model.addAttribute("order_list", mpService.getList_perchase(cri));
		log.info("list: " + total);				
		model.addAttribute("pageMaker", new VisitFormPageVO(cri, total));
    }
	
	// 마이페이지 - 개인정보 수정 페이지
	@RequestMapping("/edit")
	public String userUpdate() {
		return "/myPage/edit";
	}
	
 
	// 마이페이지 - 개인정보 수정
	@RequestMapping("/updateMembers")
	public String updateMembers(MemberVO member, HttpServletRequest request) {
		HttpSession session = request.getSession();
		log.info("updateMembers....");
		service.update(member);
		session.invalidate();
		return "redirect:/myPage/edit";
	}
	
	// 마이페이지 - 찜
		@GetMapping("/myZzim")
		public void myZzim(Model model, HttpSession session) {
		    MemberVO member = (MemberVO)session.getAttribute("member");
		      
			log.info("member 의 값 : " + member.getId());
			
			String memberId = member.getId();
			
			log.info("id 의 값 : " + memberId);
			model.addAttribute("list", Zzimservice.zzimList(memberId));
			
			// 이미지 파일 불러오기
			model.addAttribute("image", protectService.imageAnimalList());
			
		}
	
	// 마이페이지 - 회원 탈퇴
	@GetMapping("/account_delete")
	public void account_delete() {
		
	}
	
	@PostMapping("/account_delete")
	public String account_delete_post(MemberVO vo, HttpSession session, RedirectAttributes rttr) {
		MemberVO member = (MemberVO)session.getAttribute("member");
		String oldPass = member.getPassword();
		String newPass = vo.getPassword();
		
		log.info(vo.getId() +","+ vo.getPassword());
		
		if(!(oldPass.equals(newPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/myPage/account_delete";
		}
		
		mpService.accountDelete(vo);
		session.invalidate();
		return "redirect:/index";
	}
}
