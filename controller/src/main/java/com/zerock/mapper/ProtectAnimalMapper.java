package com.zerock.mapper;

import java.util.List;

import com.zerock.domain.Criteria;
import com.zerock.domain.CriteriaAR;
import com.zerock.domain.ProductVO;
import com.zerock.domain.ProtectAnimalAttachVO;
import com.zerock.domain.ProtectAnimalVO;
import com.zerock.domain.QNAVO;

public interface ProtectAnimalMapper {
	//회원 목록 보이기
	public List<ProtectAnimalVO> getList();
			
	//회원 정보 상세보기
	public ProtectAnimalVO read(int board_num);
					
	//페이지
	public List<ProtectAnimalVO> getListWithPaging(Criteria cri);
			
	public int getTotalCount(Criteria cri);
	
	
	
	
	// ProtectAnimal 목록 전체
	public List<ProtectAnimalVO> animalList();
	
	// ProtectAnimal 목록 전체 + 페이지 처리
	public List<QNAVO> getListPaging(CriteriaAR cri);
	
	// ProtectAnimal 전체 데이터 개수 처리
	public int getTotalCount(CriteriaAR cri);

	
	
	public void insertSelectKey(ProtectAnimalVO board_num);

	public int update(ProtectAnimalVO board);

	public int delete(Long board_num);
	
	// 업로드된 보호중인 아이 파일 이미지 불러오기
	public List<ProtectAnimalAttachVO> imageAnimalList();



}

