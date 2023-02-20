package com.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProtectAnimalVO {
	private int board_num;
	private String animal_name;
	private Date enter_day;
	private Date protect_day;
	private String variety;
	private String age;
	private String sex;
	private String tnr;
	private String identity;
	private String euthanasia_day;
	
	private List<ProtectAnimalAttachVO> attachList;

}
