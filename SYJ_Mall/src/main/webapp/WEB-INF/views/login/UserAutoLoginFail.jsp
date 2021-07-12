<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/mainasset.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=375, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0"/>
<title>Insert title here</title>
<link rel = "stylesheet" href = "resources/css/userlogin/userAutoLoginFail.css">
</head>
<body>

    <div id = kakaopic style = "background-image: url('resources/images/kakao.svg');"></div>


    <div id = "findtitle" class= "mainframe">
        자동 로그인 방지 조건을 
        <br>
        충족하지 못하였습니다.
    </div>

    <div id = "detailtitle" class= "mainframe">
        자동로그인 방지 조항에 의해
        <br>
        카카오 계정 접속에 대한
        <br>
        권한을 임시로 차단합니다.
    </div>
    


    <div id = "submit_button" class = "mainframe">
        <input id = "submit_info" type="button" value="돌아가기" class = "mainframe">
    </div>

    <hr id = "bottomline">

    <div id = "copyright">
        Copyright &copy; <span style="font-weight: bold;">Kakao Corp.</span> All rights reserved.
    </div>
    
    <script>
    	//돌아가기 버튼 누르면
    	$("#submit_info").click(function(){
    		location.href = "/SYJ_Mall/login.action";
    	});
    </script>


</body>
</html>