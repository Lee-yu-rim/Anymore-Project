package com.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zerock.domain.Criteria;
import com.zerock.domain.UIReplyVO;

public interface UIReplyMapper {
	
	public int insert(UIReplyVO reply);
	
	public UIReplyVO read(Long bno);
	
	public int delete(Long rno);
	
	public int update(UIReplyVO reply);
	
	public List<UIReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno);
}
