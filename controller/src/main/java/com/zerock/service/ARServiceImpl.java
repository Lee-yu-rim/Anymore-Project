package com.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zerock.domain.ARAttachVO;
import com.zerock.domain.ARVO;
import com.zerock.domain.CriteriaAR;
import com.zerock.mapper.ARAttachMapper;
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
	
	@Setter(onMethod_ = @Autowired)
	private ARAttachMapper attachMapper;
	
	// 유진 수정 - 메인 값 불러오기 용도	
	@Override
	public List<ARVO> getARList() {
		log.info("get List.........");
		return mapper.getARList();
	}
	
	@Transactional
	@Override
	public void register(ARVO adoptionReview) {
		
		log.info("register..." + adoptionReview);
		mapper.insertSelectKey(adoptionReview);
		
		if(adoptionReview.getAttachList() == null || adoptionReview.getAttachList().size() <= 0) {
			return;
		}
		
		adoptionReview.getAttachList().forEach(attach ->{
			attach.setBno(adoptionReview.getBno());
			attachMapper.insert(attach);
		});
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
	
	@Transactional
	@Override
	public boolean modify(ARVO adoptionReview) {
		
		log.info("modify........" + adoptionReview);

		attachMapper.deleteAll(adoptionReview.getBno());
		
		boolean modifyResult = mapper.update(adoptionReview) == 1;
		
		if(modifyResult && adoptionReview.getAttachList() != null && adoptionReview.getAttachList().size() > 0) {
			
			adoptionReview.getAttachList().forEach(attach -> {
				
				attach.setBno(adoptionReview.getBno());
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
	public int getTotal(CriteriaAR cri) {
		
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public int updateVisitCnt(Long bno) {
		
		return mapper.updateVisitCnt(bno);
	}
	
	@Override
	public List<ARAttachVO> getAttachList(Long bno) {
		log.info("get Attach list by bno" + bno);
		return attachMapper.findByBno(bno);
	}


//	@Override
//	public List<ARAttachVO> getAttachImg(Long bno) {
//		log.info("get Attach img by bno" + bno);
//		return attachMapper.read(bno);
//	}


	@Override
	public List<ARAttachVO> imageList() {
		System.out.println("myBatis에 담긴 값 : " + attachMapper.imageList());
		
		return attachMapper.imageList();
	}

	
}
