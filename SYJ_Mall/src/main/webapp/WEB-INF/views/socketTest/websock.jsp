<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>카카오 프렌즈샵</title>
</head>
<body>
 	

 	<div>
        <button type="button" onclick="openSocket();">대화방 참여</button>
        <br/>
        <br/>
        <button type="button" onclick="closeSocket();">대회방 나가기</button>
    	<br/><br/><br/>
  		메세지 입력 : 
        <input type="text" id="sender" value="${id}" style="display: none;">
        <input type="text" id="messageinput">
        <button id="send_message" type="button" onclick="send();">메세지 전송</button>
        <br/>
        <!-- <button type="button" onclick="javascript:clearText();">대화내용 지우기</button> -->
    </div>

	<!-- Server responses get written here -->
    <div id="messages"></div>
	
	<script type="text/javascript">
	  var ws;
      var messages = document.getElementById("messages");
      
      function openSocket(){
          if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
              writeResponse("WebSocket is already opened.");
              return;
          }
          //웹소켓 객체 만드는 코드
          ws = new WebSocket("ws://byeanma.kro.kr:9089/SYJ_Mall/echo.action");
          
          ws.onopen = function(event){
             //console.log("??" + event.data);
        	  
        	  if(event.data === undefined){
            		return;
              }
              
              //console.log(event.data);
              
              writeResponse(event.data);
          };
          
          ws.onmessage = function(event){
              console.log('writeResponse');
              console.log(event.data)
              writeResponse(event.data);
          };
          
          ws.onclose = function(event){
              writeResponse("대화 종료");
          }
          
      }
      
      $("#messageinput").keydown(function(key){
    	 if (key.keyCode == 13) {
    		 send();
    	 } 
      });
      
      function send(){
          var text = document.getElementById("messageinput").value+","+document.getElementById("sender").value;
          ws.send(text);
          text = "";
          $('#messageinput').val('');
      }
      
      function closeSocket(){
          ws.close();
      }
      
      function writeResponse(text){
          messages.innerHTML += "<br/>"+text;
      }
      
      function clearText(){
          console.log(messages.parentNode);
          messages.parentNode.removeChild(messages)
    	}
	
	</script>
	
	
</body>
</html>