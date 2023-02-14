package com.zerock.mapper;

import java.util.List;

import com.zerock.domain.NoticeAttachVO;
import com.zerock.domain.ProductAttachVO;

public interface ProductAttachMapper {
	
	public void insert(ProductAttachVO vo);
	public void delete(String uuid);
	public List<ProductAttachVO> findByBno(Long product_num);
	
	public void deleteAll(Long product_num);
	
	public List<ProductAttachVO> getOldFiles();
}
