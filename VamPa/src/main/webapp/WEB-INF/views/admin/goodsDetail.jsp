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
<link rel="stylesheet" href="../resources/css/admin/goodsDetail.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

<!-- 위지윅 에디터를 사용하기 위해 CDN 코드 추가  -->
<script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>

<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
</style>

</head>
<body>

	<%@include file="../includes/admin/header.jsp" %>
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>상품 상세</span></div>

                    <div class="admin_content_main">

                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>책 제목</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="bookName" value="<c:out value="${goodsInfo.bookName}"/>" disabled>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>등록 날짜</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input value="<fmt:formatDate value='${goodsInfo.regDate}' pattern='yyyy-MM-dd'/>" disabled>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>최근 수정 날짜</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input value="<fmt:formatDate value='${goodsInfo.updateDate}' pattern='yyyy-MM-dd'/>" disabled>
                    			</div>
                    		</div>                    		                    		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>작가</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input id="authorName_input" readonly="readonly" value="${goodsInfo.authorName }" disabled>
                    				                    				
                    			</div>
                    		</div>            
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>출판일</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="publeYear" autocomplete="off" readonly="readonly" value="<c:out value="${goodsInfo.publeYear}"/>" disabled>                    				
                    			</div>
                    		</div>            
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>출판사</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="publisher" value="<c:out value="${goodsInfo.publisher}"/>" disabled>
                    			</div>
                    		</div>             
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>책 카테고리</label>
                    			</div>
                    			<div class="form_section_content">
                    				<div class="cate_wrap">
                    					<span>대분류</span>
                    					<select class="cate1" disabled>
                    						<option  value="none">선택</option>
                    					</select>
                    				</div>
                    				<div class="cate_wrap">
                    					<span>중분류</span>
                    					<select class="cate2" disabled>
                    						<option  value="none">선택</option>
                    					</select>
                    				</div>
                    				<div class="cate_wrap">
                    					<span>소분류</span>
                    					<select class="cate3" name="cateCode" disabled>
                    						<option value="none">선택</option>
                    					</select>
                    				</div>                  				                    				
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 가격</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="bookPrice" value="<c:out value="${goodsInfo.bookPrice}"/>" disabled>
                    			</div>
                    		</div>               
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 재고</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="bookStock" value="<c:out value="${goodsInfo.bookStock}"/>" disabled>
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 할인율</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input id="discount_interface" maxlength="2" disabled>
                    			</div>
                    		</div>          		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>책 소개</label>
                    			</div>
                    			<div class="form_section_content bit">
                    				<textarea name="bookIntro" id="bookIntro_textarea" disabled>${goodsInfo.bookIntro}</textarea>
                    			</div>
                    		</div>        		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>책 목차</label>
                    			</div>
                    			<div class="form_section_content bct">
                    				<textarea name="bookContents" id="bookContents_textarea" disabled>${goodsInfo.bookContents}</textarea>
                    			</div>
                    		</div>
                    		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 이미지</label>
                    			</div>
                    			<div class="form_section_content">
                    				<div id="uploadResult">
                    				
                    				</div>
                    			</div>
                    		</div>
                   		
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">상품 목록</button>
	                    		<button id="modifyBtn" class="btn enroll_btn">수정 </button>
	                    	</div> 
                    </div>      

                	
                	<form id="moveForm" action="/admin/goodsManage" method="get" >
 						<input type="hidden" name="pageNum" value="${cri.pageNum}">
						<input type="hidden" name="amount" value="${cri.amount}">
						<input type="hidden" name="keyword" value="${cri.keyword}">
                	</form>
                	
                </div>
 		<%@include file="../includes/admin/footer.jsp" %>
 		
