package com.zerock.mapper;

import java.util.List;

import com.zerock.domain.FBAttachVO;



public interface FBAttachMapper {
	
	public void insert(FBAttachVO vo);
	public void delete(String uuid);
	public List<FBAttachVO> findByBno(Long bno);
	
	public void deleteAll(Long bno);
	
	public List<FBAttachVO> getOldFiles();
}
