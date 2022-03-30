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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>
<body>
	
	<button id="sock_test">소켓 테스트</button>



<script>
	var socket = null;
	connect();
	
	
	function connect() {
		let sock = new SockJS("<c:url value="/echo-ws"/>");
		socket = sock;
		
		sock.onopen = function() {
	           console.log('info: connection opened.');}
		
		sock.onclose = function() {
	      	console.log('connect close');
	      	/* setTimeout(function(){conntectWs();} , 1000); */
	    };
		
	}
	
	
	$("#sock_test").click(function(){
		socket.onclose();
	});
	

</script>
	
	
</body>
</html>