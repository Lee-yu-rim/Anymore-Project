package com.zerock.service;

import java.util.List;

import com.zerock.domain.ARReplyVO;
import com.zerock.domain.Criteria;

public interface ARReplyService {
	
	public int register(ARReplyVO vo);
	
	public ARReplyVO get(Long rno);
	
	public int modify(ARReplyVO vo);
	
	public int remove(Long rno);
	
	public List<ARReplyVO> getList(Criteria cri, Long bno);
}
