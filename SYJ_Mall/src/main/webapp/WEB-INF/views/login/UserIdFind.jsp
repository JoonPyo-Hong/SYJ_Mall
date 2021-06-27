<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/mainasset.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0"/>
<title>Insert title here</title>
<link rel = "stylesheet" href = "resources/css/userlogin/userFindId.css">
</head>
<body>
	
	
	<div id = kakaopic style = "background-image: url('resources/images/kakao.svg');"></div>

    <div id = "findtitle">
        이메일, 전화번호로
        <br>
        계정을 찾습니다.
    </div>

    <div id = "detailtitle">
        카카오 가입시 등록한 사용자의 이메일과
        <br>
        전화번호를 입력해 주세요.

    </div>
    
    <br>
    
    <form action="/SYJ_Mall/userFindIdCheck.action" method = "POST" id = "input_form">
        <div class = "inputtitles">
                  	등록한 이메일
        </div>
        <div class = "inputbox" id = "registeredEmailLine">
            <input type="text" id = "registeredEmail" placeholder="등록한 이메일을 입력해주세요." name = "inputmail" autocomplete="off">
        </div>

        <div class = "errmsgs" id = "emailerr">
            
        </div>

        <br>

        <div class = "inputtitles">
           	 전화번호
        </div>
        <div class = "inputbox" id = "registeredPhoneLine">
            <div class = "phoneinnertext" id = "phnuminput">
                <input type="text" id = "registeredPhone" placeholder="등록한 전화번호을 입력해주세요." maxlength="11" name = "inputphone" autocomplete="off">
            </div>
            <div class = "phoneinnertext" id = "phnummaxlen">
                <span id = "phonelength">0 / 11</span>
            </div>
        </div>

        <div class = "errmsgs" id = "phoneerr">
            
        </div>


        <div id = "submit_button">
            <input id = "submit_info" type="button" value="카카오 계정 찾기" >
        </div>
    </form>

    <hr id = "bottomline">

    <div id = "copyright">
        Copyright &copy; <span style="font-weight: bold;">Kakao Corp.</span> All rights reserved.
    </div>
    
    
    <script>
        
        var emailFlag = false;
        $("#registeredEmail").focus(function(){
            bottomcursorfocus($(this).attr('id'),1);
        });
        
        $("#registeredEmail").blur(function(){
            emailFlag = false;
            bottomcursorblur($(this).attr('id'),1);
            
            if(emailCheck()) {
                emailFlag = true;
            }
        });

        var phoneFlag = false;
        $("#registeredPhone").focus(function(){
            bottomcursorfocus($(this).attr('id'),2);
        });

        $("#registeredPhone").blur(function(){
            phoneFlag = false;
            bottomcursorblur($(this).attr('id'),2);

            if (phoneCheck()) {
                phoneFlag = true;
            }
        });
        
        //카카오 계정찾기 누를 경우
        $("#submit_info").click(function(){
        	
        	console.log("click!");
        	console.log(emailFlag);
        	console.log(phoneFlag);
        	if (emailFlag && phoneFlag) {
        		
        		$("#input_form").submit();
        	}
        	
        });
	        


        //포커스 처리 : id,계층단계(1,2) 로 나눔 -> 이메일 입력,전화번호 입력에서 공통적으로 쓰일 함수
        function bottomcursorfocus(id,hierarchy) {
            if (hierarchy == 1) {
                var parentId = $('#'+id).parent().attr('id');
            } else {
                var parentId = $('#'+id).parent().parent().attr('id');
            }
            $("#" + parentId).css('border-bottom','2px solid black');
        }

        //블러 처리 : id,계층단계(1,2) 로 나눔 -> 이메일 입력,전화번호 입력에서 공통적으로 쓰일 함수
        function bottomcursorblur(id,hierarchy) {
            if (hierarchy == 1) {
                var parentid =  $("#" + id).parent().attr('id');
            } else {
                var parentid =  $("#" + id).parent().parent().attr('id');
            }
            $('#'+parentid).css('border-bottom','1.5px solid #7C7C7C');
        }


        
        //글자입력 -> 글자수 count 이벤트
        var phonelength = 0;
        
        $("#registeredPhone").keyup(function(event){
            //console.log(event.which);
            phonelength = $("#registeredPhone").val().length;//문자의 길이
            var inputKeyCode = event.which;
            
            if (phonelength < 12) {
                numbercount(phonelength);
            } 

        });

        //숫자실시간으로 늘리기 && 줄이기
        function numbercount(len) {
            var inputlen = "";
            
            if (len < 10) {
                inputlen = len + " ";
            } else {
                 inputlen = len;
            }

            $("#phonelength").text(inputlen + " / 11");
        }


        //--------------- 유효성 검증 --------------------
        
        //등록한 이메일 유효성 검증
        function emailCheck() {
            var emailContent =  $("#registeredEmail").val();

            if (emailContent == "") {
                $("#emailerr").text('이메일이 입력되지 않았습니다. 이메일을 입력해주세요.');
                return false;
            } 
            
            $("#emailerr").text('');
            return true;
            
        }

        //등록한 휴대폰 유효성 검증
        function phoneCheck() {
            var phoneContent =  $("#registeredPhone").val();

            if (phoneContent == "") {
                $("#phoneerr").text('전화번호가 입력되지 않았습니다. 전화번호를 입력해주세요.');
                return false;
            }

            var isCheck = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g
            if (!isCheck.test(phoneContent)) {
            	$("#phoneerr").text('정확한 전화번호를 입력해주세요.');
            	return false;
            }
            
            $("#phoneerr").text('');
            return true;
        }
		
        
    </script>
</body>
</html>