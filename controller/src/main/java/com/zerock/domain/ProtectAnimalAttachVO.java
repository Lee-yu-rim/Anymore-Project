package com.zerock.domain;

import lombok.Data;

@Data
public class ProtectAnimalAttachVO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private Long fno;
	
	private Long board_num;

}
