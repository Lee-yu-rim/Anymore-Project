package com.zerock.service;

import java.util.List;

import com.zerock.domain.ARAttachVO;
import com.zerock.domain.ARVO;
import com.zerock.domain.CriteriaAR;

public interface ARService {
	
	// 유진 수정 - 메인 값 불러오기 용도
	public List<ARVO> getARList();
	
	public void register(ARVO adoptionReview);
	
	public ARVO get(Long bno);
	
	public boolean modify(ARVO adoptionReview);
	
	public boolean remove(Long bno);
	
	public List<ARVO> getList(CriteriaAR cri);
	
	public int getTotal(CriteriaAR cri);
	
	public int updateVisitCnt(Long bno);
	
	public List<ARAttachVO> getAttachList(Long bno);
	
//	public List<ARAttachVO> getAttachImg(Long bno);
	
	// 업로드된 이미지 불러오기
	public List<ARAttachVO> imageList();
	
}
