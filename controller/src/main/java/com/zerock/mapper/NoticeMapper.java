package com.zerock.mapper;

import java.util.List;

import com.zerock.domain.Criteria;
import com.zerock.domain.FAQVO;
import com.zerock.domain.NoticeVO;

public interface NoticeMapper {
	//게시글 등록
	public void insert(NoticeVO board);
		
	public void insertSelectKey(NoticeVO board);
	
	// 공지사항 삭제
	public int delete(Long bno);
	
	
	// 공지사항 목록 전체 + 페이지 처리
	public List<NoticeVO> getListPaging(Criteria cri);
	
	// 공지사항 전체 데이터 개수 처리
	public int getTotalCount(Criteria cri);
	
	// 공지사항 특정글 조회
	public NoticeVO read(Long bno);
	
	// 공지사항 조회수 증가
	public int viewCount(Long bno);
	
	

	
	
}
