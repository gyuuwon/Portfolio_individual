<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="${path}/WEB-INF/views/include/header.jsp" />


<div id="container">
	<div class="location_area member">
		<div class="box_inner">
			<h2 class="tit_page">
				TOURIST <span class="in">in</span> TOUR
			</h2>
			<p class="location">
				MEMBER <span class="path">/</span> 로그인
			</p>
			<ul class="page_menu clear">
				<li><a href="javascript:;" class="on">로그인</a></li>
			</ul>
		</div>
	</div>
	<div class="bodytext_area box_inner">
		<div class="login_container_box" >
			<div class="login_text">로그인</div>
			<div class="login_divider"></div>
			<form action="/user/signInPost" id="signInForm" method="post" class="login_form_box">
				<div class="login_field">
					<label>e-mail</label> 
					<input type="email" id="umail" name="umail" placeholder="이메일 ex) tourist@email.com" alt="이메일주소">
				</div>
				<div class="login_field">
					<label>비밀번호</label> 
					<input type="password" id="upw" placeholder="비밀번호" alt="비밀번호" name="upw">
					<p class="support">
						<a id="myBtn">비밀번호 찾기</a>
					</p>
				</div>
				<!-- The Modal -->
				
				
				
				<div class="login_field">
					<label>
						<input type="checkbox" name="userCookie">로그인 정보 저장
					</label>
				</div>
				
				<div>
      				<button id="signIn" class="login_button" type="submit" value="signIn" >확인</button>
    			</div>
			</form>
			<div class="login_divider" style="margin-top: 50px;"></div>

			<div class="login-button">아직 회원이 아니신가요? 
				<a href="/user/signUp" class="join_link">회원가입</a>
			</div>
		</div>
		<script>
		$.validator.setDefaults({
				submitHandler : function(){
					$("#signInForm").submit();
				}
			});
			
			$("#signInForm").validate({
				rules : {
					umail : {
						required : true,
						email : true
					},
					upw : {
						required : true
					}
				},
				messages : {
					umail : {
						required : "이메일(아이디)를 작성해주세요.",
						email : "올바른 이메일 형식이 아닙니다."
					},
					upw : {
						required : "비밀번호를 확인해주세요."
					}
				}
			});
		</script>
		
		
	</div>
</div>


<jsp:include page="${path}/WEB-INF/views/include/footer.jsp" />