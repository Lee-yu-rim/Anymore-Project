package com.zerock.mapper;

import java.util.List;

import com.zerock.domain.CartVO;
import com.zerock.domain.MemberVO;

public interface CartMapper {
	public List<CartVO> getList(String id);
	public void delete(Long c_num);
	public void deleteAll(String id);
}
