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

<title>카카오 프렌즈샵</title>
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
	<div class="overlay-wrap" id="sort-modal"
		style="visibility: hidden; z-index: 20;">
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
	<!-- 캐릭터 모달창 -->
	<div class="overlay-wrap" id="charac-modal" style="visibility: hidden; z-index: 20;">
		<div class="character-modal-wrap">
			<div class="character-list all" id="0">
				<div class="character-image"></div>
				<div class="character-text">전체</div>
			</div>
			<div class="character-list ryan" id="1">
				<div class="character-image"></div>
				<div class="character-text">라이언</div>
			</div>
			<div class="character-list apeach" id="2">
				<div class="character-image"></div>
				<div class="character-text">어피치</div>
			</div>
			<div class="character-list muzi" id="3">
				<div class="character-image"></div>
				<div class="character-text">무지</div>
			</div>
			<div class="character-list frodo" id="4">
				<div class="character-image"></div>
				<div class="character-text">프로도</div>
			</div>
			<div class="character-list neo" id="5">
				<div class="character-image"></div>
				<div class="character-text">네오</div>
			</div>
			<div class="character-list tube" id="6">
				<div class="character-image"></div>
				<div class="character-text">튜브</div>
			</div>
			<div class="character-list jay" id="7">
				<div class="character-image"></div>
				<div class="character-text">제이지</div>
			</div>
			<div class="character-list con" id="8">
				<div class="character-image"></div>
				<div class="character-text">콘</div>
			</div>
			<div class="character-list choonsic" id="9">
				<div class="character-image"></div>
				<div class="character-text">춘식</div>
			</div>
			<div class="character-list jordy" id="10">
				<div class="character-image"></div>
				<div class="character-text">죠르디</div>
			</div>
			<div class="character-list scappy" id="11">
				<div class="character-image"></div>
				<div class="character-text">스카피</div>
			</div>
			<div class="character-list angmond" id="12">
				<div class="character-image"></div>
				<div class="character-text">앙몬드</div>
			</div>
			<div class="character-list pendaJr" id="13">
				<div class="character-image"></div>
				<div class="character-text">팬다주니어</div>
			</div>
			<div class="character-list kereberony" id="14">
				<div class="character-image"></div>
				<div class="character-text">케로&베로니</div>
			</div>
			<div class="character-list kumdori" id="15">
				<div class="character-image"></div>
				<div class="character-text">꿈돌이</div>
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
				<div class="title">검색</div>
				<div class="right-btn">
					<button class="search"></button>
					<button class="language"></button>
				</div>
			</div>
			<div id="inner-tab">
				<!-- 상품 정렬 및 개수 -->
				<div class="search-header">
					<div class="sort-wrap">
						<div class="sort">
							<span class="sort-title" id="char-sort-name">캐릭터 전체</span> <img
								class="sort-icon"
								src="/SYJ_Mall/resources/images/product_category/dropdown_down.png" />
						</div>
						<div class="sort-divider"></div>
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
					</div>
					<div class="detail">
						<div class="all-count">
							총 <b>${searchProdCount}</b>개
						</div>
						<div class="check-global">
							<img
								src="/SYJ_Mall/resources/images/product_category/ico_checked.png" />
							<span>글로벌 배송 가능상품 보기</span>
						</div>
					</div>
				</div>
			</div>

		</div>
		<div id="kakao-content" style="overflow: scroll;">
			<div style="height: 230px;"></div>
			<div id="inner-content">
				<!-- 여기에 타일즈 내용이 들어가야함 -->
				<tiles:insertAttribute name="body" ignore="false"/>
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
		let filter_option = ${sortedOption};//정렬필터링 옵션
		let sortedCharOption = ${sortedCharOption};//캐릭터 필터링 옵션
	
		/* 검색관련 */	
		$('.search').click(function() {
			location.href = "/SYJ_Mall/searchStart.action";
		});
	
		/* 뒤로가기 관련 */
		$('.back-button').click(function(){
			window.history.go(-1);
		});	
			
		/* 메인페이지로 보내주기 */
		$('.home-button').click(function(){
			location.href = "/SYJ_Mall/searchbackmain.action";	
		});
		
		//로그인 모달창 로그인하기
		$(document).on("click",".login-btn",function(){
			$('#login-product-modal').css('visibility','hidden');
			location.href = "/SYJ_Mall/login.action";
		}); 
		
		//로그인 모달창 돌아가기
		$(document).on("click",".close-btn",function(){
			$('#login-product-modal').css('visibility','hidden');
		}); 
	
	</script>
	
</body>
</html>