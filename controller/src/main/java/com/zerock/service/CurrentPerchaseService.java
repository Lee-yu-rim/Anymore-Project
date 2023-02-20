package com.zerock.service;

import java.util.List;

import com.zerock.domain.Criteria;
import com.zerock.domain.CurrentPerchaseVO;
import com.zerock.domain.ProtectAnimalVO;

public interface CurrentPerchaseService {

	public List<CurrentPerchaseVO> getList();
			
	public CurrentPerchaseVO get(Long perchase_num);
			
	//페이지
	public int getTotal(Criteria cri);
			
	public List<CurrentPerchaseVO> getList(Criteria cri);
}
