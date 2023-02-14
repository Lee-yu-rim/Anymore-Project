package com.zerock.service;


import java.util.List;


import com.zerock.domain.Criteria;
import com.zerock.domain.ReplyVO;

public interface QNAReplyService {

	// 댓글 등록
	public int insertReply(ReplyVO reply);
	
	// 게시물의 댓글 목록
	public ReplyVO listReply(Long rno);
	
	// 댓글 삭제
	public int deleteReply(Long rno);
	
	// 댓글 수정
	public int updateReply(ReplyVO reply);
	
	// 댓글 페이징 처리
	public List<ReplyVO> pagingReply(Criteria cri, Long bno);

}
