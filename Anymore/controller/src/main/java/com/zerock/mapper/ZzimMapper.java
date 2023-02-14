package com.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zerock.domain.ZzimVO;

public interface ZzimMapper {

	// 찜하기
	public int zzimGood(ZzimVO zzim);
	
	// 찜삭제
	public int deleteZzim(ZzimVO zzim);
	
	// 찜 목록 불러오기
	 public List<ZzimVO> zzimList(String memberId);
	 
	// 찜 여부 확인용
	public int zzimCheck(@Param("memberId")String memberId, @Param("board_num") int board_num);
}
