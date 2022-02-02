<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>카카오 프렌즈샵</title>
<link rel="stylesheet" href="resources/css/mainLayout/mainTilesLayout.css">
<link rel="stylesheet" href="resources/css/userlogin/qrLoginPass.css">
</head>

<body>

	<div id="kakao-wrap">
       	<div id="kakao-content">
		        <div id="inner-content">
		            <div class="container-wrap login-wrap">
		                <img class="background-img" src="/SYJ_Mall/resources/images/login/bg_login.png"/>
		                <div class="login-box">
		                    <div class="login-text">
                        		<span class="bold">
                        		QR 로그인 인증이 
                            		<br>
                           		 허용되었습니다.
                           		 </span>
                    		</div>
		                  	<button class="login-btn">
		                    <span></span>
		                                      홈으로 돌아가기
		                    </button>
		                </div>
		            </div>
		        </div>
        	</div>
        </div>

    <script>
    	
    	$('.login-btn').click(function(){
    		location.href = '/SYJ_Mall/main.action';
    	});
    
    </script>
</body>
</html>