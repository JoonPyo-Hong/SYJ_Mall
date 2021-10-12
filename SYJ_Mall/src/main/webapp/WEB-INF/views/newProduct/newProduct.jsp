<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>

<link rel="stylesheet"
	href="resources/css/newProduct/newProductMain11.css">
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
				<c:forEach var="rectopdto" items="${recommendThemeTop}">
					<div class="post" id="${rectopdto.prodId}">
						<img src="${rectopdto.prodPicUrl}">
						<div class="banner-text">
							<p class="title">${rectopdto.prodSubject}</p>
							<p class="sub-title">${rectopdto.prodDetail}</p>
						</div>
					</div>
				</c:forEach>
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
			<ul id="wrap_ul">
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

	/* 상품 클릭할때 생기는 이벤트  -> 상품페이지로 보내줄것이다.*/
	$(document).on("click", ".item-li", function() {
		let prodt_id = $(this).attr('id');
		alert(prodt_id);
	});

	//장바구니에 상품을 넣는 경우
	$(document).on("click", ".cart", function(e) {
		let prodt_id = $(this).parent().parent().attr('id');//아이디 번호
		let prodt_this = $(this);
		//console.log(prodt_id);
		cartAjax(prodt_id, prodt_this);
		e.stopPropagation();
	});

	//장바구니에서 상품을 빼는 경우
	$(document).on("click", ".incart", function(e) {
		let prodt_id = $(this).parent().parent().attr('id');//아이디 번호
		let prodt_this = $(this);
		cartAjax(prodt_id, prodt_this);
		e.stopPropagation();
	});

	//장바구니 관련 함수
	function cartAjax(prodt_id, prodt_this) {
		$.ajax({
			type : "GET",
			url : "/SYJ_Mall/newProductBasket.action",
			data : "productId=" + prodt_id,
			dataType : "json",
			success : function(result) {
				if (result == 1) {
					$(prodt_this).attr('class', 'incart');
				} else if (result == 2) {
					$(prodt_this).attr('class', 'cart');
				}
			},
			error : function(a, b, c) {
				console.log(a, b, c);
			}
		});
	}

	//상품 알림 관련 -> 알림에 넣어주기
	$(document).on("click", ".alarm", function(e) {

		let prodt_id = $(this).parent().parent().attr('id');
		let prodt_this = $(this);

		new_prod_alarm(prodt_id, prodt_this);
		e.stopPropagation();
	});

	//상품 알림 관련 -> 알림에서 빼주기
	$(document).on("click", ".inalarm", function(e) {

		let prodt_id = $(this).parent().parent().attr('id');
		let prodt_this = $(this);
		new_prod_alarm(prodt_id, prodt_this);
		e.stopPropagation();
	});

	//상품 알림창 관련 
	function new_prod_alarm(prodt_id, prodt_this) {
		$.ajax({
			type : "GET",
			url : "/SYJ_Mall/searchItemAlarm.action",
			data : "productId=" + prodt_id,
			dataType : "json",
			success : function(result) {
				if (result == 1) {
					$(prodt_this).attr('class', 'inalarm');
				} else if (result == 2) {
					$(prodt_this).attr('class', 'alarm');
				} else {
					login_modal_open();
				}
			},
			error : function(a, b, c) {
				console.log(a, b, c);
			}
		});
	};
	
	let count = 1;
	// 0.04 정도의 오차가 발생  0.72(pc) / 0.76(mobile)
	$('#inner-content').on('scroll',function(){
		//console.log('zzz');
		//console.log(document.getElementById('inner-content').scrollHeight);
		//console.log(document.getElementById('inner-content').scrollTop);
		
		const sh = document.getElementById('inner-content').scrollHeight;
		const ih = document.getElementById('inner-content').scrollTop;
		
		
		if (ih > sh*0.7 && count <= 3){
			
			count++;
			
			$('#wrap_ul').append(
					'<li class="item-li" style="border: 1px solid red;">'
					+	'<div class="thumbnail"></div>'
					+	'<div class="name">'
					+		'<div class="nametext">콘센트 정리 트레이_라이언&춘식</div>'
					+		'<span class="cart"></span>'
					+	'</div>'
					+	'<div class="price">39,000원</div>'
					+ '</li>'
					+'<li class="item-li" style="border: 1px solid red;">'
					+	'<div class="thumbnail"></div>'
					+	'<div class="name">'
					+		'<div class="nametext">콘센트 정리 트레이_라이언&춘식</div>'
					+		'<span class="cart"></span>'
					+	'</div>'
					+	'<div class="price">39,000원</div>'
					+ '</li>'
					+'<li class="item-li" style="border: 1px solid red;">'
					+	'<div class="thumbnail"></div>'
					+	'<div class="name">'
					+		'<div class="nametext">콘센트 정리 트레이_라이언&춘식</div>'
					+		'<span class="cart"></span>'
					+	'</div>'
					+	'<div class="price">39,000원</div>'
					+ '</li>'
					+'<li class="item-li" style="border: 1px solid red;">'
					+	'<div class="thumbnail"></div>'
					+	'<div class="name">'
					+		'<div class="nametext">콘센트 정리 트레이_라이언&춘식</div>'
					+		'<span class="cart"></span>'
					+	'</div>'
					+	'<div class="price">39,000원</div>'
					+ '</li>'
					
				);
		}
		
		
	});
	
	
	
	
	


	
	
</script>





