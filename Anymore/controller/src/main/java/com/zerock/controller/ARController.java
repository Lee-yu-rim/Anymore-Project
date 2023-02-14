package com.zerock.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zerock.domain.ARAttachVO;
import com.zerock.domain.ARPageDTO;
import com.zerock.domain.ARVO;
import com.zerock.domain.Criteria;
import com.zerock.domain.CriteriaAR;
import com.zerock.service.ARService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/community/*")
@AllArgsConstructor
public class ARController {
	
private ARService service;
	
	// 입양후기 목록처리
	@GetMapping("/adoptionReview")
	public void list(CriteriaAR cri, Model model) {
		log.info("adoptionReview : " + cri);
		model.addAttribute("list", service.getList(cri));
		
		// 이미지 저장
		model.addAttribute("image", service.imageList());
		log.info("이미지 파일 : " + service.imageList());
		
		int total = service.getTotal(cri);
		
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new ARPageDTO(cri, total));
	}
	
	// 입양후기 등록하기
	@GetMapping("/registerAR")
	public void register() {
		
	}
	
	// 입양후기 등록처리
	@PostMapping("/registerAR")
	public String register(ARVO adoptionReview, RedirectAttributes rttr) {
		
		log.info("register : " + adoptionReview);
		
		if(adoptionReview.getAttachList() != null){
			
			adoptionReview.getAttachList().forEach(attach -> log.info(attach));
		}
		
		service.register(adoptionReview);
		
		rttr.addFlashAttribute("result", adoptionReview.getBno()); 
		
		return "redirect:/community/adoptionReview";
	}
	
	
	// 입양후기 조회
	@GetMapping("/getAR")		
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") CriteriaAR cri, Model model) {
		log.info("/getAR");
		
		service.updateVisitCnt(bno);
		
		model.addAttribute("adoptionReview", service.get(bno));
	}
	
	// 입양후기 수정 처리
	@GetMapping("/modifyAR")		
	public void modify(@RequestParam("bno") Long bno, @ModelAttribute("cri") CriteriaAR cri, Model model) {
		log.info("/modifyAR");
		
		model.addAttribute("adoptionReview", service.get(bno));
	}
	
	// 입양후기 수정처리
	@PostMapping("/modifyAR")
	public String modify(ARVO adoptionReview, @ModelAttribute("cri") CriteriaAR cri, RedirectAttributes rttr) {
		
		log.info("modify : " + adoptionReview);
		
		if(service.modify(adoptionReview)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/community/adoptionReview";
	}
	
	
	// 입양후기 삭제처리
	@PostMapping("/removeAR")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") CriteriaAR cri, RedirectAttributes rttr) {
		
		log.info("removeAR..." + bno);
		
		List<ARAttachVO> attachList = service.getAttachList(bno);	
		
		if(service.remove(bno)) {
			
			deleteFiles(attachList);	
			
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/community/adoptionReview";
	}
	
	// 입양후기 첨부파일
	@GetMapping(value = "/getAttachListAR", produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ARAttachVO>> getAttachList(Long bno){
		log.info("getAttachList " + bno);
		
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	
	// 입양후기 첨부파일 삭제
	private void deleteFiles(List<ARAttachVO> attachList) {	// 물리적인 경로에서 해당파일을 삭제하는 역할
			
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("delete attach files..............");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid() + "_" + attach.getFileName());
				// Paths.get : 특정 경로의 파일 정보를 가져온다.
				Files.deleteIfExists(file);
				// 파일이 존재하는 경우 삭제하고, 파일이 존재하지 않으면 false를 리턴한다.
				
				if(Files.probeContentType(file).startsWith("image")) {	// mime 타입이 image로 시작한다면 썸네일을 지워준다.
					Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid() + "_" + attach.getFileName());
					
					Files.delete(thumbNail);
					// 메소드를 사용하여 파일 또는 디렉토리 삭제. 대상이 없으면 NoSuchFileException 에러 발생
				}
				
			}catch(Exception e) {
				log.error("delete file error" + e.getMessage());
			}
		});
		
	}
	
	
	
	
	
	
	
	
	
	// 특정한 게시물 번호를 이용해서 첨부파일과 관련된 데이터를 JSON으로 반환
	@GetMapping(value = "/ARgetAttachList",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ARAttachVO>> getAttachListAR(){
		log.info("getAttachListAR : " );
		return new ResponseEntity<List<ARAttachVO>>(service.imageList(), HttpStatus.OK);
	}
	
	// 섬네일 데이터 전송하기
	@GetMapping("/displayAR")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
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
