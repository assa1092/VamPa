package com.vam.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vam.model.BoardVO;
import com.vam.model.Criteria;
import com.vam.model.PageMakerDTO;
import com.vam.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	/*
	 * // 게시판 목록
	 * 
	 * @RequestMapping(value = "/list", method = RequestMethod.GET) public void
	 * boardListGET(Model model) { log.info("####  게시판 목록");
	 * 
	 * List<BoardVO> list = boardService.getList();
	 * 
	 * model.addAttribute("list", list);
	 * 
	 * }
	 */
	
    /* 게시판 목록 페이지 접속(페이징 적용) */
    @GetMapping("/list")
    public void boardListGET(Model model, Criteria cri) {
        log.info("boardListGET");
        
        List<BoardVO> list = boardService.getListPaging(cri);
        model.addAttribute("list", list);
        
        // 페이징 적용을 위한 가공
        int total = boardService.getTotal(cri);	// 게시글 총개수

        // 페이징 처리를 위해 보여줄 페이지, 총개수를 파라메타로 보낸다.
        PageMakerDTO pageMaker = new PageMakerDTO(cri, total);

        model.addAttribute("pageMaker", pageMaker);
    }
	
	/* 게시판 등록 페이지 접속 */
	@RequestMapping(value = "/enroll", method = RequestMethod.GET)
	public void boardEnrollGET() {
		log.info("게시판 등록 페이지 진입");
		
	}
	
	/* 게시판 등록 */
	@RequestMapping(value = "/enroll", method = RequestMethod.POST)
	public String boardEnrollPOST(BoardVO board, RedirectAttributes rttr) {
		log.info("BoardVO : " + board);
		
		boardService.enroll(board);
		
		rttr.addFlashAttribute("result", "enroll success");
		
		return "redirect:/board/list";
	}
	
	// 게시판 조회
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public void boardGetPageGET(int bno, Model model, Criteria cri) {
		BoardVO vo = boardService.getPage(bno);
		
		System.out.println("상세보기 bno : " +  vo.getBno());
		
		model.addAttribute("pageInfo", vo);
		model.addAttribute("cri", cri);
		
	}
	
	// 게시판 수정 이동
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void boardModifyGET(int bno, Model model, Criteria cri) {
		BoardVO vo = boardService.getPage(bno);
		model.addAttribute("pageInfo", vo);
		model.addAttribute("cri", cri);
	}
	
	// 페이지 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String boardModifyPOST(BoardVO board, RedirectAttributes rttr) {
		boardService.modify(board);
		
		rttr.addFlashAttribute("result", "modify success");
		return "redirect:/board/list";
	}
	
	// 게시글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String boardDeletePOST(int bno, RedirectAttributes rttr) {
		boardService.delete(bno);
		
		rttr.addFlashAttribute("result", "delete success");
		
		return "redirect:/board/list";
	}
	

	
	
}
