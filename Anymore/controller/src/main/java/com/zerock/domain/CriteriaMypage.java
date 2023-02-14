package com.zerock.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CriteriaMypage {
	
	private int pageNum;
	private int amount;
	private String id;
	private String startday;
	private String endday;
	
	public CriteriaMypage() {
		this(1, 5);
	}
	
	public CriteriaMypage(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}