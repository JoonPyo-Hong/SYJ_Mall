<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp" %>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="<c:url value="resources/js/jsbn.js"/>"></script>
<script type="text/javascript" src="<c:url value="resources/js/rsa.js"/>"></script>
<script type="text/javascript" src="<c:url value="resources/js/prng4.js"/>"></script>
<script type="text/javascript" src="<c:url value="resources/js/rng.js"/>"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>	
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0"/>

<style>

/* 모달창 => 애는 css 로 빼면 안먹음 */
#myModal > .modal-dialog {
    width: 350px;
    height : 200px;
    margin-top: 300px;
}

#myModal > .modal-dialog > .modal-content {
    height : 200px;
}

#modalcontent {
    margin-top: 40px;
    color : #7C7C7C;
    text-align: center;
}

#mfooter {
    border: 0px; 
    padding: 0px;
    text-align:center
}

#mfooter_check {
    border:0px;
    width: 320px;
    height: 45px;
    background-color: #FEE500;
    font-family: 'NEXON Lv1 Gothic OTF';
    color: black;
    border-radius: 5px;
    outline: none;
}

#mfooter_check:hover{
    background-color: #F0D700;
}
    

.login-wrap {
  margin: 0 auto;
  display: flex;
  align-items: center;
}

/* 왼쪽 배너 */
.wrap-banner {
  display: none;
}

/* 오른쪽 로그인 */
.wrap-form {
  display: inline-block;
  vertical-align: top;
  text-align: left;
  width: 100%;
  max-width: 480px;
  padding: 60px 30px;
  font-size: 16px;
  box-sizing: border-box;
  border: 1px solid #e5e5e5;
}

/* 로고 */
.wrap-form .kakao-logo {
  margin: 0 0 30px 0;
  display: inline-block;
  width: 88px;
  height: 27px;
  line-height: 1;
  vertical-align: top;
  background: url(/SYJ_Mall/resources/images/main_login/ico_account-e8750da61bf611ac86a0dd8350c4fd35e3e71cca4885218a9052a286df0222f8.png);
}

.wrap-form .login-input-box input::placeholder {
  color: #8e8e8e;
}

/* 로그인 입력 부분 */

.wrap-form .login-input-box .email {
  width: 100%;
  height: 40px;
  line-height: 40px;
  font-size: 15px;
  cursor: pointer;
  border: none;
  border-bottom: 2px solid #ebebeb;
}

.wrap-form .login-input-box .password {
  width: 100%;
  height: 40px;
  line-height: 40px;
  font-size: 15px;
  cursor: pointer;
  border: none;
  border-bottom: 2px solid #ebebeb;
}

/* 로그인 상태 유지 체크 */
.set-login {
  margin-top: 25px;
}

.set-login input[type="checkbox"] {
  display: none;
}

.set-login input[type="checkbox"] + label {
  display: flex;
  align-items: center;
}

.set-login input[type="checkbox"] + label .ico-text {
  cursor: pointer;
  font-size: 14px;
  color: #252525;
}

.set-login input[type="checkbox"] + label .ico-check {
  cursor: pointer;
  display: inline-block;
  flex: 1 1 auto;
  width: 20px;
  height: 20px;
  max-width: 20px;
  max-height: 20px;
  margin-right: 8px;
  background-image: url(/SYJ_Mall/resources/images/main_login/ico_account-e8750da61bf611ac86a0dd8350c4fd35e3e71cca4885218a9052a286df0222f8.png);
  background-position: -30px -30px;
}

.set-login input[type="checkbox"]:checked + label .ico-check {
  background-position: 0 -30px;
}

/* 로그인 버튼 */
.wrap-form .login-btn-box {
  margin-top: 30px;
}

.wrap-form .login-btn-box .login-btn {
  display: block;
  width: 100%;
  height: 50px;
  padding: 0;
  border: 0;
  border-radius: 4px;
  font-size: 15px;
  color: #191919;
  background-color: #fee500;
  cursor: pointer;
}

