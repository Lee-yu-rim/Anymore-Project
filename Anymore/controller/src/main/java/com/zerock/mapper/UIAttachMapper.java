package com.zerock.mapper;

import java.util.List;

import com.zerock.domain.UIAttachVO;


public interface UIAttachMapper {
	
	public void insert(UIAttachVO vo);
	public void delete(String uuid);
	public List<UIAttachVO> findByBno(Long bno);
	
	public void deleteAll(Long bno);
	
	public List<UIAttachVO> getOldFiles();
}
