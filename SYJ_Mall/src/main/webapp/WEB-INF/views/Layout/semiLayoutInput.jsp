<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="stylesheet" href="resources/css/mainLayout/mainTilesLayout.css">
<link rel="stylesheet" href="resources/css/mainLayout/searchTest.css">
<link rel="stylesheet" href="resources/css/commoncss/sortModalWrap4.css">
<link rel="stylesheet" href="resources/css/semitiles/semiLoginModal.css">
<link rel="stylesheet" href="resources/css/semitiles/semiSeen.css">
<link rel="stylesheet" href="resources/css/semitiles/semiTilesResult.css">
<link rel="stylesheet" href="resources/css/newProduct/product_category.css">


<title>카카오 프렌즈샵</title>
<!-- 스와이프 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Sly/1.6.1/sly.min.js"></script>

</head>
<body>


	<div id="kakao-wrap">
		<div id="kakao-head" style="position: fixed; z-index: 10; background-color: #FFFFFF;">
			<div id="inner-head" style="border-bottom: 1px solid #E3E5E8;">
				<div class="left-btn">
					<button class="back-button"></button>
					<button class="home-button"></button>
				</div>
				<div class="title">${topInputWord}</div>
				<div class="right-btn">
					<button class="search"></button>
					<button class="language"></button>
				</div>
			</div>
		</div>
		<div id="kakao-content">
			<div id="inner-content">
				<!-- 여기에 타일즈 내용이 들어가야함 -->
				<tiles:insertAttribute name="body" ignore="false"/>
			</div>
		</div>
	</div>
	<c:if test="${not empty geustOrderInquiry}">
		<div id="kakao-footer">
			<div id="inner-footer">
				<div class="info-service">
					<ul>
						<li>제휴문의</li>
						<span class="footer-divider"></span>
						<li>고객문의</li>
						<span class="footer-divider"></span>
						<li>이용약관</li>
						<span class="footer-divider"></span>
						<li>개인정보처리방침</li>
						<span class="footer-divider"></span>
						<li>지식재산권보호센터</li>
					</ul>
				</div>
				<div class="logo">
					<div class="toggler">
						<span class="toggler-logo"></span> <span class="toggler-icon"></span>
					</div>
					<div class="best-family"></div>
				</div>
			</div>
		</div>
	</c:if>
	
<script>
	/* 검색관련 */
	$('.search').click(function() {
		location.href = "/SYJ_Mall/searchStart.action";
	});

	/* 뒤로가기 관련 */
	$('.back-button').click(function() {
		window.history.go(-1);
	});

	/* 메인페이지로 보내주기 */
	$('.home-button').click(function() {
		location.href = "/SYJ_Mall/searchbackmain.action";
	});

	/* 로그인 */
	$('.login-btn').click(function() {
		location.href = "/SYJ_Mall/login.action";
	});
</script>
</body>
</html>