.wrap-form .login-btn-box .qr-login-btn {
  display: block;
  width: 100%;
  height: 50px;
  padding: 0;
  border: 0;
  border-radius: 4px;
  font-size: 15px;
  color: #191919;
  background-color: #f6f6f6;
  cursor: pointer;
}

.wrap-form .login-btn-box .qr-login-btn:hover {
  background-color: #e7e7e7;
}

.wrap-form .login-btn-box .qr-login-btn .qr-icon {
  display: inline-block;
  width: 16px;
  height: 16px;
  margin-right: 7px;
  vertical-align: middle;
  background: url(/SYJ_Mall/resources/images/main_login/ico_account-e8750da61bf611ac86a0dd8350c4fd35e3e71cca4885218a9052a286df0222f8.png);
  background-position: -80px -200px;
}

.wrap-form .login-btn-box .line {
  display: block;
  width: 100%;
  padding: 15px 0;
}

.wrap-form .login-btn-box .line span {
  width: 40px;
  font-size: 12px;
  line-height: 18px;
  text-align: center;
  color: rgba(0, 0, 0, 0.3);
}

.wrap-form .login-btn-box .line span::before {
  content: "";
  display: inline-block;
  width: calc(50% - 20px);
  height: 1px;
  margin: 8px 0;
  margin-right: 8px;
  background-color: #ebebeb;
  vertical-align: middle;
}

.wrap-form .login-btn-box .line span::after {
  content: "";
  display: inline-block;
  width: calc(50% - 20px);
  height: 1px;
  margin: 8px 0;
  margin-left: 8px;
  background-color: #ebebeb;
  vertical-align: middle;
}

/* 로봇  */
.re-captcha {
  	width: 100%;
  	height: 100%;
  	margin-top: 20px;
  	display: flex;
	justify-content: center;
}

/* 하단 회원 가입 및 계정 찾기 */
.info-user {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-top: 30px;
  font-size: 12px;
}

.info-user div {
  cursor: pointer;
}

.info-user ul li {
  float: left;
  cursor: pointer;
}

.info-user ul li:last-child:before {
  content: "";
  float: left;
  width: 1px;
  height: 10px;
  margin: 4px 10px;
  background-color: #e5e5e5;
}

/* 전체 하단 */
.foot-wrap {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 20px 0 10px 0;
  border-top: 1px solid #e5e5e5;
}

.foot-wrap .service-info ul li {
  float: left;
  padding: 0 5px;
  font-size: 11px;
  color: #4c4c4c;
  line-height: 20px;
  cursor: pointer;
}

.foot-wrap .service-info ul li .ico-arr {
  display: inline-block;
  width: 9px;
  height: 6px;
  margin: 7px 0 0 4px;
  background: url(/SYJ_Mall/resources/images/main_login/ico_account-e8750da61bf611ac86a0dd8350c4fd35e3e71cca4885218a9052a286df0222f8.png);
  background-size: 300px auto;
  background-position: 0 -60px;
}

.foot-wrap .txt-copyright {
  font-size: 11px;
  color: #7c7c7c;
  margin-top: 8px;
  line-height: 18px;
}

@media (min-width: 640px) {
  /* PC */

  #main-login-wrap {
    padding: 50px 0;
  }

  .login-wrap {
    width: 100%;
    width: 1020px;
    padding: 60px 70px 50px;
    margin: 0 auto;
    display: flex;
    align-items: center;
  }

  /* 왼쪽 배너 */
  .wrap-banner {
    display: inline-block !important;
    position: relative;
    width: 540px;
    margin: 37px 40px 0 0;
    vertical-align: top;
    text-align: left;
    font-size: 16px;
  }

  .wrap-banner .info_banner {
    position: relative;
    z-index: 10;
    padding: 16px 9px 20px;
  }

  .wrap-banner .title-banner {
    font-weight: normal;
    font-size: 25px;
    line-height: 32px;
    color: #252525;
  }
  .wrap-banner .desc-banner {
    margin-top: 5px;
    font-size: 13px;
    line-height: 18px;
  }

  .wrap-banner .img-banner {
    width: 540px;
  }

  .wrap-form {
    padding: 50px 60px;
  }

  .foot-wrap .service-info ul li {
    padding: 0 10px;
    font-size: 12px;
  }
}


