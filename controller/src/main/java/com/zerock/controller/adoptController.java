package com.zerock.controller;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zerock.domain.ARPageDTO;
import com.zerock.domain.AdoptReservationVO;
import com.zerock.domain.Criteria;
import com.zerock.domain.CriteriaAR;
import com.zerock.domain.MemberVO;
import com.zerock.domain.ProtectAnimalAttachVO;
import com.zerock.domain.ProtectAnimalVO;
import com.zerock.domain.QNAFileUploadVO;
import com.zerock.service.AdoptreservationService;
import com.zerock.service.AnimalDetailsService;
import com.zerock.service.ProtectAnimalService;
import com.zerock.service.ZzimService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adopt/*")
public class adoptController {
	
	@Setter(onMethod_= @Autowired)
	private ProtectAnimalService protectService;
	
	@Setter(onMethod_= @Autowired)
	private AnimalDetailsService animalDetailsService;
	
	@Setter(onMethod_= @Autowired)
	private AdoptreservationService adoptReservationService;
	
	@Setter(onMethod_= @Autowired)
	private ZzimService zzimservice;
	
	// 입양 신청 - 전체 목록 + 페이징 처리 + 검색기능
	@GetMapping("/protectAnimal")
	public void protectAnimal(CriteriaAR cri, Model model) {
		log.info("protectAnimal List : " + cri);
		
		
		model.addAttribute("list", protectService.getList(cri));
		
		// 보호중인 아이들 이미지 파일
		model.addAttribute("image", protectService.imageAnimalList());
		log.info("board_num  : " + protectService.imageAnimalList().get(0).getBoard_num());
		log.info("이미지 파일 : " + protectService.imageAnimalList());
		
		int total = protectService.getTotal(cri);
		log.info("protectAnimal total : " + total);
		model.addAttribute("pageMaker", new ARPageDTO(cri, total));
	}
	
	// 입양 절차
	@GetMapping("/procedure")
	public void procedure() {
		log.info("procedure...");
	}
	
	// 동물 상세보기 페이지 + 공고번호와 이어져서 전체 데이터 가져오기
	@GetMapping("/animalDetails")
	public void animalDetails(@RequestParam("board_num") int board_num, Model model, HttpSession session, @ModelAttribute("cri") CriteriaAR cri) {
		
		// 이미지 가져오기
		model.addAttribute("image", protectService.imageAnimalList());

		
		ProtectAnimalVO boardNum = animalDetailsService.viewDetails(board_num);
		
		session.setAttribute("num", boardNum);
		
		log.info("animalDetails board_num :" + board_num);
		
	    //MemberVO member = (MemberVO)session.getAttribute("member");
		String memberId = "";
		
		if(session.getAttribute("member") == null) {
			log.info("memberId null.");
		} else {
			MemberVO member = (MemberVO)session.getAttribute("member");
			memberId = member.getId();
		}
		
		int zzimCount = 0;
		
		if( memberId != null ) {
			zzimCount = zzimservice.zzimCheck(memberId, board_num);
			log.info("zzimCount: " + zzimCount);
		} else {
			log.info("login No");
			return;
		}
		
		log.info("memberId : " + memberId);

		model.addAttribute("zzimCount", zzimCount);		
		model.addAttribute("details", animalDetailsService.viewDetails(board_num));
	}
	
	// 입양신청 전 체크리스트
	@GetMapping("/checklist")
	public void checklist() {
		log.info("checklist...");
	}
	
	// 입양신청 폼
	@GetMapping("/animalform")
	public void animalform() {
		log.info("animalform...");
	}
	
	// 입양신청 폼 확인
	@PostMapping("/formSubmit")
	public void formSubmit_post(AdoptReservationVO vo, Model model) {
		log.info("form...:" + vo);
		int adoptNum = adoptReservationService.formSubmit(vo);
		model.addAttribute("formSubmit", adoptReservationService.formSelect(adoptNum));
	}
	
	
	
	// 특정한 게시물 번호를 이용해서 첨부파일과 관련된 데이터를 JSON으로 반환
	@GetMapping(value = "/protectAnimalGetAttachList",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ProtectAnimalAttachVO>> qnaGetAttachList(){
		log.info("qnaGetAttachList : " );
		return new ResponseEntity<List<ProtectAnimalAttachVO>>(protectService.imageAnimalList(), HttpStatus.OK);
	}	
	
	// 섬네일 데이터 전송하기
	@GetMapping("/protectAnimalDisplay")
	@ResponseBody
	public ResponseEntity<byte[]> qnaGetFile(String fileName){
		log.info("fileName :" + fileName);
		File file = new File("c:\\upload\\" + fileName);
		log.info("file: " + file);
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch(IOException e) {
			e.printStackTrace();
		}
		return result;
	}
}
