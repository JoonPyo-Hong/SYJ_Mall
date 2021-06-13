<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/board_list_inc.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0" />
<title>NoticeList</title>
<style>
</style>
</head>
<body>
	<div id="wrap">

		<div id="top"></div>
		<div id="middle">
			<c:forEach var="list" items="${list}">
   				<div id="title">
   					<span>${list.title}</span>
   					<span>▽</span>
  				</div>
   				<div id="date">
   					<fmt:parseDate var="parsedDate" pattern="yyyy-MM-dd" value="${list.reg_dt}"/>
   					${list.reg_dt}
				</div>
    		</c:forEach>
		</div>	
	</div>
</body>
<script type="text/javascript">
	
	
</script>
</html>