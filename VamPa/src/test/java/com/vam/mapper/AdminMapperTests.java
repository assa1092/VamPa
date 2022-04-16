package com.vam.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vam.model.AttachImageVO;
import com.vam.model.BookVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTests {

		@Autowired
		private AdminMapper mapper;
		
//		// 상품 정보 삭제
//		@Test
//		public void goodsDeleteTest() {
//			int bookId = 167;
//			
//			int result = mapper.goodsDelete(bookId);
//			
//			if(result ==1) {
//				System.out.println("상품 번호 : " + bookId + " 가 삭제 되었습니다.");				
//			}
//			
//		}
		
//		/* 상품 정보 수정 */
//		@Test
//		public void goodsModifyTest() {
//			
//			BookVO book = new BookVO();
//			
//			book.setBookId(95);
//			book.setBookName("mapper 테스트");
//			book.setAuthorId(321);
//			book.setPubleYear("2021-03-18");
//			book.setPublisher("출판사");
//			book.setCateCode("103002");
//			book.setBookPrice(20000);
//			book.setBookStock(300);
//			book.setBookDiscount(0.23);
//			book.setBookIntro("책 소개 ");
//			book.setBookContents("책 목차 ");
//			
//			mapper.goodsModify(book);
//			
//		}
		
//		/* 상품 조회 페이지 */
//		@Test
//		public void goodsGetDetailTest() {
//			
//			int bookId = 50;
//			
//			BookVO result = mapper.goodsGetDetail(bookId);
//			
//			System.out.println("상품 조회 데이터 : " + result);
//			
//			
//		}
		
 		//상품 등록
//		@Test
//		public void bookEnrollTest() throws Exception{
//			BookVO book = new BookVO();
//			
//			book.setBookName("mapper 테스트");
//			book.setAuthorId(56);
//			book.setPubleYear("2021-03-18");
//			book.setPublisher("출판사");
//			book.setCateCode("203002");
//			book.setBookPrice(20000);
//			book.setBookStock(300);
//			book.setBookDiscount(0.23);
//			book.setBookIntro("책 소개 ");
//			book.setBookContents("책 목차 ");
//			
//			System.out.println("Before BookVO : " + book);
//			
//			mapper.bookEnroll(book);
//			
//			System.out.println("After BookVO : " + book);
//		}
		
//		@Test
//		public void catelist( ) throws Exception{
//			System.out.println("++++++++++++++++   cateList() : " + mapper.cateList());
//			
//		}
		
//		/* 상품 리스트 & 상품 총 갯수 */
//		@Test
//		public void goodsGetListTest() {
//			
//			Criteria cri = new Criteria();
//			
//			/* 검색조건 */
//			cri.setKeyword("테스트");
//			
//			/* 검색 리스트 */
//			List list = mapper.goodsGetList(cri);
//			for(int i = 0; i < list.size(); i++) {
//				System.out.println("result......." + i + " : " + list.get(i));
//			}
//			
//			/* 상품 총 갯수 */
//			int result = mapper.goodsGetTotal(cri);
//			System.out.println("result.........." + result);
//			
//			
//		}
		
		// 이미지 등록
//		@Test
//		public void imageEnrollTest() {
//			AttachImageVO vo = new AttachImageVO();
//			
//			vo.setBookId(23);
//			vo.setFileName("test");
//			vo.setUploadPath("test");
//			vo.setUuid("test2");
//			
//			mapper.imageEnroll(vo);
//		}
//		
		
		// 지정 상품 이미지 전체 삭제
		@Test
		public void deleteImageAllTests() {
			int bookId = 173;
			
			mapper.deleteImageAll(bookId);
		}
}
