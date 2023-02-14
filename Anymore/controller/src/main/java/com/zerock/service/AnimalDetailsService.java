package com.zerock.service;


import com.zerock.domain.ProtectAnimalVO;

public interface AnimalDetailsService {

	// 공고번호에 맞게 리스트 보여주기
	public ProtectAnimalVO viewDetails(int board_num);
}
