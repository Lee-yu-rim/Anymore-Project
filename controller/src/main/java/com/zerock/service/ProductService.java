package com.zerock.service;

import java.util.List;

import com.zerock.domain.CartVO;
import com.zerock.domain.Criteria;
import com.zerock.domain.NoticeAttachVO;
import com.zerock.domain.ProductAttachVO;
import com.zerock.domain.ProductVO;
import com.zerock.domain.ProtectAnimalVO;

public interface ProductService {
	
	//상품 목록 가져오기
	public List<ProductVO> getList();

	//상품 정보 가져오기(상세보기)
	public ProductVO get(int product_num);
	
	//상품 장바구니 담기
	public void addCart(CartVO cart);
	
	//이미지 불러오기
	public List<ProductAttachVO> productImgList();
	
	
	//스태프에서 불러오기용
	public int staffgetTotal(Criteria cri);
	
	public List<ProductVO> staffgetList(Criteria cri);

	public void register(ProductVO board);
	
	
	public List<ProductAttachVO> getAttachList(Long product_num);

	public boolean modify(ProductVO board);
	
	public boolean remove(Long product_num);

	public Object getProductAttachList(Long product_num);
}
