package com.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zerock.domain.Criteria;
import com.zerock.domain.FBReplyVO;
import com.zerock.mapper.FBMapper;
import com.zerock.mapper.FBReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class FBReplyServiceImpl implements FBReplyService {

	
	
	@Setter(onMethod_ = @Autowired)
	private FBReplyMapper mapper;			
	
	
	@Setter(onMethod_ = @Autowired)
	private FBMapper freeBoardMapper;	
	
	@Transactional
	@Override
	public int register(FBReplyVO vo) {
		
		log.info("register......" + vo);
		freeBoardMapper.updateReplyCnt(vo.getBno(),1);	
		
		return mapper.insert(vo);
	}

	@Override
	public FBReplyVO get(Long rno) {

		log.info("get......" + rno);
		
		return mapper.read(rno);
	}

	@Override
	public int modify(FBReplyVO vo) {
		log.info("modify......" + vo);

	    return mapper.update(vo);
	}
	
	@Transactional
	@Override
	public int remove(Long rno) {
		log.info("remove...." + rno);
		FBReplyVO vo = mapper.read(rno);
		
		freeBoardMapper.updateReplyCnt(vo.getBno(),-1);
		
	    return mapper.delete(rno);
	}

	@Override
	public List<FBReplyVO> getList(Criteria cri, Long bno) {
		log.info("get Reply List of a Board " + bno);

	    return mapper.getListWithPaging(cri, bno);
	}

	
}
