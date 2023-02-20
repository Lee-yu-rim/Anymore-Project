package com.zerock.service;

import java.util.List;

import com.zerock.domain.Criteria;
import com.zerock.domain.CriteriaAR;
import com.zerock.domain.ProductAttachVO;
import com.zerock.domain.ProductVO;
import com.zerock.domain.ProtectAnimalAttachVO;
import com.zerock.domain.ProtectAnimalVO;
import com.zerock.domain.QNAVO;

public interface ProtectAnimalService {

	public List<ProtectAnimalVO> getList();
			
	public ProtectAnimalVO get(int board_num);
			
	//페이지
	public int staffgetTotal(Criteria cri);
			
	public List<ProtectAnimalVO> staffgetList(Criteria cri);
	
	
	
	public List<ProtectAnimalVO> animalList();
	
	// ProtectAnimal 목록 전체 불러오기 + 페이징
	public List<QNAVO> getList(CriteriaAR cri);
	
	// ProtectAnimal 게시글 전체 데이터 불러오기
	public int getTotal(CriteriaAR cri);
	
	public List<ProtectAnimalAttachVO> getAttachList(Long board_num);

	
	public void register(ProtectAnimalVO board);

	public boolean modify(ProtectAnimalVO board);
	
	public boolean remove(Long board_num);

		// 업로드된 보호중인 아이 파일 이미지 불러오기
	public List<ProtectAnimalAttachVO> imageAnimalList();
}