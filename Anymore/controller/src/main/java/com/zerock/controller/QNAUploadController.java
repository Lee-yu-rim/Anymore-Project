package com.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zerock.domain.QNAAttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class QNAUploadController {

	@GetMapping("/qnaUploadForm")
	public void qnaUploadForm() {
		log.info("qnaUpload Form...");
	}
	
	@PostMapping("/qndUploadFormAction")
	public void qndUploadFormAction(MultipartFile[] uploadFile, Model model) {
		
		String uploadFolder = "C:\\upload";
		
		for(MultipartFile multipartFile : uploadFile) {
			log.info("------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename()); // 실제 pc에 저장되어있는 이름
			log.info("Upload File Size: " + multipartFile.getSize()); // 업로드한 파일의 크기
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	}
	
	// Ajax를 이용한 파일 업로드
	@GetMapping("/qnaUploadAjax")
	public void qnaUploadAjax() {
		log.info("qnaUploadAjax");
	}	
	
	// 년/월/일 폴더의 생성
	private String qnaGetFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator); // 2023\01\06 
	}
	
	
	// 이미지 파일의 판단
	private boolean qnaCheckImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			// mime type
			// audio/mpeg, text/xml, text/plain, image/jpeg
			
			return contentType.startsWith("image");
			
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	@PostMapping(value = "/qnaUploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE) 
	@ResponseBody
	public ResponseEntity<List<QNAAttachFileDTO>> qnaUploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("qna update ajax post...........");
		
		List<QNAAttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";
		String uploadFolderPath = qnaGetFolder();
		
		// make folder ----------------------------------------
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("upload path:" + uploadFolderPath);
		
		if(uploadPath.exists() == false) { // 해당 위치에 같은 이름을 가진 폴더가 있는지 확인 후
			uploadPath.mkdirs(); // 폴더를 생성한다.
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			
			QNAAttachFileDTO attachDTO = new QNAAttachFileDTO();
			log.info("------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename()); // 실제 pc에 저장되어있는 이름
			log.info("Upload File Size: " + multipartFile.getSize()); // 업로드한 파일의 크기
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			
			attachDTO.setFileName(uploadFileName);
			
			// File saveFile = new File(uploadFolder, uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
	
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				//check image type file
				if (qnaCheckImageType(saveFile)) {
					
					attachDTO.setImage(true);
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				}
				
				list.add(attachDTO);
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
		return new ResponseEntity<List<QNAAttachFileDTO>>(list, HttpStatus.OK);
	}
	
	// 섬네일 데이터 전송하기
	@GetMapping("/qnaDisplay")
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
	
	
	// 첨부 파일의 다운로드 (이미지가 아닌 경우에는 기본이 다운로드) + uuid 제거
	@GetMapping(value = "/qnaDownload", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> qnaDownloadFile(String fileName){
		log.info("qnaDownload file:" + fileName);
		Resource resource = new FileSystemResource("c:\\upload\\" + fileName);
		log.info("resource: " + resource);
		
		// 다운로드 기능 넣기
		String resourceName = resource.getFilename();
		
		// uuid 제거
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
		
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Disposition", "attachment; filename=" + 
						new String(resourceOriginalName.getBytes("UTF-8"),"ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	// 서버에서 첨부파일의 삭제
	@PostMapping("/qnaDeleteFile")
	@ResponseBody
	public ResponseEntity<String> qnaDeleteFile(String fileName, String type){
		log.info("qnaDeleteFile:" + fileName);
		File file;
		try {
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			
			if(type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				log.info("largeFileName:" + largeFileName);
				file = new File(largeFileName);
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}	
	
	
	
} // upload 끝
