package com.zerock.service;

import java.util.List;

import com.zerock.domain.Criteria;
import com.zerock.domain.FBReplyVO;

public interface FBReplyService {
	
	public int register(FBReplyVO vo);
	
	public FBReplyVO get(Long rno);
	
	public int modify(FBReplyVO vo);
	
	public int remove(Long rno);
	
	public List<FBReplyVO> getList(Criteria cri, Long bno);
}
