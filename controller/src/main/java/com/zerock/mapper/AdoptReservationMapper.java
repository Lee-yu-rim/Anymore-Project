package com.zerock.mapper;

import java.util.List;

import com.zerock.domain.AdoptReservationVO;
import com.zerock.domain.Adopt_Criteria;

public interface AdoptReservationMapper {
	
	// 입양신청서 폼 값 insert
	public int formSubmit(AdoptReservationVO vo);
	
	// 입양신청서 폼 값 select
	public AdoptReservationVO formSelect(int adoptNum);

	public List<AdoptReservationVO> getListWithPaging(Adopt_Criteria cri);

	public int getTotalCount(Adopt_Criteria cri);

	public AdoptReservationVO read(int adoptnum);

	public List<AdoptReservationVO> getList();

	
}
