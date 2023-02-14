package com.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zerock.domain.Criteria;
import com.zerock.domain.FBAttachVO;
import com.zerock.domain.FBVO;
import com.zerock.mapper.FBAttachMapper;
import com.zerock.mapper.FBMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FBServiceImpl implements FBService {
	
	@Setter(onMethod_ = @Autowired)
	private FBMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private FBAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void register(FBVO freeBoard) {
		
		log.info("register..." + freeBoard);
		mapper.insertSelectKey(freeBoard);
		
		if(freeBoard.getAttachList() == null || freeBoard.getAttachList().size() <= 0) {
			return;
		}
		
		freeBoard.getAttachList().forEach(attach ->{
			attach.setBno(freeBoard.getBno());
			attachMapper.insert(attach);
		});
	}
	
	@Override
	public List<FBVO> getList(Criteria cri) {
		
		log.info("get List with criteria : " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public FBVO get(Long bno) {
		
		log.info("get........" + bno);
		return mapper.read(bno);
	}
	
	@Transactional
	@Override
	public boolean modify(FBVO freeBoard) {
		
		log.info("modify........" + freeBoard);
		
		attachMapper.deleteAll(freeBoard.getBno());
		
		boolean modifyResult = mapper.update(freeBoard) == 1;
		
		if(modifyResult && freeBoard.getAttachList() != null && freeBoard.getAttachList().size() > 0) {
			
			freeBoard.getAttachList().forEach(attach -> {
				
				attach.setBno(freeBoard.getBno());
				attachMapper.insert(attach);
			});
		}
		
		return modifyResult;
	}
	
	@Transactional
	@Override
	public boolean remove(Long bno) {
		
		log.info("remove........" + bno);
		
		attachMapper.deleteAll(bno);
		
		return mapper.delete(bno) == 1;
	}

	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public int updateVisitCnt(Long bno) {
		
		return mapper.updateVisitCnt(bno);
	}

	@Override
	public List<FBAttachVO> getAttachList(Long bno) {
		log.info("get Attach list by bno" + bno);
		return attachMapper.findByBno(bno);
	}

	
	
	
	


	
	
}
