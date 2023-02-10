package com.zerock.service;


import org.springframework.stereotype.Service;

import com.zerock.domain.ProtectAnimalVO;
import com.zerock.mapper.AnimalDetailsMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class AnimalDetailsServiceImpl implements AnimalDetailsService {
	
	// 자동주입
	private AnimalDetailsMapper mapper;

	// 공고번호에 맞게 리스트 보여주기
	@Override
	public ProtectAnimalVO viewDetails(int board_num) {
		log.info("viewDetails....");
		return mapper.viewDetails(board_num);
	}

}
