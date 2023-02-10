package com.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zerock.domain.Criteria;
import com.zerock.domain.NoticeVO;
import com.zerock.domain.QNAVO;
import com.zerock.mapper.QNAMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@Service
public class QNAServiceImpl implements QNAService {
	
	private QNAMapper mapper;
	
	// QNA 목록 전체 불러오기
//	@Override
//	public List<QNAVO> getList() {
//		log.info("QNA getList.....");
//		return mapper.getList();
//	}

	@Override
	public List<QNAVO> getList(Criteria cri) {
		log.info("QNA getList....." + cri);
		return mapper.getListPaging(cri);
	}
	
	// qna 전체 데이터 갯수 처리
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	// QNA 글 쓰기
	@Override
	public void register(QNAVO vo) {
		log.info("QNA register.... : " + vo);
		mapper.insertSelectKey(vo);
	}

	// 특정 QNA 읽기
	@Override
	public QNAVO get(Long bno) {
		log.info("QNA read....");
		return mapper.read(bno);
	}

	// QNA 삭제
	@Override
	public boolean remove(Long bno) {
		log.info("QNA delete.... : " + bno);
		return mapper.delete(bno) == 1;
	}
	
	// QNA 수정
	@Override
	public boolean modify(QNAVO vo) {
		log.info("QNA modify : " + vo);
		return mapper.update(vo) == 1;
	}

	// 조회수 증가
	@Override
	public int viewCount(Long bno) {
		log.info("viewCount...");
		return mapper.viewCount(bno);
	}

}
