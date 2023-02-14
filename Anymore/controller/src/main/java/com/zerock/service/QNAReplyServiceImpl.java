package com.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zerock.domain.Criteria;
import com.zerock.domain.ReplyVO;
import com.zerock.mapper.QNAMapper;
import com.zerock.mapper.QNAReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@Service
public class QNAReplyServiceImpl implements QNAReplyService {
	
	   @Setter(onMethod_= @Autowired)
	   private QNAReplyMapper mapper;
	   
	   @Setter(onMethod_= @Autowired)
	   private QNAMapper qnaMapper;


	   // 댓글 등록
	   @Transactional
	   @Override
	   public int insertReply(ReplyVO reply) {
	      log.info("insert Reply Impl.... = "+ reply);
	      qnaMapper.updateReplyCnt(reply.getBno(), 1);
	      return mapper.insertReply(reply);
	   }

	
	// 게시물의 댓글 목록
	@Override
	public ReplyVO listReply(Long rno) {
		log.info("list Reply Impl....=" + rno);
		return mapper.listReply(rno);
	}

	   // 댓글 삭제
	   @Transactional
	   @Override
	   public int deleteReply(Long rno) {
	      log.info("delete Reply Impl....=" + rno);
	      ReplyVO reply = mapper.listReply(rno);
	      qnaMapper.updateReplyCnt(reply.getBno(), -1);
	      return mapper.deleteReply(rno);
	   }


	// 댓글 수정
	@Override
	public int updateReply(ReplyVO reply) {
		log.info("delete Reply Impl....=" + reply);
		return mapper.updateReply(reply);
	}

	// 댓글 페이징 처리
	@Override
	public List<ReplyVO> pagingReply(Criteria cri, Long bno) {
		log.info("Paging Reply Impl...." + bno);
		return mapper.pagingReply(cri, bno);
	}


}
