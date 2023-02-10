package com.zerock.service;

import java.util.List;

import com.zerock.domain.Criteria;
import com.zerock.domain.UIReplyVO;

public interface UIReplyService {
	
	public int register(UIReplyVO vo);
	
	public UIReplyVO get(Long rno);
	
	public int modify(UIReplyVO vo);
	
	public int remove(Long rno);
	
	public List<UIReplyVO> getList(Criteria cri, Long bno);
}
