package com.zerock.service;

import java.util.List;

import com.zerock.domain.ZzimVO;

public interface ZzimService {
	
	// 찜하기
	public int zzimGood(ZzimVO zzim);
	
	// 찜삭제
	public int deleteZzim(ZzimVO zzim);
	
	// 찜 목록 불러오기
	public List<ZzimVO> zzimList(String memberId);
	 
	// 찜 여부 확인용
	public int zzimCheck(String memberId, int board_num);

}
