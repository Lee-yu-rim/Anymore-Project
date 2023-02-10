package com.zerock.service;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.zerock.domain.AdoptReservationVO;
import com.zerock.domain.CriteriaMypage;
import com.zerock.domain.PerchaseVO;
import com.zerock.domain.ReserVO;
import com.zerock.mapper.MypageMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@Repository
@AllArgsConstructor
public class MypageServiceImpl implements MypageService {
	
	private MypageMapper mapper;

//	@Override
//	public List<ReserVO> getList(String id) {
//		return mapper.getList(id);
//	}

	@Override
	public List<ReserVO> getList_visit(CriteriaMypage cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging_visit(cri);
	}
	
	@Override
	public List<AdoptReservationVO> getList_adopt(CriteriaMypage cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging_adopt(cri);
	}

	@Override
	public ReserVO get_visit(Long num) {
		return mapper.get_visit(num);
	}
	
	@Override
	public AdoptReservationVO get_adopt(Long adoptnum) {
		return mapper.get_adopt(adoptnum);
	}

	@Override
	public int getTotal_visit(CriteriaMypage cri) {
		return mapper.getTotalCount_visit(cri);
	}
	
	@Override
	public int getTotal_adopt(CriteriaMypage cri) {
		return mapper.getTotalCount_adopt(cri);
	}

	@Override
	public List<PerchaseVO> getList_perchase(CriteriaMypage cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging_perchase(cri);
	}

	@Override
	public int getTotal_perchase(CriteriaMypage cri) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount_perchase(cri);
	}
	
	
}
