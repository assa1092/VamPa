package com.vam.service;

import java.util.List;

import com.vam.model.BookVO;
import com.vam.model.CateVO;
import com.vam.model.Criteria;

public interface AdminService {
	
	// 상품 등록
	public void bookEnroll(BookVO book) throws Exception;
	
	// 카테고리 리스트
	public List<CateVO> cateList() throws Exception;
	
	// 상품 리스트
	public List<BookVO> goodsGetList(Criteria cri) throws Exception;
	
	// 상품 총 개수
	public int goodsGetTotal(Criteria cri) throws Exception;

	// 상품 상세
	public BookVO goodsGetDetail(int bookId) throws Exception;
	
	// 상품 수정
	public int goodsModify(BookVO vo) throws Exception;
	
	// 상품 정보 삭제
	public int goodsDelete(int bookId) throws Exception;
}
