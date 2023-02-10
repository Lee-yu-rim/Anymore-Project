package com.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zerock.domain.Criteria;
import com.zerock.domain.FBVO;

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

	@Override
	public void register(FBVO freeBoard) {
		
		log.info("register..." + freeBoard);
		mapper.insertSelectKey(freeBoard);
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

	@Override
	public boolean modify(FBVO freeBoard) {
		
		log.info("modify........" + freeBoard);
		return mapper.update(freeBoard) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		
		log.info("remove........" + bno);
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

	
	
	
	


	
	
}
