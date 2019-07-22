<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="${path}/WEB-INF/views/include/header.jsp" />
<script src="${path}/resources/editor/js/service/HuskyEZCreator.js"></script>
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
				<li><a href="#" class="on">문의하기</a></li>
				<li><a href="#">글작성</a></li>
			</ul>
		</div>
	</div>
	<!-- //location_area -->
	
	<!-- bodytext_area -->
	<div class="bodytext_area box_inner">
		<form id="modifyForm" action="/sboard/modifyPage" method="post">
			<table border="1" style="width: 100%;">
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" value="${boardVO.title}"  required="required"></td>
				</tr>
				
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" value="${userInfo.uname}" readonly="readonly" required="required"></td>
				</tr>
				
				<tr>
					<td>내용</td>
					<td><textarea style="width: 100%;" name="content" id="content" rows="3">${boardVO.content}</textarea></td>
				</tr>
			</table>
			
			<hr class="clear">
			<div style="text-align: center; margin-top: 40px;">
				<input type="hidden" name="bno" value="${boardVO.bno}">
				<input type="button" id="saveBtn" class="btn_bbs_input" value="MODIFY">
				<input type="button" id="cancelBtn" class="btn_bbs_input" value="CANCEL">
			</div>
		</form>

		<script type="text/javascript">
			var bno = '${boardVO.bno}';
		
			var path = "${path}/resources/editor/SmartEditor2Skin.html";
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame(oEditors, "content", path,
					"createSEditor2");
			$("#saveBtn").click(function() {
				oEditors[0].exec("UPDATE_CONTENTS_FIELD",[]);
				$("#modifyForm").submit();
			});
			
			$("#cancelBtn").click(function(){
				$("#modifyForm").attr("action","/sboard/read");
				$("#modifyForm").attr("method","get");
				$("#modifyForm").submit();
			});
		</script>
	</div>
	<!-- //bodytext_area -->
</div>
<!-- //container -->


<jsp:include page="${path}/WEB-INF/views/include/footer.jsp" />