package com.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zerock.domain.VisitReservationVO;
import com.zerock.domain.Visit_Criteria;
import com.zerock.mapper.AdoptReservationMapper;
import com.zerock.mapper.VisitReservationMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class VisitreservationServiceImpl implements VisitreservationService {

	@Setter(onMethod_ = @Autowired)
	private VisitReservationMapper mapper;

	@Override
	public List<VisitReservationVO> getList() {
		log.info("get List.........");
		return mapper.getList();
	}

	@Override
	public VisitReservationVO get(Long num) {
		log.info("get............." + num);
		return mapper.read(num);
	}

	@Override
	public int getTotal(Visit_Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<VisitReservationVO> getList(Visit_Criteria cri) {
		log.info("get list with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}
	

}
