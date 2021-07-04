<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/mainasset.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0"/>
<title>Insert title here</title>
<link rel = "stylesheet" href = "resources/css/userlogin/userFindIdCheckOk.css">
</head>
<body>
    
    <div id = kakaopic style = "background-image: url('resources/images/kakao.svg');"></div>

    <div id = "findtitle" class= "mainframe">
        입력하는 정보와 일치하는
        <br>
        카카오계정을 확인해 주세요.
    </div>

    <div id = "detailtitle" class= "mainframe">
        개인정보 보호를 위해 정보 일부를 *로 표시하였습니다.
        <br>
        카카오계정에 로그인 할 수 있는 아이디 및 전화번호가
        <br>
        표시됩니다. 
    </div>
    
    <hr style="width: 350px;">

    <div id = "userinfo" class= "mainframe">
        <div id = "userid">${userId}</div>
        <div id = "userphone">${phone}</div>
    </div>

    <div id = "userselect" class= "mainframe">
        비밀번호 재설정
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
        
    	//비밀번호 재설정 눌렀을 경우 -> 비밀번호 재설정 페이지로 이동!
    	$("#userselect").click(function(){
    		location.href = "/SYJ_Mall/userFindpw.action";
        }); 
    	
    	//로그인 버튼 눌렀을 경우
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