<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/kakaoAsset.jsp" %>

<!DOCTYPE html>
<html>
<script type="text/javascript" src="<c:url value="resources/js/jsbn.js"/>"></script>
<script type="text/javascript" src="<c:url value="resources/js/rsa.js"/>"></script>
<script type="text/javascript" src="<c:url value="resources/js/prng4.js"/>"></script>
<script type="text/javascript" src="<c:url value="resources/js/rng.js"/>"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script type="text/javascript" src="<c:url value="resources/js/kakaoLogin/kakaoLoginGo.js"/>"></script>	
<head>
<meta charset="UTF-8">
<title>Kakao Friends</title>
<meta name="viewport" content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0"/>

<!-- css -->
<link rel = "stylesheet" href = "resources/css/kakaoCommon/kakaoCommon.css">
<link rel = "stylesheet" href = "resources/css/kakaoLogin/kakaoLoginGo.css">
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
	
	<!-- RSA information-->
	<input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus}" />
	<input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent}" />	
	

  	<div id="main-login-wrap">
    	<!-- Top Area -->
    	<div class="login-wrap">
	      	<!-- Left Banner -->
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
	      	<!-- Login Tab -->
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
	                  				<span class="ico-text">아이디 비밀번호 기억</span>
	                  			</label>
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
</body>
</html>