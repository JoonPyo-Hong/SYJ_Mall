<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/mainasset.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0"/>
<title>Insert title here</title>
<link rel = "stylesheet" href = "resources/css/userlogin/userQrChecking.css">

</head>
<body>
    
    
    <div id = kakaopic style = "background-image: url('resources/images/kakao.svg');"></div>

    <div id = "findtitle" class= "mainframe">
        카카오계정의
        <br>
    QR 로그인 접근을 허용합니다.
    </div>

    <div id = "detailtitle" class= "mainframe">
        QR 코드를 이용한 로그인 접근을 허용합니다.
        <br>
       아래의 내용을 확인하시고
        <br>
        로그인 허용여부를 선택해주시기 바랍니다.
    </div>
    

    <!-- 카카오 계정 아이디 -->
    <div class = "inputtitles">
        접속하실 카카오 계정 아이디
    </div>
    <div class = "inputbox" id = "kakaoIdBox">
        admin
    </div>

    <div class = "between"></div>

    <!-- 회원가입시 등록한 이메일 -->
    <div class = "inputtitles">
        접속 시도중인 ip 주소
    </div>

    <div class = "inputbox" id = "kakaoIpBox" style="color : red;">
    192.88.153.11
    </div>

    <div class = "between"></div>

    
    <div id = "submit_button" class = "mainframe">
    	<input id = "login_pass" type="button" value="로그인 허용" class = "sub_mainframe">
    	<input id = "login_not_pass" type="button" value="로그인 비허용" class = "sub_mainframe">
    </div>
	
	 <div class = "between"></div>
	
    <div id = "copyright">
        Copyright &copy; <span style="font-weight: bold;">Kakao Corp.</span> All rights reserved.
    </div>
    
    <form action="/SYJ_Mall/loginVerification.action" method = "POST" id = "input_form">
            	
        <!-- <input type="hidden" name="securedUsername" id="securedUsername" value="" /> -->
        <div name="qruuid" id="qruuid">${qruuid}</div>
           
   </form>

	  
    <script>
    	
    	//1. 로그인 허용을 누른경우
    	$('#login_pass').click(function(){
    		
    	});
    	
    	//2. 로그인 비허용을 누른경우
    	$('#login_not_pass').click(function(){
    		
    	});
    	
   
    </script>
    
    
</body>
</html>