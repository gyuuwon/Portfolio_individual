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
		<form id="registerForm" action="/board/register" method="post">
			<input type="hidden" name="n_uno" value="${userInfo.uno}">
			<table border="1" style="width: 100%;">
				<tr>
					<td>제목</td>
					<td><input type="text" name="n_title" required="required"></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="n_writer" value="${userInfo.uname}"
						readonly="readonly" required="required"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea style="width: 100%;" name="content" id="n_content"
							rows="3"></textarea></td>
				</tr>
			</table>
			<hr class="clear">
			<div style="text-align: center; margin-top: 40px;">
				<input type="button" id="saveBtn" value="등록" class="btn_bbs" style="border: none;">
				<!-- <a href="/sboard/listReply" class="btn_srch" id="saveBtn">등록</a> -->
			</div>
			
			
		</form>

		<script type="text/javascript">
			var path = "${path}/resources/editor/SmartEditor2Skin.html";
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame(oEditors, "n_content", path,
					"createSEditor2");
			$("#saveBtn").click(function() {
				oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
				$("#registerForm").submit();
			});
		</script>
	</div>
	<!-- //bodytext_area -->
</div>
<!-- //container -->


<jsp:include page="${path}/WEB-INF/views/include/footer.jsp" />