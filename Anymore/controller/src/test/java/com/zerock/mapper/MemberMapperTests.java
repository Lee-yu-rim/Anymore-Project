package com.zerock.mapper;

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
public class MemberMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(member -> log.info(member));
//	}
	
//	@Test
//	public void testTest() {
//		MemberVO member = new MemberVO();
//		member.setId("insert");
//		member.setPassword("5678efg");
//		member.setName("join_test2");
//		member.setPhone(01011111111);
//		member.setBirth(19990101);
//		member.setEmail("aaaa@naver.com");
//		member.setAddress("인천광역시 동구 화도진로 113");
//		
//		mapper.insert(member);
//		
//		log.info(member);
//	}
	
//	@Test
//	public void testRead() {
//		MemberVO member = mapper.read("test1");
//		
//		log.info(member);
//	}
	
//	@Test
//	public void testDelete() {
//		log.info("Delete Count: " + mapper.delete("test2"));
//	}
	
//	@Test
//	public void testUpdate() {
//		MemberVO member = new MemberVO();
//		
//		member.setId("test3");
//		member.setPassword("updatepass123");
//		member.setPhone(01033333333);
//		member.setEmail("update@naver.com");
//		member.setAddress("인천광역시 중구");
//		
//		int count = mapper.update(member);
//		log.info("Update Count: " + count);
//	}
	
}
