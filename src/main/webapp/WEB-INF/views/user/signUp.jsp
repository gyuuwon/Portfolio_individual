<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="${path}/WEB-INF/views/include/header.jsp" />

<div id="container">
	<!-- location_area -->
	<div class="location_area member">
		<div class="box_inner">
			<h2 class="tit_page">
				TOURIST <span class="in">in</span> TOUR
			</h2>
			<p class="location">
				MEMBER <span class="path">/</span> 회원가입
			</p>
			<ul class="page_menu clear">
				<li><a href="javascript:;" class="on">회원가입</a></li>
			</ul>
		</div>
	</div>
	<!-- //location_area -->
	<!-- bodytext_area -->
	<div class="bodytext_area box_inner">
		<!-- appForm -->
		<form action="/user/signUpPost" id="signUpForm" method="post" class="appForm">
			<fieldset>
				<legend>회원가입</legend>
				<p class="info_pilsoo pilsoo_item">필수입력</p>
				<ul class="app_list">
					<li class="clear">
						<label for="email_lbl" class="tit_lbl pilsoo_item">이메일</label>
						<div class="app_content email_area">
							<input type="text" class="w160" id="umail" title="이메일 주소"  name="umail" alt="이메일 주소"/>
							<span class="ico_space">@</span>
							<input type="text" class="w160" id="umailVendor" title="이메일 제공업체 입력"  name="umailVendor" alt="이메일"/>
							
							<div class="select_common">
								<select id="selectVendor" title="이메일 제공업체 목록">
									<option value="">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
								</select>
							</div>
						</div>
						<div style="clear:both;width:100%;"class="result"></div>
					</li>
					
					
					<li class="clear"><label for="name_lbl"
						class="tit_lbl pilsoo_item">작성자명</label>
						<div class="app_content">
							<input type="text" class="w100p" id="uname" placeholder="이름을 입력해주세요"  name="uname" alt="이름"/>
						</div>
						<div style="clear:both;width:100%;"class="result"></div>
					</li> 
					
					<li class="clear">
						<label for="pwd_lbl" class="tit_lbl pilsoo_item">비밀번호</label>
						<div class="app_content">
							<input type="password" class="w100p" id="upw" placeholder="비밀번호를 입력해주세요" name="upw" alt="비밀번호"/>
						</div>
						<div style="clear:both;width:100%;"class="result"></div>
					</li>
					
					<li class="clear">
						<label for="pwd2_lbl"class="tit_lbl pilsoo_item">비밀번호 확인</label>
						<div class="app_content">
							<input type="password" class="w100p" id="repw" placeholder="비밀번호를 다시 한번 입력해주세요" name="repw" alt="비밀번호 확인"/>
						</div>
						<div style="clear:both;width:100%;"class="result"></div>
					</li>
					
					<li class="clear">
						<label for="phone_lbl" class="tit_lbl pilsoo_item">연락처</label>
						<div class="app_content">
							<input type="tel" class="w100p" id="uphone" placeholder="휴대폰”-”없이 숫자만 입력하세요" name="uphone" alt="연락처"/>
						</div>
						<div style="clear:both;width:100%;"class="result"></div>
					</li>
					
					<li class="clear"><span class="tit_lbl">성별</span>
						<div class="app_content radio_area">
							<input type="radio" class="css-radio" id="male" name="gender" value="male" checked/>
							<label for="male">남</label> 
							
							<input type="radio" class="css-radio" id="female" name="gender" value="female" />
							<label for="female">여</label>
						</div>
					</li>
					
					<li class="clear"><span class="tit_lbl">개인정보 활용동의</span>
						<div class="app_content checkbox_area">
							<input type="checkbox" class="css-checkbox" id="agree" name="agree" value="y">
							<label for="agree">동의함</label>
						</div>
					</li>
				</ul>
				<p class="btn_line">
					<a href="javascript:;" id="signUpBtn" class="btn_baseColor">등록</a>
				</p>
			</fieldset>
		</form>
		<!-- //appForm -->
		<script>

		$(function(){
			$("#umail").focus();
			
			var boolUMail = false;
			var boolUName = false;
			var boolUPassword = false;
			var boolUPasswordCheck = false;
			var boolUPhone = false;
			var boolAgree = false;
			
			var regexEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; 
			var regexPass = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;	
			var regexMobile = /^[0-9]{2,3}?[0-9]{3,4}?[0-9]{4}$/;
			var regexName = /^[\uac00-\ud7a3]{2,6}$/;
			
			function checkRegex(elP,valP,regexP,messageP,ajaxP){
				if(regexP.test(valP) === false){
					showErrorMessage(elP,messageP,false);
					return false;
				}else if(regexP.test(valP) !== false && ajaxP === null){
					showErrorMessage(elP,'사용가능합니다.',true);
					return true;
				}else{
					if(ajaxP !== null){
						ajaxP(elP);
					}
				}
			}
			
			function showErrorMessage(elP,messageP,isChecked){
				var html = '<span style="margin-left:180px;font-size:12px;';
				html += isChecked ? 'color:green;' : 'color:red;';
				html += '">';
				html += isChecked ? '사용 가능합니다.' : messageP;
				html += '</span>';
				
				$(elP).html(html);
			}
			
			$("#umail").on("input",function(){
				var tempVal = $(this).val()+"@"+$("#umailVendor").val();
				console.log(tempVal);
				var elP = $(this).closest("li").find(".result");
				var message = "올바른 이메일 형식이 아닙니다.";
				boolUMail = checkRegex(elP,tempVal,regexEmail,message,checkUmailAjax);
			});
			
			function checkUmailAjax(elP){
				var tempVal = $("#umail").val()+"@"+$("#umailVendor").val();
				
				$.ajax({
					type : "post",
					url : '${path}/user/uIdCheck',
					dataType : 'json',
					data : {
						u_id : tempVal
					},
					success : function(data){
						console.log("isChecked : " + data);
						if(data){
							showErrorMessage(elP,"사용가능합니다.",true);
							boolUMail = true;
						}else{
							showErrorMessage(elP,"존재하는 아이디 입니다.",false);
							boolUMail = false;
						}
					}
				});
			}
			
			// umailVendor
			$("#selectVendor").on("change",function(){
				if($(this).val() == ""){
					$("#umailVendor").val("");
					$("#umailVendor").focus();
				}else{
					$("#umailVendor").val($(this).val());	
				}
				
				var tempVal = $("#umail").val()+"@"+$(this).val();
				console.log(tempVal);
				var elP = $(this).closest("li").find(".result");
				var message = "올바른 이메일 형식이 아닙니다.";
				boolUMail = checkRegex(elP,tempVal,regexEmail,message,checkUmailAjax);
				
			});
			
			
			$("#umailVendor").on("input",function(){
				var tempVal = $("#umail").val()+"@"+$(this).val();
				console.log(tempVal);
				var elP = $(this).closest("li").find(".result");
				var message = "올바른 이메일 형식이 아닙니다.";
				boolUMail = checkRegex(elP,tempVal,regexEmail,message,checkUmailAjax);
			});
			
			$("#upw").on("input",function(){
				var tempVal = $(this).val();
				var elP = $(this).closest("li").find(".result");
				var message = "영문/숫자 조합하여 6~20자 이내 작성";
				boolUPassword = checkRegex(elP,tempVal,regexPass,message,null);
			});
			
			$("#repw").on("input",function(){
				var tempVal = $(this).val();
				var elP = $(this).closest("li").find(".result");
				var originVal = $("#upw").val();
				var message = "";
				
				if(boolUPassword){
					if(tempVal == originVal){
						boolUPasswordCheck = true;
						message = "비밀번호가 일치합니다.";
					}else{
						boolUPasswordCheck = false;
						message = "비밀번호가 일치하지 않습니다.";
					}
				}else{
					message = "비밀번호를 확인해주세요.";
					boolUPasswordCheck = false;
				}
				showErrorMessage(elP,message,boolUPasswordCheck);
			});
			
			$("#uname").on("input",function(){
				var tempVal = $(this).val();
				var elP = $(this).closest("li").find(".result");
				var message = "한글 2~6자 이내 작성";
				boolUName = checkRegex(elP,tempVal,regexName,message,null);
			});
			
			$("#uphone").on("input",function(){
				var tempVal = $(this).val();
				var elP = $(this).closest("li").find(".result");
				var message = "-제외 숫자만 작성";
				boolUPhone = checkRegex(elP,tempVal,regexMobile,message,null);
			});
			
			$("#agree").on("change",function(){
				var isChecked = $(this).is(":checked");
				console.log("isCheck agree : " + isChecked);
				if(isChecked){
					boolAgree = true;
				}else{
					boolAgree = false;
				}
			});
			
			
			$("#signUpBtn").click(function() {
				console.log('click');
				console.log('boolUName'+boolUName);
				console.log('boolUMail'+boolUMail);
				
					if (!boolUMail) {
						if ($("#umail").val() == "") {
							alert("이메일을 확인해주세요.");
							$("#umail").focus();
						} else if ($("#umailVendor").val() == "") {
							alert("이메일 주소를 확인해주세요.");
							$("#umailVendor").focus();
						}
					} else if (!boolUName) {
						alert("이름을 확인해주세요.");
						$("#uname").focus();
					} else if (!boolUPassword) {
						alert("비밀번호를 확인해주세요.");
						$("#upw").focus();
					} else if (!boolUPasswordCheck) {
						alert("비밀번호가 일치하지 않습니다.");
						$("#repw").focus();
					} else if (!boolUPhone) {
						alert("전화번호를 확인해주세요.");
						$("#uphone").focus();
					} else if (!boolAgree) {
						alert("개인정보 활용에 동의해주세요.");
					} else {
						$("#signUpForm").submit();
					}
				});
			});
		</script>
	</div>
	<!-- //bodytext_area -->

</div>
<!-- //container -->

<jsp:include page="${path}/WEB-INF/views/include/footer.jsp" />