<script type="text/javascript">
	$(document).ready(function(){
		
		// 할인율 값 삽입
		let bookDiscount = '<c:out value="${goodsInfo.bookDiscount}" />' * 100;
		$("#discount_interface").attr("value", bookDiscount);
		
		// 출판일 값 가공
		// DB 에서는 Date 타입, BookVO 에서는 String 타입이므로 가공해서 처리
		// 2022-02-02 00:00:00	-> 2022-02-02 로 나오게 처리
		// 문자열중에서 " " 공백을 만나기 전까지 길이를 체크해서 
		// 초단뒤 나오기 전까지만 출력한다.
		let publeYear = '${goodsInfo.publeYear}';
		let length = publeYear.indexOf(" ");		
		
		
		publeYear = publeYear.substring(0, length);
		
		$("input[name='publeYear']").attr("value", publeYear);
		
		// 책소개, 책목차 위지윅 에디터를 사용
		// 책소개
		ClassicEditor
			.create(document.querySelector('#bookIntro_textarea'))
			.then(editor=>{
				console.log(editor);
				editor.isReadOnly = true;	// 상세보기 이므로 읽기전용으로
			})
			.catch(error=>{
				console.error(error);
			});
		// 책 목차
		ClassicEditor
			.create(document.querySelector('#bookContents_textarea'))
			.then(editor=>{
					console.log(editor);
					editor.isReadOnly = true;	// 상세보기 이므로 읽기전용으로
				})
			.catch(error=>{
				console.error(error);
			});
		
		// 카테고리 리스트 데이터 처리를 위한 로직
		/* 카테고리 */
		let cateList = JSON.parse('${cateList}');

		let cate1Array = new Array();
		let cate2Array = new Array();
		let cate3Array = new Array();
		let cate1Obj = new Object();
		let cate2Obj = new Object();
		let cate3Obj = new Object();
		
		let cateSelect1 = $(".cate1");		
		let cateSelect2 = $(".cate2");
		let cateSelect3 = $(".cate3");
		
		/* 카테고리 배열 초기화 메서드 */
		function makeCateArray(obj,array,cateList, tier){
			for(let i = 0; i < cateList.length; i++){
				if(cateList[i].tier === tier){
					obj = new Object();
					
					obj.cateName = cateList[i].cateName;
					obj.cateCode = cateList[i].cateCode;
					obj.cateParent = cateList[i].cateParent;
					
					array.push(obj);				
					
				}
			}
		}	
		
		/* 배열 초기화 */
		makeCateArray(cate1Obj,cate1Array,cateList,1);
		makeCateArray(cate2Obj,cate2Array,cateList,2);
		makeCateArray(cate3Obj,cate3Array,cateList,3);
		
		// 중분류, 소분류 카테고리에서 선택된(selected)항목에 대한
		// 데이러를 저장할 변수 선언
		// 소분류에서는 DB에 저장된 사용자가 선택한 카테고리 코드로 초기화합니다.
		let targetCate2 = '';
		let targetCate3 = '${goodsInfo.cateCode}';
		
		// 선택되어진 소분류 값을 소분류(targetCate3)값을 초기화해준다.
		for(let i=0; i<cate3Array.length; i++){
			if(targetCate3 === cate3Array[i].cateCode){
				targetCate3 = cate3Array[i];
			}
		}
		
		/* 
		console.log('targetCate3 : ' + targetCate3);
		console.log('targetCate3.cateName : ' + targetCate3.cateName);
		console.log('targetCate3.cateCode : ' + targetCate3.cateCode);
		console.log('targetCate3.cateParent : ' + targetCate3.cateParent); 
		*/
		
		// 소분류 카테고리 select 박스에 출력.
		for(let i = 0; i < cate3Array.length; i++){
			if(targetCate3.cateParent === cate3Array[i].cateParent){
				cateSelect3.append("<option value='"+cate3Array[i].cateCode+"'>" + cate3Array[i].cateName + "</option>");
			}
		}
		
		// DB에 저장된 값 소분류카테고리 <option> 태그에 selected 속성에 추가.
		$(".cate3 option").each(function(i, obj){
			if(targetCate3.cateCode === obj.value){
				$(obj).attr("selected", "selected");
			}
		});
		
		// 소분류의 부모코드와 동일한 코드를 찾아서  중분류(targetCate2)값을 초기화 한다. 
		for(let i = 0; i < cate2Array.length; i++){
			if(targetCate3.cateParent === cate2Array[i].cateCode){
				targetCate2 = cate2Array[i];	
			}
		}// for
		
		// 중분류 카테고리값 select 박스에 출력
		for(let i = 0; i < cate2Array.length; i++){
			if(targetCate2.cateParent === cate2Array[i].cateParent){
				cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");
			}
		}
		
		// DB에 저장된 값 중분류카테고리 <option> 태그에 selected 속성에 추가.
		$(".cate2 option").each(function(i, obj){
			if(targetCate2.cateCode === obj.value){
				$(obj).attr("selected", "selected");
			}
		});
		
		// 대분류에 있는 모든 항목을 option 태그에 그대로 추가해준다.
		for(let i = 0; i < cate1Array.length; i++){
			cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
		}
		
		$(".cate1 option").each(function(i,obj){
			if(targetCate2.cateParent === obj.value){
				$(obj).attr("selected", "selected");
			}
		});
		
		// 이미지 정보 호출
		let bookId = '<c:out value="${goodsInfo.bookId}" />';
		let uploadResult = $("#uploadResult");
		
		$.getJSON("/getAttachList", {bookId : bookId}, function(arr){
			
			// 이미지가 없을 경우
			if(arr.length === 0){
								
				let str = "";
				str += "<div id='result_card'>";
				str += "<img src='/resources/img/goodsNoImage.png'>";
				str += "</div>";
				
				uploadResult.html(str);	
				
				return;
			}
			
			let str="";
			let obj = arr[0];
			
			let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			str += "<div id='result_card'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
			str += "<img src='/display?fileName=" + fileCallPath +"'>";
			str += "</div>";
			
			uploadResult.html(str);
		});
		
	});	// $(document).ready
	
	
	// 목록 이동 버튼
	$("#cancelBtn").on("click", function(e){
		e.preventDefault();
		$("#moveForm").submit();
	});
	
	// 수정 페이지 이동
	$("#modifyBtn").on("click", function(e){
		e.preventDefault();
		let addInput = "<input type='hidden' name = 'bookId' value='${goodsInfo.bookId}'>";
		
		$("#moveForm").append(addInput);
		$("#moveForm").attr("action", "/admin/goodsModify");
		$("#moveForm").submit();
	});
</script>

</body>
</html>