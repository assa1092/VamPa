<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/authorEnroll.css">
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
</head>
<body>
 
    <%@include file="../includes/admin/header.jsp" %>
    
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>작가 등록</span></div>
                    
                    <div class="admin_content_main">
                    	<form action="/admin/authorEnroll.do" method="post" id="enrollForm">
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>작가 이름</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="authorName">
                    				<span id="warn_authorName">작가 이름을 입력하세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>소속 국가</label>
                    			</div>
                    			<div class="form_section_content">
                    				<select name="nationId">
                    					<option value="none" selected>=== 선택 ===</option>
                    					<option value="01">국내</option>
                    					<option value="02">국외</option>
                    				</select>
                    				<span id="warn_nationId">소속 국가를 선택해하세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>작가소개</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="authorIntro" type="text">
                    				<span id="warn_authorIntro">작가 소개를 입력하세요.</span>
                    			</div>
                    		</div>
                   		</form>
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">취 소</button>
	                    		<button id="enrollBtn" class="btn enroll_btn">등 록</button>
	                    	</div> 
                    </div>
                    
                </div>
                
      <%@include file="../includes/admin/footer.jsp" %>         

<script type="text/javascript">

	// 등록버튼
	$("#enrollBtn").click(function () {
		// 유효성 검사 변수
		let nameCheck = false;			// 작가이름
		let nationCheck = false;		// 소속국가
		let introCheck = false;			// 작가소개
		
		let authorName = $("input[name='authorName']").val();
		let nationId = $("select[name='nationId']").val();
		let authorIntro = $("input[name='authorIntro']").val();
		
		// 작가이름 공란체크
		if(authorName == ""){
			$("#warn_authorName").css("display", "block");
			nameCheck = false;
		} else{
			$("#warn_authorName").css("display", "none");
			nameCheck = true;
		}
		
		// 소속국가 공란체크
		if(nationId == "none"){
			$("#warn_nationId").css("display", "block");
			nationCheck = false;
		} else{
			$("#warn_nationId").css("display", "none");
			nationCheck = true;
		}
		
		// 작가소개 공란체크
		if(authorIntro == ""){
			$("#warn_authorIntro").css("display", "block");
			introCheck = false;
		} else{
			$("#warn_authorIntro").css("display", "none");
			introCheck = true;
		}
		
		if(nameCheck && nationCheck && introCheck){
			$("#enrollForm").submit();			
		} else {
			return false;
		}
		
	});
	
	// 취소버튼
	$("#cancelBtn").click(function() {
		location.href="/admin/authorManage";
	});

</script>
 
</body>
</html>
