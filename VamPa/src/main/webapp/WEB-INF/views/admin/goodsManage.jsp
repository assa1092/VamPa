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
<title>상품 관리</title>

<link rel="stylesheet" href="../resources/css/admin/goodsManage.css">
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
</head>
<body>
 
        <%@include file="../includes/admin/header.jsp" %>
				
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>상품 관리</span></div>

                    <div class="goods_table_wrap">
                    	<!-- 상품 리스트 O -->
	                    <c:if test="${listCheck != 'empty'}">
	                    	<table class="goods_table">
	                    		<thead>
	                    			<tr>
										<td class="th_column_1">상품 번호</td>
	                    				<td class="th_column_2">상품 이름</td>
	                    				<td class="th_column_3">작가 이름</td>
	                    				<td class="th_column_4">카테고리</td>
	                    				<td class="th_column_5">재고</td>
	                    				<td class="th_column_6">등록날짜</td>
	                    			</tr>
	                    		</thead>	
	                    		<c:forEach items="${list}" var="list">
	                    		<tr>
	                    			<td><c:out value="${list.bookId}"></c:out></td>
	                    			<td>
	                    				<a class="move" href="<c:out value='${list.bookId }'/>">
	                    					<c:out value="${list.bookName}"></c:out>
	                    				</a>
	                    			</td>
	                    			<td><c:out value="${list.authorName}"></c:out></td>
	                    			<td><c:out value="${list.cateName}"></c:out></td>
	                    			<td><c:out value="${list.bookStock}"></c:out></td>
	                    			<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/></td>
	                    		</tr>
	                    		</c:forEach>
	                    	</table>
	                    </c:if>
	                    <!-- 상품 리스트 X -->
                		<c:if test="${listCheck == 'empty'}">
                			<div class="table_empty">
                				등록된 작가가 없습니다.
                			</div>
                		</c:if> 
                	</div>
                	
                	<!-- 검색 영역 -->
                	<div class="search_wrap">
                		<form id="searchForm" action="/admin/goodsManage" method="get">
                			<div class="search_input">
                    			<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                    			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                    			<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                    			<input type="hidden" name="type" value="G">
                    			<button class='btn search_btn'>검 색</button>                				
                			</div>
                		</form>
                	</div>
                	
                	<!-- 페이지 이름 인터페이스 영역 -->
                	<div class="pageMaker_wrap">
                		<ul class="pageMaker">
                			
                			<!-- 이전 버튼 -->
                			<c:if test="${pageMaker.prev }">
                				<li class="pageMaker_btn prev">
                					<a href="${pageMaker.pageStart -1}">이전</a>
                				</li>
                			</c:if>
                			
                			<!-- 페이지 번호 -->
                			<c:forEach begin="${pageMaker.pageStart }" end="${pageMaker.pageEnd }" var="num">
                				<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
                					<a href="${num}">${num}</a>
                				</li>	
                			</c:forEach>
                		
	                    	<!-- 다음 버튼 -->
	                    	<c:if test="${pageMaker.next}">
	                    		<li class="pageMaker_btn next">
	                    			<a href="${pageMaker.pageEnd + 1 }">다음</a>
	                    		</li>
	                    	</c:if>
	                    </ul>
                	</div>
                	
                	<form id="moveForm" action="/admin/goodsManage" method="get" >
 						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                	</form>
                    
                </div>
 
 				<%@include file="../includes/admin/footer.jsp" %>

<script type="text/javascript">
	// 상품 등록 결과
	let enroll_result = '<c:out value = "${enroll_result}"/>';
	
	chechResult(enroll_result);
	
	function chechResult(result){
		if(result ===''){
			return false;
		}
		alert("상품" + enroll_result + "을 등록하였습니다.");
	}
	
	// 상품 수정 결과
	let modify_result ='<c:out value="${modify_result}" />';
	if(modify_result ==1){
		alert("상품 정보 수정 완료");
	}
	
	// 상품 삭제 결과
	let delete_result = '<c:out value="${delete_result}"/>';
	if( delete_result ==1 ){
		alert("상품 정보 삭제 완료");
	}
	
	
	// 작가 검색, 페이지 이동 버튼 동작
	let searchForm = $("#searchForm");
	let moveForm = $("#moveForm");
	
	// 작가 검색
	$("#searchForm button").on("click", function(e){
		e.preventDefault();
		
		// 검색 키워드 유효성 검사
		if(!searchForm.find("input[name='keyword']").val()){
			alert("검색어를 입력하세요.");
			return false;
		}
		searchForm.find("input[name='pageNum']").val(1);	// 검색결과 페이지를 1로 세팅
		searchForm.submit();
	});
	
	// 페이지 이동
	$(".pageMaker_btn a").on("click", function(e){
		e.preventDefault();
		
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.submit();
	});
	
	// 상품 조회 페이지
	$(".move").on("click", function(e){
		e.preventDefault();
		
		moveForm.append("<input type='hidden' name='bookId' value='" + $(this).attr("href") + "' >");
		moveForm.attr("action", "/admin/goodsDetail");
		moveForm.submit();
	})

</script>
 
</body>
</html>
