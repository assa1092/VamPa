package com.vam.mapper;

import java.util.List;

import com.vam.model.BoardVO;
import com.vam.model.Criteria;

public interface BoardMapper {

	
	// 게시판 등록
	public void enroll(BoardVO board);
	
	// 게시판 목록
	public List<BoardVO> getList();
	
	// 게시글 목록(페이징 적용)
	public List<BoardVO> getListPaging(Criteria cri);
	
	// 게시판 조회
	public BoardVO getPage(int bno);
	
	// 게시판 수정
	public int modify(BoardVO board);
	
	// 게시글 삭제
	public int delete(int bno);
	
	// 게시글 총 개수
	// 게시글 페이징 처리를 위해 총 개수를 알아야한다.
	public int getTotal(Criteria cri);
}
