package com.zerock.mapper;

import java.util.List;

import com.zerock.domain.AdoptReservationVO;
import com.zerock.domain.CriteriaMypage;
import com.zerock.domain.PerchaseVO;
import com.zerock.domain.ReserVO;

public interface MypageMapper {
	// 마이페이지 방문 신청 폼 상세보기
	public ReserVO get_visit(Long num);
	
	// 마이페이지 입양 신청 폼 상세보기
	public AdoptReservationVO get_adopt(Long adoptnum);
	
//	public List<ReserVO> getList(String id);
	
	// 마이페이지 방문 신청 폼 리스트 불러오기
	public List<ReserVO> getListWithPaging_visit(CriteriaMypage cri);
	
	// 마이페이지 입양 신청 폼 리스트 불러오기
	public List<AdoptReservationVO> getListWithPaging_adopt(CriteriaMypage cri);
	
	// 마이페이지 방문 신청 폼 리스트 총 페이지 수
	public int getTotalCount_visit(CriteriaMypage cri);
	
	// 마이페이지 입양 신청 폼 리스트 총 페이지 수
	public int getTotalCount_adopt(CriteriaMypage cri);
	
	//마이페이지 구매내역 불러오기
	/* public List<PerchaseVO> perchase_list(String id); */
	
	//마이페이지 구매내역 불러오기 + 페이징
	public List<PerchaseVO> getListWithPaging_perchase(CriteriaMypage cri);
	
	public int getTotalCount_perchase(CriteriaMypage cri);
}
