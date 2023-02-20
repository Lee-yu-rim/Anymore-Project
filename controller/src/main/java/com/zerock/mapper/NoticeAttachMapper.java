package com.zerock.mapper;

import java.util.List;

import com.zerock.domain.NoticeAttachVO;

public interface NoticeAttachMapper {
	
	public void insert(NoticeAttachVO vo);
	public void delete(String uuid);
	public List<NoticeAttachVO> findByBno(Long bno);
	
	public void deleteAll(Long bno);
	
	public List<NoticeAttachVO> getOldFiles();
}
