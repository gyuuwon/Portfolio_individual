<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<footer>
		<div class="foot_area box_inner">
			<ul class="foot_list clear">
				<li><a href="javascript;">이용약관</a></li>
				<li><a href="javascript;">개인정보취급방침</a></li>
			</ul>
			<h2>투어리스트인투어</h2>
			<p class="addr">서울특별시 종로구 혜화동 9길 청운빌딩 5층 <span class="gubun">/</span>        
				<span class="br_line">대표전화 <span class="space0">02-1234-5678</span> <span class="gubun">/</span>        
					<span class="br_line">E-mail : <span class="space0"> titour@touristintour.com</span></span>
				</span>
			</p>
			<p class="copy box_inner">Copyright(c) TouristInTour all right reserved</p>
			<ul class="snslink clear">
				<li><a href="javascript:;">blog</a></li>
				<li><a href="javascript:;">facebook</a></li>
				<li><a href="javascript:;">instargram</a></li>
			</ul>
		</div>
	</footer>

</div>
<!-- //wrap -->

<h2 class="hdd">빠른 링크 : 전화 문의,카카오톡,오시는 길,꼭대기로</h2>
<div class="quick_area">
	<ul class="quick_list">
		<li><a href="tel:010-7184-4403"><h3>전화 문의</h3><p>010-1234-5678</p></a></li>
		<li><a href="javascript:;"><h3>카카오톡 <em>상담</em></h3><p>1:1상담</p></a></li>
		<li><a href="javascript:;"><h3 class="to_contact">오시는 길</h3></a></li>
	</ul>
	<p class="to_top"><a href="#layout0" class="s_point">TOP</a></p>
</div>

<script type="text/javascript" src="${path}/resources/js/swiper.min.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
		var swiper = new Swiper('.swiper-container', {
			loop: true,
			autoplay:5500,
		    autoplayDisableOnInteraction: false,
			pagination: '.swiper-pagination',
            paginationClickable: true
		});
	});
</script>

<!-- contact_pop -->
<div class="popup_base contact_pop">
	<div class="pop_content">
		<p class="btn_xpop"><a href="#" onclick="$(this).parent().parent().parent().hide();">닫기</a></p>
		<ul class="pop_list">
			<li>
				<h2 class="tit_pop">성패트릭 대성당</h2>
				<img class="pop_img"src="resources/img/img_pop1_1.jpg" alt="성패트릭 대성당" />
				<div class="pop_txt"><p>뉴욕에서 만난 아름다운 고딕양식에 감탄을 금할 수 없습니다. <br>인상적인 예술작품들과 함께 하고 있으며 정교한 구조와 섬세한 조각들을 만날 수 있습니다. </p></div>
			</li>
		</ul>		
	</div>
</div>
<!-- //contact_pop -->

<!-- space_pop -->
<div class="popup_base space_pop">
	<div class="pop_content">
		<p class="btn_xpop"><a href="#" onclick="$(this).parent().parent().parent().hide();">닫기</a></p>
		<ul class="pop_list">
			<li>
				<h2 class="tit_pop">원주 뮤지엄 '산'</h2>
				<img class="pop_img"src="resources/img/img_pop2_1.jpg" alt="뮤지엄 산의 물위의 건물" />
				<div class="pop_txt"><p>실내와 야외, 문화와 자연이 공존하는 세계. <br> 뮤지엄 산은  휴식과 소통이 어울러진 복합공간을 추구합니다. </p></div>
			</li>
			<li>
				<h2 class="tit_pop">박물관 야외</h2>
				<img class="pop_img"src="resources/img/img_pop2_2.jpg" alt="박물관 야외조경" />
				<div class="pop_txt"><p>공간에 대한 관람을 최대한 배려하려고 합니다.<br>뮤지엄 산은 돌과 물과 산이 함께 어울림으로 배치된 조형 공간입니다.</p></div>
			</li>
		</ul>		
	</div>
</div>
<!-- //space_pop -->

<!-- program_pop -->
<div class="popup_base program_pop">
	<div class="pop_content">
		<p class="btn_xpop"><a href="#" onclick="$(this).parent().parent().parent().hide();">닫기</a></p>
		<ul class="pop_list">
			<li>
				<h2 class="tit_pop">일본 만국박람회 기념 공원</h2>
				<img class="pop_img"src="resources/img/img_pop3_1.jpg" alt="일본 만국박람회 기념 공원" />
				<div class="pop_txt"><p>센리 반파쿠 기념 공원에서는 일본 정원의 확장판을 만날 수 있습니다.<br>가능한 가장 넓은 공간에 꾸민 연못, 산림욕, 정원, 산책길을 만끽할 수 있습니다.</p></div>
			</li>
		</ul>		
	</div>
</div>
<!-- //program_pop -->

</body>
</html>