package com.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zerock.domain.Criteria;
import com.zerock.domain.FBVO;

public interface FBMapper {

	public List<FBVO> getList();
	
	public List<FBVO> getListWithPaging(Criteria cri);
	
	public void insert(FBVO freeBoard);
	
	public void insertSelectKey(FBVO freeBoard);
	
	public FBVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(FBVO freeBoard);
	
	public int getTotalCount(Criteria cri);
	
	public int updateVisitCnt(Long bno);
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
	
}
