<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/mainasset.jsp" %>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="<c:url value="resources/js/jsbn.js"/>"></script>
<script type="text/javascript" src="<c:url value="resources/js/rsa.js"/>"></script>
<script type="text/javascript" src="<c:url value="resources/js/prng4.js"/>"></script>
<script type="text/javascript" src="<c:url value="resources/js/rng.js"/>"></script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0"/>
<title>Insert title here</title>
<style>
		/* 로그인 이미지 */
        #qoo10login {
            margin: 0px auto;
            margin-top: 40px;
            height : 170px;
            width : 370px;
            transition-property: all;
            transition-duration: 2s;
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
            opacity: 0;
            transition-property: all;
            transition-duration: 3s;
        }
        .inputform input {
            width : 340px;
            height : 40px;
            border: 1px solid #E5E5E6;
        }
        
        #input_form {
        	opacity: 0;
            transition-property: all;
            transition-duration: 3s;
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
            opacity: 0;
            transition-property: all;
            transition-duration: 3s;
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
	<!-- type="hidden" -->
	<input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus}" />
    <input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent}" />	
	
    <div id = "qoo10login">
        <img src = "resources/images/kakao.svg">
    </div>

    <!-- 아이디 -->
    <div class = "inputform">
        <input type="text" name = "id" autocomplete="off" id = "inputid" placeholder = "아이디">
    </div>
    <!-- 비밀번호 -->
    <div class = "inputform">
        <input type="password" name = "pw" autocomplete="off" id = "inputpw" placeholder = "비밀번호">
    </div>	
	
    
    <form action="loginVerification.action" method = "POST" id = "input_form">
		
		<input type="hidden" name="securedUsername" id="securedUsername" value="" />
        <input type="hidden" name="securedPassword" id="securedPassword" value="" />
		
        <c:if test="${loginError eq '-1'}">
        <div id = "errorLogin" style = "display: <c:out value="${adverMap['errorLogin']}"/>;">
            &nbsp;가입되지 않은 아이디이거나, 잘못된 비밀번호 입니다.
       	</div>       
        </c:if>
        <!-- 로그인 버튼 -->
        <div class = "inputform">
            <input id = "go" type="button" value = "로그인" style = "font-size: 1em; background-color: #FEE500; color:black; font-family: 'NEXON Lv1 Gothic OTF';">
        </div>
    </form>
    
    <div id = "etcinfo">
        <a target="_blank" href = "">아이디 찾기</a>
        <span class = "bar">|</span>
        <a target="_blank" href = "">비밀번호 찾기</a>
        <span class = "bar">|</span>
        <a target="_blank" href = "/SYJ_Mall/userSignUp.action">회원 가입</a>
    </div>

	
	<!-- 광고칸 -->
	<div id = "advertise" class = "inputform" style = "background: url('resources/images/adver/<c:out value="${adverMap['picName']}"/>'); background-size: cover;"></div>


    <script>
        
    
    	setTimeout(function(){
        	$("#qoo10login").css("width","200px")
            				.css("height","100px");   
    	},500);
    	
        setTimeout(function(){
            $(".inputform").css("opacity","1");
            $("#input_form").css("opacity","1");
            $("#etcinfo").css("opacity","1");
        },1000);
    	
        //광고 클릭했을 경우
        $("#advertise").click(function(){
        	location.href = '<c:out value="${adverMap['url']}"/>'
        });
        
      	//1. 버튼을 직접 누른 경우
        $("#go").click(function(){
        	packetLogin();
      	}); 
        
        //2. 엔터키를 통해서 로그인 시도한 경우
        $("#inputpw").keyup(function(e){
        	if(e.keyCode == 13) packetLogin();
        })
        
        
        
        //로그인 - 패킷을 중간에 가로채는것을 방지하기 위함
        function packetLogin() {
        	
        	var username = document.getElementById("inputid").value;//유저가 작성한 아이디
      	    var password = document.getElementById("inputpw").value;//유저가 작성한 비밀번호

      	    
      	    try {
      	        var rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
      	        var rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
      	        submitEncryptedForm(username,password, rsaPublicKeyModulus, rsaPublicKeyExponent);
      	        
      	    } catch(err) {
      	    	
      	        alert(err);
      	    } 
        }
        
      	
        //로그인 버튼 클릭시 -> 데이터를 넘겨주는 부분
      	function submitEncryptedForm(username, password, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
      	    var rsa = new RSAKey();
      	    
      	    rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);

      	    // 사용자ID와 비밀번호를 RSA로 암호화한다.
      	    var securedUsername = rsa.encrypt(username);
      	    var securedPassword = rsa.encrypt(password);
		
      	    
      	    var securedForm = document.getElementById("input_form");//form 데이터
      	    
      	    securedForm.securedUsername.value = securedUsername;//여기서 암호화된 아이디번호를 넘겨준다.
      	    securedForm.securedPassword.value = securedPassword;//여기서 암호화된 비밀번호를 넘겨준다.
      	    securedForm.submit();//제출
      	}


    </script>

</body>
</html>