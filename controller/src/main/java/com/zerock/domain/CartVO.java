package com.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {
	
	private Long c_num;
	private int quantity;
	private Date c_regdate;
	private String id;
	private Long product_num;
	
	private String product_name;
	private String price;
}
