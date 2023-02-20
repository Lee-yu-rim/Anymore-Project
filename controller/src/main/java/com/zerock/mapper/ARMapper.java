package com.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zerock.domain.ARVO;
import com.zerock.domain.CriteriaAR;

public interface ARMapper {

	// 유진 수정 - 메인 값 불러오기 용도
	public List<ARVO> getARList();
	
	public List<ARVO> getListWithPaging(CriteriaAR cri);
	
	public void insert(ARVO adoptionReview);
	
	public void insertSelectKey(ARVO adoptionReview);
	
	public ARVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(ARVO adoptionReview);
	
	public int getTotalCount(CriteriaAR cri);
	
	public int updateVisitCnt(Long bno);
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
	
}
