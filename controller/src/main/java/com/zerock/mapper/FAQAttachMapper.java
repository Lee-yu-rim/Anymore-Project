package com.zerock.mapper;

import java.util.List;

import com.zerock.domain.FAQAttachVO;

public interface FAQAttachMapper {
	
	public void insert(FAQAttachVO vo);
	public void delete(String uuid);
	public List<FAQAttachVO> findByBno(Long bno);
	
	public void deleteAll(Long bno);
	
	public List<FAQAttachVO> getOldFiles();
}
