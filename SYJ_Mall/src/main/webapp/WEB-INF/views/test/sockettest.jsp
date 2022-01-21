<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>카카오 프렌즈샵</title>
<script src="https://cdn.jsdelivr.net/sockjs/latest/sockjs.min.js"></script>

</head>
<body>

	<div>asdasd</div>

<script>
	
	
var ws = new WebSocket("wss:/echo.do");

console.log(ws);
	
	
	
	//var socket = null;
	
	//connectWS();
/* 	$(document).ready(function(){
    	if(!isEmpty($("#session_id").val()))
        	    connectWS();
	});
    $(".chat_start_main").click(function(){
        $(this).css("display","none");
        $(".chat_main").css("display","inline");
    })
    $(".chat_main .modal-header").click(function(){
        $(".chat_start_main").css("display","inline");
        $(".chat_main").css("display","none");
    });
  */
    
    
    
   /*  function connectWS(){
        var sock = new SockJS("/echo/");
        socket = sock;
        sock.onopen = function() {
               console.log('info: connection opened.');
        };
        sock.onmessage = function(e){
//             console.log(e);
//             var strArray = e.data.split(":");
//             if(e.data.indexof(":") > -1){
//                 $(".chat_start_main").text(strArray[0]+"님이 메세지를 보냈습니다.");
//             }
//             else{
//             }
            //$("#chat").append(e.data + "<br/>");
        }
        sock.onclose = function(){
            $("#chat").append("연결 종료");
//              setTimeout(function(){conntectWs();} , 10000); 
        }
        sock.onerror = function (err) {console.log('Errors : ' , err);};
 
        $("#chatForm").submit(function(event){
            event.preventDefault();
                sock.send($("#message").val());
                $("#message").val('').focus();    
        });
    } */
	
	//var ws = new WebSocket("ws://localhost:9089/echo");
	
	//console.log(ws);

	
	/* ws.onopen = frunction() {
		console.log('Info : connection opened');
		setTimeout(function(){connect();},1000);
	}
	
	ws.onmessage = function(event) {
		console.log(event.data + '\n');
	}
	
	ws.onclose = function(event) {console.log('connection closed');};
	ws.onerror = function(event) {console.log('connection closed');};  */
	
</script>
</body>
</html>
