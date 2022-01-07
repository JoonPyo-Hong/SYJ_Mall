<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/mainasset.jsp" %>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="<c:url value="resources/js/jsbn.js"/>"></script>
<script type="text/javascript" src="<c:url value="resources/js/rsa.js"/>"></script>
<script type="text/javascript" src="<c:url value="resources/js/prng4.js"/>"></script>
<script type="text/javascript" src="<c:url value="resources/js/rng.js"/>"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>	
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0"/>
<title>Insert title here</title>
<link rel="icon" href="resources/images/main/kakao_ryan.ico">
<c:if test="${empty comeCount}">
	<link rel = "stylesheet" href = "resources/css/userlogin/userLoginNotAnimation.css">
</c:if>
<c:if test="${not empty comeCount}">
	<link rel = "stylesheet" href = "resources/css/userlogin/userLogin.css">
</c:if>
<style>

    /* 모달창 */
    #myModal > .modal-dialog {
        width: 350px;
        height : 200px;
        margin-top: 300px;
    }
    #myModal > .modal-dialog > .modal-content {
        height : 200px;
    }
    #modalcontent {
        margin-top: 40px;
        font-family: 'NEXON Lv1 Gothic OTF';
        color : #7C7C7C;
        text-align: center;
    }
    #mfooter {
        border: 0px; 
        padding: 0px;
        text-align:center
    }
    #mfooter_check {
        border:0px;
        width: 320px;
        height: 45px;
        background-color: #FEE500;
        font-family: 'NEXON Lv1 Gothic OTF';
        color: black;
        border-radius: 5px;
        outline: none;
    }
    #mfooter_check:hover{
        background-color: #F0D700;
    }
    

	#recaptcha {
		display: flex;
	  	justify-content: center;
	}
	
	
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
    <!-- <form action="" method = "POST" id = "input_form"> -->
		
		<input type="hidden" name="securedUsername" id="securedUsername" value="" />
		<input type="hidden" name="securedPassword" id="securedPassword" value="" /> 
		
		
		
        <!-- 로그인 버튼 -->
        <div class = "inputform">
            <input id = "go" type="button" value = "로그인" style = "border-radius: 5px; font-size: 1em; background-color: #FEE500; color:black; font-family: 'NEXON Lv1 Gothic OTF';">
        </div>
    </form>
    
    <div id = "recaptcha">
		<div class="g-recaptcha" data-sitekey="6Lcw6-UdAAAAAJLINDkliT-Ops9xfnkysSKtYlcF"></div>
	</div>
    
    <div id = "etcinfo">
        <a target="_self" href = "/SYJ_Mall/userFindId.action">아이디 찾기</a>
        <span class = "bar">|</span>
        <a target="_self" href = "/SYJ_Mall/userFindpw.action">비밀번호 찾기</a>
        <span class = "bar">|</span>
        <a target="_self" href = "/SYJ_Mall/userSignUp.action">회원 가입</a>
    </div>
	
	
	<!-- 광고칸 -->
	<div id = "advertise" class = "inputform" style = "background: url('resources/images/adver/<c:out value="${adverMap['picName']}"/>'); background-size: cover;"></div>
	
	
	  <!--Login Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-body" id = "modalcontent">
	          <p id="modal_context"></p>
	        </div>
	        <div class="modal-footer" id = "mfooter">
	          <button type="button" id = "mfooter_check" class="btn btn-default" data-dismiss="modal">확인</button>
	        </div>
	      </div> 
	    </div>
	  </div>
	  
	  
	

    <script>
    	/* 카카오사진 눌러주면 로그인창으로 이동 */
		$("#qoo10login").click(function(){
			location.href = "/SYJ_Mall/login.action";
		});       
    	
    	//애니매이션 효과 안보여주고 싶을 경우
    	<c:if test="${not empty comeCount}">
    	setTimeout(function(){
        	$("#qoo10login").css("width","200px")
            				.css("height","100px");   
    	},500);
    	
        setTimeout(function(){
            $(".inputform").css("opacity","1");
            $("#input_form").css("opacity","1");
            $("#etcinfo").css("opacity","1");
        },1000);
        </c:if>
        
    	
        //광고 클릭했을 경우
        $("#advertise").click(function(){
        	location.href = '<c:out value="${adverMap['url']}"/>'
        });
        
      	//1. 버튼을 직접 누른 경우
        $("#go").click(function(){
        	capcharStart();
        	//packetLogin();
      	});  
        
        //2. 엔터키를 통해서 로그인 시도한 경우
        $("#inputpw").keyup(function(e){
        	if(e.keyCode == 13) capcharStart();
        });
        
        $('#mfooter_check').click(function(){
        	location.reload();
        })
        
       	//리캅챠 인증 함수 
       	function capcharStart() {
        	$.ajax({
                url: '/SYJ_Mall/loginCaptcha.action',
                type: 'post',
                data: {
                    recaptcha: $("#g-recaptcha-response").val()
                },
                success: function(data) {
                    switch (data) {
                        case 1:
                            packetLogin();
                            break;

                        case -1:
                        	modal_situation('자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.');
                            break;

                        default:
                            alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
                            break;
                    }
                }
            });
        } 
        
        
        
        
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
      	   ajaxCheck(securedUsername,securedPassword);//ajax 호출
      	}
        
        
        function ajaxCheck(securedUsername,securedPassword) {	
      		$.ajax({
                type:"POST",
                url: "/SYJ_Mall/userLoginVerificationCheck.action" ,
                data : {"securedUsername" : securedUsername,"securedPassword" : securedPassword },
                dataType : "json",
                success : function(result) {
                	
					
           			if (result == 1){
           				$("#input_form").submit();
           			} else {
           				modal_situation('가입되지 않은 아이디이거나, 잘못된 비밀번호 입니다.');
           			}
           			
                },
                error: function(a,b,c) {
					alert('error');
				}
            });
      		
        }
        
        //상황에 따라 맞는 모달 넣어주기
        function modal_situation(inner_text) {
        	
        	$('#modal_context').text(inner_text)
        	
        	$("#myModal").modal();
        	
        }
        


    </script>

</body>
</html>