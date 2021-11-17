<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>
<link rel="stylesheet" href="resources/css/newProduct/newProductMainFinal.css">

<div class="container-wrap new-product-new">
	<div class="product-new-section theme-wrap">
		<!-- 데이터 없을 시 -->
		<c:if test="${empty recommendTheme}">
			<div class="search-list-nodata">
				<div class="standing-ryan"></div>
				<div class="empty-message">내역이 없어요</div>
			</div>
		</c:if>
		<!-- 데이터 있을 시 -->
		<c:if test="${not empty recommendTheme}">
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
		</c:if>
	</div>


</div>


<script>
	
	let sortedCharOption = ${sortedCharOption};
	let filter_option = ${sortedOption};
	
	//상품 카트에 관련 -> 카트에 넣어주기
	$(document).on("click", ".cart", function(e) {

		let prodt_id = $(this).parent().parent().attr('id');
		let prodt_this = $(this);
		search_prod_basket(prodt_id, prodt_this);

		e.stopPropagation();
	});
	//상품 카트에 관련 -> 카트에서 빼주기
	$(document).on("click", ".incart", function(e) {

		let prodt_id = $(this).parent().parent().attr('id');
		let prodt_this = $(this);
		search_prod_basket(prodt_id, prodt_this);

		e.stopPropagation();
	});

	//상품카트 관련 공통 함수
	function search_prod_basket(prodt_id, prodt_this) {
		$.ajax({
			type : "GET",
			url : "/SYJ_Mall/searchItemBasketSet.action",
			data : "productId=" + prodt_id,
			dataType : "json",
			success : function(result) {

				if (result == 1) {
					//$("#"+prodt_id).attr('class','incart');
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
		search_prod_alarm(prodt_id, prodt_this);
		e.stopPropagation();
	});

	//상품 알림 관련 -> 알림에서 빼주기
	$(document).on("click", ".inalarm", function(e) {

		let prodt_id = $(this).parent().parent().attr('id');
		let prodt_this = $(this);
		search_prod_alarm(prodt_id, prodt_this);
		e.stopPropagation();
	});

	//상품알림 관련 공통 함수
	function search_prod_alarm(prodt_id, prodt_this) {
		$.ajax({
			type : "GET",
			url : "/SYJ_Mall/searchItemAlarm.action",
			data : "productId=" + prodt_id,
			dataType : "json",
			success : function(result) {
				console.log(result);
				if (result == 1) {
					$(prodt_this).attr('class', 'inalarm');
				} else if (result == 2) {
					$(prodt_this).attr('class', 'alarm');
				} else {
					//로그인해야 알람을 넣어줄 수 있는 경우
					$('#login-product-modal').css('visibility', 'visible');
					$(document.body).css('overflow', 'hidden');
				}
			},
			error : function(a, b, c) {
				console.log(a, b, c);
			}
		});
	}


	/*--------------------필터링 조건---------------------------*/
	//~~ 순 정하는 필터링
	$('#content-sort-name').click(function() {
		$('#sort-modal').css('visibility', 'visible');
		$('.sort-modal-wrap').css('bottom', '0');
		$('#kakao-footer').css('background-color', '#4C4C4C');
		$(document.body).css('overflow', 'hidden');
	});
	
	$('#buy-sort').click(function () {
		location.href = "/SYJ_Mall/newProductMainAdd.action?sortedOption=1&sortedCharOption="+ sortedCharOption;	
	});
	
	$('#new-sort').click(function () {		
		location.href = "/SYJ_Mall/newProductMainAdd.action?sortedOption=2&sortedCharOption="+ sortedCharOption;
	});

	$('#low-price-sort').click(function () {
		location.href = "/SYJ_Mall/newProductMainAdd.action?sortedOption=3&sortedCharOption="+ sortedCharOption;
	});
	    
	$('#high-price-sort').click(function () {
		location.href = "/SYJ_Mall/newProductMainAdd.action?sortedOption=4&sortedCharOption="+ sortedCharOption;
	});
	
	
	//캐릭터순 필터
    $('.character-list').click(function(){
    	
    	sortedCharOption = $(this).attr('id');
    	location.href = "/SYJ_Mall/newProductMainAdd.action?sortedOption=" + filter_option + "&sortedCharOption=" + sortedCharOption;
    	
    });	
	
	
	//캐릭터별 모달
    $("#char-sort-name").click(function () {
      $('#charac-modal').css("visibility", "visible");
      $('.character-modal-wrap').css('bottom', '0');
      $('#kakao-footer').css('background-color','#4C4C4C');
      $(document.body).css('overflow','hidden');
    });
	
    //모달 제거하는 용도
    $('.overlay-wrap').click(function () {
    	$('.overlay-wrap').css('visibility', 'hidden');
      	$('.sort-modal-wrap').css('bottom', '-180px');
     	$('.character-modal-wrap').css('bottom', '-180px');
      	$('#kakao-footer').css('background-color','#FFF');
      	$(document.body).css('overflow','visible');
    });
	
	
	
</script>
