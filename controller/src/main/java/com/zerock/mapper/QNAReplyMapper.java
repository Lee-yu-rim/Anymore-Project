package com.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zerock.domain.Criteria;
import com.zerock.domain.ReplyVO;

public interface QNAReplyMapper {

	// 댓글 작성
	public int insertReply(ReplyVO reply);

	// 게시물의 댓글 목록
	public ReplyVO listReply(Long bno);
	
	// 댓글 삭제
	public int deleteReply(Long rno);
	
	// 댓글 수정
	public int updateReply(ReplyVO reply);
	
	// 댓글 페이징 처리
	public List<ReplyVO> pagingReply(@Param("cri") Criteria cri, @Param("bno") Long bno);

}
