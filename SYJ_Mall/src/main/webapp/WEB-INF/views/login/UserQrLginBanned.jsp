<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/mainasset.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0"/>
<title>Insert title here</title>
<link rel = "stylesheet" href = "resources/css/commoncss/commonerror.css">
</head>
<body>
	
	<div id = kakaopic style = "background-image: url('resources/images/kakao.svg');"></div>

    <div id = "congwriter">QR 로그인 허용이 거부되었습니다.</div>

    <div id = "usercongimg" style = "background-image: url('resources/images/kakaoerror.png');"></div>
    
    <div id = "loginbutton"><button id = "gologin">메인 페이지로 돌아가기</button></div>
	
	<script>
	 
		$("#gologin").click(function(){
			location.href = "/SYJ_Mall/main.action";
		});
	 
	</script>
	
</body>
</html>