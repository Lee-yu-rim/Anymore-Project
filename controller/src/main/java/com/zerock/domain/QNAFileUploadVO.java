package com.zerock.domain;


import lombok.Data;

@Data
public class QNAFileUploadVO {

//	private Long fno; // 파일 번호
//	private Long bno; // 글번호
//	private String origin_fname; // 기존 파일이름
//	private String change_fname; // 바뀐 파일이름
//	private Date uploaddate; // 업로드 날짜
//	private int file_size; // 파일 크기
//	private String uploadpath; // 업로드 경로
//	private String filetype; // 파일 타입
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private Long bno;
	
}
