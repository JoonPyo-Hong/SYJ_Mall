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
<link rel="stylesheet" href="resources/css/commoncss/sortModalWrap3.css">
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
	<!-- 정렬 모달창 -->
	<div class="overlay-wrap" id="sort-modal" style="visibility: hidden;">
		<div class="sort-modal-wrap">
			<div class="sort-list" id="buy-sort">
				<div class="sort-text">판매량순</div>
				<c:if test="${sortedOption eq 1}">
					<img
						src="/SYJ_Mall/resources/images/product_search_result/check.png">
				</c:if>
			</div>
			<div class="sort-list" id="new-sort">
				<div class="sort-text">신상품순</div>
				<c:if test="${sortedOption eq 2}">
					<img
						src="/SYJ_Mall/resources/images/product_search_result/check.png">
				</c:if>
			</div>
			<div class="sort-list" id="low-price-sort">
				<div class="sort-text">낮은 가격순</div>
				<c:if test="${sortedOption eq 3}">
					<img
						src="/SYJ_Mall/resources/images/product_search_result/check.png">
				</c:if>
			</div>
			<div class="sort-list" id="high-price-sort">
				<div class="sort-text">높은가격순</div>
				<c:if test="${sortedOption eq 4}">
					<img
						src="/SYJ_Mall/resources/images/product_search_result/check.png">
				</c:if>
			</div>
		</div>
	</div>

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
			<div id="inner-tab"></div>
		</div>
		<div id="kakao-content">
			<div class="container-wrap product-category-character"
				style="margin: 0px auto;">
				<div class="category-banner"
					style=" background: url(/SYJ_Mall/${charHeadPicUrl}) right 0px /
    cover no-repeat;">
					<span class="category-title">${charHeadName}</span> <img
						class="select-icon"
						src="/SYJ_Mall/resources/images/product_category/ico_category_header_fold.png"
						alt="foldWhite" /> <select id="select_char">
						<option value="0">-------------캐릭터 선택-------------</option>
						<option value="1">라이언</option>
						<option value="2">어피치</option>
						<option value="3">무지</option>
						<option value="4">프로도</option>
						<option value="5">네오</option>
						<option value="6">튜브</option>
						<option value="7">제이지</option>
						<option value="8">콘</option>
						<option value="9">춘식</option>
						<option value="10">죠르디</option>
						<option value="11">스카피</option>
						<option value="12">앙몬드</option>
						<option value="13">팬다주니어</option>
						<option value="14">케로&amp;베로니</option>
						<option value="15">꿈돌이</option>
					</select>
				</div>
				<!-- 상품 정렬 및 개수 -->
				<div class="category-header">
					<div class="sort">
						<c:if test="${sortedOption eq 1}">
							<span class="sort-title" id="content-sort-name">판매량순</span>
							<img class="sort-icon"
								src="/SYJ_Mall/resources/images/product_category/dropdown_down.png" />
						</c:if>
						<c:if test="${sortedOption eq 2}">
							<span class="sort-title" id="content-sort-name">신상품순</span>
							<img class="sort-icon"
								src="/SYJ_Mall/resources/images/product_category/dropdown_down.png" />
						</c:if>
						<c:if test="${sortedOption eq 3}">
							<span class="sort-title" id="content-sort-name">낮은 가격순</span>
							<img class="sort-icon"
								src="/SYJ_Mall/resources/images/product_category/dropdown_down.png" />
						</c:if>
						<c:if test="${sortedOption eq 4}">
							<span class="sort-title" id="content-sort-name">높은 가격순</span>
							<img class="sort-icon"
								src="/SYJ_Mall/resources/images/product_category/dropdown_down.png" />
						</c:if>
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

			<div id="inner-content" style="overflow: scroll;">
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
	
	/* 상위 캐릭터 변경  */
	$('#select_char').change(function(){
		const char_num = $(this).val();//캐릭터 번호
		location.href = "/SYJ_Mall/charAtProdtStart.action?charSeq=" + char_num;
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
	$('.sort-title').click(function() {
			$('#sort-modal').css('visibility', 'visible');
			$('.sort-modal-wrap').css('bottom', '0');
			$(document.body).css('overflow', 'hidden');
	});
	
	$('#buy-sort').click(function () {
		<c:if test="${empty productSeq}">
			location.href = "/SYJ_Mall/searchresult.action?inputName=${userinputName}&sortedOption=1";
		</c:if>
		<c:if test="${not empty productSeq}">
			location.href = "/SYJ_Mall/searchresult.action?productSeq=${productSeq}&sortedOption=1";
		</c:if>
	    //const productSeq = ${productSeq};
		
		//if (productSeq != null) location.href = "/SYJ_Mall/searchresult.action?productSeq=${productSeq}&sortedOption=1";
		//else location.href = "/SYJ_Mall/searchresult.action?inputName=${userinputName}&sortedOption=1";
	});
	
	$('#new-sort').click(function () {
		<c:if test="${empty productSeq}">
			location.href = "/SYJ_Mall/searchresult.action?inputName=${userinputName}&sortedOption=2";
		</c:if>
		<c:if test="${not empty productSeq}">
			location.href = "/SYJ_Mall/searchresult.action?productSeq=${productSeq}&sortedOption=2";
		</c:if>
		
		//const productSeq = ${productSeq};
		
		//if (productSeq != null) location.href = "/SYJ_Mall/searchresult.action?productSeq=${productSeq}&sortedOption=2";
		//else location.href = "/SYJ_Mall/searchresult.action?inputName=${userinputName}&sortedOption=2";
	});

	$('#low-price-sort').click(function () {
		<c:if test="${empty productSeq}">
			location.href = "/SYJ_Mall/searchresult.action?inputName=${userinputName}&sortedOption=3";
		</c:if>
		<c:if test="${not empty productSeq}">
			location.href = "/SYJ_Mall/searchresult.action?productSeq=${productSeq}&sortedOption=3";
		</c:if>
		
		//const productSeq = ${productSeq};
		
		//if (productSeq != null) location.href = "/SYJ_Mall/searchresult.action?productSeq=${productSeq}&sortedOption=3";
		//else location.href = "/SYJ_Mall/searchresult.action?inputName=${userinputName}&sortedOption=3";
	});
	    
	$('#high-price-sort').click(function () {
		<c:if test="${empty productSeq}">
			location.href = "/SYJ_Mall/searchresult.action?inputName=${userinputName}&sortedOption=4";
		</c:if>
		<c:if test="${not empty productSeq}">
			location.href = "/SYJ_Mall/searchresult.action?productSeq=${productSeq}&sortedOption=4";
		</c:if>
		
		//const productSeq = ${productSeq};
		
		//if (productSeq != null) location.href = "/SYJ_Mall/searchresult.action?productSeq=${productSeq}&sortedOption=4";
		//else location.href = "/SYJ_Mall/searchresult.action?inputName=${userinputName}&sortedOption=4";
	});
	
	
	
	
	//모달 제거하는 용도
    $('.overlay-wrap').click(function () {
      $('.overlay-wrap').css('visibility', 'hidden');
      $('.sort-modal-wrap').css('bottom', '-200px');
      //$('.character-modal-wrap').css('bottom', '-400px');
      $(document.body).css('overflow','visible');
    });
	
	
	
	</script>

</body>
</html>