package com.zerock.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class CurrentPerchaseVO {
	private Long perchase_num;
	private String name; 
	private String perchased_product;
	private String all_price;
	private Date ordered_date;
	private String ordered_time;
	private String delivery_status;
	private Long delivery_fee;
	private Long product_num;
	private String payment;
	private String id;
	
	private String address;
	private String phone;
}
