package com.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zerock.domain.ARReplyVO;
import com.zerock.domain.Criteria;
import com.zerock.mapper.ARMapper;
import com.zerock.mapper.ARReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ARReplyServiceImpl implements ARReplyService {

	
	
	@Setter(onMethod_ = @Autowired)
	private ARReplyMapper mapper;			
	
	
	@Setter(onMethod_ = @Autowired)
	private ARMapper ARMapper;	
	
	@Transactional
	@Override
	public int register(ARReplyVO vo) {
		
		log.info("register......" + vo);
		ARMapper.updateReplyCnt(vo.getBno(),1);	
		
		return mapper.insert(vo);
	}

	@Override
	public ARReplyVO get(Long rno) {

		log.info("get......" + rno);
		
		return mapper.read(rno);
	}

	@Override
	public int modify(ARReplyVO vo) {
		log.info("modify......" + vo);

	    return mapper.update(vo);
	}
	
	@Transactional
	@Override
	public int remove(Long rno) {
		log.info("remove...." + rno);
		ARReplyVO vo = mapper.read(rno);
		
		ARMapper.updateReplyCnt(vo.getBno(),-1);
		
	    return mapper.delete(rno);
	}

	@Override
	public List<ARReplyVO> getList(Criteria cri, Long bno) {
		log.info("get Reply List of a Board " + bno);

	    return mapper.getListWithPaging(cri, bno);
	}

	
}
