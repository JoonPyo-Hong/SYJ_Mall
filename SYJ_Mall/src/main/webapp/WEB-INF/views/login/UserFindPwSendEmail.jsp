<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/mainasset.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0"/>
<title>Insert title here</title>
<link rel="icon" href="resources/images/main/kakao_ryan.ico">
<link rel = "stylesheet" href = "resources/css/userlogin/userFindPwMail.css">
</head>
<body>
    
    
    <div id = kakaopic style = "background-image: url('resources/images/kakao.svg');"></div>

    <div id = "findtitle" class= "mainframe">
        카카오 계정의 비밀번호가 
        <br>
        성공적으로 변경되었습니다.
    </div>

    <div id = "detailtitle" class= "mainframe">
        아래의 고객님의 이메일 주소로 
        <br>
        카카오 계정에 접속 가능한
        <br>
        임시 비밀번호를 보내드렸습니다.
    </div>
    
    <hr style="width: 350px;">

    <div id = "userinfo" class= "mainframe">
        <div id = "userid">${sendEmail}</div>
    </div>

    <hr style="width: 350px;">

    <div id = "submit_button" class = "mainframe">
        <input id = "submit_info" type="button" value="로그인" class = "mainframe">
    </div>

    <hr id = "bottomline">

    <div id = "copyright">
        Copyright &copy; <span style="font-weight: bold;">Kakao Corp.</span> All rights reserved.
    </div>

	
	<script>
		
		//로그인 버튼을 눌렀을 경우에
		$("#submit_info").click(function(){
			location.href = "/SYJ_Mall/login.action";
		});
		
    	/* 카카오사진 눌러주면 로그인창으로 이동 */
    	$("#kakaopic").click(function(){
    		location.href = "/SYJ_Mall/login.action";
    	});
	
	
	</script>
	
	

</body>
</html>