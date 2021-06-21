<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/mainasset.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0"/>
<title>Insert title here</title>
</head>
<body>
	
		<div class = "inputform">
            <input id = "go" type="button" value = "로그인" style = "font-size: 1em; background-color: #FEE500; color:black;">
        </div>
        
	 <script>
	 
		$("#go").click(function(){
			location.href = "/SYJ_Mall/login.action";
		});
	 
	 </script>
	
</body>
</html>