package com.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	private String id;
	private String password;
	private String name;
	private int login_type;
	private String staffs;
	private String phone;
	private String birth;
	private String email;
	private String pass_question;
	private String pass_answer;
	private String address;
	private Date regdate; 
	private int alert_cnt;
	private int member_num;
	
	private String kakao_email;
}
