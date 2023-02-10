package com.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zerock.domain.Criteria;
import com.zerock.domain.UIVO;

import com.zerock.mapper.UIMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UIServiceImpl implements UIService {
	
	@Setter(onMethod_ = @Autowired)
	private UIMapper mapper;

	@Override
	public void register(UIVO usedItems) {
		
		log.info("register..." + usedItems);
		mapper.insertSelectKey(usedItems);
	}
	
	@Override
	public List<UIVO> getList(Criteria cri) {
		
		log.info("get List with criteria : " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public UIVO get(Long bno) {
		
		log.info("get........" + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(UIVO usedItems) {
		
		log.info("modify........" + usedItems);
		return mapper.update(usedItems) == 1;
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
