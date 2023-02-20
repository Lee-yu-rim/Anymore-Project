package com.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.zerock.domain.Criteria;
import com.zerock.domain.FAQVO;

@Mapper
public interface FAQMapper {
	
	//faq 게시글 등록
	public void insert(FAQVO board);
	
	public void insertSelectKey(FAQVO board);
	
	// faq 삭제
	public int delete(Long bno);

	
	// faq 목록 전체 + 페이지 처리
	public List<FAQVO> getListPaging(Criteria cri);
	
	// faq 전체 데이터 개수 처리
	public int getTotalCount(Criteria cri);
	
	// faq 특정글 조회
	public FAQVO read(Long bno);
	
	// faq 조회수 증가
	public int viewCount(Long bno);

}
