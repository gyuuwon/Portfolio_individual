<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<jsp:include page="${path}/WEB-INF/views/include/header.jsp" />
<!-- container -->
<div id="container">
	<!-- location_area -->
	<div class="location_area customer">
		<div class="box_inner">
			<h2 class="tit_page">
				TOURIST <span class="in">in</span> TOUR
			</h2>
			<p class="location">
				고객센터 <span class="path">/</span> 공지사항
			</p>
			<ul class="page_menu clear">
				<li><a href="#" class="on">공지사항</a></li>
				<li><a href="#">문의하기</a></li>
			</ul>
		</div>
	</div>
	<!-- //location_area -->
	
	<!-- bodytext_area -->
	<div class="bodytext_area box_inner">
		<ul class="bbsview_list">
			<li class="bbs_title">${boardVO.title}</li>
			<li class="bbs_name">작성자 : <span>${boardVO.writer}</span></li>
			<li class="bbs_date">조회수 : <span>${boardVO.viewcnt}</span></li>
			<li class="bbs_hit">작성일 : <span><f:formatDate pattern="yyyy-MM-dd hh:mm" value="${boardVO.regdate}"/></span></li>
			<li class="bbs_content">
				<div class="editer_content">${boardVO.content}</div>
			</li>
		</ul>

		<div>
			<c:if test="${!empty userInfo}">
				<c:if test="${userInfo.uno eq boardVO.uno}">
					<input type="button" id="modifyBtn" class="btn_bbs_input" value="MODIFY" />
					<input type="button" id="deleteBtn" class="btn_bbs_input" value="DELETE" />
				</c:if>
				<input type="button" id="replyBtn" value="REPLY" class="btn_bbs_input"/>
			</c:if>
			<input type="button" id="listBtn" value="LIST" class="btn_bbs_input"/>

			<form id="readForm" method="post">
				<input type="hidden" name="csrf_token" value="${csrf_token}" /> 
				<input type="hidden" name="bno" value="${boardVO.bno}" /> 
				<input type="hidden" name="page" value="${cri.page}" /> 
				<input type="hidden" name="perPageNum" value="${cri.perPageNum}" /> 
				<input type="hidden" name="searchType" value="${cri.searchType}" /> 
				<input type="hidden" name="keyword" value="${cri.keyword}" />
			</form>
		</div>

		<ul class="near_list mt20">
			<c:if test="${!empty nextBoard}">
				<li><h4 class="prev">다음글</h4>
					<a id="nextBoard" href="#">${nextBoard.title}</a></li>
			</c:if>
			<c:if test="${!empty prevBoard}">
				<li><h4 class="next">이전글</h4>
					<a id="prevBoard" href="#">${prevBoard.title}</a></li>
			</c:if>
		</ul>
	</div>
	<!-- //bodytext_area -->
</div>
<!-- //container -->

<script>
	function isCheckAuth(uno){
		var userUno = "${userInfo.uno}";
		console.log(userUno+"//"+uno);
		if(userUno != "" && userUno == uno){
			return true;
		}else{
			return false;
		}
	}
	
	function pringPage(pageMaker){
		console.log(pageMaker);
		var str = "";
		
		if(pageMaker.prev){
			str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
		}
		
		for(var i = pageMaker.startPage; i <= pageMaker.endPage; i++){
			str += "<li><a href='"+i+"'> "+i+" </a></li>";
		}
		
		if(pageMaker.next){
			str += "<li><a href='"+(pageMaker.endPage+1)+"'> >> </a></li>";
		}
		console.log(str);
		$("#pagination").html(str);
	}
	
	$("#pagination").on("click","li a", function(event){
		event.preventDefault();
		var page = $(this).attr("href");
		getPageList(page);
	});
	
	var obj = $("#readForm");
	
	$("#replyBtn").click(function(){
		obj.attr("action","/sboard/replyRegister");
		obj.attr("method","get");
		obj.submit();
	});
	
	$("#listBtn").click(function(){
		obj.attr("action","/sboard/listReply");
		obj.attr("method","get");
		obj.submit();
	});
	
	$("#modifyBtn").click(function(){
		obj.attr("action","/sboard/modifyPage");
		obj.attr("method","get");
		obj.submit();
	});
	
	$("#deleteBtn").click(function(){
		var isDelete = confirm("삭제하시겠습니까?");
		if(isDelete){
			console.log("삭제요청");
			
			obj.attr("action","/sboard/remove");
			obj.submit();
		}else{
			alert("삭제요청이 취소되었습니다.");
		}
	});
	


	$("#nextBoard").click(function(event) {
		event.preventDefault();
		$("#boardBno").val("${nextBoard.bno}");
		obj.attr("method", "get");
		obj.submit();
	});

	$("#prevBoard").click(function(event) {
		event.preventDefault();
		$("#boardBno").val("${prevBoard.bno}");
		obj.attr("method", "get");
		obj.submit();
	});
</script>

<jsp:include page="${path}/WEB-INF/views/include/footer.jsp" />