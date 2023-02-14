package com.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zerock.domain.Criteria;
import com.zerock.domain.CriteriaAR;
import com.zerock.domain.ProductAttachVO;
import com.zerock.domain.ProductVO;
import com.zerock.domain.ProtectAnimalAttachVO;
import com.zerock.domain.ProtectAnimalVO;
import com.zerock.domain.QNAVO;
import com.zerock.mapper.ProductAttachMapper;
import com.zerock.mapper.ProtectAnimalMapper;
import com.zerock.mapper.ProtectAnimalAttachMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProtectAnimalServiceImpl implements ProtectAnimalService {

	@Setter(onMethod_ = @Autowired)
	private ProtectAnimalMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private ProtectAnimalAttachMapper attachMapper;
	

	@Override
	public List<ProtectAnimalVO> getList() {
		log.info("get List.........");
		return mapper.getList();
	}

	@Override
	public ProtectAnimalVO get(int board_num) {
		log.info("get............." + board_num);
		return mapper.read(board_num);
	}

	@Override
	public int staffgetTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<ProtectAnimalVO> staffgetList(Criteria cri) {
		log.info("get list with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}
	
	
	// 보호중인 동물 전체 목록 불러오기
	@Override
	public List<ProtectAnimalVO> animalList() {
		log.info("animalList..." );
		return mapper.animalList();
	}

	// ProtectAnimal 목록 전체 불러오기 + 페이징
	@Override
	public List<QNAVO> getList(CriteriaAR cri) {
		log.info("animalListPaging..." );
		return mapper.getListPaging(cri);
	}

	// ProtectAnimal 게시글 전체 데이터 불러오기
	@Override
	public int getTotal(CriteriaAR cri) {
		log.info("animalList getTotal..." );
		return mapper.getTotalCount(cri);
	}
	
	
	//게시글 등록
	@Transactional
	@Override
	public void register(ProtectAnimalVO board) {
		log.info("register..." + board);
		mapper.insertSelectKey(board);
		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		board.getAttachList().forEach(attach ->{
			attach.setBoard_num((long) board.getBoard_num());
			attachMapper.insert(attach);
		});
		
	}

	@Override
	public List<ProtectAnimalAttachVO> getAttachList(Long board_num) {
		log.info("get Attach list by board_num" + board_num);
		return attachMapper.findByBno(board_num);
	}

	@Transactional
	@Override
	public boolean modify(ProtectAnimalVO board) {
		log.info("modify..................." + board);
		
		attachMapper.deleteAll((long) board.getBoard_num());
		
		boolean modifyResult = mapper.update(board) == 1;
		
		if(modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {
			board.getAttachList().forEach(attach -> {
				attach.setBoard_num((long) board.getBoard_num());
				attachMapper.insert(attach);
			});
		}
		return modifyResult;
		
	}

	@Override
	public boolean remove(Long board_num) {
		log.info("remove..................." + board_num);
		
		attachMapper.deleteAll(board_num);
		
		return mapper.delete(board_num) == 1;
	}
	
	// 업로드된 보호중인 아이 파일 이미지 불러오기
	@Override
	public List<ProtectAnimalAttachVO> imageAnimalList() {
		
		System.out.println("myBatis에 담긴 값 : " + mapper.imageAnimalList());
		
		return mapper.imageAnimalList();
	}
	


}
