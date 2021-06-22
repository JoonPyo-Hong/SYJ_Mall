<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/mainasset.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0"/>
<title>Insert title here</title>
<link rel = "stylesheet" href = "resources/css/userlogin/userLoginSuccess.css">
</head>
<body>
	
    <div id = kakaopic></div>

    <div id = "congwriter">카카오 프렌즈 가입을 환영합니다!</div>

    <div id = "usercongimg"></div>
    
    <div id = "loginbutton"><button id = "gologin">로그인 하기</button></div>
        
	 <script>
	 
		$("#gologin").click(function(){
			location.href = "/SYJ_Mall/login.action";
		});
	 
	 </script>
	
</body>
</html>