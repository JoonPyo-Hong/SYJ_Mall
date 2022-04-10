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
      <button id="send_message" type="button" onclick="send();">메세지 전송</button>
    </div>
  </div>
  
  <form action="/SYJ_Mall/loginQrDeviceCheck.action" method = "POST" id = "last_checking_form">
            	
        <input type="hidden" name="throwUuid" id="throwUuid" value="" />
           
  </form>
  
  
  <script type="text/javascript">
    
	let qruuid;
 	let qrhttps;
  	let time = 300;
	let min = "";
	let sec = "";
	
	
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
			closeSocket();
			openSocket();
			time = 300;
				  
		}
	}, 1000);
   	
	// if click the refresh button then refresh Qrcode and timer
	$('#resetBtn').click(function(){
		closeSocket();
		openSocket();
		time = 300; 
	});
		
	//go to genenral login page
	$('.info-another').click(function(){
		closeSocket();
		location.href = "/SYJ_Mall/login.action";
	});
	
	
	/************************* QR Code Socket process *************************/
	let wss;//socket Object
	let request_ip = '${requestIpAddress}';
	
	window.onload = function(){
		openSocket();	
  	} 
	
	function openSocket() {
		if(wss !== undefined && wss.readyState !== WebSocket.CLOSED ){
            alert("WebSocket is already opened.");
            return;
           	}
		 
		//Generate Websocekt
		wss = new WebSocket("ws://byeanma.kro.kr:${serverPort}/SYJ_Mall/qrecho.action");
		
		
		wss.onopen = function(event){			
            if(event.data === undefined){
            	return;
            }
        };
        
        wss.onmessage = function(event){
            console.log(event.data);
            let gubun = event.data.split(",");
            
            let first = gubun[0];
            let second = gubun[1];
            
            //Generate Qrcode and making Qr image
			if (first == 'gen') {
				qruuid = second;
	            qrhttps = 'http://byeanma.kro.kr:${serverPort}/SYJ_Mall/loginQrPrevCheck.action?qrhttps='+ qruuid + '&tryip=' + request_ip;
	            qrcode.makeCode(qrhttps);//qr code image making
			}   
			else if (first == 'qruuid'){
				//login pass
				QRLogin(second);
			} else if (first == 'stop') {
				closeSocket();
				location.href  = '/SYJ_Mall/qrLoginBannedMonitor.action';
			} else {
				closeSocket();
				location.href = "/SYJ_Mall/totalError.action";
			}
        };
        
        wss.onclose = function(event){
			
        }	
	}
	
	function send() {
		var text = 'test,test';
		wss.send(text);
	}
	
	function closeSocket(){
		wss.close();
    }
	
	function testConsole(text) {
		qruuid = text;
		console.log(text);
	}
	
	//Post the Qrcode Backend logic
	function QRLogin(qruuid) {
		
		$('#throwUuid').val(qruuid);
		$('#last_checking_form').submit();
		
	}

  </script>
</body>
</html>