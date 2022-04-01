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
  		원하는 아이디 입력 : 
        <input type="text" id="idgenerate">
        <button id="send_message" type="button" onclick="send();">아이디 생성</button>
        <br/>
        <!-- <button type="button" onclick="javascript:clearText();">대화내용 지우기</button> -->
    </div>
	
	<script type="text/javascript">
	  
		function send() {
			location.href = "/SYJ_Mall/syloveshtext.action?setId=" + $('#idgenerate').val();
		}
	
	</script>
	
	
</body>
</html>