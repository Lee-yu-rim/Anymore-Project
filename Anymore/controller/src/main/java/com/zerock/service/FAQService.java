package com.zerock.service;

import java.util.List;

import com.zerock.domain.Criteria;
import com.zerock.domain.FAQAttachVO;
import com.zerock.domain.FAQVO;

public interface FAQService {
	
	//관리자페이지에서 게시글 등록하기위해 추가해뒀습니다
	public void register(FAQVO board);
	
	//파일올리기
	public List<FAQAttachVO> getAttachList(Long bno);
	
	
	
	
	//public List<FAQVO> faqGetList();
	
	// FAQ 목록 전체 불러오기 + 페이징
	public List<FAQVO> getList(Criteria cri);
	
	// FAQ 게시글 전체 데이터 불러오기
	public int getTotal(Criteria cri);

	// FAQ 특정글 조회
	public FAQVO get(Long bno);
	
	// FAQ 조회수 증가
	public int viewCount(Long bno);



}
