package com.zerock.service;

import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zerock.domain.Criteria;
import com.zerock.domain.MemberVO;
import com.zerock.domain.PassFindVO;
import com.zerock.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	//경은씨가 추가한 회원정보 수정
	@Override
	public void update(MemberVO member) {
		log.info("update........." + member);
		mapper.updateMembers(member);
	}

	@Override
	public List<MemberVO> getList() {
		log.info("get List.........");
		return mapper.getList();
	}
	
	@Override
	public void register(MemberVO member) {
		log.info("register....." + member);
		mapper.insert(member);
	}
	
	@Override
	public void kakao_insert(MemberVO member) {
		log.info("kakao register....." + member);
		mapper.kakao_insert(member);
	}

	@Override
	public MemberVO get(String id) {
		log.info("get............." + id);
		return mapper.read(id);
	}

	@Override
	public boolean modify(MemberVO member) {
		log.info("modify........." + member);
		return mapper.update(member) == 1;
	}

	@Override
	public boolean remove(MemberVO member) {
		log.info("remove......." + member);
		return mapper.delete(member) == 1;
	}

	@Override
	public MemberVO idCheck(String id) {
		log.info("id check...........");
		return mapper.idCheck(id);
	}

	@Override
	public MemberVO login(MemberVO member) throws Exception{
		log.info("login..........");
		return mapper.login(member);
	}

//	@Override
//	public PassFindVO pass_find(PassFindVO vo) {
//		log.info("pass find......");
//		return mapper.pass_find(vo);
//	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<MemberVO> getList(Criteria cri) {
		log.info("get list with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public MemberVO kakao_check(String kakao_email) {
		log.info("kakao login check");
		return mapper.kakao_check(kakao_email);
	}

	//비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(MemberVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "ghdbdlfla@naver.com";
		String hostSMTPpwd = "your4699rim";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "ghdbdlfla@naver.com";
		String fromName = "애니모어 유기동물 보호소";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "애니모어 유기동물 보호소";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getPassword() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getEmail();
		try {			
			//객체 선언
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSLOnConnect(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); 
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setStartTLSEnabled(true);
			email.addTo(mail,charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();	
			
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	//비밀번호찾기
	@Override
	public void findPw(HttpServletResponse response, MemberVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		MemberVO ck = mapper.read(vo.getId());
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(mapper.idCheck(vo.getId()) == null) {
			out.print("회원 정보를 확인 해주세요.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!vo.getEmail().equals(ck.getEmail())) {
			out.print("회원 정보를 확인 해주세요.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setPassword(pw);
			// 비밀번호 변경
			mapper.updatePw(vo);
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}
	
	@Override
	public int updatePw(MemberVO vo) throws Exception {
		return mapper.updatePw(vo);
	}

	

}
