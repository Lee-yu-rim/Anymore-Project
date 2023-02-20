package com.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zerock.domain.ZzimVO;
import com.zerock.mapper.ZzimMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ZzimServiceImpl implements ZzimService {

	private ZzimMapper mapper;

	// 찜하기 
	@Override
	public int zzimGood(ZzimVO zzim) {
		System.out.println("zzim mapper good...");
		return mapper.zzimGood(zzim);
	}


	// 찜삭제
	@Override
	public int deleteZzim(ZzimVO zzim) {
		System.out.println("zzim mapper delete...");
		return mapper.deleteZzim(zzim);
	}
	
	// 찜 목록 가져오기
	@Override
	public List<ZzimVO> zzimList(String memberId) {
		System.out.println("zzim mapper List...");
		return mapper.zzimList(memberId);
	}

	// 찜 여부 확인용
	@Override
	public int zzimCheck(String memberId, int board_num) {
		System.out.println("zzimCheck... : " + memberId + board_num);
		return mapper.zzimCheck(memberId, board_num);
	}
	
}
