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
    <title>Document</title>
	<link rel = "stylesheet" href = "resources/css/userlogin/userSignUp.css">
</head>
<body>
	
    <input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus}" />
    <input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent}" />	
	
    <div id = "qoo10login">
        <img src = "resources/images/kakao.svg">    
    </div>
    
    
    <div class="input_box">
        <div class = "info_name">아이디</div>
        <div class = "info_write"><input id = "id_input" class = "inputs_info" type="text" name = "id_input" autocomplete="off"></div>
        <div class = "error_next_box" id="iderrmsg" style="display:none;"></div>
    </div>

    <div id="pw_input_div" class="input_box">
        <div class = "info_name">비밀번호</div>
        <div class = "info_write"><input id = "pw_input" class = "inputs_info" type="password" name = "pw_input"></div>
        <div class="error_next_box" id="pwerrmsg" style="display:none;"></div>
    </div>
        
    <div id="pw_input_check_div" class="input_box">
        <div class = "info_name">비밀번호 재확인</div>
        <div class = "info_write"><input id = "pw_input_check" class = "inputs_info" type="password"></div>
        <div class="error_next_box" id="pwerrmsg2" style="display:none;"></div>
    </div>
    
	
	<form id="securedForm" name="securedForm" action="/SYJ_Mall/userSignUpGo.action" method="post">
		<!-- 암호화하여 넘겨줄 데이터 -->
		<input type="hidden" name="securedUsername" id="securedUsername" value="" />
        <input type="hidden" name="securedPassword" id="securedPassword" value="" />
		<!-- 암호화하여 넘겨줄 데이터 -->
		
        <div id="name_input_check" class="input_box">
            <div class = "info_name">이름</div>
            <div class = "info_write"><input id = "name_input" class = "inputs_info" type="text" name = "name_input" autocomplete="off"></div>
            <div class="error_next_box" id="nmerrmsg" style="display:none;"></div>
        </div>

        <div id="gender_input" class="input_box">
            <div class = "info_name">성별</div>
            <select class = "selected_info" id = "gender_selected" name = "sex_input">
                <option value selected >성별</option>
                <option value = "M">남자</option>
                <option value = "F">여자</option>
            </select>
            <div class="error_next_box" id="gendererrmsg" style="display:none;"></div>
        </div>

        <div id="nation_input" class="input_box">
            <div class = "info_name">거주국가</div>
            <select class = "selected_info" id = "nation_selected" name = "nation_input">
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
            <div class="error_next_box" id="nationerrmsg" style="display:none;"></div>
        </div>

        

        <div id="birth_input" class="input_box" style = "width : 360px;">
            <div class = "info_name">&nbsp;생년월일</div>
            <div class = "birth">
                <input class = "inputs_info_small" type="text" id = "birth_yy" placeholder = "YYYY" name = "yy_input" maxlength="4" autocomplete = "OFF">
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
                <input class = "inputs_info_small" type="text" id = "birth_dd" placeholder = "dd" name = "dd_input" maxlength="2" autocomplete = "OFF">
            </div>
            <div class="error_next_box" id="birtherrmsg" style="margin-left:5px; clear:both; display:none;"></div>
        </div>

        <div id="email_input" class="input_box" style = "width : 360px;">
            <div class = "info_name">&nbsp;이메일 주소</div>
            <div class = "email">
                <input class = "inputs_info_small" type="text" id = "email_id" name = "email_input_address" autocomplete = "OFF">
            </div>
            <div id = "email_gol">@</div>
            <div class = "email">
                <input class = "inputs_info_small" type="text" id = "email_site" name = "email_input_site" autocomplete = "OFF">
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
            <div class="error_next_box" id="emailerrmsg" style="margin-left:5px; clear:both; display:none;"></div>
        </div>

        <div id="email_agree" class="input_box">
            <div class = "info_name">이메일 발송 동의 유무</div>
                <select class = "selected_info" id = "email_selected" name = "email_agree_input">
                    <option value selected>선택</option>
                    <option value = "Y">동의</option>
                    <option value = "N">비동의</option>
                </select>
                <div class="error_next_box" id="email_selected_errmsg" style="display:none;"></div>
        </div>
        
        
        <div id="phone_input" class="input_box">
            <div class = "info_name">휴대전화</div>
            <div class = "info_write"><input id = "phone_number_input" class = "inputs_info" type="text" placeholder="01012345678" name = "phone_input" maxlength="11" autocomplete = "OFF"></div>
            <div class="error_next_box" id="phoneerrmsg" style="display:none;"></div>
        </div>

        <div id="sms_agree" class="input_box">
            <div class = "info_name">SMS 발송 동의 유무</div>
                <select class = "selected_info" id = "sms_selected" name = "sms_agree_input">
                    <option value selected>선택</option>
                    <option value = "Y">동의</option>
                    <option value = "N">비동의</option>
                </select>
            <div class="error_next_box" id="smserrmsg" style="display:none;"></div>
        </div>

        


        <div id = "submit_button" style="margin-top:50px;">
            <input id = "submit_info" type="button" value="가입하기">
        </div>

    </form>

    

    <script>
        

        //----------------------------------------------------------------------------유효성 검증-----------------------------------------------------------------------------------
		
        //객체 id, 지정할 color, 띄워줄 문자열
        function common(element,color,inputText) {
        	$("#" + element).text(""+inputText);
        	$("#" + element)
            .css('color',""+color)
            .css('display','block');
        }
        
        //객체id --> 확인되었으면 붉은색 글자 없애준는 용도
        function commondel(element) {
            $("#" + element).css('display','none');
        }
        
        
        //1. 아이디
        var idFlag = false;//아이디 검증
        
        $("#id_input").blur(function(){

            //if(idFlag) return true;
            var id = this.value;
            
            //iderrmsg
            if (id == "") {
                
            	common('iderrmsg','red','필수입력 항목입니다.');
            	
                return false;
            } 

            var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
            if (!isID.test(id)) {
            	common('iderrmsg','red','5~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.');
                
                return false;
            }
            
            $.ajax({
                type:"GET",
                url: "/SYJ_Mall/userSignUpIdCheck.action" ,
                data : "checkid=" + id,
                datatype : "json",
                success : function(result) {
                    
                    if (result == 1) {// 아이디가 중복되지 않는경우
                    	common('iderrmsg','#08A600','멋진 아이디네요!');
                       
                       
                        idFlag = true;
                    } else {//아이디가 중복되는 경우
                    	common('iderrmsg','red','이미 사용중이거나 탈퇴한 아이디입니다.');
                    	
                    }
                },
                error: function(a,b,c) {
					console.log(a,b,c);
				}
            });
            
            return true;

        });

		
        
        //2. 비밀번호
        var pwFlag = false;//비밀번호 통과할지 결정해주는 변수
        var pwInstance = '';//임시변수 -> 비밀번호 체크하기 위한
        
        $("#pw_input").blur(function(){
            
        	pwFlag = false;
            var pw = this.value;
            pwInstance = pw;
            


            if (pw == "") {
                common('pwerrmsg','red','필수입력 항목입니다.');
                return false;
            }

            if (isValidPasswd(pw) != true) {
                common('pwerrmsg','red','8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.');
                return false;
            }

            
            //여기아래에서 이제 ajax 를 통한 검증을 들어가야한다. -> 인코딩을 통해 암호화가 필요할거같은데;
            $.ajax({
                type:"POST",
                url: "/SYJ_Mall/userSignUpPwCheck.action" ,
                data : {"checkpw" : pw},
                datatype : "json",
                success : function(result) {

                	
                    if (result == 0) {// 비밀번호가 안전한 경우
                    	common('pwerrmsg','#08A600','안전한 비밀번호네요 ^^');
                    } 	else if (result == -1) {
                    	common('pwerrmsg','red','공백은 들어갈 수 없어요');
                    	pwFlag = false;
                    	return false;
                    }  	else if (result == -4) {
                    	common('pwerrmsg','red','동일한 문자 3개 이상쓰는건 지양해주세요.');
                    	pwFlag = false;
                    	return false;
                    }	else if (result == -5) {
                    	common('pwerrmsg','red','연속된 숫자는 금지해주세요.');
                    	pwFlag = false;
                    	return false;
                    }	else {
                    	common('pwerrmsg','red','8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.');
                    	pwFlag = false;
                    	return false;
                    }
                },
                error: function(a,b,c) {
					//console.log(a,b,c);
				}
            });
            
            pwFlag = true;
            return true;
            
        });       
        
        
        
        
        //3. 비밀번호 체크
        var pwCheckFlag = false;//비밀번호 체크를 통과할지 결정해주는 변수
        $("#pw_input_check").blur(function(){
        	
        	pwCheckFlag = false;//초기화
        	
        	var checkPw = this.value;//재확인할 비밀번호
        	
        	if (pwInstance == "") {
        		common('pwerrmsg2','red','비밀번호를 확인해주세요.');
        		return false;
        	}
        	
        	if (checkPw != "" && checkPw != pwInstance) {
        		common('pwerrmsg2','red','비밀번호가 일치하지 않습니다.');
        		return false;
        	}
        	
        	commondel('pwerrmsg2');
    		//pwInstance = '0';//비밀번호 체크값 초기화 -> 제풀할떄 해야함
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
        
        //4. 이름 체크
        var nameFlag = false;
        $("#name_input").blur(function(){
            
            nameFlag = false;//초기화

            var name = this.value;//이름
            var nonchar = /[^가-힣a-zA-Z]/gi;//이름에 해당되는 정규식
            var number = /[0-9]/gi;//숫자 제외해줄것

            if (name == "") {
                common('nmerrmsg','red','필수입력 항목입니다.');
                return false;
            }
            if (name != "" && number.test(name)) {
                common('nmerrmsg','red','이름에 숫자는 사용할 수 없습니다.');
                return false;
            }
            if (name != "" && nonchar.test(name)) {
                common('nmerrmsg','red','한글과 영문 대 소문자를 사용하세요.(특수기호,공백 사용 불가)');
                return false;
            }
            if(name.length > 60) {
                common('nmerrmsg','red','너무 긴 이름입니다.');
                return false;
            }

            nameFlag = true;
            commondel('nmerrmsg');

        });
        
        //5.성별선택
        var genderFlag = false;
        $("#gender_selected").blur(function(){
            genderFlag = false;//초기화

            var genderValue = this.value;
            
            if (genderValue == "") {
                common('gendererrmsg','red','성별을 선택해주세요.');
                return false;
            }
			
            commondel('gendererrmsg');
            genderFlag = true;
        });
        
        //6. 거주국가 선택
        var nationFlag = false;
        $("#nation_selected").blur(function(){
        	nationFlag = false;//초기화
			
            var nationValue = this.value;
            
            if (nationValue == "") {
                common('nationerrmsg','red','거주국가를 선택해주세요.');
                return false;
            }
			
            commondel('nationerrmsg');
            nationFlag = true;
        });
        
        
        //7. 생년월일 선택
        var birthFlag = false;
        //생년월일 - 년도 선택
        $("#birth_yy").blur(function(){
        	birthFlag = false;
			if (checkBirthday()) {
				birthFlag = true;
			}
        });
        
        //생년월일 - 월 선택
        $("#birth_mm").blur(function(){
        	birthFlag = false;
			if (checkBirthday()) {
				birthFlag = true;
			}
        });
        
        //생년월일 - 일 선택
        $("#birth_dd").blur(function(){
        	birthFlag = false;
			if (checkBirthday()) {
				birthFlag = true;
			}
        });
        
        
        //생년월일을 체크를 위한 함수 정의
        function checkBirthday() {
        	var birthday;
        	var yy = $("#birth_yy").val();
        	var mm = $("#birth_mm").val();
        	var dd = $("#birth_dd").val();
        	
        	var oyy = yy + "";//자꾸 yy가 false 로 나오는 오류때문에 지정해준 새로운 변수

        	
        	
            if (mm.length == 1) {
                mm = "0" + mm;
            }
            if (dd.length == 1) {
                dd = "0" + dd;
            } 
        	
        	if (yy == "" && mm == "" && dd == "") {

        		common('birtherrmsg','red','태어난 년도 4자리를 정확하게 입력하세요.');
        		return false;
        	}
        	
        	if(yy = "" || yy.length != 4) {
        		common('birtherrmsg','red','태어난 년도 4자리를 정확하게 입력하세요.');
       		 	return false;
        	}
        	
            if(mm == "") {
            	common('birtherrmsg','red','태어난 월을 선택하세요.');
                return false;
            }
            
            if(dd == "" || dd.length != 2) {
            	common('birtherrmsg','red','태어난 일(날짜) 2자리를 정확하게 입력하세요.');
                return false;
            }
            
             
            birthday = oyy +"-"+ mm +"-"+ dd;
        	
            
           	if(!isValidDate(birthday)) {
            	common('birtherrmsg','red','생년월일을 다시 확인해주세요.');
                return false;
            }
            
            var age = calcAge(birthday);
            
            
            if (age < 0) {
            	common('birtherrmsg','red','미래에서 오셨군요. ^^');
            	return false;
            } else if (age >= 100) {
            	common('birtherrmsg','red','정말이세요?');
            	return false;
            } else {
            	commondel('birtherrmsg');
            	return true;
            }   
        }
        
        
        
        //윤년체크
 		function isValidDate(param) {
	        try {
	            param = param.replace(/-/g, '');
	            // 자리수가 맞지않을때
	            if (isNaN(param) || param.length != 8) {
	                return false;
	            }
	
	            var year = Number(param.substring(0, 4));
	            var month = Number(param.substring(4, 6));
	            var day = Number(param.substring(6, 8));
	            if (month < 1 || month > 12) {
	                return false;
	            }
	
	            var maxDaysInMonth = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
	            var maxDay = maxDaysInMonth[month - 1];
	
	            // 윤년 체크
	            if (month == 2 && (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)) {
	                maxDay = 29;
	            }
	
	            if (day <= 0 || day > maxDay) {
	                return false;
	            }        
	            
	            return true;
	
	        } catch (err) {
	            return false;
	        };
    	}
        
     	//나이 체크
     	function calcAge(birth) {
     		
	        var date = new Date();
	        var year = date.getFullYear();
	        var month = (date.getMonth() + 1);
	        var day = date.getDate();
	        if (month < 10)
	            month = '0' + month;
	        if (day < 10)
	            day = '0' + day;
	        var monthDay = month + '' + day;
	
	        birth = birth.replace('-', '').replace('-', '');
	        var birthdayy = birth.substr(0, 4);
	        var birthdaymd = birth.substr(4, 4);
	
	        var age = monthDay < birthdaymd ? year - birthdayy - 1 : year - birthdayy;
	        return age;
    	}
     
        
        //8. 이메일주소 선택
        var emailchFlag = false;
        $("#email_id").blur(function(){
        	emailchFlag = false;
        	if(checkEmail()) {
        		emailchFlag = true;
        	};
        });

        $("#email_site").blur(function(){
        	emailchFlag = false;
        	if(checkEmail()) {
        		emailchFlag = true;
        	};
        });
        
        $("#email_site_seleted").blur(function(){
        	emailchFlag = false;
        	if(checkEmail()) {
        		emailchFlag = true;
        	};
        });
        
        
        //이메일 체크 함수
        function checkEmail() {
        	var id = $("#email_id").val();
        	var email = $("#email_site").val();
        	
        	if (id == "") {
        		common('emailerrmsg','red','아이디를 다시 확인해주세요.');
        		return false;
        	}
        	
        	if (email == "") {
        		common('emailerrmsg','red','이메일 주소를 다시 확인해주세요.');
        		return false;
        	}
        	
        	var isEmail = /([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
            var isHan = /[ㄱ-ㅎ가-힣]/g;
           
            
            if (!isEmail.test(email) || isHan.test(email)) {
            	common('emailerrmsg','red','이메일 주소를 다시 확인해주세요.');
                return false;
            } 
            
            var fullEmail = id + "@" + email;
            
            //이미사용중인 이메일 아이디인지 체크한다.
            $.ajax({
                type:"GET",
                url: "/SYJ_Mall/userEmailVerifyCheck.action" ,
                data : "fullEmail=" + fullEmail,
                datatype : "json",
                success : function(result) {
                    
                    if (result != 1) {// 아이디가 중복되는경우
                    	common('emailerrmsg','red','이미 사용중인 이메일 아이디입니다.');
                      	return false; 	
                    } 
                },
                error: function(a,b,c) {
					console.log(a,b,c);
				}
            });
            
            commondel('emailerrmsg');
            return true;
        }
        
        
        
        //9. 이메일 발송 동의 유무 선택
        var emailFlag = false;
        $("#email_selected").blur(function(){
        	emailFlag = false;//초기화
			
            var emailValue = this.value;
            
            if (emailValue == "") {
                common('email_selected_errmsg','red','필수입력 항목입니다.');
                return false;
            }
			
            commondel('email_selected_errmsg');
            emailFlag = true;
        });        
        
        
        
        //10. 휴대전화 선택
        var phoneFlag = false;
        $("#phone_number_input").blur(function(){
        	phoneFlag = false;
        	
        	if (phoneCheck()) {
        		phoneFlag = true;
        	}
        });
        
        //휴대전화번호 확인
        function phoneCheck() {
        	var phoneVal = $("#phone_number_input").val();
        	
        	phoneVal = phoneVal.replace('-', '').replace('-', '');
        	
        	if(phoneVal == "") {
        		common('phoneerrmsg','red','필수입력 항목입니다.');
        		return false;
        	}
        	
        	if(phoneVal.length != 11) {
        		common('phoneerrmsg','red','휴대전화번호를 확인해주십시오.');
        		return false;
        	}
        	
        	var isCheck = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g
        	
        	if(!isCheck.test(phoneVal)) {
        		return false;
        	}
        	
        	return true;
        }
        
        
        
        
        //11. sms 발송 동의 유무 선택
        var smsFlag = false;
        $("#sms_selected").blur(function(){
        	smsFlag = false;//초기화
			
            var smsValue = this.value;
            
            if (smsValue == "") {
                common('smserrmsg','red','필수입력 항목입니다.');
                return false;
            }
			
            commondel('smserrmsg');
            smsFlag = true;
        });
        
        
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
        
        
        
        
      	//회원가입 버튼 클릭시
      	$("#submit_button").click(function(){
      	    
      		//원래는 더 많은 로직이 필요하다. -> 여기서 모든 항목에 오류가 없는지 검사한다.
      		//console.log("idFlag : " + idFlag);//1. 아이디
      		//console.log("pwFlag  : " + pwFlag );//2. 비밀번호
      		//console.log("pwCheckFlag : " + pwCheckFlag);//3. 비밀번호 체크
      		//console.log("nameFlag : " + pwCheckFlag);//4. 이름체크
      		//console.log("genderFlag : " + genderFlag);//5. 성별선택
      		//console.log("nationFlag : " + nationFlag );//6. 국가 선택
      		//console.log("birthFlag : " + birthFlag );//7. 생년월일
      		//console.log("emailchFlag  : " + emailchFlag);//8. 이메일 주소 선택
      		//console.log("emailFlag   : " + emailFlag );//9. 이메일 발송 선택
      		//console.log("phoneFlag    : " + phoneFlag  );//10. 휴대폰 전화 선택
      		//console.log("smsFlag     : " + smsFlag   );//11. sms 발송선택
      		
      		if (idFlag == true && pwFlag == true && pwCheckFlag == true && nameFlag == true && 
      			genderFlag == true && nationFlag == true && birthFlag == true && emailchFlag == true &&
      			emailFlag == true && phoneFlag == true && smsFlag == true) {
      			
          		var username = document.getElementById("id_input").value;//유저가 작성한 아이디
          	    var password = document.getElementById("pw_input").value;//유저가 작성한 비밀번호
          	    
          	    try {
          	        var rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
          	        var rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
          	        submitEncryptedForm(username,password, rsaPublicKeyModulus, rsaPublicKeyExponent);
          	        
          	    } catch(err) {
          	    	
          	        alert(err);
          	    }
      		} else {//일치하지 않는경우
      			
      			//1.아이디를 잘못 적은 경우
      			if (idFlag == false) {
      				$("#id_input").focus();
      				return false;
      			}
      		
      			//2.비밀번호를 잘못 적은 경우
      			if (pwFlag == false) {
      				$("#pw_input").focus();
      				return false;
      			}
      			
      			//3. 비밀번호 확인을 잘못 적은경우
      			if(pwCheckFlag == false) {
      				$("#pw_input_check").focus();
      				return false;
      			}
      			
      			//4.이름을 잘못 적은 경우
      			if (nameFlag == false) {
      				$("#name_input").focus();
      				return false;
      			}
      			
      			//5.성별 잘못 적은 경우
      			if (genderFlag == false) {
      				$("#gender_selected").focus();
      				return false;
      			}
      			
      			//6.국가 잘못 적은 경우
      			if(nationFlag == false) {
      				$("#nation_selected").focus();
      				return false;
      			}
      			
      			//7.생년월일 잘못 적은 경우
      			if(birthFlag == false) {
      				$("#birth_yy").focus();
      				return false;
      			}
      			
      			//8.이메일 주소 잘못 입력한 경우
      			if(emailchFlag == false) {
      				$("#email_id").focus();
      				return false;
      			}
      			
      			//9.이메일 발송선택 잘못입력한 경우
      			if(emailFlag == false) {
      				$("#email_selected").focus();
      				return false;
      			}
      			
      			//10.휴대전화 잘못 넣은경우
      			if(phoneFlag == false) {
      				$("#phone_number_input").focus();
      				return false;
      			}
      			
      			//11. sms 잘못 넣은 경우
      			if(smsFlag == false) {
      				$("#sms_selected").focus();
      				return false;
      			}
      			
      		}

      	});
        
        
      	//회원가입 버튼 클릭시 -> 데이터를 넘겨주는 부분
      	function submitEncryptedForm(username, password, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
      	    var rsa = new RSAKey();
      	    
      	    rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);

      	    // 사용자ID와 비밀번호를 RSA로 암호화한다.
      	    var securedUsername = rsa.encrypt(username);
      	    var securedPassword = rsa.encrypt(password);

      	    var securedForm = document.getElementById("securedForm");//form 데이터
      	    
      	    securedForm.securedUsername.value = securedUsername;//여기서 암호화된 아이디번호를 넘겨준다.
      	    securedForm.securedPassword.value = securedPassword;//여기서 암호화된 비밀번호를 넘겨준다.
      	    securedForm.submit();//제출
      	}

    
    </script>

</body>
</html>