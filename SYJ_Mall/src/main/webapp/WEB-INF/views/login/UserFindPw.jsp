<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/mainasset.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0"/>
<title>Insert title here</title>
<link rel = "stylesheet" href = "resources/css/userlogin/userFindPw.css">
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
    <div id = kakaopic style = "background-image: url('resources/images/kakao.svg');"></div>

    <div id = "findtitle" class= "mainframe">
        카카오계정의
        <br>
        비밀번호를 재설정합니다.
    </div>

    <div id = "detailtitle" class= "mainframe">
        비밀번호를 재설정할 카카오계정의 아이디와
        <br>
        회원가입시 등록한 이메일을 입력해주세요.
        <br>
        이메일 주소로 임시 비밀번호를 지급해드립니다.
    </div>
    
    <form action="/SYJ_Mall/userFindpwSend.action" method = "POST" id = "input_form">
       <!-- 카카오 계정 아이디 -->
        <div class = "inputtitles">
            카카오 계정 아이디
        </div>
        <div class = "inputbox" id = "kakaoIdBox">
            <input type="text" class = "inputboxcontent" id = "kakaoId" name = "kakaoId" placeholder="카카오 계정 아이디" autocomplete="off">
        </div>

        <div class = "errmsgs" id = "kakaoIderr"></div>

        <!-- 회원가입시 등록한 이메일 -->
        <div class = "inputtitles">
            회원가입시 등록한 이메일
        </div>

        <div class = "inputbox" id = "kakaoMailBox">
            <input type="text" class = "inputboxcontent" id = "kakaoMail" name = "kakaoMail" placeholder="등록한 이메일을 입력해주세요." autocomplete="off">
        </div>

        <div class = "errmsgs" id = "kakaoMailerr"></div>

        <!-- 회원가입시 등록한 전화번호 -->
        <div class = "inputtitles">
            전화번호
        </div>

        <div class = "inputbox" id = "kakaoPhoneBox">
            <input type="text" class = "inputboxcontent" id = "kakaoPhone" name = "kakaoPhone" placeholder="등록한 전화번호를 입력해주세요." maxlength = 11 autocomplete="off">
            <div id = "phoneLen"> 0 / 11</div>
        </div>

        <div class = "errmsgs" id = "kakaoPhoneerr"></div>

        <div id = "submit_button" class = "mainframe">
            <input id = "submit_info" type="button" value="다음" class = "mainframe">
        </div>
    </form>

    <hr id = "bottomline">

    <div id = "copyright">
        Copyright &copy; <span style="font-weight: bold;">Kakao Corp.</span> All rights reserved.
    </div>

	  <!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-body" id = "modalcontent">
	          <p>입력하신 정보와 일치하는 계정이 없습니다.</p>
	        </div>
	        <div class="modal-footer" id = "mfooter">
	          <button type="button" id = "mfooter_check" class="btn btn-default" data-dismiss="modal">확인</button>
	        </div>
	      </div> 
	    </div>
	  </div>
	  
	  
    <script>
        
	    /* 카카오사진 눌러주면 로그인창으로 이동 */
		
		$("#kakaopic").click(function(){
			location.href = "/SYJ_Mall/login.action";
		});
    
    
        //1.카카오 아이디 검증
        var kakaoIdFlag = false;
        $("#kakaoId").focus(function(){
            console.log($(this).attr('id'))
            bottomcursorfocus($(this).attr('id'));
        });

        $("#kakaoId").blur(function(){
            kakaoIdFlag = false;
            bottomcursorblur($(this).attr('id'));

            if(idVerify()) {
                kakaoIdFlag = true;
            }
        });

        //2.이메일 주소 검증
        var kakaoMailFlag = false;
        $("#kakaoMail").focus(function(){
            console.log($(this).attr('id'))
            bottomcursorfocus($(this).attr('id'));
        });

        $("#kakaoMail").blur(function(){
            kakaoMailFlag = false;
            bottomcursorblur($(this).attr('id'));

            if(emailVerify()) {
                kakaoMailFlag = true;
            }
        });


        //3.전화번호 검증
        var kakaoPhoneFlag = false;
        $("#kakaoPhone").focus(function(){
            console.log($(this).attr('id'))
            bottomcursorfocus($(this).attr('id'));
        });

        $("#kakaoPhone").blur(function(){
            kakaoPhoneFlag = false;
            bottomcursorblur($(this).attr('id'));

            if (phoneVerify()) {
                kakaoPhoneFlag = true;
            }
        });


         //포커스 처리
        function bottomcursorfocus(id) {
            var parentId = $('#'+id).parent().attr('id');
            $("#" + parentId).css('border-bottom','2px solid black');
        }
       
        //블러 처리 -> 각각의 항목에 대해 유효성 검증을 실시한다.
        function bottomcursorblur(id) {
            var parentId = $('#'+id).parent().attr('id');
            $('#'+parentId).css('border-bottom','1.5px solid #7C7C7C');
        }


        // 아이디에 대한 유효성 검증
        function idVerify() {

            var idValue = $("#kakaoId").val();
            var idLenth = $("#kakaoId").val().length;
            var idHan = /[ㄱ-ㅎ가-힣]/g;

            if (idLenth == 0) {
                $("#kakaoIderr").text('필수입력 항목 입니다.');
                return false;
            }
            
            if(idHan.test(idValue)) {
                $("#kakaoIderr").text('아이디를 확인해주십시오.');
                return false;
            }
            
            $("#kakaoIderr").text('');
            return true;
            
        } 

        // 이메일에 대한 유효성 검증
        function emailVerify() {
            var mailValue = $("#kakaoMail").val();
            var mlen = $("#kakaoMail").val().length;//이메일 길이
            var emailCheck = /([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
            var emailHan = /[ㄱ-ㅎ가-힣]/g;

            if (mlen == 0) {
                $("#kakaoMailerr").text('필수입력 항목 입니다.');
                return false;
            }
            if (!emailCheck.test(mailValue) && emailHan.test(mailValue)) {
                $("#kakaoMailerr").text('이메일 주소를 확인해주십시오.');
                return false;
            }

            $("#kakaoMailerr").text('');
            return true;
        } 

        //전화번호에 대한 유효성 검증
        function phoneVerify() {
            
            var phoneValue = $("#kakaoPhone").val();
            var plen = $("#kakaoPhone").val().length;//전화번호 길이
            var phoneCheck = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;//휴대폰 유효성 검사

            if (plen == 0) {
                $("#kakaoPhoneerr").text('필수입력 항목 입니다.');
                return false;
            }

            if (!phoneCheck.test(phoneValue)) {
                $("#kakaoPhoneerr").text('휴대전화번호를 확인해주십시오.');
                return false;
            }

            $("#kakaoPhoneerr").text('')
            return true;
        } 

        //핸드폰 길이 실시간으로 쳤을 경우 나오는 이벤트 
         $("#kakaoPhone").keyup(function(event){
            //console.log(event.which);
            phonelength = $("#kakaoPhone").val().length;//핸드폰 문자의 길이
            
            if (phonelength < 12) {
                phonLenAuto(phonelength);
            } 

        });
        
        //핸드폰번호 길이 실시간으로 반영해주는 함수
        function phonLenAuto() {
            var len = $("#kakaoPhone").val().length;//핸드폰 번호 길이
            var inputLen = "";//들어갈 숫자

            if (len < 10) {
                inputlen = len + " ";
            } else {
                 inputlen = len;
            }
            $("#phoneLen").text(inputlen + " / 11");
        }
        
        
        $("#submit_info").click(function(){
        	
        	if ((kakaoIdFlag == true) && (kakaoMailFlag == true) && (kakaoPhoneFlag == true)){
        		ajaxCheck();
        	}
        });
        
      	//여기서도 ajax를 통해서 일치하는 정보가 존재하는지 아닌지 따져봐야한다.
        function ajaxCheck() {
      		
      		$.ajax({
                type:"POST",
                url: "/SYJ_Mall/userFindpwCheck.action" ,
                data : {"userId" : $("#kakaoId").val(),"userEmail" : $("#kakaoMail").val(),"userPhone" : $("#kakaoPhone").val()},
                dataType : "json",
                success : function(result) {
                	
           			//console.log(result);

                	if (result == -1) {
                		$("#myModal").modal();
                	} else {
                		$("#input_form").submit();
                	}
                	
                },
                error: function(a,b,c) {
					//console.log(a,b,c);
				}
            });
      		
        }
        
        

    </script>
</body>
</html>