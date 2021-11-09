<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>

<link rel="stylesheet"
	href="resources/css/newProduct/newProductMainFinal.css">
<!-- 슬라이드 라이브러리 -->
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- 신규 스와이퍼 라이브러리 신규 -->
 <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
 <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>


<div class="container-wrap new-product-new">
	<!-- 데이터 없을 시 -->
	<!-- <div class="order-list-nodata">
              <div class="standing-ryan"></div>
              <div class="empty-message">내역이 없어요</div>
            </div> -->
	<!-- 데이터 있을 시 -->


	<!-- 배너 슬라이드 -->
	<div class="swiper mySwiper">
		<div class="swiper-wrapper">
			<c:forEach var="rectopdto" items="${recommendThemeTop}">
				<div class="swiper-slide" id="${rectopdto.prodId}">
					<img src="${rectopdto.prodPicUrl}">
					<div class="banner-text">
						<p class="title">${rectopdto.prodSubject}</p>
						<p class="sub-title">${rectopdto.prodDetail}</p>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="swiper-button-next">
			<img src="/SYJ_Mall/resources/images/product_new/arrow-right.png">
		</div>
		<div class="swiper-button-prev">
			<img src="/SYJ_Mall/resources/images/product_new/arrow-left.png">
		</div>
		<div class="swiper-pagination"></div>
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
					<c:if test="${dto.prodCnt eq 0}">
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
					</c:if>


					<c:if test="${dto.prodCnt ne 0 && dto.discRate eq 0}">
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
					</c:if>


					<c:if test="${dto.prodCnt ne 0 && dto.discRate ne 0}">
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
					</c:if>
				</c:forEach>
			</ul>
		</div>
		<a href="#" class="theme-more-view">더 보기</a>
	</div>
	<div class="product-new-section new-theme-wrap" id="testest">
		<!-- 오늘 업데이트 했어요-->
		<div class="sub-title">오늘 업데이트 했어요</div>
		<div class="title">새로나온 친구들</div>
		<!-- 상품 리스트 공통 UI -->
		<div class="new-product-item-wrap">
			<ul id="wrap_ul">

				<!-- 여기서부터 조건이 붙어야 한다.***** -->
				<c:forEach var="ndto" items="${newFdtoList}">
					<c:if test="${ndto.prodCnt eq 0}">
						<!-- 상품재고가 없는 경우 -->
						<li class="item-li" id="${ndto.prodId}">
							<div class="thumbnail"
								style="background-image : url('${ndto.picUrl}'); ">
								<div class="soldout-label"></div>
							</div>
							<div class="name">
								<div class="nametext">${ndto.prodNm}</div>
								<span class="${ndto.alarmYn}"></span>
							</div>
							<div class="price">${ndto.prodPrice}원</div>
						</li>
					</c:if>


					<c:if test="${ndto.prodCnt ne 0 && ndto.discRate eq 0}">
						<!-- 상품재고는 있고 할인이 없는경우 -->
						<li class="item-li" id="${ndto.prodId}">
							<div class="thumbnail"
								style="background-image : url('${ndto.picUrl}'); "></div>
							<div class="name">
								<div class="nametext">${ndto.prodNm}</div>
								<span class="${ndto.cookieBasket}"></span>
							</div>
							<div class="price">${ndto.prodPrice}원</div>
						</li>
					</c:if>


					<c:if test="${ndto.prodCnt ne 0 && ndto.discRate ne 0}">
						<!-- 상품재고는 있고 할인이 있는 경우 -->
						<li class="item-li" id="${ndto.prodId}">
							<div class="thumbnail"
								style="background-image : url('${ndto.picUrl}'); "></div>
							<div class="name">
								<div class="nametext">${ndto.prodNm}</div>
								<span class="${ndto.cookieBasket}"></span>
							</div>
							<div class="price" style="color: #FF447F;">${ndto.discRate}%
								${ndto.dcPrice}원</div>
							<div class="price"
								style="text-decoration: line-through; color: #9A9A9E;">${ndto.prodPrice}원</div>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>



