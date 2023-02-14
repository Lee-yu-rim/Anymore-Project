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
	private String delivery_status;
	private Long product_num;
	private String payment;
	private String id;

	//perchase_info(상품구매정보)
	private String perchased_pname;
	private String amount;
	private String product_price;
	
	//delivery_info(배송정보)
	private String address;
	private String phone;
	private String requests;
	
	
}
