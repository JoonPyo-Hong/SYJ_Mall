<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/main.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="icon" href="resources/images/main/kakao_ryan.ico">
<script> <%@ include file ="/resources/js/main/main.js"%></script>
<title>Main</title>

</head>
<body>

	<div id="wrap">
		<div id="head">
			<div>
				<img src="resources/images/main/ic_menu_2x.png"></img>
			</div>
			<div>
				<img src="resources/images/main/new-logo-mo.png"></img>
			</div>
			<div>
				<img src="resources/images/main/ic_search_2x.png"></img>
			</div>
			<div>
				<img src="resources/images/main/language-global-18-black@2x.png"></img>
			</div>
		</div>
		<div id="tab">
			<div class="tab_selected">오늘</div>
			<div>신규</div>
			<div>인기</div>
			<div>마이</div>
		</div>
		<div class="scroll">
			
		</div>
	</div>
</body>

</html>