</style>

</head>



<body>
	
	  <!--Login Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-body" id = "modalcontent">
	          <p id="modal_context"></p>
	        </div>
	        <div class="modal-footer" id = "mfooter">
	          <button type="button" id = "mfooter_check" class="btn btn-default" data-dismiss="modal">확인</button>
	        </div>
	      </div> 
	    </div>
	  </div>
	
	<!-- RSA -->
	<input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus}" />
	<input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent}" />	
	

  <div id="main-login-wrap">
    <!-- 상단 영역 -->
    <div class="login-wrap">
      <!-- 왼쪽 배너 -->
      <div class="wrap-banner">
        <div class="info-banner">
          <strong class="title-banner">카카오계정 하나로 충분합니다.</strong>
          <p class="desc-banner">
            카카오 서비스 뿐 아니라 Daum, Melon 및 다양한 외부 서비스까지<br>
            카카오계정 하나로 편리하게 이용해보세요!
          </p>
          <img class="img-banner" src="/SYJ_Mall/resources/images/main_login/banner_login1-81752909ec9c815794b13ccff4d17d7d3e81f431585ecec30ee7a8055785c74f.png" />
        </div>
      </div>
      <!-- 오른쪽 로그인 -->
      <div class="wrap-form">
        <div class="kakao-logo"></div>
        <div class="login-kakao-mail">
          <div class="login-form">
            <div class="login-input-box">
              <input class="email" name = "id" id = "inputid" placeholder="카카오메일 아이디, 이메일, 전화번호" autocomplete="off">
              <input class="password" name = "pw" id = "inputpw" type="password" placeholder="비밀번호">
              <div class="set-login">
                <input type="checkbox" id="stay-login" class="set-check">
                <label class="set-text" for="stay-login">
                  <span class="ico-check"></span>
                  <span class="ico-text">아이디 비밀번호 기억</span></label>
              </div>
            </div>
          </div>
          <div class="login-btn-box">
            <form action="/SYJ_Mall/loginVerification.action" method = "POST" id = "input_form">
            	
            	<input type="hidden" name="securedUsername" id="securedUsername" value="" />
				<input type="hidden" name="securedPassword" id="securedPassword" value="" />
				<input type="hidden" name="loginSave" id="loginSave" value="-1" /> 
				<input type="hidden" name="deviceCode" id="deviceCode" value="-1" />
           
            </form>
            <button class="login-btn">로그인</button>
            <div class="line">
              <span>또는</span>
            </div>
            <button class="qr-login-btn"><span class="qr-icon"></span>QR코드 로그인</button>
          </div>
         	<div class="re-captcha">
           		<!-- recaptcha -->
           		<div class="g-recaptcha" data-sitekey="6Lcw6-UdAAAAAJLINDkliT-Ops9xfnkysSKtYlcF"></div>
        	</div>
        </div>
        <div class="info-user">
          <div onclick="location.href = '/SYJ_Mall/userSignUp.action'">회원가입</div>
          <ul>
            <li onclick="location.href = '/SYJ_Mall/userFindId.action'">카카오계정</li>
            <li onclick="location.href = '/SYJ_Mall/userFindpw.action'">비밀번호 찾기</li>
          </ul>
        </div>
      </div>
    </div>
	
	
    <div class="foot-wrap">
      <div class="service-info">
        <ul>
          <li>이용약관</li>
          <li><b>개인정보 처리방침</b></li>
          <li>운영정책</li>
          <li>고객센터</li>
          <li>공지사항</li>
          <li>한국어<span class="ico-arr"></span></li>
        </ul>
      </div>
      <div class="txt-copyright">Copyright © <b>Kakao Corp.</b> All rights reserved.</div>
    </div>

  </div>
  
  
  

