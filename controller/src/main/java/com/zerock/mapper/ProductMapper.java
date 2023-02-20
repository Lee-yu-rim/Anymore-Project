package com.zerock.mapper;

import java.util.List;

import com.zerock.domain.CartVO;
import com.zerock.domain.Criteria;
import com.zerock.domain.ProductAttachVO;
import com.zerock.domain.ProductVO;
import com.zerock.domain.ProtectAnimalVO;

public interface ProductMapper {
	
	//상품 목록 가져오기
	public List<ProductVO> getList();
	
	//상품 정보 가져오기(상세보기)
	public ProductVO read(int product_num);
	
	//상품 장바구니 담기
	public void addCart(CartVO cart);
	
	//이미지 불러오기
	public List<ProductAttachVO> productImgList();
	
	
	public int getTotalCount(Criteria cri);

	public List<ProductVO> getListWithPaging(Criteria cri);

	
	
	public void insertSelectKey(ProductVO board);
	
	public int update(ProductVO board);

	public int delete(Long product_num);
	
}
