package com.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.zerock.domain.CartVO;
import com.zerock.domain.MemberVO;
import com.zerock.mapper.CartMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@Repository
@AllArgsConstructor
public class CartServiceImpl implements CartService {
	@Setter(onMethod_ = @Autowired) 
	private CartMapper cartMapper;

	@Override
	public List<CartVO> getList(String id) {
		log.info("getList...Cart");
		return cartMapper.getList(id);
	}

	@Override
	public void delete(Long c_num) {
		log.info("delete... : " + c_num);
		cartMapper.delete(c_num);
	}

	@Override
	public void deleteAll(String id) {
		cartMapper.deleteAll(id);
	}
	
}
