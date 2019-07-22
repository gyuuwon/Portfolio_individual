<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<title> 회원가입 | 투어리스트인투어 </title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="${path}/resources/css/common.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${path}/resources/js/jquery-1.11.3.min.js"></script>
<script src="${path}/resources/js/common.js"></script>  
<script src="${path}/resources/js/jquery.easing.js"></script>	
<script src="${path}/resources/js/jquery.smooth-scroll.min.js"></script> 
<script src="${path}/resources/js/rollmain.js"></script>
<script src="${path}/resources/js/jquery.validate.js"></script> 


<!--[if lte IE 9]>
    <script src="js/html5shiv.js"></script>
	<script src="js/placeholders.min.js"></script>
<![endif]-->
</head>

<body>
<ul class="skipnavi">
    <li><a href="#container">본문내용</a></li>
</ul>
<!-- wrap -->
<div id="wrap">

	<header id="header">
		<div class="header_area box_inner clear">	
			<h1><a href="/">Tourist in tour</a></h1>
			<p class="openMOgnb"><a href="#"><b class="hdd">메뉴열기</b> <span></span><span></span><span></span></a></p>
			<!-- header_cont -->
			<div class="header_cont">
				<c:choose>
					<c:when test="${!empty userInfo}">
						<ul class="util clear">
							<li><a>${userInfo.uname} 님 반갑습니다.</a></li>
							<li><a href="/user/signOut">로그아웃</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="util clear">
							<li><a href="/user/signIn">로그인</a></li>
							<li><a href="/user/signUp">회원가입</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
						
				<nav>
				<ul class="gnb clear">
					<li><a href="javascript:;" class="openAll1">여행정보</a>

                        <div class="gnb_depth gnb_depth2_1">
                            <ul class="submenu_list">
                                <li><a href="javascript:;">국내</a></li>
                                <li><a href="javascript:;">해외</a></li>
                            </ul>
                        </div>
					</li>
					<li><a href="javascript:;" class="openAll2">고객센터</a>
				        <div class="gnb_depth gnb_depth2_2">
                            <ul class="submenu_list">
                                <li><a href="/board/listPage">공지사항</a></li>
                                <li><a href="/sboard/listReply">문의하기</a></li>
                            </ul>
                        </div>
					</li>
					<li><a href="/tour/program" class="openAll3">상품투어</a>
                        <div class="gnb_depth gnb_depth2_3">
                            <ul class="submenu_list">
                                <li><a href="/tour/program">프로그램 소개</a></li>
                                <li><a href="/tour/tourData">여행자료</a></li>
                            </ul>
                        </div>
					</li>
					<li><a href="/tour/flights" class="openAll4">티켓/가이드</a>
                        <div class="gnb_depth gnb_depth2_4">
                            <ul class="submenu_list">
                                <li><a href="/tour/flights">항공</a></li>
                                <li><a href="/tour/lodge">호텔</a></li>
                            </ul>
                        </div>
					</li>
				</ul>
                </nav>
				<p class="closePop"><a href="javascript:;">닫기</a></p>
			</div>
			<!-- //header_cont -->
		</div>
	</header>