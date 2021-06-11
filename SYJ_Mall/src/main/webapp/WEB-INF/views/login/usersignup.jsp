<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/mainasset.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0"/>
    <title>Document</title>
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
            height : 1300px;
            background-color : #F5F6F7;
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

        /* 회원가입 정보 입력하는 란 */
        .input_box {
            /* border: 1px solid red; */
            margin: 10px auto;
            width: 350px;
            height: 80px;
        }

        /* 정보입력창 감싸는 영역 */
        .info_write {
            border: 1px solid #DADADA;
            background-color: #FFFFFF;
            height: 45px;
            margin-bottom: 4px;
        }

        /* 진짜 정보를 입력하는 창 */
        .inputs_info {
            border: 0px solid;
            margin: 8px 10px;
            width: 325px;
            height: 28px;
            outline: none;
        }

        /* 정보입력 메인글씨 -> 아이디, 비밀번호 와 같이 상태를 표현해주는 정보를 나타내는곳*/
        .info_name {
            font-family: 'NEXON Lv1 Gothic OTF';
            font-weight: bolder;
        }


        /* --가입하기 버튼-- */
        #submit_button {
            /* border : 1px solid red; */
            margin: 0px auto;
            width: 350px;
            height: 45px;
        }

        #submit_info {
            border: 0px;
            width: 350px;
            height: 45px;
            margin: 0px auto;
            background-color: #EC2E3C;
            font-family: 'NEXON Lv1 Gothic OTF';
            color: #FFFFFF;
        }
        /* --가입하기 버튼-- */


        /* selected 형식모두 디자인 정해주는 클래스 */
        .selected_info {
            /* border: 1px solid blue; */
            outline:none;
            border-style: none;
            border: 1px solid #DADADA;
            background-color: #FFFFFF;
            padding-left: 7px;
            height: 45px;
            width: 350px;
            margin-bottom:4px;
        }

        /* --생년월일 입력-- */
        .birth {
            border: 1px solid #DADADA;
            /* border: 1px solid red; */
            background-color: #FFFFFF;
            float: left;
            margin: 3px 5px;
            width: 110px;
            height: 40px;
            outline: none;
            margin-bottom: 4px;
        }

        .selected_info_birth {
            border-style: none;
            outline:none;
            /* border: 1px solid red; */
            background-color: #FFFFFF;
            margin : 4px auto;
            padding-left: 7px;
            height: 30px;
            width: 100px;
        }
        /* --생년월일 입력-- */
        

        /* --이메일 입력-- */
        .email{
            border: 1px solid #DADADA;
            /* border:1px solid red; */
            background-color: #FFFFFF;
            float: left;
            margin: 3px 0px;
            margin-left: 5px;
            width: 114px;
            height: 40px;
            outline: none;
            margin-bottom:4px;
        }

        #email_gol {
            /* border: 1px solid green; */
            height: 40px;
            width: 22px;
            float: left;
            padding-top : 6px;
            padding-left: 5px;
            margin: 3px 0px;
        }


        .selected_info_email {
            border-style: none;
            outline:none;
            /* border: 1px solid blue; */
            background-color: #FFFFFF;
            margin : 4px;
            /* padding-left: 0px; */
            height: 30px;
            width: 80px;
        }

        #email_selected_site {
            /* border: 1px solid red; */
            width: 90px;
        }



        /* --이메일 입력-- */


         /* 진짜 정보를 입력하는 창 -> 작은창 버전 */
        .inputs_info_small {
            /* border: 1px solid red; */
            border-style: none;
            outline:none;
            margin-left: 8px;
            margin-top:4px;
            width: 93px;
            height: 28px;
            outline: none;
        }

        /* 유효성 검증 */
        .error_next_box {
            /* border:1px solid red; */
            margin:0px auto;
            width:400px;
            font-size: 0.9em;
            color : red;

        }



    </style>


