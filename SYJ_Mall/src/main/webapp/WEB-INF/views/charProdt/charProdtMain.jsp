<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>카카오 프렌즈샵</title>
<link rel="stylesheet"
	href="resources/css/mainLayout/mainTilesLayout.css">
<link rel="stylesheet" href="resources/css/mainLayout/loginModal2.css">
<link rel="stylesheet"
	href="resources/css/charProdt/product_category_character3.css">
</head>
<body>
	
	<!-- 로그인 모달창 -->
	<div class="overlay-wrap" id="login-product-modal"
		style="visibility: hidden;">
		<div class="login-modal-wrap">
			<div class="modal-close">
				<div class="close-btn"></div>
			</div>
			<img class="login-img"
				src="/SYJ_Mall/resources/images/login_modal/character-3-d-apeach-128-2.png" />
			<div class="login-text">
				<h3>앗! 로그인</h3>
				<p>
					로그인 후 재입고 알림을 신청해주세요<br /> 지금 로그인 화면으로 이동하시겠어요?
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
	
	<!-- 로그인 모달 필요 -->
	<div id="kakao-wrap">
		<div id="kakao-head">
			<div id="inner-head">
				<div class="left-btn">
					<button class="back-button"></button>
					<button class="home-button"></button>
				</div>
				<div class="title">캐릭터</div>
				<div class="right-btn">
					<button class="search"></button>
					<button class="language"></button>
				</div>
			</div>
			<div id="inner-tab">
			</div>
		</div>
		<div id="kakao-content">
			<div class="container-wrap product-category-character" style="margin: 0px auto;">
				<div class="category-banner" style=" background: url(/SYJ_Mall/${charPicUrl}) right 0px /
    cover no-repeat;">
					<span class="category-title">라이언</span> <img class="select-icon"
						src="/SYJ_Mall/resources/images/product_category/ico_category_header_fold.png"
						alt="foldWhite" /> <select>
						<option>전체</option>
						<option>라이언</option>
						<option>어피치</option>
						<option>무지</option>
						<option>프로도</option>
						<option>네오</option>
						<option>튜브</option>
						<option>제이지</option>
						<option>콘</option>
						<option>춘식</option>
						<option>죠르디</option>
						<option>스카피</option>
						<option>앙몬드</option>
						<option>팬다주니어</option>
						<option>케로&amp;베로니</option>
						<option>꿈돌이</option>
					</select>
				</div>
				<!-- 상품 정렬 및 개수 -->
				<div class="category-header">
					<div class="sort">
						<span class="sort-title">신상품 순</span> <img class="sort-icon"
							src="/SYJ_Mall/resources/images/product_category/dropdown_down.png" />
					</div>
					<div class="detail">
						<div class="all-count">
							총 <b>258</b>개
						</div>
						<div class="check-global">
							<img
								src="/SYJ_Mall/resources/images/product_category/ico_checked.png" />
							<span>글로벌 배송 가능상품 보기</span>
						</div>
					</div>
				</div>
			</div>

			<div id="inner-content" style="overflow:scroll;">
				<!-- 상품 -->
				<!-- 카테고리 선택 배너 -->

				<!-- 해당 카테고리 상품 영역 -->
				<div class="category-product-wrap">
					<ul>
						<li class="item-li">
							<div class="thumbnail">
								<!-- 솔드아웃 라벨 -->
								<div class="soldout-label"></div>
							</div>
							<div class="name">
								<div class="nametext">콘센트 정리 트레이_라이언&춘식</div>
								<span class="cart"></span>
							</div>
							<div class="price">39,000원</div>
						</li>
						<li class="item-li">
							<div class="thumbnail"></div>
							<div class="name">
								<div class="nametext">콘센트 정리 트레이_라이언&춘식</div>
								<span class="cart"></span>
							</div>
							<div class="price">39,000원</div>
						</li>
						<li class="item-li">
							<div class="thumbnail"></div>
							<div class="name">
								<div class="nametext">콘센트 정리 트레이_라이언&춘식</div>
								<span class="cart"></span>
							</div>
							<div class="price">39,000원</div>
						</li>
						<li class="item-li">
							<div class="thumbnail"></div>
							<div class="name">
								<div class="nametext">콘센트 정리 트레이_라이언&춘식</div>
								<span class="cart"></span>
							</div>
							<div class="price">39,000원</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
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
	</div>
	
	<script>
	
	/* 검색관련 */
	$('.search').click(function() {
		location.href = "/SYJ_Mall/searchStart.action";
	});

	/* 뒤로가기 관련 */
	$('.back-button').click(function(){
		location.href = "/SYJ_Mall/searchback.action";	
	});	
	
	/* 메인페이지로 보내주기 */
	$('.home-button').click(function(){
		location.href = "/SYJ_Mall/searchbackmain.action";	
	});
	
	
	
	//상품알림 관련 공통 함수
	function search_prod_alarm(prodt_id,prodt_this) {
		$.ajax({
        	type:"GET",
        	url: "/SYJ_Mall/searchItemAlarm.action",
        	data : "productId=" + prodt_id,
        	dataType : "json",
        	success : function(result) {
        		console.log(result);
        		if (result == 1) {
        			$(prodt_this).attr('class','inalarm');
        		} else if (result == 2) {
        			$(prodt_this).attr('class','alarm');
        		} else {
        			$('#login-product-modal').css('visibility','visible');
        		}
        	},
        	error: function(a,b,c) {
				console.log(a,b,c);
		}
       });
	}	
	
	
	/*--------------------필터링 조건---------------------------*/
	
	</script>
	
</body>
</html>