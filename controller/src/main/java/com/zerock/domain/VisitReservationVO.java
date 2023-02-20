package com.zerock.domain;

import lombok.Data;

@Data
public class VisitReservationVO {
	private Long num;
	private String title;
	private String sex;
	private String people_cnt;
	private String visiter_name;
	private String phone;
	private String visit_day;
	private String reser_time;
	private String visit_reason;
	private String id;
	private Long visit_identify;
}
