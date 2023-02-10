package com.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zerock.domain.Criteria;
import com.zerock.domain.QNAFileUploadVO;
import com.zerock.domain.QNAVO;
import com.zerock.mapper.QNAFileUploadMapper;
import com.zerock.mapper.QNAMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@Service
public class QNAServiceImpl implements QNAService {
	
	@Setter(onMethod_= @Autowired)
	private QNAMapper mapper;
	
	@Setter(onMethod_= @Autowired)
	private QNAFileUploadMapper uploadMapper;
	
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
	@Transactional
	@Override
	public void register(QNAVO vo) {
		log.info("QNA register.... : " + vo);
		mapper.insertSelectKey(vo);

		if(vo.getQnaAttachList() == null || vo.getQnaAttachList().size() <= 0) {
			return;
		}
		vo.getQnaAttachList().forEach(attach -> {
			attach.setBno(vo.getBno());
			uploadMapper.qnaInsert(attach);
		});		
		
	}

	// 특정 QNA 읽기
	@Override
	public QNAVO get(Long bno) {
		log.info("QNA read....");
		return mapper.read(bno);
	}

	// QNA 삭제
	@Transactional
	@Override
	public boolean remove(Long bno) {
		log.info("QNA delete.... : " + bno);
		uploadMapper.qnaDeleteAll(bno);
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

	// findByBno mapping 작업 - 첨부파일을 화면에 뿌려주는 것	
	@Override
	public List<QNAFileUploadVO> qnaGetAttachList(Long bno) {
		
		System.out.println("qnaGetAttachList....");

		return uploadMapper.qnaFindByBno(bno);
	}

	

}
