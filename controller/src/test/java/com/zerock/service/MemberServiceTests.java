package com.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zerock.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	
//	@Test 
//	public void testExist() {
//		log.info(service);
//		assertNotNull(service);
//	}
	
//	@Test
//	public void testRegister() {
//		MemberVO member = new MemberVO();
//		member.setId("register");
//		member.setPassword("5678efg");
//		member.setName("join_test2");
//		member.setPhone(01011111111);
//		member.setBirth(19990101);
//		member.setEmail("aaaa@naver.com");
//		member.setAddress("인천광역시 동구 화도진로 113");
//		
//		service.register(member);
//		
//		log.info("생성된 아이디 : " + member.getId());
//	}
	
//	@Test
//	public void testGetList() {
//		service.getList().forEach(member -> log.info(member));
//	}
	
//	@Test
//	public void testGet() {
//		log.info(service.get("test5"));
//	}
	
//	@Test
//	public void testDelete() {
//		log.info("remover result: " + service.remove("test3"));
//	}
	
//	@Test
//	public void testUpdate() {
//		MemberVO member = service.get("test4");
//		
//		if(member ==  null) {
//			return;
//		}
//		
//		member.setPassword("비번 수정");
//		log.info("modify result : " + service.modify(member));
//	}

}
