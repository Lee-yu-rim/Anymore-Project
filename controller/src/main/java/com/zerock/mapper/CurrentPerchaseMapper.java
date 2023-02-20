package com.zerock.mapper;

import java.util.List;

import com.zerock.domain.Criteria;
import com.zerock.domain.CurrentPerchaseVO;

public interface CurrentPerchaseMapper {
	//회원 목록 보이기
	public List<CurrentPerchaseVO> getList();
			
	//회원 정보 상세보기
	public CurrentPerchaseVO read(Long perchase_num);
			
					
	//페이지
	public List<CurrentPerchaseVO> getListWithPaging(Criteria cri);
			
	public int getTotalCount(Criteria cri);
}
