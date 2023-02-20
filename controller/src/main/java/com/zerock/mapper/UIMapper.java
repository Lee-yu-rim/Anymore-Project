package com.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zerock.domain.Criteria;
import com.zerock.domain.UIVO;

public interface UIMapper {

	public List<UIVO> getList();
	
	public List<UIVO> getListWithPaging(Criteria cri);
	
	public void insert(UIVO usedItems);
	
	public void insertSelectKey(UIVO usedItems);
	
	public UIVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(UIVO usedItems);
	
	public int getTotalCount(Criteria cri);
	
	public int updateVisitCnt(Long bno);
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
	
}
