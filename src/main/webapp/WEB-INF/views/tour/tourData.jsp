<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp" />   
  
	<div id="container">
		<!-- location_area -->
		<div class="location_area package">
			<div class="box_inner">
				<h2 class="tit_page">TOURIST <span class="in">in</span> TOUR</h2>
				<p class="location">상품투어 <span class="path">/</span> 여행 자료</p>
				<ul class="page_menu clear">
					<li><a href="javascript:;" class="on">프로그램 소개</a></li>
					<li><a href="javascript:;">여행 자료</a></li>
				</ul>
			</div>
		</div>	
		<!-- //location_area -->

		<!-- bodytext_area -->
		<div class="bodytext_area place_area box_inner">
			<div class="ready">
				<div>
					<img src="../resources/img/ready_img.png">
				</div>
			</div>
		</div>
		<!-- //bodytext_area -->

	</div>
	<!-- //container -->  
    
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/footer.jsp" />