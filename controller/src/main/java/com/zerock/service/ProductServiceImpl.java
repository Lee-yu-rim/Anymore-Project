package com.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zerock.domain.CartVO;
import com.zerock.domain.Criteria;
import com.zerock.domain.ProductAttachVO;
import com.zerock.domain.ProductVO;
import com.zerock.domain.ProtectAnimalVO;
import com.zerock.mapper.NoticeAttachMapper;
import com.zerock.mapper.ProductAttachMapper;
import com.zerock.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {
	
	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private ProductAttachMapper attachMapper;

	@Override
	public List<ProductVO> getList() {
		log.info("get List.......");
		return mapper.getList();
	}

	@Override
	public ProductVO get(int product_num) {
		log.info("get......");
		return mapper.read(product_num);
	}
	
	@Override
	public List<ProductAttachVO> productImgList() {
		log.info("image");
		return mapper.productImgList();
	}

	@Override
	public void addCart(CartVO cart) {
		log.info("add cart.....");
		mapper.addCart(cart);
	}

	@Override
	public int staffgetTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<ProductVO> staffgetList(Criteria cri) {
		log.info("get list with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}

	//게시글 등록
	@Transactional
	@Override
	public void register(ProductVO board) {
		log.info("register..." + board);
		mapper.insertSelectKey(board);
		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		board.getAttachList().forEach(attach ->{
			attach.setProduct_num((long) board.getProduct_num());
			attachMapper.insert(attach);
		});
		
	}

	@Override
	public List<ProductAttachVO> getAttachList(Long product_num) {
		log.info("get Attach list by product_num" + product_num);
		return attachMapper.findByBno(product_num);
	}

	@Override
	public boolean modify(ProductVO board) {
		log.info("modify..................." + board);
		
		attachMapper.deleteAll((long) board.getProduct_num());
		
		boolean modifyResult = mapper.update(board) == 1;
		
		if(modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {
			board.getAttachList().forEach(attach -> {
				attach.setProduct_num((long) board.getProduct_num());
				attachMapper.insert(attach);
			});
		}
		return modifyResult;
	}

	@Override
	public boolean remove(Long product_num) {
		log.info("remove..................." + product_num);
		
		attachMapper.deleteAll(product_num);
		
		return mapper.delete(product_num) == 1;
	}

	@Override
	public Object getProductAttachList(Long product_num) {
		log.info("get Attach list by product_num" + product_num);
		return attachMapper.findByBno(product_num);
	}

	

}
