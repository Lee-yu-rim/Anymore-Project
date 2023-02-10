package com.zerock.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class MemberControllerTests {

	@Setter(onMethod_ = @Autowired)
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception {
		log.info(
			mockMvc.perform(MockMvcRequestBuilders.get("/join/member_list"))
			.andReturn().getModelAndView().getModelMap());
	}
	
//	@Test
//	public void testRegister() throws Exception{
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/join/join_complete")
//				.param("id", "테스트 아이디")
//				.param("password", "테스트 비번")
//				.param("name", "테스트")
//				.param("phone", "01012345678")
//				.param("birth", "20000101")
//				.param("email", "test@naver.com")
//				.param("address", "테스트 주소")
//				).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
	
//	@Test
//	public void testGet() throws Exception {
//		log.info(mockMvc.perform(MockMvcRequestBuilders
//				.get("/join/member_info")
//				.param("id", "test2"))
//				.andReturn().getModelAndView().getModelMap());
//	}
	
//	@Test
//	public void testModify() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/join/member_modify")
//				.param("id", "test1")
//				.param("password", "수정 비번")
//				.param("phone", "01012345678")
//				.param("email", "modify@naver.com")
//				.param("address", "수정 주소")
//				).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
//	
//	@Test
//	public void testRemove() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/join/member_remove")
//				.param("id", "test5")
//				).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
	
}
