package com.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zerock.domain.IamportVO;
import com.zerock.mapper.IamportMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class IamprotServiceImpl implements IamportService {
	
	@Setter(onMethod_ = @Autowired)
	private IamportMapper mapper;
	
	@Override
	public void register(IamportVO board) {
		log.info("register..." + board);
		mapper.insert(board);
		mapper.insert2(board);
		mapper.insert3(board);
	}

}
