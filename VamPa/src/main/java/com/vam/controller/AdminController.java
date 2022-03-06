package com.vam.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.vam.model.AuthorVO;
import com.vam.model.BookVO;
import com.vam.model.CateVO;
import com.vam.model.Criteria;
import com.vam.model.PageDTO;
import com.vam.service.AdminService;
import com.vam.service.AuthorService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	private static final Logger log = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AuthorService authorService;
	
	@Autowired
	private AdminService adminService;
	
	// 관리자 메인 페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void adminMainGET() throws Exception {
		log.info("관리자 페이지 이동");
	}
	
	// 상품 관리 페이지 접속
	@RequestMapping(value = "/goodsManage", method = RequestMethod.GET)
	public void goodsManageGET(Criteria cri, Model model) throws Exception{
		log.info("상품 관리 페이지 접속");
		
		// 상품 리스트 데이터
		List list = adminService.goodsGetList(cri);
		
		// 상품 리스트 데이터 유무에 따른 처리
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return ;
		}
		
		model.addAttribute("pageMaker", new PageDTO(cri, adminService.goodsGetTotal(cri)));
		
		
	}
	
	// 상품 등록 페이지 접속
	@RequestMapping(value = "/goodsEnroll", method = RequestMethod.GET)
	public void goodsEnrollGET(Model model) throws Exception{
		log.info("상품 등록 페이지 접속");
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		List<CateVO> list = adminService.cateList();
		
		String cateList = objectMapper.writeValueAsString(list);
		
		model.addAttribute("cateList", cateList);
		
		log.info("++++   변경 전 : " + list);
		log.info("++++   변경 후 : " + cateList);
	}
	
	// 작가 등록 페이지 접속
	@RequestMapping(value = "/authorEnroll", method = RequestMethod.GET)
	public void authorEnrollGET() throws Exception{
		log.info("작가 등록 페이지 접속");

		
	}
	// 작가 관리 페이지 접속
	@RequestMapping(value = "/authorManage", method = RequestMethod.GET)
	public void authorManageGET(Criteria cri, Model model) throws Exception{
		log.info("작가 관리 페이지 접속");
		
		List<AuthorVO> list = authorService.authorGetList(cri);
		
		if (!list.isEmpty()) {
			model.addAttribute("list", list);			
		} else {
			model.addAttribute("listCheck", "empty");
		}
		
		// 작가 총 수
		int total = authorService.authorGetTotal(cri);
		PageDTO pageMaker = new PageDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	// 작가 등록
	@RequestMapping(value = "/authorEnroll.do", method = RequestMethod.POST)
	public String authorEnrollPOST(AuthorVO author, RedirectAttributes rttr) throws Exception{
		log.info("작가 등록 : " + author);
		
		authorService.authorEnroll(author);
		
		rttr.addFlashAttribute("enroll_result", author.getAuthorName());
		
		return "redirect:/admin/authorManage";
	}
	
	// 작가 상세 페이지
//	@RequestMapping(value = "/authorDetail", method = RequestMethod.GET)
	@GetMapping({"/authorDetail","/authorModify"})
	public void authorGetInfoGet(int authorId, Criteria cri, Model model) throws Exception{
		log.info("작가 상세페이지 : " + authorId);
		
		AuthorVO authorInfo = authorService.authorGetDetail(authorId);
		
		// 작가 관리 페이지 정보
		model.addAttribute("cri", cri);
		model.addAttribute("authorInfo", authorInfo);
	}
	
	// 작가 정보 수정
	@PostMapping("/authorModify")
	public String authorModifyPOST(AuthorVO author, RedirectAttributes rttr) throws Exception{
		log.info("작가 정보 수정 : " + author);
		
		int result = authorService.authorModify(author);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/admin/authorManage";
	}
	
	// 작가 정보 삭제
	@PostMapping("/authorDelete")
	public String authorDeletePOST(int authorId, RedirectAttributes rttr) throws Exception{
		log.info("작가 정보 삭제 : " + authorId);
		
		int result = 0;
		
		try {
			result = authorService.authorDelete(authorId);			
		} catch (Exception e) {
			e.printStackTrace();
			result = 2;
			rttr.addFlashAttribute("delete_result", result);
			return "redirect:/admin/authorManage";
		}
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/admin/authorManage";
	}
	
	// 상품 등록 
	@PostMapping("/goodsEnroll")
	public String goodsEnrollPOST(BookVO book, RedirectAttributes rttr) throws Exception{
		log.info("상품 등록 :" + book);
		
		adminService.bookEnroll(book);
		
		rttr.addFlashAttribute("enroll_result", book.getBookName());
		
		return "redirect:/admin/goodsManage";
	}
	
	
	  // 작가 검색 팝업창
	  @GetMapping("/authorPop") 
	  public void authorPopGET(Criteria cri, Model model) throws Exception{
		  log.info("authorPopGET()======== ");
		  
		  cri.setAmount(5);
		  
		  // 작가 게시물 출력 데이터
		   List<AuthorVO> list = authorService.authorGetList(cri);
		   
		   if (!list.isEmpty()) {
			   model.addAttribute("list", list);
		   } else {
			   model.addAttribute("listCheck", "empty");
		   }
		   
		   // 페이지 이동 인터페이스 데이터
		   model.addAttribute("pageMaker", new PageDTO(cri, authorService.authorGetTotal(cri)));
		  
	  }
	  
	  // 상품 상세페이지
	  @GetMapping({"/goodsDetail", "/goodsModify"})
	  public void goodsGetInfoGet(int bookId, Criteria cri, Model model ) throws Exception{
		  log.info("goodsGetInfo()=========" + bookId);
		  
		  BookVO bookInfo = adminService.goodsGetDetail(bookId);
		  
		  // 카테고리 리스트 데이터 처리
		  ObjectMapper objectMapper = new ObjectMapper();
			
		  List<CateVO> list = adminService.cateList();
		
		  String cateList = objectMapper.writeValueAsString(list);
		  
		  model.addAttribute("cateList", cateList);
		  
		  // 목록 페이지 조건 정보
		  model.addAttribute("cri", cri);
		  // 상품 상세페이지 정보
		  model.addAttribute("goodsInfo", bookInfo);
		  
		  
	  }
	  
	  // 상품 정보 수정
	  @PostMapping("/goodsModify")
	  public String goodsModifyPOST(BookVO vo, RedirectAttributes rttr) throws Exception {
		  log.info("상품 정보 수정======" + vo);
		  
		  int result = adminService.goodsModify(vo);
		  
		  rttr.addFlashAttribute("modify_result", result);
		  
		  return "redirect:/admin/goodsManage";
	  }
	  
	  // 상품 정보 삭제
	  @PostMapping("/goodsDelete")
	  public String goodsDeletePOST(int bookId, RedirectAttributes rttr) throws Exception{
		  log.info("상품 정보 삭제 : " + bookId);
		  
		  int result  = adminService.goodsDelete(bookId);
		  
		  rttr.addFlashAttribute("delete_result", result);
		  
		  return "redirect:/admin/goodsManage";
	  }
	  
	  // 첨부 파일 업로드
	  // 파일 여러개 일경우 MultipartFile[] uploadFile
	  // 파일 하나일 경우  MultipartFile uploadFile
	  @PostMapping("/uploadAjaxAction")
	  public void uploadAjaxAtionPOST(MultipartFile[] uploadFile) {		
		  log.info("-----	uploadAjaxAtionPOST ");
		  
		  String uploadFolder = "C:\\upload";
		  
		  // 오늘의 날짜 데이터 값을 가지고 있는 date 변수를 
		  // "yyyy-MM-dd" 형식의 문자열로 변환을 해주기 위해서 
		  // SimpleDateFormat의 format 메서드를 호출.
		  // format 메서드의 인자 값으로 date 변수를 부여합니다.
		  // String 타입으로 변환된 값을 String 타입의 str 변수를 선언하여 대입합니다.
		  
		  
		  // 날짜 폴더 경로
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		  Date date = new Date();
		  String str = sdf.format(date);		
		  String datePath = str.replace("-", File.separator);
		  
		  // 날짜 형식 폴더 생성
		  File uploadPath = new File(uploadFolder, datePath);
		  uploadPath.mkdirs();
		  
		  // 기본 for 문
//		  for (int i = 0; i < uploadFile.length; i++) {
//			  log.info("---------------------------------------------------");
//			  log.info("파일 이름 : " + uploadFile[i].getOriginalFilename());
//			  log.info("파일 타입 : " + uploadFile[i].getContentType());
//			  log.info("파일 크기 : " + uploadFile[i].getSize());		
//		  }
		  
		  // 향상된 for 문
		  for(MultipartFile multipartFile : uploadFile) {
			  log.info("---------------------------------------------------");
			  log.info("파일 이름 : " + multipartFile.getOriginalFilename());
			  log.info("파일 타입 : " + multipartFile.getContentType());
			  log.info("파일 크기 : " + multipartFile.getSize());			  
		  }
	  }
	  
	  

	
}
