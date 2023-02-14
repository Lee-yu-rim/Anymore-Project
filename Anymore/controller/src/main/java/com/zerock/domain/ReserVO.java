package com.zerock.domain;


import java.util.Date;

import lombok.Data;

@Data
public class ReserVO {
	
	private Long num;				// 예약번호
	private String title;			// 제목
	private String sex;				// 성별
	private String people_cnt;		// 인원수
	private String visiter_name;	// 방문자 이름
	private String phone;			// 연락처
	private Date visit_day;			// 방문날짜
	private String reser_time;		// 방문시간
	private String visit_reason;	// 내용
	private String id;				// 예약자 아이디
	private int visit_identify;		// 예약 목적(1:방문, 2:봉사)
	
	
}


//CREATE TABLE reservation (
//		num	number(10,0)		NOT NULL,
//		title	varchar2(50)		NOT NULL,
//		sex	varchar2(10)		NULL,
//		people_cnt	number(10,0)		NOT NULL,
//		visiter_name	varchar2(20)		NOT NULL,
//		phone	varchar2(30)		NOT NULL,
//		visit_day	varchar2(30)		NOT NULL,
//		reser_time	varchar2(30)		NOT NULL,
//		visit_reason	varchar2(2000)		NULL,
//		id	varchar2(20)		NOT NULL,
//		visit_identify	number(10,0)		NOT NULL
//	);