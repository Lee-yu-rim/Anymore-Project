package com.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zerock.domain.Criteria;
import com.zerock.domain.QNAVO;

public interface QNAMapper {
	
	// qna 목록 전체 불러오기
	public List<QNAVO> getList();
	
	// qna 목록 전체 + 페이지 처리
	public List<QNAVO> getListPaging(Criteria cri);
	
	// qna 전체 데이터 개수 처리
	public int getTotalCount(Criteria cri);
	
	// qna 글쓰기
	public void insertSelectKey(QNAVO vo);
	
	// qna 특정글 조회
	public QNAVO read(Long bno);
	
	// qna 삭제
	public int delete(Long bno);
	
	// qna 수정
	public int update(QNAVO vo);
	
	// 조회수 증가
	public int viewCount(Long bno);

	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);

}
