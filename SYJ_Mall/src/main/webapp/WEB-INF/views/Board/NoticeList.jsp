<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/board_list_inc.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0"/>
<title>NoticeList</title>
<style>
  
    
</style>
</head>
<body>
    <div id="wrap">
    	<div id="board">
    		<div id="top"></div>
    		<c:forEach var="list" items="${list}">
    			${list.seq}
    		</c:forEach>
    	</div>
    </div>
</body>
</html>