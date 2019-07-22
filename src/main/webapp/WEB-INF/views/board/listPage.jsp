<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				고객센터 <span class="path">/</span> 문의하기
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
		<form action="#" class="minisrch_form">
			<fieldset>
				<legend>검색</legend>
				<!-- //searchBar -->
				<div class="searchBar">
					<select name="searchType">
						<option value="n" ${cri.searchType == null ? 'selected' : ''}>검색조건</option>
						<option value="t" ${cri.searchType == 't' ? 'selected' : ''}>제목</option>
						<option value="c" ${cri.searchType == 'c' ? 'selected' : ''}>내용</option>
						<option value="w" ${cri.searchType == 'w' ? 'selected' : ''}>작성자</option>
						<option value="tc" ${cri.searchType == 'tc' ? 'selected' : ''}>제목+내용</option>
						<option value="cw" ${cri.searchType == 'cw' ? 'selected' : ''}>내용+작성자</option>
						<option value="tcw" ${cri.searchType == 'tcw' ? 'selected' : ''}>제목+내용+작성자</option>
					</select> 
					<input type="text" id="keyword" class="tbox" name="keyword" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요" value="${cri.keyword}">
					<a href="#" class="btn_srch" id="searchBtn">검색</a> 
					<a href="/board/register" class="btn_srch" id="newBtn">글작성</a>
				</div>
				<!-- //searchBar -->
				
			</fieldset>
		</form>

		<table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
			<caption class="hdd">공지사항 목록</caption>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col" style="width:10%;">조회수</th>
				</tr>
			</thead>
			<!-- 게시글 항목 출력 -->
			<c:forEach var="board" items="${list}">
				<c:choose>
					<c:when test="${board.n_showboard eq 'Y'}">
						<tr>
							<td>${board.n_bno}</td>
							<td>
								<a style="text-decoration: none;" href="/board/readPage${pageMaker.makeSearchQuery(pageMaker.cri.page)}&n_bno=${board.n_bno}">
									${board.n_title}
								</a>
							</td>
							<td>${board.n_writer}</td>
							<td><f:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.n_regdate}" /></td>
							<td >${board.n_viewcnt}</td>
						</tr>
					</c:when>
				</c:choose>
			</c:forEach>
		</table>
		<!-- pagination -->
		<div class="pagination">
			<c:if test="${pageMaker.prev}">
				<a href="/board/listPage${pageMaker.makeSearchQuery(1)}" class="firstpage  pbtn"> 
					<img src="/resources/img/btn_firstpage.png" alt="첫 페이지로 이동">
				</a>
				<a href="/board/listPage${pageMaker.makeSearchQuery(pageMaker.startPage-1)}" class="prevpage  pbtn"> 
					<img src="/resources/img/btn_prevpage.png" alt="이전 페이지로 이동">
				</a>
			</c:if>
			<c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			
				<c:choose>
					<c:when test="${pageMaker.cri.page == i}">
						<a href="/board/listPage${pageMaker.makeSearchQuery(i)}">
							<span class="pagenum currentpage">${i}</span>
						</a>
					</c:when>
					<c:otherwise>
						<a href="/board/listPage${pageMaker.makeSearchQuery(i)}">
							<span class="pagenum">${i}</span>
						</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<a href="/board/listPage${pageMaker.makeSearchQuery(pageMaker.endPage+1)}" class="nextpage  pbtn"> 
					<img src="/resources/img/btn_nextpage.png" alt="다음 페이지로 이동">
				</a>
				<a href="/board/listPage${pageMaker.makeSearchQuery(pageMaker.maxPage)}" class="lastpage  pbtn"> 
					<img src="/resources/img/btn_lastpage.png" alt="마지막 페이지로 이동">
				</a>
			</c:if>
		</div>
		<!-- //pagination -->
	</div>
	<!-- //bodytext_area -->
</div>
<!-- //container -->
<script>
$("#searchBtn").click(function(){
	var searchValue = $("select option:selected").val();
	var keywordValue = $("#keyword").val();
	console.log(searchValue + " / " + keywordValue);
	location.href = "/board/listPage?searchType="+searchValue+"&keyword="+keywordValue;
});

$("#newBtn").click(function(){
	location.href="/board/register";
});
</script>

<jsp:include page="${path}/WEB-INF/views/include/footer.jsp" />