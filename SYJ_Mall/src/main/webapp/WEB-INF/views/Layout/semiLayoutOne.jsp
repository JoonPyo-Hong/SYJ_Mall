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
	<div class="overlay-wrap" id="sort-modal" style="visibility: hidden; z-index: 20;">
		<div class="sort-modal-wrap">
			<div class="sort-list" id="buy-sort">
				<div class="sort-text">판매량순</div>
				<c:if test="${sortedOption eq 1}">
					<img src="/SYJ_Mall/resources/images/product_search_result/check.png">
				</c:if>
			</div>
			<div class="sort-list" id="new-sort">
				<div class="sort-text">신상품순</div>
				<c:if test="${sortedOption eq 2}">
					<img src="/SYJ_Mall/resources/images/product_search_result/check.png">
				</c:if>
			</div>
			<div class="sort-list" id="low-price-sort">
				<div class="sort-text">낮은 가격순</div>
				<c:if test="${sortedOption eq 3}">
					<img src="/SYJ_Mall/resources/images/product_search_result/check.png">
				</c:if>
			</div>
			<div class="sort-list" id="high-price-sort">
				<div class="sort-text">높은가격순</div>
				<c:if test="${sortedOption eq 4}">
					<img src="/SYJ_Mall/resources/images/product_search_result/check.png">
				</c:if>
			</div>
		</div>
	</div>


	<div id="kakao-wrap">
		<div id="kakao-head"
			style="position: fixed; z-index: 10; background-color: #FFFFFF;">
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
				<div class="product-category" style="margin: 0px auto">
					<!-- 카테고리 선택 배너 -->
					<div class="category-banner" style="background: url(/SYJ_Mall/${selectBcDto.catRepImg}) right 0px / cover no-repeat;">
						
						<span class="category-title">${selectBcDto.bigCatNm}</span> 
						<img class="select-icon" src="/SYJ_Mall/resources/images/product_category/ico_category_header_fold.png" alt="foldWhite" />
						
							<select style="height: 100%;" id="big_category_select">
								<!-- <option>---------------카테고리 선택---------------</option> -->
								<c:forEach var="thsjt" items="${themeSubjectList}"> 
									<c:if test="${thsjt.selected eq 'Y'}">
										<option selected value="${thsjt.categoryCode}">${thsjt.bigCatNm}</option>
									</c:if>
									<c:if test="${thsjt.selected eq 'N'}">
										<option value="${thsjt.categoryCode}">${thsjt.bigCatNm}</option>
									</c:if>
								</c:forEach>
							</select>
					</div>
					<!-- 상품 정렬 및 개수 이쪽도 바꿔줘야한다.-->
					<div class="category-header">
						<div class="sort">
							<span class="sort-title">
							<c:forEach var="prodtCat" items="${prodtCategory}">
								<c:if test="${prodtCatgr eq prodtCat.categoryNum}">
									${prodtCat.categoryNm}
								</c:if>
							</c:forEach>
							</span> <img class="sort-icon" src="/SYJ_Mall/resources/images/product_category/dropdown_down.png" />
						</div>
						<div class="category-tab">
							<div class="category-tab-frame">
								<ul id="small_category" class="slide">
									<c:forEach var="prodtCat" items="${prodtCategory}">
										<c:choose>
											<c:when test="${prodtCat.categoryNmLen <= 4}">
												<c:choose>
													<c:when test="${prodtCatgr eq prodtCat.categoryNum}">
														<li value="${prodtCat.categoryNum}" class="active" style="min-width: 100px;">${prodtCat.categoryNm}</li>
													</c:when>
													<c:when test="${prodtCatgr ne prodtCat.categoryNum}">
														<li value="${prodtCat.categoryNum}" style="min-width: 100px;">${prodtCat.categoryNm}</li>
													</c:when>
												</c:choose>
											</c:when>
											<c:when test="${prodtCat.categoryNmLen > 4}">
												<c:choose>
													<c:when test="${prodtCatgr eq prodtCat.categoryNum}">
														<li value="${prodtCat.categoryNum}" class="active" style="min-width: 170px;">${prodtCat.categoryNm}</li>
													</c:when>
													<c:when test="${prodtCatgr ne prodtCat.categoryNum}">
														<li value="${prodtCat.categoryNum}" style="min-width: 170px;">${prodtCat.categoryNm}</li>
													</c:when>
												</c:choose>
											</c:when>
										</c:choose>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="detail">
							<div class="all-count">
								총 <b>${prodtCount}</b>개
							</div>
							<div class="check-global">
								<img src="/SYJ_Mall/resources/images/product_category/ico_checked.png" /> <span>글로벌
									배송 가능상품 보기</span>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<div id="kakao-content" style="overflow: scroll;">
			<div id = "vacant_area" ></div>
			<div id="inner-content">
				<!-- 여기에 타일즈 내용이 들어가야함 -->
				<tiles:insertAttribute name="body" ignore="false" />
			</div>
		</div>
		<!-- footer 자체를 불러오는 형식으로 해주면 좋을거 같은데 -->
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
			window.history.go(-1);
		});	
			
		/* 메인페이지로 보내주기 */
		$('.home-button').click(function(){
			location.href = "/SYJ_Mall/searchbackmain.action";	
		});
		
		$(document).ready(function() {
	        // 탭 메뉴 이동 시 효과
	        $("div.category-tab ul li").click(function () {
	          const tab_id = $(this).attr("data-tab");
	          $("div.category-tab ul li").removeClass("active");
	          $(this).addClass("active");
	        });
	      });
		
		/* 대분류 변경  */
		$('#big_category_select').change(function(){
			const char_seq = $(this).val();//대분류 번호로 적어주는게 좋을듯 한데;
			location.href = "/SYJ_Mall/newProductMainAdd.action?themeNum=" + char_seq;
		});
		
		/* 소분류 변경 */
		$('#small_category').children().click(function(){
			const small_cat_num = $(this).val();
			location.href = "/SYJ_Mall/newProductMainAdd.action?themeNum=" + themeNum + "&prodtCatgr=" +small_cat_num;
		});
		
		/*--------------------필터링 조건---------------------------*/
		$('.sort-title').click(function() {
			$('#sort-modal').css('visibility', 'visible');
			$('.sort-modal-wrap').css('bottom', '0');
			$('#kakao-footer').css('background-color', '#4C4C4C');
			$(document.body).css('overflow', 'hidden');
		});
		
		$('#buy-sort').click(function () {
			location.href = "/SYJ_Mall/newProductMainAdd.action?themeNum=" + themeNum + "&prodtCatgr=" + prodtCatgr + "&sortedOption=1";
		});
		
		$('#new-sort').click(function () {		
			location.href = "/SYJ_Mall/newProductMainAdd.action?themeNum=" + themeNum + "&prodtCatgr=" + prodtCatgr + "&sortedOption=2";
		});

		$('#low-price-sort').click(function () {
			location.href = "/SYJ_Mall/newProductMainAdd.action?themeNum=" + themeNum + "&prodtCatgr=" + prodtCatgr + "&sortedOption=3";
		});
		    
		$('#high-price-sort').click(function () {
			location.href = "/SYJ_Mall/newProductMainAdd.action?themeNum=" + themeNum + "&prodtCatgr=" + prodtCatgr + "&sortedOption=4";
		});
		
		
		/* 모달제거하는 용도 */
		$('.overlay-wrap').click(function() {
			$('.overlay-wrap').css('visibility', 'hidden');
			$('.sort-modal-wrap').css('bottom', '-180px');
			$('.character-modal-wrap').css('bottom', '-180px');
			$('#kakao-footer').css('background-color', '#FFF');
			$(document.body).css('overflow', 'visible');
		});
		
		
		/* 소분류 슬라이드  */
		const on = $('.slide').find('.active').index();
	    const options = {
	      horizontal: 1,
	      itemNav: 'centered', //basic , centered,
	      speed: 300,
	      smart: 1,
	      activateOn: 'click',
	      mouseDragging: 1,
	      touchDragging: 1,
	      activateMiddle: 1,
	      releaseSwing: 1,
	      activeClass: 'active',
	      startAt: on
	      // itemSelector:1
	    };
	    const frame = new Sly('.category-tab-frame', options).init();
		
	</script>

</body>
</html>