<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>

<link rel="stylesheet"
	href="resources/css/newProduct/newProductMain5.css">
<!-- 슬라이드 라이브러리 -->
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<style>
@media screen and (max-width: 640px) {
	.new-product-new .product-new-banner {
		height: 210px;
	}
}
</style>
<div class="container-wrap new-product-new">
	<!-- 데이터 없을 시 -->
	<!-- <div class="order-list-nodata">
              <div class="standing-ryan"></div>
              <div class="empty-message">내역이 없어요</div>
            </div> -->
	<!-- 데이터 있을 시 -->


	<!-- 배너 슬라이드 -->
	<div class="product-new-banner">
		<div class="post-slider">
			<div class="post-wrapper">
				<div class="post" id="1">
					<img
						src="./../images/product_new/banner_20210906174400_mobile_kr.jpg">
					<div class="banner-text">
						<p class="title">양 볼에 고구마 가득</p>
						<p class="sub-title">춘식이 폰그립 폰케이스</p>
					</div>
				</div>
				<div class="post" id="2">
					<img
						src="./../images/product_new/banner_20210903094056_mobile_kr.jpg">
					<div class="banner-text">
						<p class="title">집콕엔 청소도 즐겁게</p>
						<p class="sub-title">라이언과 춘식이의 집콕놀이</p>
					</div>
				</div>
				<div class="post" id="3">
					<img
						src="./../images/product_new/banner_20210826174841_mobile_kr.jpg">
					<div class="banner-text">
						<p class="title">춘식이에게 새로운 캣타워를</p>
						<p class="sub-title">워치 전용 충전 거치대</p>
					</div>
				</div>
				<div class="post" id="4">
					<img
						src="./../images/product_new/banner_20210819103906_mobile_kr.jpg">
					<div class="banner-text">
						<p class="title">배출량에 따라 효율적으로</p>
						<p class="sub-title">편리한 분리수거함</p>
					</div>
				</div>
				<div class="post" id="5">
					<img
						src="./../images/product_new/banner_20210809090322_mobile_kr.jpg">
					<div class="banner-text">
						<p class="title">웰컴 투 춘식이의 방</p>
						<p class="sub-title">춘식이의 방 둘러 보기</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="product-new-section theme-wrap">
		<!-- 추천 신규 테마 -->
		<div class="sub-title">추천 신규 테마</div>
		<div class="title">${themeSubject}</div>
		<!-- 상품 리스트 공통 UI -->
		<div class="new-product-item-wrap">
			<ul>

				<!-- 여기서부터 조건이 붙어야 한다.***** -->
				<c:forEach var="dto" items="${recommendTheme}">
					<c:choose>
						<c:when test="${empty userinfo}">
							<c:choose>
								<c:when test="${dto.prodCnt eq 0}">
									<!-- 상품재고가 없는 경우 -->
									<li class="item-li" id="${dto.prodId}">
										<div class="thumbnail"
											style="background-image : url('${dto.picUrl}'); ">
											<div class="soldout-label"></div>
										</div>
										<div class="name">
											<div class="nametext">${dto.prodNm}</div>
											<span class="alarm"></span>
										</div>
										<div class="price">${dto.prodPrice}원</div>
									</li>
								</c:when>


								<c:when test="${dto.prodCnt ne 0 && dto.discRate eq 0}">
									<!-- 상품재고는 있고 할인이 없는경우 -->
									<li class="item-li" id="${dto.prodId}">
										<div class="thumbnail"
											style="background-image : url('${dto.picUrl}'); "></div>
										<div class="name">
											<div class="nametext">${dto.prodNm}</div>
											<span class="${dto.cookieBasket}"></span>
										</div>
										<div class="price">${dto.prodPrice}원</div>
									</li>
								</c:when>


								<c:when test="${dto.prodCnt ne 0 && dto.discRate ne 0}">
									<!-- 상품재고는 있고 할인이 있는 경우 -->
									<li class="item-li" id="${dto.prodId}">
										<div class="thumbnail"
											style="background-image : url('${dto.picUrl}'); "></div>
										<div class="name">
											<div class="nametext">${dto.prodNm}</div>
											<span class="${dto.cookieBasket}"></span>
										</div>
										<div class="price" style="color: #FF447F;">${dto.discRate}%
											${dto.dcPrice}원</div>
										<div class="price"
											style="text-decoration: line-through; color: #9A9A9E;">${dto.prodPrice}원</div>
									</li>
								</c:when>
							</c:choose>
						</c:when>
						<c:when test="${not empty userinfo}">
							<c:choose>
								<c:when test="${dto.prodCnt eq 0}">
									<!-- 상품재고가 없는 경우 -->
									<li class="item-li" id="${dto.prodId}">
										<div class="thumbnail"
											style="background-image : url('${dto.picUrl}'); ">
											<div class="soldout-label"></div>
										</div>
										<div class="name">
											<div class="nametext">${dto.prodNm}</div>
											<span class="${dto.alarmYn}"></span>
										</div>
										<div class="price">${dto.prodPrice}원</div>
									</li>
								</c:when>


								<c:when test="${dto.prodCnt ne 0 && dto.discRate eq 0}">
									<!-- 상품재고는 있고 할인이 없는경우 -->
									<li class="item-li" id="${dto.prodId}">
										<div class="thumbnail"
											style="background-image : url('${dto.picUrl}'); "></div>
										<div class="name">
											<div class="nametext">${dto.prodNm}</div>
											<span class="${dto.cookieBasket}"></span>
										</div>
										<div class="price">${dto.prodPrice}원</div>
									</li>
								</c:when>


								<c:when test="${dto.prodCnt ne 0 && dto.discRate ne 0}">
									<!-- 상품재고는 있고 할인이 있는 경우 -->
									<li class="item-li" id="${dto.prodId}">
										<div class="thumbnail"
											style="background-image : url('${dto.picUrl}'); "></div>
										<div class="name">
											<div class="nametext">${dto.prodNm}</div>
											<span class="${dto.cookieBasket}"></span>
										</div>
										<div class="price" style="color: #FF447F;">${dto.discRate}%
											${dto.dcPrice}원</div>
										<div class="price"
											style="text-decoration: line-through; color: #9A9A9E;">${dto.prodPrice}원</div>
									</li>
								</c:when>
							</c:choose>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
		<a href="#" class="theme-more-view">더 보기</a>
	</div>
	<div class="product-new-section new-theme-wrap">
		<!-- 오늘 업데이트 했어요-->
		<div class="sub-title">오늘 업데이트 했어요</div>
		<div class="title">새로나온 친구들</div>
		<!-- 상품 리스트 공통 UI -->
		<div class="new-product-item-wrap">
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






<script>
	
	//슬라이드 관련
	$('.post-wrapper').slick({
		slidesToShow : 1,
		slidesToScroll : 1,
		autoplay : true,
		autoplaySpeed : 3000,
		nextArrow : $('.next'),
		prevArrow : $('.prev'),
	});

	$('.post').click(function() {
		console.log($(this).attr('id'));
	});
	
	
	//장바구니,알림창 관련 
	
	
	
</script>