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
<link rel="stylesheet" href="resources/css/commoncss/sortModalWrap4.css">

<title>카카오 프렌즈샵</title>
<!-- 신규 스와이퍼 라이브러리 신규 -->
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>


</head>
<body>
	
	
	<!-- 구매 옵션 팝업창 -->
    <div class="overlay-wrap" id="testmodal1" style="visibility: hidden;">
        <div class="option-modal-wrap">
            <div class="select-box">
                <select>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                </select>
            </div>
            <div class="price-text">
                13,000원
            </div>
        </div>
    </div>
	

	<div id="kakao-wrap">
		<div id="kakao-head" style="position: fixed; z-index: 10; background-color: #FFFFFF;">
			<div id="inner-head">
				<div class="left-btn">
					<button class="back-button"></button>
					<button class="home-button"></button>
				</div>
				<div class="title">제품상세</div>
				<div class="right-btn">
					<button class="search"></button>
					<button class="language"></button>
				</div>
			</div>
		</div>
		<div id="kakao-content" style="overflow: scroll;">
			<div id="inner-content">
				<!-- 여기에 타일즈 내용이 들어가야함 -->
				<tiles:insertAttribute name="body" ignore="false"/>
			</div>
		</div>
	</div>

	

	
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