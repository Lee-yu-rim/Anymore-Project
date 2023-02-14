package com.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zerock.domain.Criteria;
import com.zerock.domain.FAQAttachVO;
import com.zerock.domain.FAQVO;
import com.zerock.mapper.FAQAttachMapper;
import com.zerock.mapper.FAQMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class FAQServiceImpl implements FAQService {

	@Setter(onMethod_ = @Autowired)
	private FAQMapper mapper; 
	
	@Setter(onMethod_ = @Autowired)
	private FAQAttachMapper attachMapper;
	
	
	@Transactional
	@Override
	public void register(FAQVO board) {
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
	
	// FAQ 삭제
	@Override
	public boolean remove(Long bno) {
		log.info("FAQ delete.... : " + bno);
		return mapper.delete(bno) == 1;
	}	
	
	//파일 업로드
	@Override
	public List<FAQAttachVO> getAttachList(Long bno) {
		log.info("get Attach list by bno" + bno);
		return attachMapper.findByBno(bno);
	}
	

	// FAQ 목록 전체 불러오기
	@Override
	public List<FAQVO> getList(Criteria cri) {
		log.info("FAQ getList....." + cri);
		return mapper.getListPaging(cri);
	}
	
	// FAQ 전체 데이터 갯수 처리
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	// 특정 FAQ 읽기
	@Override
	public FAQVO get(Long bno) {
		log.info("FAQ read....");
		return mapper.read(bno);
	}

	// FAQ 증가
	@Override
	public int viewCount(Long bno) {
		log.info("FAQViewCount...");
		return mapper.viewCount(bno);
	}



}
