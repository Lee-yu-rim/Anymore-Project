package com.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zerock.domain.Criteria;
import com.zerock.domain.CurrentPerchaseVO;
import com.zerock.mapper.CurrentPerchaseMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CurrentPerchaseServiceImpl implements CurrentPerchaseService {

	@Setter(onMethod_ = @Autowired)
	private CurrentPerchaseMapper mapper;

	@Override
	public List<CurrentPerchaseVO> getList() {
		log.info("get List.........");
		return mapper.getList();
	}

	@Override
	public CurrentPerchaseVO get(Long perchase_num) {
		log.info("get............." + perchase_num);
		return mapper.read(perchase_num);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<CurrentPerchaseVO> getList(Criteria cri) {
		log.info("get list with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}
	

}
