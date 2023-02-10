package com.zerock.service;

import java.util.List;

import com.zerock.domain.Criteria;
import com.zerock.domain.FBVO;

public interface FBService {
	
	public void register(FBVO freeBoard);
	
	public FBVO get(Long bno);
	
	public boolean modify(FBVO freeBoard);
	
	public boolean remove(Long bno);
	
	public List<FBVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public int updateVisitCnt(Long bno);
	
//	public List<BoardAttachVO> getAttachList(Long bno);
	
}
