package com.zerock.service;

import java.util.List;

import com.zerock.domain.AdoptReservationVO;
import com.zerock.domain.Adopt_Criteria;

public interface AdoptreservationService {

		public List<AdoptReservationVO> getList();

		public AdoptReservationVO get(int adoptnum);

		//페이지
		public int getTotal(Adopt_Criteria cri);
		
		public List<AdoptReservationVO> getList(Adopt_Criteria cri);
		
		// 입양신청서 폼 값 insert
		public int formSubmit(AdoptReservationVO vo);
		
		// 입양신청서 폼 값 select
		public AdoptReservationVO formSelect(int adoptNum);
}
