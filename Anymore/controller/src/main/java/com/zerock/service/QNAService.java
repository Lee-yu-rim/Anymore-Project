package com.zerock.service;

import java.util.List;

import com.zerock.domain.Criteria;
import com.zerock.domain.QNAVO;


public interface QNAService {
	// qna 목록 전체 불러오기
	// public List<QNAVO> getList();
	
	// qna 목록 전체 불러오기 + 페이징
	public List<QNAVO> getList(Criteria cri);
	
	// qna 게시글 전체 데이터 불러오기
	public int getTotal(Criteria cri);
	
	// qna 글쓰기
	public void register(QNAVO vo);
	
	// qna 특정글 조회
	public QNAVO get(Long bno);
	
	// qna 삭제
	public boolean remove(Long bno);
	
	// qna 수정
	public boolean modify(QNAVO vo);
	
	// 조회수 증가
	public int viewCount(Long bno);
}
