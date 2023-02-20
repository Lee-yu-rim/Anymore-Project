package com.zerock.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.zerock.domain.Criteria;
import com.zerock.domain.MemberVO;
import com.zerock.domain.PassFindVO;

public interface MemberService {
	
	//경은씨가 추가한 회원정보 수정
	public void update(MemberVO member);
	
	
	//회원 목록 가져오기
	public List<MemberVO> getList();
	
	//회원 가입
	public void register(MemberVO member);
	
	//카카오 회원가입
	public void kakao_insert(MemberVO member);
	
	//카카오 회원가입 여부 체크
	public MemberVO kakao_check(String kakao_email);
	
	//회원 정보 상세보기
	public MemberVO get(String id);
	
	//회원 정보 수정
	public boolean modify(MemberVO member);
	
	//회원 정보 삭제
	public boolean remove(MemberVO member);
	
	//아이디 중복 체크
	public MemberVO idCheck(String id);
	
	//로그인
	public MemberVO login(MemberVO member) throws Exception;
	
	//비밀번호 찾기
//	public PassFindVO pass_find(PassFindVO vo);
	public void findPw(HttpServletResponse resp, MemberVO vo) throws Exception;
	
	//이메일발송
	public void sendEmail(MemberVO vo, String div) throws Exception;
	
	// 비밀번호 변경
	public int updatePw(MemberVO vo) throws Exception;


	//페이지
	public int getTotal(Criteria cri);
	
	public List<MemberVO> getList(Criteria cri);

}
