package com.zerock.mapper;

import java.util.List;

import com.zerock.domain.QNAFileUploadVO;

public interface QNAFileUploadMapper {

	public void qnaInsert(QNAFileUploadVO vo);
	
	public void qnaDelete(String uuid);
	
	public List<QNAFileUploadVO> qnaFindByBno(Long bno);
	
	public void qnaDeleteAll(Long bno);
	
}
