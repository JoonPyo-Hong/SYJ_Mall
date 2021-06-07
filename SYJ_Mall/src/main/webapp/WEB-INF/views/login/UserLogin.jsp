<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/mainasset.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0"/>
<title>Insert title here</title>
<style>
		/* 로그인 이미지 */
        #qoo10login {
            /* border : 1px solid red; */
            margin: 0px auto;
            margin-top: 40px;
            height: 100px;
            width: 200px;
        }
        #qoo10login img {
            width:100%;
            height : 100%;
        }
        /* 전체적인 바디 */
        body {
            /* border : 1px solid red; */
            height : 740px;
            background-color : #F5F6F7;
        }
        /* 아이디 비밀번호 치는곳 */
        .inputform {
            /* border: 1px solid blue; */
            margin: 5px auto;
            width : 355px;
            height : 50px;
            padding: 10px;
        }
        .inputform input {
            width : 340px;
            height : 40px;
            border: 1px solid #E5E5E6;
        }

        #copyright {
            /* border : 1px solid blue; */
            width : 310px;
            margin: 20px auto;
            font-size: 0.9em;
            text-align: center;
        }

        #inputid:focus {
            outline: none;
        }
        
        #inputpw:focus {
            outline:none;
        }
        
        /* 광고관련 */
        #advertise {
            height: 200px;
        }

        #advertise:hover{
            cursor: pointer;
        }
        #etcinfo {
            margin: 5px auto;
            width : 260px;
            height : 30px;
            padding: 6px;
        }

        #etcinfo a,span {
            color: #8E8E8E;
            font-family: 'NEXON Lv1 Gothic OTF';
        }

         #etcinfo:hover {
             cursor : pointer;
         }
         
         <c:if test="${not empty loginError}">
         /* 로그인 실패했을때 띄워줄것 */
         #errorLogin {
             width : 340px;
             margin : 0px auto;   
             color : red;
             text-align: center;
         }
         </c:if>
		
    </style>
</head>
<body>

    <div id = "qoo10login">
        <img src = "resources/images/Qoo10_Logo.png">    
    </div>
    
    <form action="loginVerification.action" method = "POST" id = "inputform">
        <!-- 아이디 -->
        <div class = "inputform">
            <input type="text" name = "id" autocomplete="off" id = "inputid" placeholder = "아이디">
        </div>
        <!-- 비밀번호 -->
        <div class = "inputform">
            <input type="password" name = "pw" autocomplete="off" id = "inputpw" placeholder = "비밀번호">
        </div>
        <c:if test="${not empty loginError}">
        <div id = "errorLogin" style = "display: <c:out value="${adverMap['errorLogin']}"/>;">
            &nbsp;가입되지 않은 아이디이거나, 잘못된 비밀번호 입니다.
       	</div>       
        </c:if>
        <!-- 로그인 버튼 -->
        <div class = "inputform">
            <input id = "go" type="submit" value = "SIGN IN" style = "font-weight: bold; font-size: 1.3em; background-color: #EC2E3C; color:white;">
        </div>
    </form>
    
    <div id = "etcinfo">
        <a target="_blank" href = "">아이디 찾기</a>
        <span class = "bar">|</span>
        <a target="_blank" href = "">비밀번호 찾기</a>
        <span class = "bar">|</span>
        <a target="_blank" href = "/SYJ_Mall/userSignUp.action">회원 가입</a>
    </div>

    <div id = "copyright" style="font-family: 'NEXON Lv1 Gothic OTF'">
        Copyright &copy; <span style="font-weight: bold;">Qoo10 Corp.</span> All rights reserved.
    </div>
	
	<!-- 광고칸 -->
	<div id = "advertise" class = "inputform" style = "background: url('resources/images/adver/<c:out value="${adverMap['picName']}"/>'); background-size: cover;"></div>


    <script>
        
        //광고 클릭했을 경우
        $("#advertise").click(function(){
        	location.href = '<c:out value="${adverMap['url']}"/>'
        });


    </script>

</body>
</html>