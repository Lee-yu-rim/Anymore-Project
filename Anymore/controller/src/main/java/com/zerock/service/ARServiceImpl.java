package com.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zerock.domain.ARVO;
import com.zerock.domain.CriteriaAR;
import com.zerock.mapper.ARMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ARServiceImpl implements ARService {
	
	@Setter(onMethod_ = @Autowired)
	private ARMapper mapper;

	@Override
	public void register(ARVO adoptionReview) {
		
		log.info("register..." + adoptionReview);
		mapper.insertSelectKey(adoptionReview);
	}
	
	@Override
	public List<ARVO> getList(CriteriaAR cri) {
		
		log.info("get List with criteria : " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public ARVO get(Long bno) {
		
		log.info("get........" + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(ARVO adoptionReview) {
		
		log.info("modify........" + adoptionReview);
		return mapper.update(adoptionReview) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		
		log.info("remove........" + bno);
		return mapper.delete(bno) == 1;
	}

	@Override
	public int getTotal(CriteriaAR cri) {
		
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public int updateVisitCnt(Long bno) {
		
		return mapper.updateVisitCnt(bno);
	}

	
}
