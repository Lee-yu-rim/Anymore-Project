package com.zerock.domain;

import lombok.Data;

@Data
public class IamportVO {
	
	private int perchase_num;
	private String name; //구매자이름
	private String buyer_name;//구매자이름2
	private String buyer_tel;//구매자 전화번호
	private String phone; //구매자 전화번호
	private String address; //구매자 주소
	private String buyer_addr;//주소
	private String postcode; //우편번호
	private String deli_ask; //배송요청사항
	
	private String product_name; //상품이름 == perchased_product
	private String quantity; //상품 양
	private int price; //상품 가격
	private int total; //총 가격 == all_price
	private int total_cnt; //총 상품갯수
	private int cnt; //총 상품 종류
	private String delivery_status;//배송여부
	private String payment; //결제방법
	private String id;
	
	private int product_num;
	
	private int quantity_num;
	
	private int p_amount;
	
	private int perchase_way;
}
