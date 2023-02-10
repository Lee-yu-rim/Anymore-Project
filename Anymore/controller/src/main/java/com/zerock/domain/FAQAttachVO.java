package com.zerock.domain;

import lombok.Data;

@Data
public class FAQAttachVO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private Long bno;

}