</head>
<body>


    <div id = "qoo10login">
        <img src = "resources/images/Qoo10_Logo.png">    
    </div>
    
    <form action="/SYJ_Mall/userSignUpGo.action" method="post">
        <div class="input_box">
            <div class = "info_name">아이디</div>
            <div class = "info_write"><input id = "id_input" class = "inputs_info" type="text" name = "id_input" autocomplete="off"></div>
            <div class = "error_next_box" id="iderrmsg" style="display:none;"></div>
        </div>

        

        <div id="id_input" class="input_box">
            <div class = "info_name">비밀번호</div>
            <div class = "info_write"><input id = "pw_input" class = "inputs_info" type="password" name = "pw_input"></div>
            <div class="error_next_box" id="pwerrmsg" style="display:none;">8~16 영문 대 소문자, 숫자, 특수문자를 사용하세요.</div>
        </div>

        <div id="pw_input" class="input_box">
            <div class = "info_name">비밀번호 재확인</div>
            <div class = "info_write"><input id = "pw_input_check" class = "inputs_info" type="password"></div>
            <div class="error_next_box" id="pwerrmsg2" style="display:none;">비밀번호가 일치하지 않습니다.</div>
        </div>

        <div id="pw_input_check" class="input_box">
            <div class = "info_name">이름</div>
            <div class = "info_write"><input id = "name_input" class = "inputs_info" type="text" name = "name_input"></div>
            <div class="error_next_box" id="nameerrmsg2" style="display:none;">정확한 이름을 적어주세요.</div>
        </div>

        <div id="gender_input" class="input_box">
            <div class = "info_name">성별</div>
            <select class = "selected_info" id = gender_selected name = "sex_input">
                <option value selected >성별</option>
                <option value = "M">남자</option>
                <option value = "F">여자</option>
            </select>
            <div class="error_next_box" id="nameerrmsg2" style="display:none;">정확한 이름을 적어주세요.</div>
        </div>

        <div id="nation_input" class="input_box">
            <div class = "info_name">거주국가</div>
            <select class = "selected_info" id = nation_selected name = "nation_input">
                <option value selected>선택</option>
                <option value = "KR">대한민국</option>
                <option value = "CN">중국</option>
                <option value = "JP">일본</option>
                <option value = "MY">말레이시아</option>
                <option value = "SG">싱가포르</option>
                <option value = "TW">대만</option>
                <option value = "UK">영국</option>
                <option value = "US">미국</option>
            </select>
            <div class="error_next_box" id="nameerrmsg2" style="display:none;">정확한 이름을 적어주세요.</div>
        </div>

        

        <div id="birth_input" class="input_box" style = "width : 360px;">
            <div class = "info_name">&nbsp;생년월일</div>
            <div class = "birth">
                <input class = "inputs_info_small" type="text" id = "birth_yy" placeholder = "YYYY" name = "yy_input" maxlength="4">
            </div>
            <div class = "birth">
                    <select class="selected_info_birth" id = "birth_mm" name = "mm_input">
                        <option value seleted>선택</option>
                        <option value = "1">1월</option>
                        <option value = "2">2월</option>
                        <option value = "3">3월</option>
                        <option value = "4">4월</option>
                        <option value = "5">5월</option>
                        <option value = "6">6월</option>
                        <option value = "7">7월</option>
                        <option value = "8">8월</option>
                        <option value = "9">9월</option>
                        <option value = "10">10월</option>
                        <option value = "11">11월</option>
                        <option value = "12">12월</option>
                    </select>
            </div>
            <div class = "birth">
                <input class = "inputs_info_small" type="text" id = "birth_dd" placeholder = "dd" name = "dd_input" maxlength="2">
            </div>
            <div class="error_next_box" id="nameerrmsg2" style="margin-left:5px; clear:both; display:none;">정확한 이름을 적어주세요.</div>
        </div>

        <div id="email_input" class="input_box" style = "width : 360px;">
            <div class = "info_name">&nbsp;이메일 주소</div>
            <div class = "email">
                <input class = "inputs_info_small" type="text" id = "email_id" name = "email_input_address">
            </div>
            <div id = "email_gol">@</div>
            <div class = "email">
                <input class = "inputs_info_small" type="text" id = "email_site" name = "email_input_site">
            </div>
             <div class = "email" id = "email_selected_site">
                    <select class="selected_info_email" id = "email_site_seleted">
                        <option value seleted>직접입력</option>
                        <option value = "naver">naver</option>
                        <option value = "gmail">gmail</option>
                        <option value = "yahoo">yahoo</option>
                        <option value = "hotmail">hotmail</option>
                        <option value = "hanmail">hanmail</option>
                        <option value = "qoo10">qoo10</option>
                    </select>
            </div>
            <div class="error_next_box" id="nameerrmsg2" style="margin-left:5px; clear:both; display:none;">필수입력 항목입니다.</div>
        </div>

        <div id="email_agree" class="input_box">
            <div class = "info_name">이메일 발송 동의 유무</div>
                <select class = "selected_info" id = email_selected name = "email_agree_input">
                    <option value selected>선택</option>
                    <option value = "Y">동의</option>
                    <option value = "N">비동의</option>
                </select>
                <div class="error_next_box" id="nameerrmsg2" style="display:none;">필수입력 항목입니다.</div>
        </div>
        
        
        <div id="phone_input" class="input_box">
            <div class = "info_name">휴대전화</div>
            <div class = "info_write"><input id = "phone_number_input" class = "inputs_info" type="text" placeholder="01012345678" name = "phone_input" maxlength="11"></div>
            <div class="error_next_box" id="nameerrmsg2" style="display:none;">필수입력 항목입니다.</div>
        </div>

        <div id="sms_agree" class="input_box">
            <div class = "info_name">SMS 발송 동의 유무</div>
                <select class = "selected_info" id = sms_selected name = "sms_agree_input">
                    <option value selected>선택</option>
                    <option value = "Y">동의</option>
                    <option value = "N">비동의</option>
                </select>
            <div class="error_next_box" id="nameerrmsg2" style="display:none;">필수입력 항목입니다.</div>
        </div>

        


        <div id = "submit_button" style="margin-top:50px;">
            <input id = "submit_info" type="submit" value="가입하기">
        </div>

    </form>

    
    <div id = "copyright">
        Copyright &copy; <span style="font-weight: bold;">Qoo10 Corp.</span> All rights reserved.
    </div>

    <script>
        

        //----------------------------------------------------------------------------유효성 검증-----------------------------------------------------------------------------------
	
        
        //객체 id, 지정할 color, 띄워줄 문자열
        function common(element,color,inputText) {
        	$("#" + element).text(""+inputText);
        	$("#" + element)
            .css('color',""+color)
            .css('display','block');
        }
        
        //1. 아이디
        var idFlag = false;
        
        $("#id_input").blur(function(){

            //if(idFlag) return true;
            var id = this.value;
            
            //iderrmsg
            if (id == "") {
                
            	common('iderrmsg','red','필수입력 항목입니다.');
                /* $("#iderrmsg").text('필수입력 항목입니다.');
                $("#iderrmsg")
                .css('color','red')
                .css('display','block'); */
                return false;
            } 

            var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
            if (!isID.test(id)) {
            	common('iderrmsg','red','5~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.');
                /* $("#iderrmsg").text('5~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.');
                $("#iderrmsg")
                .css('color','red')
                .css('display','block'); */
                return false;
            }
            
            $.ajax({
                type:"GET",
                url: "/SYJ_Mall/userSignUpIdCheck.action" ,
                data : "checkid=" + id,
                datattype : "json",
                success : function(result) {
                    //var result = data.substr(4);
                    console.log(result);
                    
                    if (result == 1) {// 아이디가 중복되지 않는경우
                    	//consle.log(result);
                    	common('iderrmsg','#08A600','멋진 아이디네요!');
                        /* $("#iderrmsg").text('멋진 아이디네요!');
                        $("#iderrmsg")
                        .css('color','#08A600')
                        .css('display','block'); */
                       
                        idFlag = true;
                    } else {//아이디가 중복되는 경우
                    	//console.log(result);
                    	common('iderrmsg','red','이미 사용중이거나 탈퇴한 아이디입니다.');
                    	/* $("#iderrmsg").text('이미 사용중이거나 탈퇴한 아이디입니다.');
                        $("#iderrmsg")
                        .css('color','red')
                        .css('display','block'); */
                    }
                },
                error: function(a,b,c) {
                	//console.log("error");
					console.log(a,b,c);
				}
            });
            
            return true;

        });

		
        
        //2. 비밀번호
        
        
        
        
        //select 박스 클릭해줄때 빨간테두리 생기게 해주는 기능
        $(".selected_info").focus(function(){
            redClickSelectedOff(2,this);
        });

        //select 박스가 아닌 박스를 클릭해줄때 빨간테두리 생기게 해주는 기능
        $(".inputs_info").focus(function(){
            redClickSelectedOff(1,this);
        });

        $("#birth_yy").focus(function(){
            
            redClickSelectedOffbirth(this.id,1);
            //console.log( $("#birth_yy").parent());
            
        });

        $("#birth_mm").focus(function(){
           
            redClickSelectedOffbirth(this.id,1);
            //console.log( $("#birth_mm").parent());
           
        });

        $("#birth_dd").focus(function(){

            redClickSelectedOffbirth(this.id,1);
            //console.log( $("#birth_dd").parent());
        });

        $("#email_id").focus(function(){
            redClickSelectedOffemail(this.id,1);
        });
        
        $("#email_site").focus(function(){
            redClickSelectedOffemail(this.id,1);
        });

        
        $("#email_site_seleted").focus(function(){
            redClickSelectedOffemail(this.id,1);
        });
        
        //이메일주소 선택시 바로 value를 넣어주기 위한 작업
        $("#email_site_seleted").on('change',function(){

            var emailSite = this.value;

            if (emailSite == "") {
                $("#email_site").val(""); 
            } else {
                $("#email_site").val(this.value + ".com"); 
            }
            
        });
        
                



        //생년월일 관련
        function redClickSelectedOffbirth(id,num) {

            $(".birth").css('border','1px solid #DADADA');
            
            if (num == 1) {//내가 주체가 될때 -> 다른함수에서 나를 콜 하지 않은경우
                redClickSelectedOff(0,null);
                redClickSelectedOffemail(null,0);
                $("#"+id).parent().css('border','1px solid #EC2E3C');
            }                   
        }

        //이메일 관련
        function redClickSelectedOffemail(id,num) {

            $(".email").css('border','1px solid #DADADA');
            
            if (num == 1) {//내가 주체가 될때 -> 다른함수에서 나를 콜 하지 않은경우
                redClickSelectedOff(0,null);
                redClickSelectedOffbirth(0,null);
                $("#"+id).parent().css('border','1px solid #EC2E3C');
            }                   
        }


        //기본적으로 한칸짜리 놈들
        function redClickSelectedOff(num,class_this) {     
            
            $('.selected_info').css('border','1px solid #DADADA');
            $('.info_write').css('border','1px solid #DADADA');
        
            if (num == 1) {
                redClickSelectedOffbirth(null,0);
                redClickSelectedOffemail(null,0);
                $("#"+class_this.id).parent().css('border','1px solid #EC2E3C');  
            } else if (num == 2) {
                redClickSelectedOffbirth(null,0);
                redClickSelectedOffemail(null,0);
                $("#"+class_this.id).css('border','1px solid #EC2E3C'); 
            }
        }

    
    </script>

</body>
</html>