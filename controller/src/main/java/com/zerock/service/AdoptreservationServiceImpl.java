package com.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zerock.domain.AdoptReservationVO;
import com.zerock.domain.Adopt_Criteria;
import com.zerock.domain.PassFindVO;
import com.zerock.mapper.AdoptReservationMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdoptreservationServiceImpl implements AdoptreservationService {
	@Setter(onMethod_ = @Autowired)
	private AdoptReservationMapper mapper;

	@Override
	public List<AdoptReservationVO> getList() {
		// TODO Auto-generated method stub
		log.info("get List.........");
		return mapper.getList();
	}

	@Override
	public AdoptReservationVO get(int adoptnum) {
		log.info("get............." + adoptnum);
		return mapper.read(adoptnum);
	}


	@Override
	public int getTotal(Adopt_Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<AdoptReservationVO> getList(Adopt_Criteria cri) {
		log.info("get list with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}

	// 입양신청서 폼 값 insert
	@Override
	public int formSubmit(AdoptReservationVO vo) {
		log.info("formSubmit...");
		mapper.formSubmit(vo);
		int adoptnum = vo.getAdoptnum();
		
		return adoptnum;
	}

	// 입양신청서 폼 값 select
	@Override
	public AdoptReservationVO formSelect(int adoptNum) {
		
		return mapper.formSelect(adoptNum);
	}





}
