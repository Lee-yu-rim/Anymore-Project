package com.zerock.mapper;

import com.zerock.domain.ReserVO;

public interface ReserMapper {
	
	public void insert(ReserVO reser);
	
	public ReserVO read(Long num);
}
