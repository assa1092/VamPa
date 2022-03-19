package com.vam.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.AdminMapper;
import com.vam.model.AttachImageVO;
import com.vam.model.BookVO;
import com.vam.model.CateVO;
import com.vam.model.Criteria;

@Service

public class AdminServiceImpl implements AdminService {
	private static final Logger log = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Autowired
	private AdminMapper adminMapper;
	
	// 상품 등록
	@Override
	public void bookEnroll(BookVO book) throws Exception {
		log.info("(service) bookEnroll()===============");
		log.info("----- book -----  : " + book);
		adminMapper.bookEnroll(book);
		
		if(book.getImageList() == null || book.getImageList().size() <=0) {
			log.info("=====================================================");
			return;
		}
		
		List<AttachImageVO> imageList = new ArrayList<AttachImageVO>();
		
		imageList = book.getImageList();
		
		log.info("imageList ============" + imageList);
				
		book.getImageList().forEach(attach ->{
			attach.setBookId(book.getBookId());
			adminMapper.imageEnroll(attach);	
		});
		
	}

	// 카테고리 리스트
	@Override
	public List<CateVO> cateList() throws Exception {
		log.info("(service) cateList()===============");
		return adminMapper.cateList();
	}

	// 상품 리스트
	@Override
	public List<BookVO> goodsGetList(Criteria cri) throws Exception {
		log.info("(service) goodsGetList()===============");
		return adminMapper.goodsGetList(cri);
	}

	// 상품 총 개수
	@Override
	public int goodsGetTotal(Criteria cri) throws Exception {
		log.info("(service) goodsGetTotal()===============");
		return adminMapper.goodsGetTotal(cri);
	}

	// 상품 상세
	@Override
	public BookVO goodsGetDetail(int bookId) throws Exception {
		log.info("(service) goodsGetDetail()===============" + bookId);
		return adminMapper.goodsGetDetail(bookId);
	}

	@Override
	public int goodsModify(BookVO vo) throws Exception {
		log.info("(service) goodsModify()===============" + vo);
		return adminMapper.goodsModify(vo);
	}

	@Override
	public int goodsDelete(int bookId) throws Exception {
		log.info("(service) goodsDelete()===============" + bookId);
		return adminMapper.goodsDelete(bookId);
	}
	
	

}
