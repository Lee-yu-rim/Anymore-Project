package com.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProductVO {
	
	private int product_num;
	private String price;
	private String identity;
	private String discribe;
	private int p_amount;
	private String product_name;
	private Date product_regdate;
	private String product_content;
	private String quantity_num;
	
	
	private List<ProductAttachVO> attachList;
}
