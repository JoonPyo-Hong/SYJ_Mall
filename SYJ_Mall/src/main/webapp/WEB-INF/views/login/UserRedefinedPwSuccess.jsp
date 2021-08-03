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
	
    <div id = kakaopic style = "background-image: url('resources/images/kakao.svg');"></div>

    <div id = "congwriter">비밀번호가 성공적으로 변경되었습니다.</div>

    <div id = "usercongimg" style = "background-image: url('resources/images/kakaofriends.png');"></div>
    
    <div id = "loginbutton"><button id = "gologin">로그인 하기</button></div>
        
	 <script>
	 
		$("#gologin").click(function(){
			location.href = "/SYJ_Mall/login.action";
		});
		
    	/* 카카오사진 눌러주면 로그인창으로 이동 */
		$("#kakaopic").click(function(){
			location.href = "/SYJ_Mall/login.action";
		});
	 
	 </script>
	
</body>
</html>