<script>

	function device_check() {
		// 디바이스 종류 설정
		let pc_device = "win16|win32|win64|mac|macintel";
	
		// 접속한 디바이스 환경
		let this_device = navigator.platform;
	
		if (this_device) {
	
			if (pc_device.indexOf(navigator.platform.toLowerCase()) < 0) {
				//console.log('MOBILE');
				return 1;
			} else {
				//console.log('PC');
				return -1;
			}
		}
	}

	//1. 버튼을 직접 누른 경우
	$(".login-btn").click(function() {
		capcharStart();
	});

	//2. 엔터키를 통해서 로그인 시도한 경우
	$("#inputpw").keyup(function(e) {
		if (e.keyCode == 13)
			capcharStart();
	});

	$('#mfooter_check').click(function() {
		location.reload();
	});
	
	//로그인 - 패킷을 중간에 가로채는것을 방지하기 위함
	function packetLogin() {

		let username = document.getElementById("inputid").value;//유저가 작성한 아이디
		let password = document.getElementById("inputpw").value;//유저가 작성한 비밀번호
		
		try {
			let rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
			let rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
			submitEncryptedForm(username, password, rsaPublicKeyModulus,rsaPublicKeyExponent);

		} catch (err) {

			alert(err);
		}
	}
	
	//로그인 버튼 클릭시 -> 데이터를 넘겨주는 부분
	function submitEncryptedForm(username, password, rsaPublicKeyModulus,rsaPpublicKeyExponent) {
		let rsa = new RSAKey();

		rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);

		// 사용자ID와 비밀번호를 RSA로 암호화한다.
		let securedUsername = rsa.encrypt(username);
		let securedPassword = rsa.encrypt(password);

		let securedForm = document.getElementById("input_form");//form 데이터
		
		let device_code = device_check();//pc 인지 모바일인지 구분
		$('#deviceCode').val(device_code);
		
		securedForm.securedUsername.value = securedUsername;//여기서 암호화된 아이디번호를 넘겨준다.
		securedForm.securedPassword.value = securedPassword;//여기서 암호화된 비밀번호를 넘겨준다.
		ajaxCheck(securedUsername, securedPassword);//ajax 호출
	}
	
	function ajaxCheck(securedUsername, securedPassword) {
		$.ajax({
			type : "POST",
			url : "/SYJ_Mall/userLoginVerificationCheck.action",
			data : {
				"securedUsername" : securedUsername,
				"securedPassword" : securedPassword
			},
			dataType : "json",
			success : function(result) {

				if (result == 1) {
					$("#input_form").submit();
				} else {
					modal_situation("가입되지 않은 아이디이거나, 잘못된 비밀번호 입니다.");
				}

			},
			error : function(a, b, c) {
				alert('error');
			}
		});
	}

	//리캅챠 인증 함수 
	function capcharStart() {
		$.ajax({
			url : '/SYJ_Mall/loginCaptcha.action',
			type : 'post',
			data : {
				recaptcha : $("#g-recaptcha-response").val()
			},
			success : function(data) {
				switch (data) {
				case 1:
					packetLogin();
					break;

				case -1:
					modal_situation('자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.');
					break;

				default:
					alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
					break;
				}
			}
		});
	}
	
	//상황에 따라 맞는 모달 넣어주기
	function modal_situation(inner_text) {

		$('#modal_context').text(inner_text);

		$("#myModal").modal();

	}
	
	//로그인 상태 유지
	$('.ico-check').click(function(){
		const login_stay_val = $('#loginSave').val();
		$('#loginSave').val(login_stay_val * -1);
	});
	
	//QR 코드 로그인을 누른 경우
	$('.qr-login-btn').click(function(){
		qr_ajax_function();
		$("#myModal").modal();
	});
	
	
	//QR 관련
	function qr_ajax_function() {
		$.ajax({
			url : '/SYJ_Mall/loginQr.action',
			type : 'POST',
			data : {
				
			},
			success : function(data) {
				console.log(data);
			}
		});
	}
	
	
	
</script>


</body>




</html>
