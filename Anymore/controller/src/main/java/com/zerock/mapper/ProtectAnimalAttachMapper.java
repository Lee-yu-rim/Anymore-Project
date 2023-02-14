package com.zerock.mapper;

import java.util.List;

import com.zerock.domain.NoticeAttachVO;
import com.zerock.domain.ProtectAnimalAttachVO;

public interface ProtectAnimalAttachMapper {
	
	public void insert(ProtectAnimalAttachVO vo);
	public void delete(String uuid);
	public List<ProtectAnimalAttachVO> findByBno(Long board_num);
	
	public void deleteAll(Long board_num);
	
	public List<ProtectAnimalAttachVO> getOldFiles();
}
