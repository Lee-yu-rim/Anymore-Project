package com.zerock.service;

import java.util.List;

import com.zerock.domain.Criteria;
import com.zerock.domain.FAQAttachVO;
import com.zerock.domain.FAQVO;
import com.zerock.domain.NoticeAttachVO;
import com.zerock.domain.NoticeVO;
import com.zerock.domain.QNAVO;

public interface NoticeService {
	
	//관리자페이지에서 게시글 등록하기위해 추가해뒀습니다
	public void register(NoticeVO board);
	
	public List<NoticeAttachVO> getAttachList(Long bno);
	
	// 공지사항 삭제
	public boolean remove(Long bno);
	
	// 공지사항 목록 전체 불러오기
	//public List<NoticeVO> getList();
	
	// 공지사항 목록 전체 불러오기 + 페이징
	public List<NoticeVO> getList(Criteria cri);
	
	// 공지사항 게시글 전체 데이터 불러오기
	public int getTotal(Criteria cri);

	// 공지사항 특정글 조회
	public NoticeVO get(Long bno);
	
	// 공지사항 조회수 증가
	public int viewCount(Long bno);

	
	
}
