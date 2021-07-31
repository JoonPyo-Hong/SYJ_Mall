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
<link rel = "stylesheet" href = "resources/css/main/mainLayOutCommon.css">
<link rel = "stylesheet" href = "resources/css/newGoods/newGoodMain.css"> 
</head>
<body>

	<!-- 상단 메인 타일즈 -->
	<tiles:insertAttribute name="header" ignore="false"/>
	
	<!-- 내용 타일즈 -->
	<tiles:insertAttribute name="body" ignore="false"/>
		


	<script>
	
		
		$('#banner_today').click(function(){
			location.href = "/SYJ_Mall/main.action";
		});
		
		$('#banner_new').click(function(){
			location.href = "/SYJ_Mall/newGoodsStart.action";
		});
		
		$('#banner_popular').click(function(){
			location.href = "/SYJ_Mall/popularStart.action";
		});
		
		$('#banner_my').click(function(){
			location.href = "/SYJ_Mall/myStart.action";
		});

	</script>



</body>
</html>


