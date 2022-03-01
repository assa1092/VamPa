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
<link rel="stylesheet" href="../resources/css/admin/authorManage.css">
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
</head>
<body>
 
    <%@include file="../includes/admin/header.jsp" %>
    
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>작가 관리</span></div>
                    <div class="author_table_wrap">
                    
                    <!-- 검색 결과 있을때  -->
                    <c:if test="${listCheck != 'empty' }">
                    	<table class="author_table">
                    		<thead>
                    			<tr>
                    				<td class="th_column_1">작가 번호</td>
                    				<td class="th_column_2">작가 이름</td>
                    				<td class="th_column_3">작가 국가</td>
                    				<td class="th_column_4">등록 날짜</td>
                    				<td class="th_column_5">수정 날짜</td>
                    			</tr>
                    		</thead>
                    		<c:forEach items="${list }" var = "list">
                    		<tr>
                    			<td><c:out value="${list.authorId }"></c:out></td>
                    			<td>
                    				<a class="move" href="<c:out value='${list.authorId}' />">
	                    				<c:out value="${list.authorName }"></c:out>
                    				</a>                    				
                    			</td>
                    			<td><c:out value="${list.nationName }"></c:out></td>
                    			<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/></td>
                    			<td><fmt:formatDate value="${list.updateDate}" pattern="yyyy-MM-dd"/></td>
                    		</tr>
                    		</c:forEach>
                    	</table>
                    	</c:if>
                    	
                    	<!-- 검색 결과 없을때  -->
                    	<c:if test="${listCheck == 'empty' }">
                    		<div class="table_empty">등록된 작가가 없습니다.</div>
                    	</c:if>
                    </div>
                    
                    <div class="search_wrap">
                    	<form id="searchForm" action="/admin/authorManage" method="get">
                    		<div class="search_input">
                    			<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"></c:out>' >
                    			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>' >
                    			<input type="hidden" name="account" value='<c:out value="${pageMaker.cri.amount }"></c:out>' >
                    			<button class="btn search_btn">검색</button>
                    		</div>
                    	</form>
                    </div>
                    
                    <!-- 페이지 이동 인터페이스 영역  -->
                    <div class="pageMaker_wrap">
                    	<ul class="pageMaker">
                    		<!-- 이전 버튼  -->
                    		<c:if test="${pageMaker.prev }">
                    			<li class="pageMaker_btn prev">
                    				<a href="${pageMaker.pageStart -1 }">이전</a>
                    			</li>
                    		</c:if>
                    		
                    		<!-- 페이지 번호  -->
                    		<c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd }" var ="num">
                    			<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active' : ''}">
                    				<a href="${num }">${num }</a>
                    			</li>
                    		</c:forEach>
                    		
                    		<!-- 다음 버튼  -->
                    		<c:if test="${pageMaker.next }">
                    			<li class="pageMaker_btn next">
                    				<a href="${pageMaker.pageEnd +1 }">다음</a>
                    			</li>
                    		</c:if>
                    	</ul>
                    </div>
                    
                    <!-- 페이징, 검색 인터페이스 영역  -->
                    <form id="moveForm" action="/admin/authorManage" method="get">
                    	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                    	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                    	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
                    </form>
                    
                </div>
	
	<%@include file="../includes/admin/footer.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		let result = '<c:out value="${enroll_result}"/>';
		let modifyResult = '<c:out value = "${modify_result}"/>';
		
		CheckModifyResult(modifyResult);
		
		function CheckModifyResult(modifyResult){
			if(modifyResult ==='1'){
				alert("작가 정보 수정을 완료하였습니다.");
			} else if(modifyResult === '0'){
				alert("작가 정보를 수정하지 못하였습니다.")
			}
		}
		
		if(result===''){
			return;
		}
		alert("작가 '${enroll_result}' 님을 등록하였습니다.")
	});
	
	let moveForm = $("#moveForm");
	let searchForm = $("#searchForm");
	
	$(".pageMaker_btn a").on("click", function(e){

		e.preventDefault();
		
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.submit();
	});
	
	$(".search_btn").on("click", function(e){
		e.preventDefault();
		
		// 검색 키워드 유호성 검사
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요");
			return false;
		}
		
		// 검색결과 페이지 1
		searchForm.find("input[name='pageNum']").val(1);
		searchForm.submit();
		
	});
	
	$(".move").on("click", function(e){
		e.preventDefault();
		
		moveForm.append("<input type='hidden' name='authorId' value='"+$(this).attr("href")+"'> ");
		moveForm.attr("action", "/admin/authorDetail");
		moveForm.submit();
	})
	
	// 작가 삭제 결과
	let delete_result = '${delete_result}';
	
	if(delete_result ==1){
		alert("작가 삭제 완료");
	} else if(delete_result ==2){
		alert("해당 작가 데이터를 사용하고 있는 데이터가 있어서 삭제 할 수 없습니다.");
	}

</script>
 
</body>
</html>
