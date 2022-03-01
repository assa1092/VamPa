package com.vam.mapper;

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
public class AuthorMapperTests {

    @Autowired
    private AuthorMapper mapper;
    
    // 작가 정보 삭제
    @Test
    public void authorDelete() throws Exception{
    	int authorId = 360;
    	
    	int result = mapper.authorDelete(authorId);
    	
    	if(result ==1) {
    		System.out.println("작가 삭제 성공");
    	}
    	
    }
    
//    /* 작가 등록 테스트 */
//    @Test
//    public void authorEnroll() throws Exception{
//        
//        AuthorVO author = new AuthorVO();
//        
//        author.setNationId("01");
//        author.setAuthorName("테스트");
//        author.setAuthorIntro("테스트 소개");
//        
//        mapper.authorEnroll(author);
//        
//    }  
    
    // 작가 목록 테스트
//    @Test
//    public void authorGetListTests() throws Exception{
//    	Criteria cri = new Criteria(3,10);
//    	cri.setKeyword("난");
//    	List<AuthorVO> list = mapper.authorGetList(cri);
//    	
//    	for(int i=0 ; i < list.size(); i++) {
//    		System.out.println("list  " + i + "   =============   " + list.get(i));
//    	}
//    }
//    
//    // 작가 총 수 테스트
//    @Test
//    public void authorGetTotal() throws Exception{
//    	Criteria cri = new Criteria();
//    	
//    	cri.setKeyword("웹");
//    	
//    	int total = mapper.authorGetTotal(cri);
//    	
//    	System.out.println("작가 총 수 : " + total);	
//    }
//    
//    // 작가 상세 페이지
//    @Test
//    public void authorGetDetail() throws Exception{
//    	int authorId = 30;
//    	
//    	AuthorVO author = mapper.authorGetDetail(authorId);
//    	
//    	System.out.println("작가 상세페이지 : " + author);
//    }
//    
//    // 작가 정보 수정
//    @Test
//    public void authorModify() throws Exception{
//    	AuthorVO author = new AuthorVO();
//    	
//    	author.setAuthorId(30);
//    	
//    	System.out.println("########    수정 전 #######" + mapper.authorGetDetail(author.getAuthorId()));
//    	
//    	author.setAuthorName("수정");
//    	author.setNationId("01");
//    	author.setAuthorIntro("소개 수정 하였습니다.");
//    	
//    	mapper.authorModify(author);
//    	
//    	System.out.println("########    수정 후 #######" + mapper.authorGetDetail(author.getAuthorId()));
//    }
	
	
}