package com.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zerock.domain.Adopt_Criteria;
import com.zerock.domain.Adopt_pageDTO;
import com.zerock.domain.Criteria;
import com.zerock.domain.FAQVO;
import com.zerock.domain.MemberVO;
import com.zerock.domain.NoticeVO;
import com.zerock.domain.PageDTO;
import com.zerock.domain.ProductAttachVO;
import com.zerock.domain.ProductVO;
import com.zerock.domain.ProtectAnimalAttachVO;
import com.zerock.domain.ProtectAnimalVO;
import com.zerock.domain.Visit_Criteria;
import com.zerock.domain.Visit_pageDTO;
import com.zerock.service.AdoptreservationService;
import com.zerock.service.CurrentPerchaseService;
import com.zerock.service.FAQService;
import com.zerock.service.MemberService;
import com.zerock.service.NoticeService;
import com.zerock.service.ProductService;
import com.zerock.service.VisitreservationService;
import com.zerock.service.ProtectAnimalService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/staffMyPage/*")
@AllArgsConstructor
public class staffMyPageController {
	
	private FAQService FAQservice;
	private MemberService MemberService;
	private NoticeService Noticeservice;
	private AdoptreservationService AdoptreservationService;
	private VisitreservationService VisitreservationService;
	private ProtectAnimalService ProtectAnimalService;
	private CurrentPerchaseService CurrentPerchaseService;
	private ProductService ProductService;
		
//		//관리자 마이페이지 : 상품관리
//		@GetMapping("/product_manage")
//		public String product_manage() {
//	  
//			return "/staffMyPage/product_manage";
//		}
		//페이지
		@GetMapping("/product_manage")
		public void product_manage_list(Criteria cri, Model model) {
			log.info("product_list : " + cri);
			model.addAttribute("product_list", ProductService.staffgetList(cri));
			
			int total = ProductService.staffgetTotal(cri);
			log.info("total : " + total);
					
			model.addAttribute("pageMaker", new PageDTO(cri,total));
		}
		
		@PostMapping("/product_manage_write")//register
		public String register(ProductVO board, RedirectAttributes rttr) {
			System.out.print("==========================");
			
			System.out.print("Product register : " + board);
			
			
			System.out.print("==========================");
			
			ProductService.register(board);
			
			rttr.addFlashAttribute("result", board.getProduct_num());
			
			return "redirect:/staffMyPage/product_manage_write";
		}
		
		//관리자 마이페이지 : 상품관리 상세페이지
		@GetMapping({"/product_manage_watch","product_manage_modify"})
		public void product_manage_watch(@RequestParam("product_num") int product_num, @ModelAttribute("cri") Criteria cri, Model model) {
			log.info("/Product_manage_get or product_manage_modify");
			model.addAttribute("product", ProductService.get(product_num));
			model.addAttribute("image", ProductService.productImgList());
		}
		
		//관리자 마이페이지 : 보호동물 글 수정
		@PostMapping("/product_manage_modify")
		public String product_modify(ProductVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
			log.info("modify : " + board);
			
			if(ProductService.modify(board)) {
				rttr.addFlashAttribute("result", "success");
			}
							
			rttr.addAttribute("pageNum",cri.getPageNum());
			rttr.addAttribute("amount",cri.getAmount());
			rttr.addAttribute("type",cri.getType());
			rttr.addAttribute("keyword",cri.getKeyword());
			return "redirect:/staffMyPage/product_manage";
		}
		//첨부파일
		@GetMapping(value = "/getProductAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<ProductAttachVO>> getAttachList1(Long product_num){
			log.info("getProductAttachList " + product_num);
			return new ResponseEntity<>(ProductService.getAttachList(product_num), HttpStatus.OK);
		}
		//삭제하기
		@PostMapping("/product_remove")
		public String product_remove(@RequestParam("product_num") Long product_num, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
			log.info("remove..." + product_num);
							
			List<ProductAttachVO> attachList = ProductService.getAttachList(product_num); //정보 받아와서 저장 해두기 .. 게시글을 삭제하기 전에 삭제하려는 원글에 대한 첨부파일 정보를 받아옴
							
			if(ProductService.remove(product_num)) {
				product_deleteFiles(attachList);
				rttr.addFlashAttribute("result","success");
			}
			rttr.addAttribute("pageNum",cri.getPageNum());
			rttr.addAttribute("amount",cri.getAmount());
			rttr.addAttribute("type",cri.getType());
			rttr.addAttribute("keyword",cri.getKeyword());
							
			return "redirect:/staffMyPage/product_manage";
		}
		
		private void product_deleteFiles(List<ProductAttachVO> attachList) {
			//테이블에서 데이터가 정확히 삭제된 이후에 삭제되어야 한다.
			if(attachList == null || attachList.size() == 0) {
				return;
			}
			
			log.info("delete attach files..........");
			log.info(attachList);
			
			attachList.forEach(attach-> {
				try {
					Path file = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\"+attach.getUuid() + "_"+attach.getFileName());
					
					Files.deleteIfExists(file);
					
					if(Files.probeContentType(file).startsWith("image")) {
						Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
						
						Files.delete(thumbNail);
					}
					
				}catch(Exception e){
					log.error("delete file error" + e.getMessage());
				}//end catch
			});//end foreach
		}
		
		
//		//관리자 마이페이지 : 배송정보/구매내역 관리
//		@GetMapping("/current_perchase")
//		public String current_perchase() {
//	  
//			return "/staffMyPage/current_perchase";
//		}
		//페이지
		@GetMapping("/current_perchase")
		public void current_perchase_list(Criteria cri, Model model) {
			log.info("Current_perchase_list : " + cri);
			model.addAttribute("perchase_list", CurrentPerchaseService.getList(cri));
			
			int total = CurrentPerchaseService.getTotal(cri);
			log.info("total : " + total);
			
			model.addAttribute("pageMaker", new PageDTO(cri,total));
		}
		@GetMapping({"/Current_perchase_get","modify"})
		public void Current_perchase_get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
			log.info("/Current_perchase_get or modify");
			model.addAttribute("perchase", CurrentPerchaseService.get(bno));
		}
		
		
		
		
		
		//관리자 마이페이지 : 보호동물 보기 리스트 
//		@GetMapping("/protect_animal")
//		public String protect_animal() {
//		  
//			return "/staffMyPage/protect_animal";
//		}
		
		//페이지
		@GetMapping("/protect_animal")
		public void protect_animal_list(Criteria cri, Model model) {
			log.info("Animal_list : " + cri);
			model.addAttribute("animal_list", ProtectAnimalService.staffgetList(cri));
			
			int total = ProtectAnimalService.staffgetTotal(cri);
			log.info("total : " + total);
			
			model.addAttribute("pageMaker", new PageDTO(cri,total));
		}
		
		//관리자 마이페이지 : 보호동물 보기 글 상세페이지
		@GetMapping({"/protect_animal_watch","protect_animal_modify"})
		public void protect_animal_watch(@RequestParam("board_num") int board_num, @ModelAttribute("cri") Criteria cri, Model model) {
			log.info("/protect_animal_watch or protect_animal_modify");
			model.addAttribute("animal", ProtectAnimalService.get(board_num));
			model.addAttribute("image", ProtectAnimalService.imageAnimalList());
		}
		
		//관리자 마이페이지 : 보호동물 글 수정
		@PostMapping("/protect_animal_modify")
		public String protect_modify(ProtectAnimalVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
			log.info("modify : " + board);
			
			if(ProtectAnimalService.modify(board)) {
				rttr.addFlashAttribute("result", "success");
			}
			
			rttr.addAttribute("pageNum",cri.getPageNum());
			rttr.addAttribute("amount",cri.getAmount());
			rttr.addAttribute("type",cri.getType());
			rttr.addAttribute("keyword",cri.getKeyword());
			return "redirect:/staffMyPage/protect_animal";
		}
		//첨부파일
		@GetMapping(value = "/getAnimalAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<ProtectAnimalAttachVO>> getAttachList(Long board_num){
			log.info("getAttachList " + board_num);
			return new ResponseEntity<>(ProtectAnimalService.getAttachList(board_num), HttpStatus.OK);
		}
		//삭제하기
		@PostMapping("/animal_remove")
		public String protect_remove(@RequestParam("board_num") Long board_num, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
			log.info("remove..." + board_num);
			
			List<ProtectAnimalAttachVO> attachList = ProtectAnimalService.getAttachList(board_num); //정보 받아와서 저장 해두기 .. 게시글을 삭제하기 전에 삭제하려는 원글에 대한 첨부파일 정보를 받아옴
			
			if(ProtectAnimalService.remove(board_num)) {
				deleteFiles(attachList);
				rttr.addFlashAttribute("result","success");
			}
			rttr.addAttribute("pageNum",cri.getPageNum());
			rttr.addAttribute("amount",cri.getAmount());
			rttr.addAttribute("type",cri.getType());
			rttr.addAttribute("keyword",cri.getKeyword());
			
			return "redirect:/staffMyPage/protect_animal";
		}
		
		
		
		private void deleteFiles(List<ProtectAnimalAttachVO> attachList) {
			//테이블에서 데이터가 정확히 삭제된 이후에 삭제되어야 한다.
			if(attachList == null || attachList.size() == 0) {
				return;
			}
			
			log.info("delete attach files..........");
			log.info(attachList);
			
			attachList.forEach(attach-> {
				try {
					Path file = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\"+attach.getUuid() + "_"+attach.getFileName());
					
					Files.deleteIfExists(file);
					
					if(Files.probeContentType(file).startsWith("image")) {
						Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
						
						Files.delete(thumbNail);
					}
					
				}catch(Exception e){
					log.error("delete file error" + e.getMessage());
				}//end catch
			});//end foreach
		}
		

		
//		//관리자 마이페이지 : 입양신청 폼 
//		@GetMapping("/adopt_reservation_form")
//		public String adopt_reservation_form() {
//		  
//			return "/staffMyPage/adopt_reservation_form";
//		}	
		
		//페이지
		@GetMapping("/adopt_reservation_form")
		public void Adopt_reservation_form_list(Adopt_Criteria cri, Model model) {
			log.info("adopt_list : " + cri);
			model.addAttribute("adopt_list", AdoptreservationService.getList(cri));
			
			int total = AdoptreservationService.getTotal(cri);
			log.info("total : " + total);
			
			model.addAttribute("pageMaker", new Adopt_pageDTO(cri,total));
		}
		
		@GetMapping({"/adopt_reservation_form_watch","modify"})
		public void adopt_reservation_form_watch(@RequestParam("adoptnum") int adoptnum, @ModelAttribute("cri") Adopt_Criteria cri, Model model) {
			log.info("/adopt_reservation_form_watch or modify");
			model.addAttribute("adopt", AdoptreservationService.get(adoptnum));
		}

		
		//관리자 마이페이지 : 방문신청 폼
//		@GetMapping("/visit_reservation_form")
//		public String visit_reservation_form() {
//		  
//			return "/staffMyPage/visit_reservation_form";
//		}
		
		//페이지
		@GetMapping("/visit_reservation_form")
		public void visit_reservation_form_list(Visit_Criteria cri, Model model) {
			log.info("Visit_list : " + cri);
			model.addAttribute("visit_list", VisitreservationService.getList(cri));
			
			int total = VisitreservationService.getTotal(cri);
			log.info("total : " + total);
			
			model.addAttribute("pageMaker", new Visit_pageDTO(cri,total));
		}
		
		@GetMapping({"/visit_reservation_form_watch","modify"})
		public void visit_reservation_form_watch(@RequestParam("num") Long num, @ModelAttribute("cri") Adopt_Criteria cri, Model model) {
			log.info("/visit_reservation_form_watch or modify");
			model.addAttribute("visit", VisitreservationService.get(num));
		}
		
		
		//관리자 마이페이지 : 보호중인 동물 현황
		@GetMapping("/current_animal")
		public String current_animal() {
		  
			return "/staffMyPage/current_animal";
		}
		
		
		//관리자 마이페이지 : 보호동물 보기 글 등록 페이지 이동
		@GetMapping("/protect_animal_write")
		public String visit_reservation_form() {
		  
			return "/staffMyPage/protect_animal_write";
		}
		
		//관리자 마이페이지 : 보호동물 보기 글 등록
		@PostMapping("/protect_animal_write")//register
		public String register(ProtectAnimalVO board_num, RedirectAttributes rttr) {
			System.out.print("==========================");
			
			System.out.print("ProtectAnimal register : " + board_num);
			
			
			System.out.print("==========================");
			
			ProtectAnimalService.register(board_num);
			
			rttr.addFlashAttribute("result", board_num.getBoard_num());
			
			return "redirect:/staffMyPage/protect_animal_write";
		}
		
		
		
		//관리자 마이페이지 : 배송정보/구매내역관리 상세보기
		@GetMapping("/current_perchase_watch")
		public void current_perchase_watch(@RequestParam("perchase_num") Long perchase_num, @ModelAttribute("cri") Criteria cri, Model model) {
	         log.info("/Current_perchase_get or current_perchase_modify");
	         model.addAttribute("perchase", CurrentPerchaseService.get(perchase_num));
	      }
		
		
		
		//관리자 마이페이지 : 상품 글 수정
//		@GetMapping("/product_manage_modify")
//		public String product_manage_modify() {
//		  
//			return "/staffMyPage/product_manage_modify";
//		}
		
//		//관리자 마이페이지 : 배송정보/구매내역관리 상세보기 수정
//		@GetMapping("/current_perchase_modify")
//		public String current_perchase_modify() {
//		  
//			return "/staffMyPage/current_perchase_modify";
//		}
		
		//관리자 마이페이지 : 상품등록
		@GetMapping("/product_manage_write")
		public String product_manage_write() {
		  
			return "/staffMyPage/product_manage_write";
		}
		

		
		
		//관리자 마이페이지 : 공지사항 작성
		@GetMapping("/notice_write")
		public String notice_write() {
		 
			return "/staffMyPage/notice_write";
		}
		
		//관리자 마이페이지: FAQ 작성
		@GetMapping("/faq_write")
		public void faq_write() {
		  
			//return "/staffMyPage/faq_write";
		}
		
		
		//관리자 마이페이지 : 회원목록
//		@GetMapping("/member_list")
//		public String member_list() {
//		  
//			return "/staffMyPage/member_list";
//		}

		//페이지
		@GetMapping("/member_list")
		public void member_list(Criteria cri, Model model) {
			log.info("list : " + cri);
			model.addAttribute("list", MemberService.getList(cri));
			
			int total = MemberService.getTotal(cri);
			log.info("total : " + total);
			
			model.addAttribute("pageMaker", new PageDTO(cri,total));
		}
		
		// 관리자가 회원탈퇴 시키는 기능
		@GetMapping("/account_delete")
	      public String member_delete(MemberVO vo) {
	         MemberService.remove(vo);
	         
	         return "redirect:/staffMyPage/member_list";
	      }

		
		
		
		
		
//		
//		@GetMapping({"/get","modify"})
//		public void member_get(@RequestParam("bno") String id, @ModelAttribute("cri") Criteria cri, Model model) {
//			log.info("/get or modify");
//			model.addAttribute("member", MemberService.get(id));
//		}
//		
//		@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//		@ResponseBody
//		public ResponseEntity<List<FAQAttachVO>> getMemberAttachList(Long bno){
//			log.info("getAttachList " + bno);
//			return new ResponseEntity<>(MemberService.getAttachList(bno), HttpStatus.OK);
//		}

		
		
		//관리자 마이페이지 : FAQ 작성 폼 DB에 집어넣기위해 post
		@PostMapping("/faq_write")//register
		public String register(FAQVO board, RedirectAttributes rttr) {
			System.out.print("==========================");
			
			System.out.print("FAQregister : " + board);
			
			
			System.out.print("==========================");
			
			FAQservice.register(board);
			
			rttr.addFlashAttribute("result", board.getBno());
			
			return "redirect:/staffMyPage/faq_write";
		}
		
		
		//관리자 마이페이지 : Notice 작성 폼 DB에 집어넣기위해 post
		@PostMapping("/notice_write")//register
		public String register(NoticeVO board, RedirectAttributes rttr) {
			System.out.print("==========================");
			
			System.out.print("Notice register : " + board);
			
			
			System.out.print("==========================");
			
			Noticeservice.register(board);
			
			rttr.addFlashAttribute("result", board.getBno());
			
			return "redirect:/staffMyPage/notice_write";
		}
		
		
}
