<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0"/>
<title>카카오 프렌즈샵</title>
<script type="text/javascript" src="resources/js/qrcodejs-master/qrcode.js"></script>

<style>
.login-wrap {
  margin: 0 auto;
  margin-top: 50px;
  display: flex;
  align-items: center;
  flex-direction: column;
}

/* 로그인 */
.wrap-form {
  display: inline-block;
  vertical-align: top;
  text-align: left;
  width: 100%;
  min-height: 545px;
  padding: 110px 30px;
  font-size: 16px;
  box-sizing: border-box;
}

/* 로고 */
.kakao-logo {
  display: inline-block;
  width: 88px;
  height: 27px;
  line-height: 1;
  vertical-align: top;
  background: url(/SYJ_Mall/resources/images/main_login/ico_account-e8750da61bf611ac86a0dd8350c4fd35e3e71cca4885218a9052a286df0222f8.png);
}

/* 로그인 타이틀 */
.login-title {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.login-title h2 {
  font-weight: normal;
  color: #252525;
  font-size: 28px;
  margin-bottom: 20px;
}

.login-title p {
  color: #7c7c7c;
  font-size: 13px;
  line-height: 19px;
}

.login-title p .icon-scan {
  display: inline-block;
  width: 15px;
  height: 15px;
  background-image: url(/SYJ_Mall/resources/images/main_login/ico_account-e8750da61bf611ac86a0dd8350c4fd35e3e71cca4885218a9052a286df0222f8.png);
  background-position: -100px -200px;
  vertical-align: top;
}

/* QR 박스 */

.qr-box {
  width: 206px;
  height: 220px;
  margin: 20px auto 40px;
  padding: 24px 24px 0 24px;
  border: 4px solid #ffde01;
  box-sizing: border-box;
}

.qr-box .qr-code {
  width: 150px;
  height: 150px;
  background-color: #e5e5e5;
  background-size: contain;
}

.qr-box .desc {
  padding-top: 10px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.qr-box .desc .title {
  font-size: 12px;
  line-height: 20px;
  vertical-align: top;
  color: #7c7c7c;
  font-weight: normal;
}

.qr-box .desc .title .time {
  font-weight: bold;
  padding-left: 3px;
  color: #e65f3e;
  letter-spacing: 0.5px;
  vertical-align: top;
}

.qr-box .ico-reset {
  cursor: pointer;
  display: inline-block;
  width: 20px;
  height: 20px;
  background-image: url(/SYJ_Mall/resources/images/main_login/ico_account-e8750da61bf611ac86a0dd8350c4fd35e3e71cca4885218a9052a286df0222f8.png);
  background-position: -120px -200px;
  vertical-align: top;
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

/* 확인 버튼 */
.wrap-form .login-btn-box {
  margin-top: 30px;
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

/* 하단 카카오 계정 직접 입력 */
.info-another {
  margin-top: 22px;
  font-size: 12px;
  text-align: center;
  color: rgba(0, 0, 0, 0.7);
  text-decoration: underline;
  cursor: pointer;
}

/* 전체 하단 */
.foot-wrap {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 0 0 40px 0;
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

  .login-wrap {
    width: 100%;
    width: 480px;
    padding: 50px 70px 30px;
    margin: 0 auto;
    display: flex;
    align-items: center;
  }

  .wrap-form {
    border: 1px solid #e5e5e5;
    padding: 60px 30px;
    min-width : 480px;
  }

  .kakao-logo {
    margin: 0 0 30px 0;
  }

  .foot-wrap .service-info ul li {
    padding: 0 10px;
    font-size: 12px;
  }
}



</style>

</head>
<body>
  <div id="main-login-wrap">
    <div class="login-wrap">
      <!-- 카카오 로고 -->
      <div class="kakao-logo"></div>
      <!-- 로그인 전체 박스 -->
      <div class="wrap-form">

        <div class="login-form">
          <!-- 로그인 타이틀 -->
          <div class="login-title">
            <h2>QR코드 로그인</h2>
            <p>카카오톡 앱 > 더보기 > 우측 상단의
              <br />
              <span class="icon-scan"></span>
              아이콘을 눌러 QR코드를 스캔하세요.
            </p>
          </div>
          <!-- QR 박스 -->
          <div class="qr-box">
            <div class="qr-code" id="qrcode"></div>
            <div class="desc">
              <div class="title">남는 시간:
                <span id="timeCheck" class="time"></span>
              </div>
              <div id="resetBtn" class="ico-reset"></div>
            </div>
          </div>
          <!-- 로그인 상태 유지 체크 -->
          <div class="set-login">
            <input type="checkbox" id="stay-login" class="set-check">
            <label class="set-text" for="stay-login">
              <span class="ico-check"></span>
              <span class="ico-text">로그인 상태 유지</span></label>
          </div>
        </div>
        <!-- 확인 버튼 -->
        <div class="login-btn-box">
          <button class="qr-login-btn">확인</button>
        </div>
        <!-- 하단 카카오 계정 직접 입력 -->
        <div class="info-another">
          카카오 계정 직접 입력
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
    
  	let qruuid = '${qrhttps}';
 	let qrhttps = 'http://byeanma.kro.kr:9089/SYJ_Mall/loginQrCheck.action?qrhttps=${qrhttps}';
  	
  	let qrcode = new QRCode(document.getElementById("qrcode"), { 
  					//가로, 세로 높이 조절 
  							width : 150, height : 150 
  							});
  	qrcode.makeCode(qrhttps);
  	
  	
  	let time = 300;
	let min = "";
	let sec = "";
	const reset = document.getElementById('resetBtn');
	
	const x = setInterval(function () {
		min = parseInt(time / 60);
	  	sec = time % 60;
	 	
	  	//여기서 계속 ajax를 통해서 불러와줘야한다. -> qr코드로 로그인을 할지 말지 정할것이다.
	  	qr_checking_user_pass(qrhttps);
	  	
	  	
		const zeroMin = String(min).padStart(2,'0');
		const zerosec = String(sec).padStart(2,'0');
			
		$("#timeCheck").html(zeroMin + " : " + zerosec);
		time--;
		
		// 리셋 버튼 클릭 시 타이머 리셋
		resetBtn.addEventListener('click', () => {
			location.href = "/SYJ_Mall/loginQr.action"  
		//time = 300;
		});
			
		// 5분 지날 시 자동 리셋
		// QR 코드 이미지 변경 로직 추가 예정
		if (time < 1) {
			location.href = "/SYJ_Mall/loginQr.action"  
		  //time = 300;
		}
	
	}, 1000);
   	
	$('.info-another').click(function(){
		location.href = "/SYJ_Mall/login.action"; 
	});
	
	
	//qr 관련
	function qr_checking_user_pass(qrhttps) {
		
		$.ajax({
			type : "POST",
			url : "/SYJ_Mall/loginQrCheck.action",
			data : {
				"qruuid" : qruuid
			},
			dataType : "json",
			success : function(result) {
				
				console.log(result);
				
				if (result == 1) {
					//로그인 해주기
					location.href = "/SYJ_Mall/main.action";
				}

			},
			error : function(a, b, c) {
				alert('error');
			}
		});
	} 
	

  </script>
</body>
</html>