package com.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zerock.domain.Criteria;
import com.zerock.domain.UIAttachVO;
import com.zerock.domain.UIVO;
import com.zerock.mapper.UIAttachMapper;
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
	
	@Setter(onMethod_ = @Autowired)
	private UIAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void register(UIVO usedItems) {
		
		log.info("register..." + usedItems);
		mapper.insertSelectKey(usedItems);
		
		if(usedItems.getAttachList() == null || usedItems.getAttachList().size() <= 0) {
			return;
		}
		
		usedItems.getAttachList().forEach(attach ->{
			attach.setBno(usedItems.getBno());
			attachMapper.insert(attach);
		});
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

	@Transactional
	@Override
	public boolean modify(UIVO usedItems) {
		
		log.info("modify........" + usedItems);
		
		attachMapper.deleteAll(usedItems.getBno());
		
		boolean modifyResult = mapper.update(usedItems) == 1;
		
		if(modifyResult && usedItems.getAttachList() != null && usedItems.getAttachList().size() > 0) {
			
			usedItems.getAttachList().forEach(attach -> {
				
				attach.setBno(usedItems.getBno());
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
	public List<UIAttachVO> getAttachList(Long bno) {
		log.info("get Attach list by bno" + bno);
		return attachMapper.findByBno(bno);
	}
	
	
	
	


	
	
}
