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
	
	    /* 로그인 이미지 */
        #qoo10login {
            /* border : 1px solid red; */
            margin: 0px auto;
            margin-top: 40px;
            height: 70px;
            width: 140px;
        }
        #qoo10login img {
            width:100%;
            height : 100%;
        }
        /* 전체적인 바디 */
        body {
            /*border : 1px solid red;*/
            height : 740px;
            background-color : #F5F6F7;
        }

        /* 자동로그인 방지를 위한 큰 틀 -> 제목 + 사진들 */
        .standardRule {
            /* border: 1px solid red; */
            margin : 0px auto;
            width : 330px;
        }
        /* 제목을 감싸는 박스 */
        #secSubject {
            /* border: 1px solid red; */
            background-color: #1D6AB3;
            color : white;
        } 
        
        /*보안 테이블 */
        #secTable  {
            /* border: 1px solid blue; */
            height : 300px;
        }
        #secTable td {
            padding : 5px;
            width : 20px;
            height : 30px;
            /* border: 1px solid green; */
        }

        #copyright {
            /* border : 1px solid blue; */
            width : 310px;
            margin: 20px auto;
            font-size: 0.9em;
            text-align: center;
        }

        .images {
            transition: all;
            transition-duration: 200ms;
        }
	
	
</style>

</head>
<body>
	
	<div id = "qoo10login">
        <img src = "resources/images/Qoo10_Logo.png">    
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
        
    	var picName;
    	var clickNum;
    	var answer;
    	var sucessCount = 0;// 애를기준으로 넘어갈지 말지 결정한다.
    
        $(".images").click(function(){
            
            clickNum = event.srcElement.id;
            picName = event.srcElement.style.background;
			console.log(picName)
            
			$.ajax({
				//요청 정보
				type: "POST",
				url: "/SYJ_Mall/userautologinCheck.action",
				
				//전송 데이터
				//data: "num=10"
				//{"picName" : picName}
				data: {"picName" : picName, "clickNum" : clickNum},
				
				//수신 데이터의 형식
				dataType: "json",
				
				//수신 데이터
				success: function(result) {
						
					$("#" + result.clickNum).css({"background":"url(resources/images/securefile/" + result.selectPic +")"})
							  				.css({"background-size":"cover"});
					
					//정답이 포함된 그림 꼭 하나는 들어갈것
					$("#" + result.ansImg_1).css({"background":"url(resources/images/securefile/" + result.ansImg_1_value +")"})
	  				.css({"background-size":"cover"});
					
					//나머지는 아무그림이나 들어갈것
					$("#" + result.ansImg_2).css({"background":"url(resources/images/securefile/" + result.ansImg_2_value +")"})
	  				.css({"background-size":"cover"});
					
					$("#" + result.ansImg_3).css({"background":"url(resources/images/securefile/" + result.ansImg_3_value +")"})
	  				.css({"background-size":"cover"});
					
					
					
					sucessCount = result.sucessCount;
					
					//아래를 만족하면 넘어가준다. -> 여기는 아직 처리되지 않음
					if (sucessCount >= 3) {
						location.href = "login.action";
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