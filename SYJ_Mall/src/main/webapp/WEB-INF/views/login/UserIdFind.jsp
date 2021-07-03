<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/mainasset.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0"/>
<title>Insert title here</title>
<link rel = "stylesheet" href = "resources/css/userlogin/userFindIdNew.css">
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
    
    <form action="/SYJ_Mall/userFindIdCheckFinal.action" method = "POST" id = "input_form">
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
		
		<input type="hidden" name="throwUserId" id="throwUserId" value="" />
        <input type="hidden" name="throwUserPhone" id="throwUserPhone" value="" />
		
        <div id = "submit_button">
            <input id = "submit_info" type="button" value="카카오 계정 찾기" >
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
        
        
        //1.카카오 계정찾기 누를 경우
        $("#submit_info").click(function(){
        	
        	if ((emailFlag == true) && (phoneFlag == true)) {
        		goCheck();
        	}
        });
        
      	//2. 엔터키를 통해서 로그인 시도한 경우
        $("#registeredPhone").keyup(function(e){
        	if(e.keyCode == 13 && ((emailFlag == true) && (phoneFlag == true))) {
        		goCheck();
        	}
        });
	        
		
      	//일치하는 정보가 있는지 없는지 ajax를 통해 체크후 보내준는 작업
      	function goCheck() {
      		
      	
      		$.ajax({
                type:"POST",
                url: "/SYJ_Mall/userFindIdCheck.action" ,
                data : {"inputmail" : $("#registeredEmail").val(),"inputphone" : $("#registeredPhone").val()},
                dataType : "json",
                success : function(result) {
                	
                	var userId = result.userId;
                	var phone = result.phone

                	if (userId == null) {
                		$("#myModal").modal();
                	} else {
                		$("#throwUserId").val(userId);
                		$("#throwUserPhone").val(phone);
                		
                		$("#input_form").submit();
                	}
                	
                },
                error: function(a,b,c) {
					//console.log(a,b,c);
				}
            });
      		
      	}
      	

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