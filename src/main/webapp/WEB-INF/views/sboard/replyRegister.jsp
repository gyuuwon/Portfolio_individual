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
		<form id="registerForm" action="/sboard/replyRegister" method="post">
			<input type="hidden" name="uno" value="${userInfo.uno}">
					<input type="hidden" name="origin" value="${boardVO.origin}"/>
					<input type="hidden" name="depth" value="${boardVO.depth}"/>
					<input type="hidden" name="seq" value="${boardVO.seq}"/>
					<input type="hidden" name="page" value="${cri.page}"/>
					<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
					<input type="hidden" name="searchType" value="${cri.searchType}"/>
					<input type="hidden" name="keyword" value="${cri.keyword}"/>
			<table border="1" style="width: 100%;">
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" required="required"></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" value="${userInfo.uname}"
						readonly="readonly" required="required"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea style="width: 100%;" name="content" id="content"
							rows="3"></textarea></td>
				</tr>
			</table>
			<hr class="clear">
			<div style="text-align: center; margin-top: 40px;">
				<input type="button" id="saveBtn" value="등록" class="btn_bbs" style="border: none;">
			</div>
		</form>

		<script type="text/javascript">
			var path = "${path}/resources/editor/SmartEditor2Skin.html";
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame(oEditors, "content", path,
					"createSEditor2");
			$("#saveBtn").click(function() {
				var str = "";
				$("#registerForm").append(str);
				oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
				$("#registerForm").submit();
			});
		</script>
	</div>
	<!-- //bodytext_area -->
</div>
<!-- //container -->


<jsp:include page="${path}/WEB-INF/views/include/footer.jsp" />