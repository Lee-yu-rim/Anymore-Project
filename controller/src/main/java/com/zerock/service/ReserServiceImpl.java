package com.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zerock.domain.ReserVO;
import com.zerock.mapper.ReserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReserServiceImpl implements ReserService {
	
	@Setter(onMethod_ = @Autowired)
	private ReserMapper mapper;

	@Override
	public void register(ReserVO reser) {
		
		log.info("register..." + reser);
		mapper.insert(reser);
	}

	@Override
	public ReserVO get(Long num) {
		
		log.info("get........" + num);
		return mapper.read(num);
	}


	
}
