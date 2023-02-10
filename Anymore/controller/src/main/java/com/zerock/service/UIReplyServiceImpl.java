package com.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zerock.domain.Criteria;
import com.zerock.domain.UIReplyVO;
import com.zerock.mapper.UIMapper;
import com.zerock.mapper.UIReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class UIReplyServiceImpl implements UIReplyService {

	
	
	@Setter(onMethod_ = @Autowired)
	private UIReplyMapper mapper;			
	
	
	@Setter(onMethod_ = @Autowired)
	private UIMapper usedItemsMapper;	
	
	@Transactional
	@Override
	public int register(UIReplyVO vo) {
		
		log.info("register......" + vo);
		usedItemsMapper.updateReplyCnt(vo.getBno(),1);	
		
		return mapper.insert(vo);
	}

	@Override
	public UIReplyVO get(Long rno) {

		log.info("get......" + rno);
		
		return mapper.read(rno);
	}

	@Override
	public int modify(UIReplyVO vo) {
		log.info("modify......" + vo);

	    return mapper.update(vo);
	}
	
	@Transactional
	@Override
	public int remove(Long rno) {
		log.info("remove...." + rno);
		UIReplyVO vo = mapper.read(rno);
		
		usedItemsMapper.updateReplyCnt(vo.getBno(),-1);
		
	    return mapper.delete(rno);
	}

	@Override
	public List<UIReplyVO> getList(Criteria cri, Long bno) {
		log.info("get Reply List of a Board " + bno);

	    return mapper.getListWithPaging(cri, bno);
	}

	
}
