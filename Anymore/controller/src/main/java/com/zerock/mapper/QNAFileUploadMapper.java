package com.zerock.mapper;

import java.util.List;

import com.zerock.domain.QNAFileUploadVO;

public interface QNAFileUploadMapper {

	public void insert(QNAFileUploadVO vo);
	
	public void delete(String uuid);
	
	public List<QNAFileUploadVO> findByBno(Long bno);
	
	public void deleteAll(Long bno);
	
	public List<QNAFileUploadVO> getOldFiles();
	
}
