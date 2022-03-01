package com.vam.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vam.model.AuthorVO;
import com.vam.model.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AuthorServiceTests {
	@Autowired
	private AuthorService service;
	
//	@Test
//	public void authorEnrollTest() throws Exception{
//		AuthorVO author = new AuthorVO();
//		
//        author.setNationId("01");
//        author.setAuthorName("테스트");
//        author.setAuthorIntro("테스트 소개");
//        
//        service.authorEnroll(author);
//        
//	}
	
	@Test
	public void authorGetList() throws Exception{
		Criteria cri = new Criteria(3, 10);
		
		List<AuthorVO> list = service.authorGetList(cri);
		
		
		for(int i=0; i<list.size(); i++) {
			System.out.println(list);
		}
		
		
	}
}