<script>
	
	// 신규 슬라이드 관련
	var swiper = new Swiper(".mySwiper", {
		allowTouchMove : true,
		loop : true,
		scrollbar : {
			el : '.swiper-scrollbar',
			draggable : true,
		},
		autoplay : {
			delay : 3000,
			disableOnInteraction : false,
		}, 
		pagination : {
			el : ".swiper-pagination",
			type : "fraction",
			clickable : true
		},
		navigation : {
			nextEl : ".swiper-button-next",
			prevEl : ".swiper-button-prev",
		},
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

	let new_friends_total = ${newFriendsCount};//새로운 친구 물품 갯수 -> 전체 페이징
	let new_friends_count = 2;//페이징변수

	$('#kakao-content')
			.on(
					'scroll',
					function() {

						const scrollHeight = document
								.getElementById('kakao-content').scrollHeight;
						const scrollTop = document
								.getElementById('kakao-content').scrollTop;
						const height = $('#kakao-content').height();

						console.log("scrollHeight : " + scrollHeight);
						console.log("scrollTop : " + scrollTop);
						console.log("height : " + height);

						if ((scrollTop + height >= scrollHeight)
								&& new_friends_count <= new_friends_total) {
							$
									.ajax({
										type : "GET",
										url : "/SYJ_Mall/newFriendsProduct.action",
										data : "newFriendsPaging="
												+ new_friends_count,
										async : false,
										dataType : "json",
										success : function(result) {
											let selectCount = result.length;

											for (let i = 0; i < selectCount; i++) {
												let url = "'"
														+ result[i].picUrl
														+ "'";

												//1. 재고 없는 경우
												if (result[i].prodCnt == 0) {
													$('#wrap_ul')
															.append(

																	'<li class="item-li" id="'+ result[i].prodId + '">'
																			+ '<div class="thumbnail" style="background-image : url('
																			+ url
																			+ ')"><div class="soldout-label"></div></div>'
																			+ '<div class="name">'
																			+ '<div class="nametext">'
																			+ result[i].prodNm
																			+ '</div>'
																			+ '<span class="'+result[i].alarmYn+'"></span>'
																			+ '</div>'
																			+ '<div class="price">'
																			+ result[i].prodPrice
																			+ '원</div>'
																			+ '</li>'

															);
												}
												//2. 재고 있는 경우
												else {
													//재고 있는 경우 : 할인되는 품목과 안되는 품목을 나눠서 추가하도록 하자.
													//1. 할인안되는 품목인 경우
													if (result[i].discRate == 0) {
														$('#wrap_ul')
																.append(

																		'<li class="item-li" id="'+ result[i].prodId + '">'
																				+ '<div class="thumbnail" style="background-image : url('
																				+ url
																				+ ')"></div>'
																				+ '<div class="name">'
																				+ '<div class="nametext">'
																				+ result[i].prodNm
																				+ '</div>'
																				+ '<span class="' + result[i].cookieBasket + '"></span>'
																				+ '</div>'
																				+ '<div class="price">'
																				+ result[i].prodPrice
																				+ '원</div>'
																				+ '</li>'

																);
													}
													//2. 할인되는 품목인 경우
													else {
														$('#wrap_ul')
																.append(

																		'<li class="item-li" id="'+ result[i].prodId + '">'
																				+ '<div class="thumbnail" style="background-image : url('
																				+ url
																				+ ')"></div>'
																				+ '<div class="name">'
																				+ '<div class="nametext">'
																				+ result[i].prodNm
																				+ '</div>'
																				+ '<span class="' + result[i].cookieBasket + '"></span>'
																				+ '</div>'
																				+ '<div class="price" style="color : #FF447F;">'
																				+ result[i].discRate
																				+ '% '
																				+ result[i].dcPrice
																				+ '원</div>'
																				+ '<div class="price" style="text-decoration:line-through; color : #9A9A9E;">'
																				+ result[i].prodPrice
																				+ '원</div>'
																				+ '</li>'

																);
													}
												}//else

											}//for
										},
										error : function(a, b, c) {
											console.log(a, b, c);
										}
									});
							new_friends_count++;//페이징 카운트 늘리기
						}

					});
</script>





