package com.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zerock.domain.Criteria;
import com.zerock.domain.FBReplyVO;

public interface FBReplyMapper {
	
	public int insert(FBReplyVO reply);
	
	public FBReplyVO read(Long bno);
	
	public int delete(Long rno);
	
	public int update(FBReplyVO reply);
	
	public List<FBReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno);
}
