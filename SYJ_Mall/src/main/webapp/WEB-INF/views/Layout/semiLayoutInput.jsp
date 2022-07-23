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


<style>

/* 모달 작업 */
.overlay-wrapper {
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1;
  position: absolute;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.7);
  top : -1400px;
}

/* 정렬 모달창 */
.error-modal-wrap {
  position: absolute;
  background-color: rgb(255, 255, 255);
  box-sizing: border-box;
  display: flex;
  flex-wrap: wrap;
  flex-direction: column;
  align-items: center;
  bottom: 50%;
  margin-bottom: -175.5px;
  width: 310px;
  /* height: 350px; */
  border-radius: 16px;
}

.error-modal-wrap .modal-close {
  width: 100%;
  display: flex;
  justify-content: flex-end;
}

.error-modal-wrap .modal-close .close-btn {
  width: 24px;
  height: 24px;
  background: url(/SYJ_Mall/resources/images/login_modal/close-24.png) no-repeat;
  background-size: contain;
  margin-right: 15px;
  margin-top: 15px;
  cursor: pointer;
}

.error-modal-wrap .error-img {
  margin-bottom: 6px;
  width: 128px;
  height: 128px;
}

.error-modal-wrap .error-text {
  font-weight: bold;
  font-size: 18px;
  text-align: center;
}

.error-modal-wrap .error-text p {
  font-weight: normal;
  font-size: 16px;
  text-align: center;
  padding: 0px 10px 20px;
}

.error-modal-wrap .return-btn {
  margin-bottom: 40px;
}

.error-modal-wrap .return-btn button {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 220px;
  min-height: 48px;
  border-radius: 35px;
  text-align: center;
  background-color: rgb(255, 235, 0);
}

.error-modal-wrap .return-btn button p {
  font-weight: bold;
  font-size: 15px;
  letter-spacing: -0.25px;
  margin-left: 5px;
}


</style>


</head>
<body>
	
	
	<!-- 체크 모달1 -->
	<div class="overlay-wrapper" id="error_modal_check" style="z-index:20;">
		<div class="error-modal-wrap">
			<div class="modal-close">
				<div class="close-btn" onclick="user_input_error_response_close()"></div>
			</div>
			<img class="error-img" src="/SYJ_Mall/resources/images/login_modal/character-3-d-apeach-128-2.png" />
			<div class="error-text">

			</div>
			<div class="return-btn">
				<button onclick="user_input_error_response_close()">
					<p>돌아가기</p>
				</button>
			</div>
		</div>
	</div>
	
	
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