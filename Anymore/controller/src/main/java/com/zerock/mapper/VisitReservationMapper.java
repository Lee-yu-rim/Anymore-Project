package com.zerock.mapper;

import java.util.List;

import com.zerock.domain.VisitReservationVO;
import com.zerock.domain.Visit_Criteria;

public interface VisitReservationMapper {
	//회원 목록 보이기
	public List<VisitReservationVO> getList();
			
	//회원 정보 상세보기
	public VisitReservationVO read(Long num);
			
					
	//페이지
	public List<VisitReservationVO> getListWithPaging(Visit_Criteria cri);
			
	public int getTotalCount(Visit_Criteria cri);
}
