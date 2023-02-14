package com.zerock.service;

import com.zerock.domain.ReserVO;

public interface ReserService {
	
	public void register(ReserVO reser);
	
	public ReserVO get(Long num);
	
	
}
