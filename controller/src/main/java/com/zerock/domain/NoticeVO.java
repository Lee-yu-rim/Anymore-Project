package com.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class NoticeVO {
	
	// 공지사항
	private Long bno;
	private String title;
	private String content;
	private String id;
	private Date regdate;
	private Date updatedate;
	private int count;
	
	private List<NoticeAttachVO> attachList;
}
