package com.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zerock.domain.Criteria;
import com.zerock.domain.NoticeAttachVO;
import com.zerock.domain.NoticeVO;
import com.zerock.mapper.NoticeAttachMapper;
import com.zerock.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private NoticeAttachMapper attachMapper;
	
	// 공지사항 목록 전체 불러오기
//	@Override
//	public List<NoticeVO> getList() {
//		log.info("Notice getList.....");
//		return mapper.getList();
//	}
	

	//게시글 등록
	@Transactional
	@Override
	public void register(NoticeVO board) {
		log.info("register..." + board);
		mapper.insertSelectKey(board);
		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		board.getAttachList().forEach(attach ->{
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
		
	}
	
	//공지사항 삭제
	@Override
	public boolean remove(Long bno) {
		log.info("NOTICE delete.... : " + bno);
		return mapper.delete(bno) == 1;
	}
	
	// 공지사항 목록 전체 불러오기
	@Override
	public List<NoticeVO> getList(Criteria cri) {
		log.info("Notice getList....." + cri);
		return mapper.getListPaging(cri);
	}
	
	// 공지사항 전체 데이터 갯수 처리
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	// 특정 공지사항 읽기
	@Override
	public NoticeVO get(Long bno) {
		log.info("Notice read....");
		return mapper.read(bno);
	}

	// 조회수 증가
	@Override
	public int viewCount(Long bno) {
		log.info("NoticeViewCount...");
		return mapper.viewCount(bno);
	}

	@Override
	public List<NoticeAttachVO> getAttachList(Long bno) {
		log.info("get Attach list by bno" + bno);
		return attachMapper.findByBno(bno);
	}

	
}
