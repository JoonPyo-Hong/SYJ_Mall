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
<link rel="icon" href="resources/images/main/kakao_ryan.ico">
<link rel = "stylesheet" href = "resources/css/userlogin/userLoginPwRedefined.css">
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

</style>

</head>
<body>
	<!-- type="hidden" -->
	<input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus}" />
    <input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent}" />	

	<!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-body" id = "modalcontent">
	          <p>비밀번호를 확인해주세요!</p>
	        </div>
	        <div class="modal-footer" id = "mfooter">
	          <button type="button" id = "mfooter_check" class="btn btn-default" data-dismiss="modal">확인</button>
	        </div>
	      </div> 
	    </div>
	  </div>
	
	
	
    <div id = kakaopic style = "background-image: url('resources/images/kakao.svg');"></div>

    <div id = "findtitle">
        새로운 비밀번호로
        <br>
        변경합니다.
    </div>

    <div id = "detailtitle">
        기존의 비밀번호와는 다른
        <br>
        새로운 비밀번호를 입력해 주세요.

    </div>
    
    <br>

    <div class = "inputtitles">
        새로운 비밀번호
    </div>
    <div class = "inputbox" id = "newpwLine">
        <input type="password" id = "newpw" autocomplete="off">
    </div>
    <div class = "errmsgs" id = "newpwerr"></div>

    <br>

    <div class = "inputtitles">
        비밀번호 확인
    </div>
    <div class = "inputbox" id = "newpwLine2">
        <input type="password" id = "newpw2" autocomplete="off">
    </div>
    <div class = "errmsgs" id = "newpwerr2"></div>

    <form action="/SYJ_Mall/userRedefinedPw.action" method = "POST" id = "input_form">
        <input type="hidden" name="securedPassword" id="securedPassword" value="" />
        <div id = "submit_button">
            <input id = "submit_info" type="button" value="비밀번호 변경하기" >
        </div>
    </form>

    <hr id = "bottomline">

    <div id = "copyright">
        Copyright &copy; <span style="font-weight: bold;">Kakao Corp.</span> All rights reserved.
    </div>
    
    
    <script>
        
        //1. 비밀번호가 규정에 맞는지 체크
        var pwFlag = false;//비밀번호 통과할지 결정해주는 변수
        var pwInstance = '';//임시변수 -> 비밀번호 체크하기 위한

        $("#newpw").blur(function(){
            pwFlag = false;
            var pw = this.value;
            pwInstance = pw;  
            
            if (pw == "") {
                $("#newpwerr").text('필수입력 항목입니다.');
                return false;
            }

            if (isValidPasswd(pw) != true) {
                $("#newpwerr").text('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.');
                return false;
            }

            $("#newpwerr").text('');
            pwFlag = true;
            return true;
        });

        //2. 입력한 비밀번호와 일치하는지 체크
        var pwCheckFlag = false;//비밀번호 체크를 통과할지 결정해주는 변수
        $("#newpw2").blur(function(){
        	
        	pwCheckFlag = false;//초기화
        	
        	var checkPw = this.value;//재확인할 비밀번호
        	
            if (pwInstance == "") {
                return false;
            }

        	if (pwInstance != "" && checkPw == "") {
        		//common('pwerrmsg2','red','비밀번호를 확인해주세요.');
                $("#newpwerr2").text('비밀번호를 확인해주세요.');
        		return false;
        	}
        	
        	if (checkPw != "" && checkPw != pwInstance) {
        		//common('pwerrmsg2','red','비밀번호가 일치하지 않습니다.');
                $("#newpwerr2").text('비밀번호가 일치하지 않습니다.');
        		return false;
        	}
        	
        	//commondel('pwerrmsg2');
             $("#newpwerr2").text('');
             //$("#securedPassword").val(pwInstance);//진짜로 넣어준다. --> 암호화를 걸쳐야 한다.
    		pwCheckFlag = true;       	
        });
        

        //공백체크
        function checkSpace(str) {
            if (str.search(/\s/) != -1) {
                return true;
            } else {
                return false;
            }
        } 
        
        //비밀번호를 체크하기 위한 로직
        function isValidPasswd(str) {
        	var cnt = 0;
        	if (str == "") {
	            return false;
	        }
	        
	        /* check whether input value is included space or not */
	        var retVal = checkSpace(str);
	        
	        if (retVal) {
	            return false;
	        }
	        
	        if (str.length < 8) {
	            return false;
	        }
	        
	        for (var i = 0; i < str.length; ++i) {
	            if (str.charAt(0) == str.substring(i, i + 1))
	                ++cnt;
	        }
	        
	        if (cnt == str.length) {
	            return false;
	        }
			
	        //정규식 -> 비밀번호 검증 정규식
	        var isPW = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;
	        
			if (!isPW.test(str)) {
	            
	        	return false;
	        } 
	
	        return true;
    	}

        //조건에 맞으면 비밀번호 변경하기를 노란색으로 바꿔주는 로직
        $("#submit_info").mouseover(function(){
            
            if ((pwCheckFlag == true) && (pwFlag == true)) {
                $(this).css("background-color","#FEE500");
            }
        });

        $("#submit_info").mouseleave(function(){
            
            $(this).css("background-color","#F6F6F6");

        });
        
        //1. 비밀번호 변경 버튼을 직접 누른경우
        $("#submit_info").click(function(){
        	
        	if ((pwCheckFlag == true) && (pwFlag == true))
        		packetLogin();
        	else $("#myModal").modal();
        	//else alert("확인요망");//여기 모달창으로 바꿔야함
        })
        
        
        //로그인 - 패킷을 중간에 가로채는것을 방지하기 위함
        function packetLogin() {
        	
      	    let password = document.getElementById("newpw2").value;//유저가 작성한 비밀번호
			
      	  	//console.log(password);
      	    
      	    
      	    try {
      	        let rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
      	        let rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
      	        submitEncryptedForm(password, rsaPublicKeyModulus, rsaPublicKeyExponent);
      	        
      	    } catch(err) {
      	    	
      	        alert(err);
      	    } 
        }

        //로그인 버튼 클릭시 -> 데이터를 넘겨주는 부분
      	function submitEncryptedForm(password, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
      	    let rsa = new RSAKey();
      	    
      	    rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);

      	    // 사용자ID와 비밀번호를 RSA로 암호화한다.
      	    let securedPassword = rsa.encrypt(password);
		
      	    let securedForm = document.getElementById("input_form");//form 데이터
      	    
      	    securedForm.securedPassword.value = securedPassword;//여기서 암호화된 비밀번호를 넘겨준다.
      	    securedForm.submit();//제출
      	}



    </script>

</body>
</html>