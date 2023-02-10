package com.zerock.mapper;

import java.util.List;

import com.zerock.domain.Criteria;
import com.zerock.domain.MemberVO;
import com.zerock.domain.PassFindVO;

public interface MemberMapper {
	
	//회원 정보 수정
	public void updateMembers(MemberVO member);
	
	//회원 목록 보이기
	public List<MemberVO> getList();
	
	//회원 가입(회원 정보 등록)
	public void insert(MemberVO member);
	
	//카카오 회원가입
	public void kakao_insert(MemberVO member);
	
	//카카오 회원가입 여부 체크
	public MemberVO kakao_check(String kakao_email);
	
	//회원 정보 상세보기
	public MemberVO read(String id);
	
	//회원 정보 수정
	public int update(MemberVO member);
	
	//회원 정보 삭제(탈퇴)
	public int delete(String id);
	
	//아이디 중복 체크
	public MemberVO idCheck(String id);
	
	//로그인
	public MemberVO login(MemberVO member) throws Exception;
	
	//비밀번호 찾기
	public PassFindVO pass_find(PassFindVO vo);
	
	
	//페이지
	public List<MemberVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
}
