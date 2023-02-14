package com.zerock.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zerock.domain.CartVO;
import com.zerock.domain.IamportVO;
import com.zerock.domain.MemberVO;
import com.zerock.service.CartService;
import com.zerock.service.IamportService;
import com.zerock.service.MemberService;
import com.zerock.service.ProductService;
import com.zerock.service.ZzimService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/anymoremall/*")
@AllArgsConstructor
public class anymoremallController {

	@Setter(onMethod_ = @Autowired)
	private ProductService service;

	@Setter(onMethod_ = @Autowired)
	private CartService cartService;

	@Setter(onMethod_ = @Autowired)
	private IamportService portService;

	// 상품 목록 가져오기
	@RequestMapping(value = "/product_list", method = RequestMethod.GET)
	public void list(Model model) {
		log.info("product_list");

		// 이미지 불러오기
		model.addAttribute("image", service.productImgList());

		// 목록 값 불러오기
		model.addAttribute("productlist", service.getList());
	}

	// 상품 상세보기
	@RequestMapping(value = "/product_detail", method = RequestMethod.GET)
	public void get(@RequestParam("product_num") int product_num, Model model) {
		log.info("product_detail");

		// 상품 번호 불러오기
		model.addAttribute("product", service.get(product_num));

		// 이미지 불러오기
		model.addAttribute("image", service.productImgList());
	}

//	//장바구니 페이지 이동
//	@RequestMapping(value = "/cart", method = RequestMethod.GET)
//	public void go_cart() {
//		
//	}

	// 상품 장바구니 담기
	@ResponseBody
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public int addCart(CartVO cart, HttpSession session) {

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");

		if (member != null) {
			cart.setId(member.getId());
			service.addCart(cart);
			result = 1;
		}

		return result;

	}

	@GetMapping("/cart")
	public void cart(Model model, HttpSession session) {

		// 로그인 한 사용자의 아이디 변수
		String id = "";
		if (session.getAttribute("member") == null) {
			log.info("로그인 되지 않은 아이디인식");
			return;
		} else {
			MemberVO member = (MemberVO) session.getAttribute("member");
			id = member.getId();
			log.info("로그인 된 아이디 인식 : " + id);
		}

		// 장바구니 목록 확인
		List<CartVO> cartInfo = cartService.getList(id);
		log.info("cart info... : " + cartInfo);

		// 모델 객체에 장바구니 정보들 배열로 넘기기
		model.addAttribute("cart_list", cartService.getList(id));
	}

	@RequestMapping("/cart_delete")
	public String cartDelete(@RequestParam("c_num") Long c_num, RedirectAttributes rttr) {
		log.info("delete..." + c_num);
		cartService.delete(c_num);

		return "redirect:/anymoremall/cart";
	}

	@RequestMapping("/cart_delete_all")
	public String cartDeleteAll(HttpSession session, RedirectAttributes rttr) {
		String id = "";
		log.info("delete...All!");

		MemberVO member = (MemberVO) session.getAttribute("member");
		id = member.getId();
		cartService.deleteAll(id);

		return "redirect:/anymoremall/cart";
	}

	@GetMapping("/import2")
	public void import_reading1(Model model, HttpSession session) {
		String id = "";
		if (session.getAttribute("member") == null) {
			log.info("로그인 되지 않은 아이디인식");
			return;
		} else {
			MemberVO member = (MemberVO) session.getAttribute("member");
			id = member.getId();
			log.info("로그인된 아이디: " + id);
		}

		List<CartVO> cartInfo = cartService.getList(id);
		log.info("get cart info... : " + cartInfo);
		model.addAttribute("cart_list", cartService.getList(id));

	}

	@PostMapping("/import")
	public void import_reading2(Model model, HttpSession session) {
		String id = "";
		if (session.getAttribute("member") == null) {
			return;
		} else {
			MemberVO member = (MemberVO) session.getAttribute("member");
			id = member.getId();
			log.info("로그인 된 아이디 인식 : " + id);
		}

	}

	@PostMapping("/import3")
	public void import_reading3(Model model, HttpSession session) {
		String id = "";
		if (session.getAttribute("member") == null) {
			return;
		} else {
			MemberVO member = (MemberVO) session.getAttribute("member");
			id = member.getId();
			log.info("로그인 된 아이디 인식 : " + id);
		}

	}

	@RequestMapping("/import")
	public void call_iamport(IamportVO port, RedirectAttributes rttr) {
		System.out.print("==========================");
		System.out.print("iamport : " + port);

	}

	@PostMapping("/iamport")
	public void paying(IamportVO board) {
		System.out.println("==========================");

		System.out.println("구매 info : " + board);

		System.out.println("==========================");

	}

	@PostMapping("/afterImport") // register
	public void register(IamportVO board, RedirectAttributes rttr, HttpSession session, Model model) {
		String id = "";
		if (session.getAttribute("member") == null) {
			log.info("로그인 되지 않은 아이디인식");
			;
			return;
		} else {
			MemberVO member = (MemberVO) session.getAttribute("member");
			id = member.getId();
			log.info("로그인 된 아이디 인식 : " + id);
		}

		// 옣諛붽뎄 땲 紐⑸줉 솗 씤
		List<CartVO> cartInfo = cartService.getList(id);
		log.info("cart info... : " + cartInfo);

		model.addAttribute("cart_list", cartService.getList(id));

		System.out.println("==========================");

		System.out.println("Perchase register : " + board);

		System.out.println("==========================");

		portService.register(board);

	}
}