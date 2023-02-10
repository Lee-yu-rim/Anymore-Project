package com.zerock.service;

import java.util.List;

import com.zerock.domain.AdoptReservationVO;
import com.zerock.domain.Criteria;
import com.zerock.domain.CriteriaMypage;
import com.zerock.domain.PerchaseVO;
import com.zerock.domain.ReserVO;

public interface MypageService {
	public ReserVO get_visit(Long num);
	public AdoptReservationVO get_adopt(Long adoptnum);
//	public List<ReserVO> getList(String id);
	public List<ReserVO> getList_visit(CriteriaMypage cri);
	public List<AdoptReservationVO> getList_adopt(CriteriaMypage cri);
	public int getTotal_visit(CriteriaMypage cri);
	public int getTotal_adopt(CriteriaMypage cri);
	
	//마이페이지 구매내역 불러오기 + 페이징
	public List<PerchaseVO> getList_perchase(CriteriaMypage cri);
	public int getTotal_perchase(CriteriaMypage cri);
}
