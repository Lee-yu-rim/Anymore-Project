package com.zerock.mapper;

import com.zerock.domain.ProtectAnimalVO;

public interface AnimalDetailsMapper {

	// 상세보기
	public ProtectAnimalVO viewDetails(int board_num);
	
}
