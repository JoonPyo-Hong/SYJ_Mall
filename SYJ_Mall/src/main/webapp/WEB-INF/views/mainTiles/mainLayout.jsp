<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/mainasset.jsp" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=375, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0"/>
<title>Insert title here</title>
<link rel = "stylesheet" href = "resources/css/main/mainLayout.css">
</head>
<body>

	<!-- 상단 메인 타일즈 -->
	<tiles:insertAttribute name="header" ignore="false"/>
	
	<!-- 내용 타일즈 -->
	<tiles:insertAttribute name="body" ignore="false"/>
	

</body>
</html>