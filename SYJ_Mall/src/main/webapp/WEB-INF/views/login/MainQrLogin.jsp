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
<script type="text/javascript" src="resources/js/login/mainQrLogin.js"></script>
<link rel="stylesheet" href="resources/css/userlogin/MainQrLogin.css">

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
  
  <form action="/SYJ_Mall/loginQrDeviceCheck.action" method = "POST" id = "last_checking_form">
            	
        <input type="hidden" name="throwUuid" id="throwUuid" value="" />
           
  </form>
  
  
  <script type="text/javascript">
    
	let qruuid; 	//Universally Unique IDentifier
  	let time; 		//총 시간
	let min = "";	//분
	let sec = "";	//초
	
	//위의 qr 코드 박스에 어떤 qr code 값을 넣을 것인지 지정해주는 코드
  	let qrcode = new QRCode(document.getElementById("qrcode"), { 
  					//width, height modify
  							width : 150, height : 150 
  							});
  	
	//QR code
	const x = setInterval(function() {
		min = parseInt(time / 60);
	  	sec = time % 60;
	  	
		const zeroMin = String(min).padStart(2,'0');
		const zerosec = String(sec).padStart(2,'0');
			
		$("#timeCheck").html(zeroMin + " : " + zerosec);
		time--;
		
		// if Timecount over 5min then refresh Qrcode and timer 
		if (time < 1) {
			refreshQr();//location reload 역할 수행				  
		}
	}, 1000);
   	

	
	
	/************************* QR Code Socket process *************************/
	let request_ip = '${requestIpAddress}';
	let server_port = '${serverPort}';
	
	window.onload = function(){
		openSocket(server_port,request_ip);
		time = 300;
  	} 
	
	//if click the refresh button then refresh Qrcode and timer
	$(document).on("click","#resetBtn",function(e){
		refreshQr();
	});
		
	//go to genenral login page
	$(document).on("click",".info-another",function(e){
		closeSocket();
		location.href = "/SYJ_Mall/login.action";
	});


  </script>
</body>
</html>