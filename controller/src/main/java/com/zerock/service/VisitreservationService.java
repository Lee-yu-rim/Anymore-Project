package com.zerock.service;

import java.util.List;

import com.zerock.domain.Criteria;
import com.zerock.domain.VisitReservationVO;
import com.zerock.domain.Visit_Criteria;

public interface VisitreservationService {

	public List<VisitReservationVO> getList();
			
	public VisitReservationVO get(Long num);
			
	//페이지
	public int getTotal(Visit_Criteria cri);
			
	public List<VisitReservationVO> getList(Visit_Criteria cri);
}
