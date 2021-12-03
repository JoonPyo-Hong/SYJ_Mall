<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>
<!-- <link rel="stylesheet" href="resources/css/myPage/myPageSeen2.css"> -->

<style>
@charset "UTF-8";

.seen-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	height: 48px;
	padding-right: 15px;
	padding-left: 20px;
}

.seen-header .seen-text {
	font-size: 13px;
	color: rgb(154, 154, 158);
	/* garbage-27-grey.png */
}

.delete-all {
	display: flex;
	align-items: center;
	justify-content: center;
}

.delete-all-btn {
	font-size: 14px;
	color: rgb(102, 102, 102);
	cursor: pointer;
}

.delete-all-icon {
	width: 27px;
	height: 27px;
	background-image:
		url(/SYJ_Mall/resources/images/mypage_seen/garbage-27-grey.png);
	background-size: contain;
}

.recent-list-wrap {
	border-top: 1px solid rgb(242, 242, 242);
	overflow-y: auto;
}

.recent-list-item {
	display: flex;
	align-items: flex-start;
	justify-content: space-between;
	border-bottom: 1px solid rgb(242, 242, 242);
	padding: 20px;
}

.product-content {
	display: flex;
}

.product-img {
	position: relative;
	width: 64px;
	height: 64px;
}

.product-img::after {
	position: absolute;
	inset: 0px;
	background: rgba(0, 0, 0, 0.02);
	content: "";
	width: 100%;
	z-index: 0;
	padding-top: 100%;
}

.product-text {
	display: flex;
	flex-direction: column;
	margin-left: 20px;
}

.product-text .product-name {
	font-size: 16px;
	color: rgb(119, 119, 119);
}

.product-text .product-price {
	font-size: 16px;
	font-weight: bold;
}

.product-text .product-price-discount {
	font-size: 16px;
	font-weight: bold;
	color: red;
}

.product-text .product-price-prediscount {
	font-size: 16px;
	text-decoration: line-through; 
	color:#909092;
}

.recent-list-delete-btn {
	width: 24px;
	height: 24px;
	background:
		url(/SYJ_Mall/resources/images/mypage_seen/delete-small-18-light-grey.png)
		no-repeat;
	background-size: 16px 16px;
	cursor: pointer;
}
</style>

<div class="container-wrap mypage-seen-wrap">

	<div class="seen-header">
		<div class="seen-text">최대 50개까지 저장됩니다.</div>
		<div class="delete-all">
			<button class="delete-all-btn">전체삭제</button>
			<div class="delete-all-icon"></div>
		</div>
	</div>

	<c:if test="${empty mpsList}">
		<!-- 데이터 없을 시 -->
		<div class="order-list-nodata">
			<div class="standing-ryan"></div>
			<div class="empty-message">내역이 없어요</div>
		</div>
	</c:if>
	<c:if test="${not empty mpsList}">
		<!-- 데이터 있을 시 -->
		<div class="recent-list-wrap">

			<c:forEach var="mpsList" items="${mpsList}">
				<div class="recent-list-item">
					<!-- 이미지 및 상품 내용-->
					<div class="product-content">
						<a href="#">
							<div class="product-img" style="background : url(/SYJ_Mall/${mpsList.picUrl}) no-repeat; background-size: cover"></div>
						</a>
						<!-- 할인 하는 경우 -->
						<c:if test="${mpsList.discRate ne 0}">
							<div class="product-text">
								<span class="product-name">${mpsList.prodNm}</span> 
								<span class="product-price-discount">${mpsList.discRate}% ${mpsList.dcPrice}원</span>
								<span class="product-price-prediscount">${mpsList.prodPrice}원</span>
							</div>
						</c:if>
						<!-- 할인 하지 않는 경우  -->
						<c:if test="${mpsList.discRate eq 0}">
							<div class="product-text">
								<span class="product-name">${mpsList.prodNm}</span> 
								<span class="product-price">${mpsList.prodPrice}원</span>
							</div>
						</c:if>
					</div>
					<!-- 상품 삭제 -->
					<div class="recent-list-delete-btn"></div>
				</div>
			</c:forEach>
		</div>

	</c:if>



</div>