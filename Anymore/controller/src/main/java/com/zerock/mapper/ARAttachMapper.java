package com.zerock.mapper;

import java.util.List;

import com.zerock.domain.ARAttachVO;



public interface ARAttachMapper {
	
	public void insert(ARAttachVO vo);
	public void delete(String uuid);
	public List<ARAttachVO> findByBno(Long bno);
	
	public void deleteAll(Long bno);
	
	public List<ARAttachVO> getOldFiles();
	
	
	
	
//	public List<ARAttachVO> read(Long bno);
	
	
	// 업로드된 보호중인 아이 파일 이미지 불러오기
	public List<ARAttachVO> imageList();
	
}
