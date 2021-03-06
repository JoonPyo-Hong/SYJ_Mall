<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/mainasset.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0"/>
<title>Insert title here</title>
<link rel = "stylesheet" href = "resources/css/userlogin/userAutoCheck.css">
</head>
<body>
	
	<div id = "qoo10login">
        <img src = "resources/images/kakao.svg">    
    </div>
    	
    <div id = "secSubject" class = "standardRule">
            <span id = "secTitle">${picName}</span><br>이(가) 있는 타일을 모두 선택하세요
    </div>
        
    <table id = "secTable" class = "standardRule">
            <tr>
                <td id = "img1" class = "images" style = "background: url('resources/images/securefile/${picList[0]}'); background-size: cover;"></td>
                <td id = "img2" class = "images" style = "background: url('resources/images/securefile/${picList[1]}'); background-size: cover;"></td>
                <td id = "img3" class = "images" style = "background: url('resources/images/securefile/${picList[2]}'); background-size: cover;"></td>
            </tr>
            <tr>
                <td id = "img4" class = "images" style = "background: url('resources/images/securefile/${picList[3]}'); background-size: cover;"></td>
                <td id = "img5" class = "images" style = "background: url('resources/images/securefile/${picList[4]}'); background-size: cover;"></td>
                <td id = "img6" class = "images" style = "background: url('resources/images/securefile/${picList[5]}'); background-size: cover;"></td>
            </tr>
            <tr>
                <td id = "img7" class = "images" style = "background: url('resources/images/securefile/${picList[6]}'); background-size: cover;"></td>
                <td id = "img8" class = "images" style = "background: url('resources/images/securefile/${picList[7]}'); background-size: cover;"></td>
                <td id = "img9" class = "images" style = "background: url('resources/images/securefile/${picList[8]}'); background-size: cover;"></td>
            </tr>
    </table>
    
    <div id = "copyright">
        Copyright &copy; <span style="font-weight: bold;">Qoo10 Corp.</span> All rights reserved.
    </div>
	
	
	
    <script>
        
    	/* 접속된 디바이스 확인 */	
    	function device_check() {
			// 디바이스 종류 설정
			let pc_device = "win16|win32|win64|mac|macintel";
	
			// 접속한 디바이스 환경
			let this_device = navigator.platform;
	
			if (this_device) {
		
				if (pc_device.indexOf(navigator.platform.toLowerCase()) < 0) {
					//console.log('MOBILE');
					return 1;
				} else {
					//console.log('PC');
					return -1;
				}
			}
		}
    	
    	
        $(".images").click(function(){
            
            let clickNum = event.srcElement.id;
            let picName = event.srcElement.style.background;
			//console.log(picName)
            
			$.ajax({
				//요청 정보
				type: "POST",
				url: "/SYJ_Mall/userautologinCheck.action",
				
				//전송 데이터
				data: {"picName" : picName, "clickNum" : clickNum},
				
				//수신 데이터의 형식
				dataType: "json",
				
				//수신 데이터
				success: function(result) {
					
					if (result == null) location.href = "/SYJ_Mall/totalError.action";
					else {
						$("#" + result.clickNum).css({"background":"url(resources/images/securefile/" + result.selectPic +")"}).css({"background-size":"cover"});

						//정답이 포함된 그림 꼭 하나는 들어갈것
						$("#" + result.ansImg_1).css({"background":"url(resources/images/securefile/" + result.ansImg_1_value +")"}).css({"background-size":"cover"});

						//나머지는 아무그림이나 들어갈것
						$("#" + result.ansImg_2).css({"background":"url(resources/images/securefile/" + result.ansImg_2_value +")"}).css({"background-size":"cover"});

						$("#" + result.ansImg_3).css({"background":"url(resources/images/securefile/" + result.ansImg_3_value +")"})
							.css({"background-size":"cover"});
						
						
						
						let sucessCount = result.sucessCount;
						let failCount = result.failCount;
						
						//실패횟수를 초과한 경우
						if(failCount == 3) {
							location.href = "/SYJ_Mall/userautologinFail.action";
						}
						
						//성공횟수를 충족한 경우
						if (sucessCount == 3) {
							const deviceCode = device_check();
							location.href = "/SYJ_Mall/userautologinPass.action?deviceCode=" + deviceCode;
						}
											}
					
				},
				
				//예외 처리
				error: function(a,b,c) {
					console.log(a,b,c);
				}
				
			});

        });



    </script>
	



</body>
</html>