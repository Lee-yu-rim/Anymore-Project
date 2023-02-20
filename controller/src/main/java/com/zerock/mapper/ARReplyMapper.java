package com.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zerock.domain.ARReplyVO;
import com.zerock.domain.Criteria;

public interface ARReplyMapper {
	
	public int insert(ARReplyVO reply);
	
	public ARReplyVO read(Long bno);
	
	public int delete(Long rno);
	
	public int update(ARReplyVO reply);
	
	public List<ARReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno);
}
