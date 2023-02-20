package com.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PerchaseVO {
	
	private Long perchase_num;
	private String name;
	private String perchased_product;
	private String all_price;
	private Date ordered_date;
	private String delivery_status;
	private int product_num;
	private String payment;
	private String id;
}
