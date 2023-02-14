package com.zerock.service;

import java.util.List;

import com.zerock.domain.Criteria;
import com.zerock.domain.UIAttachVO;
import com.zerock.domain.UIVO;




public interface UIService {
	
	public void register(UIVO usedItems);
	
	public UIVO get(Long bno);
	
	public boolean modify(UIVO usedItems);
	
	public boolean remove(Long bno);
	
	public List<UIVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public int updateVisitCnt(Long bno);
	
	public List<UIAttachVO> getAttachList(Long bno);
	
}
