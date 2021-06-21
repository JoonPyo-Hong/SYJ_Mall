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
        /* 전체적인 바디 */
        body {
            /* border : 1px solid red; */
            height : 600px;
            background-color : #F5F6F7;
        }
        /* 넥슨 글씨체 */
        @font-face {
            font-family: 'NEXON Lv1 Gothic OTF';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        /* 카카오프렌즈 이미지 */
        #kakaopic {
            /* border : 1px solid red; */
            margin: 0px auto;
            margin-top: 40px;
            height: 100px;
            width: 200px;
            background-image: url('resources/images/kakao.svg');
            background-position: center;
            background-repeat: no-repeat;
        }

        /* 축하글 */
        #congwriter {
            /* border: 1px solid red; */
            width: 440px;
            height : 100px;
            margin: 0px auto;
            padding-top: 30px;
            font-size : 2em;
            font-family: 'NEXON Lv1 Gothic OTF';
            text-align: center;
        }


        /* 축하이미지 */
        #usercongimg {
            /* border: 1px solid red; */
            width: 400px;
            height : 200px;
            background-image: url('resources/images/kakaofriends.png');
            background-position: center;
            background-size: 50%;
            background-repeat: no-repeat;
            margin: 0px auto
        }

        /* 로그인 버튼 */
        #loginbutton {
            /* border: 1px solid red; */
            width: 352px;
            margin: 30px auto;
        }
        
        #gologin {
            border: 0px;
            width: 350px;
            height: 45px;
            margin: 0px auto;
            background-color: #FEE500;
            font-family: 'NEXON Lv1 Gothic OTF';
            color: black; 
        }	
	
	
</style>
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