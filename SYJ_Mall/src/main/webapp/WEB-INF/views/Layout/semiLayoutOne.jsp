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


<style>

/* 카테고리 선택 배너 */
.category-banner {
  display: flex;
  align-items: center;
  position: relative;
  background: url(/SYJ_Mall/resources/images/product_category/Category_Ryan_210303.jpg) right 0px /
    cover no-repeat;
  background-color: #ededed;
  margin-top: -3px;
  min-height: 111px;
}

.category-banner .category-title {
  font-size: 24px;
  font-weight: bold;
  color: rgb(255, 255, 255);
  margin-left: 20px;
}

.category-banner .category-title {
  font-size: 24px;
  font-weight: bold;
  color: rgb(255, 255, 255);
  margin-left: 20px;
}

.category-banner .select-icon {
  width: 18px;
  height: 18px;
  margin-left: 6px;
}

.category-banner select {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 100%;
  border: none;
  background-color: transparent;
  appearance: none;
  font-size: 0px;
  min-height: 111px;
  outline: none;
}

.category-banner select option {
  font-size: 14px;
}


/* 상품 정렬 및 개수 */
.category-header {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  /* padding: 0px 20px; */
  cursor: pointer;
}

.category-header .sort {
  width: 100%;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-bottom: 1px solid rgb(242, 242, 242);
}

.category-header .sort .sort-title {
  font-size: 16px;
  color: rgb(17, 17, 17);
  margin-right: 2px;
}

.category-header .sort .sort-icon {
  width: 18px;
  height: 18px;
  object-fit: contain;
}

.category-header .category-tab {
  width: 100%;
}

.category-header .category-tab ul {
  display: flex;
  align-items: center;
  justify-content: baseline;
  height: 50px;
  border-bottom: 1px solid rgb(242, 242, 242);
}

.category-header .category-tab ul li {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0 15px;
  height: 50px;
}

.category-header .category-tab ul li.active {
  font-weight: bold;
  border-bottom: 2px solid #1e1e1e;
}

.category-header .detail {
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 70px;
  padding: 20px;
  box-sizing: border-box;
}

.category-header .detail .all-count {
  font-size: 16px;
}

.category-header .detail .check-global {
  display: flex;
  font-size: 16px;
}

.category-header .detail .check-global img {
  width: 20px;
  height: 20px;
  margin-right: 6px;
}


.category-banner {
    height: 220px;
 }
 
 #vacant_area {
 	height: 400px;
 }

@media (max-width: 640px) {
  .category-banner {
    height: 111px;
  }
  
  .category-header .category-tab ul li {
  	  padding: 0 2px;
  }
  
  #vacant_area {
  	height: 250px;
  }
}


</style>

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
					<div class="category-banner" >
						<span class="category-title" >토이</span> <img class="select-icon"
							src="/SYJ_Mall/resources/images/product_category/ico_category_header_fold.png"
							alt="foldWhite" /> 
							<select style="height: 100%;">
							<option>---------------카테고리 선택---------------</option>
							<option>전체</option>
							<option>토이</option>
							<option>리빙</option>
							<option>잡화</option>
							<option>문구</option>
							<option>의류</option>
							<option>디지털</option>
							<option>여행/레저</option>
							<option>식품</option>
							<option>테마 기획전</option>
						</select>
					</div>
					<!-- 상품 정렬 및 개수 -->
					<div class="category-header">
						<div class="sort">
							<span class="sort-title">신상품 순</span> <img class="sort-icon"
								src="/SYJ_Mall/resources/images/product_category/dropdown_down.png" />
						</div>
						<div class="category-tab">
							<ul>
								<c:forEach var="prodtCat" items="${prodtCategory}">
									<c:if test="${prodtCatgr eq prodtCat.categoryNum}">
										<li data-tab= ${prodtCat.categoryNum} class="active">${prodtCat.categoryNm}</li>
									</c:if>
									<c:if test="${prodtCatgr ne prodtCat.categoryNum}">
										<li data-tab= ${prodtCat.categoryNum}>${prodtCat.categoryNm}</li>
									</c:if>
								</c:forEach>
							</ul>
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
		
		$(document).ready(function () {
	        // 탭 메뉴 이동 시 효과
	        $("div.category-tab ul li").click(function () {
	          var tab_id = $(this).attr("data-tab");
	          $("div.category-tab ul li").removeClass("active");
	          $(this).addClass("active");
	        });
	      });
	 	
	 	
	</script>

</body>
</html>