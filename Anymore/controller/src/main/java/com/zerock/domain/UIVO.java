package com.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class UIVO {
	
	private Long bno;
	private String title;
	private String content;
	private Date regdate;
	private Date updatedate;
	private int reply_cnt;
	private int visit_cnt;
	private String field;
	private String id;
	
	private List<UIAttachVO> attachList;
}
