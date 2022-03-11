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
<link rel="stylesheet" href="resources/css/mainLayout/loginModal2.css">

<title>카카오 프렌즈샵</title>
<!-- 신규 스와이퍼 라이브러리 신규 -->
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>


</head>
<body>
	
	
	<!-- 로그인 모달1 -->
	<div class="overlay-wrapper" id="login-product-modal" style="z-index:20;">
		<div class="login-modal-wrap">
			<div class="modal-close">
				<div class="close-btn"></div>
			</div>
			<img class="login-img"
				src="/SYJ_Mall/resources/images/login_modal/character-3-d-apeach-128-2.png" />
			<div class="login-text">
				<h3>앗! 로그인</h3>
				<p>
					로그인 후 재입고 알림을 신청해주세요<br/> 지금 로그인 화면으로 이동하시겠어요?
				</p>
			</div>
			<div class="login-btn">
				<button>
					<span class="login-kakao"></span>
					<p>로그인하기</p>
				</button>
			</div>
		</div>
	</div>
	
	
	<!-- 구매 옵션 팝업창 -->
    <div class="overlay-wrap-up" id="testmodal1" style="visibility: hidden;">
        <div class="option-modal-wrap">
            <div class="select-box">
                <select id="product_buy_cnt">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="17">17</option>
                    <option value="18">18</option>
                    <option value="19">19</option>
                    <option value="20">20</option>
                </select>
            </div>
            <div class="price-text">
            	<c:if test="${prodtInfo.discRate eq 0}">
            		${prodtInfo.prodPrice}원
            	</c:if>
                <c:if test="${prodtInfo.discRate ne 0}">
            		${prodtInfo.dcPrice}원
            	</c:if>
                
            </div>
        </div>
    </div>
    
    
    <!-- 알람 옵션 팝업창 -->
    <div class="overlay-wrap-up" id="testmodal2" style="visibility: hidden;">
        
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
	
	//로그인 모달 열기
	function login_modal_open() {
	    const scrollLocation = window.scrollY;
		$('#login-product-modal').css('top',scrollLocation + 'px');
	    $(document.body).css('overflow', 'hidden');
	}
	
	//로그인 모달 닫기
	function login_modal_close() {
		$('#login-product-modal').css('top','-1400px');
	    $(document.body).css('overflow', 'scroll');
	}
	
	//로그인 모달창 로그인하기
  	$(document).on("click",".login-btn",function(){
  		login_modal_close();
  		location.href = "/SYJ_Mall/login.action";
	});
	
  	//로그인 모달창 돌아가기
	$(document).on("click",".close-btn",function(){
		login_modal_close();
	});
	
	
	
</script>
</body>
</html>