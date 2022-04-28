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
<link rel="stylesheet" href="resources/css/mainLayout/mainTilesLayout.css">
<link rel="stylesheet" href="resources/css/mainLayout/loginModal2.css">
<link rel="stylesheet" href="resources/css/charProdt/product_category_character7.css">
<link rel="stylesheet" href="resources/css/commoncss/sortModalWrap4.css">
</head>
<body>

	<!-- 로그인 모달창 -->
	<div class="overlay-wrap" id="login-product-modal"
		style="visibility: hidden; z-index: 20;">
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
		<div id="kakao-head" style="position: fixed; z-index: 10;">
			<div id="inner-head" style="background-color: #FFFFFF;">
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
			<!-- <div id="inner-tab" style="height:10px;"></div> -->
		</div>


		<div id="kakao-content" style="overflow: scroll;">
			<div class="container-wrap product-category-character" style="margin: 0px auto;">
				<div class="category-banner"
					style=" background: url(/SYJ_Mall/${charHeadPicUrl}) right 0px /cover no-repeat; margin-top : 50px;">
					<span class="category-title">${charHeadName}</span> <img
						class="select-icon"
						src="/SYJ_Mall/resources/images/product_category/ico_category_header_fold.png"
						alt="foldWhite"/> <select id="select_char">
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
				<div class="category-header" style="background-color: #FFFFFF;">
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
					<div class="detail" style="background-color: #FFFFFF;">
						<div class="all-count">
							총 <b>${charHeadCount}</b>개
						</div>
						<div class="check-global">
							<img
								src="/SYJ_Mall/resources/images/product_category/ico_checked.png" />
							<span>글로벌 배송 가능상품 보기</span>
						</div>
					</div>
				</div>
			</div>

			<!-- <div id="media-vacant"></div> -->
			<div id="inner-content">
				<!-- 상품 -->
				<!-- 카테고리 선택 배너 -->

				<!-- 해당 카테고리 상품 영역 -->
				<div class="category-product-wrap">
					<ul id="char-item-lists">
						<c:forEach var="dto" items="${charProdts}">
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
	
	
	
	let paging = ${paging};
	let sortedOption = ${sortedOption};
	let totalPagingCount = ${pageAjaxCount};
	let charSeq = ${charSeq};
	
	//검색결과를 몇개씩 보여줄지 처리 -> ajax 처리
	$('#kakao-content').on(
			"scroll",
			function(){

				const scrollHeight = document.getElementById('kakao-content').scrollHeight;
				const scrollTop = document.getElementById('kakao-content').scrollTop;
				const height = $('#kakao-content').height();
				
				
				if ((scrollTop + height >= scrollHeight)) {	
					
					if (paging < totalPagingCount && paging >= 0) {
						paging++;
						char_prodt_ajax();
					} else if (paging == totalPagingCount) {
						paging = -1;
						call_footer();
					}
				}
	});
	
	function char_prodt_ajax() {
		$.ajax({
        	type:"POST",
            url: "/SYJ_Mall/charAtProdtStart.action" ,
            async : false,
            data : {"paging" : paging, "charSeq" : charSeq,"sortedOption" : sortedOption},
            dataType : "json",
            success : function(result) {
                
            	let selectCount = result.length;
            
            	
            	for (let i = 0; i < selectCount; i++) {
            		
            		let url = "'" + result[i].picUrl + "'";
            		
            		//재고가 있는경우와 없는경우로 나눠준다.
            		//1. 재고 없는 경우
            		if (result[i].prodCnt == 0) {
            			$('#char-item-lists').append(
			            		
		            			'<li class="item-li" id="'+ result[i].prodId + '">'
								+	'<div class="thumbnail" style="background-image : url('+url+')"><div class="soldout-label"></div></div>'
								+	'<div class="name">'
								+		'<div class="nametext">' + result[i].prodNm + '</div>'  
								+		'<span class="' + result[i].alarmYn + '"></span>'
								+	'</div>'
								+	'<div class="price">' + result[i].prodPrice + '원</div>'
								+'</li>'
					            	
			            	);
            		}
            		//2. 재고 있는 경우
            		else {
            			//재고 있는 경우 : 할인되는 품목과 안되는 품목을 나눠서 추가하도록 하자.
	            		//1. 할인안되는 품목인 경우
	            		if(result[i].discRate == 0) {
	            			$('#char-item-lists').append(
				            		
	            					'<li class="item-li" id="'+ result[i].prodId + '">'
									+	'<div class="thumbnail" style="background-image : url('+url+')"></div>'
									+	'<div class="name">'
									+		'<div class="nametext">' + result[i].prodNm + '</div>'  
									+ 		'<span class="' + result[i].cookieBasket + '"></span>'
									+	'</div>'
									+	'<div class="price">' + result[i].prodPrice + '원</div>'
									+'</li>'
						            	
				            	);
	            		} 
	            		//2. 할인되는 품목인 경우
	            		else {
	            			$('#char-item-lists').append(
				            		
	            					'<li class="item-li" id="'+ result[i].prodId + '">'
									+	'<div class="thumbnail" style="background-image : url('+url+')"></div>'
									+	'<div class="name">'
									+		'<div class="nametext">' + result[i].prodNm + '</div>'  
									+ 		'<span class="' + result[i].cookieBasket + '"></span>'
									+	'</div>'
									+	'<div class="price" style="color : #FF447F;">' + result[i].discRate + '% '+ result[i].dcPrice + '원</div>'
									+	'<div class="price" style="text-decoration:line-through; color : #9A9A9E;">' + result[i].prodPrice + '원</div>'
									+'</li>'
						            	
				            	);
	            		}
            		}//else
            	}//for	
            },
            error: function(a,b,c) {
					console.log(a,b,c);
			}
        	});
	}
	
	
	/*--------------------장바구니/알람 조건---------------------------*/
	//상품카트 관련 공통 함수
		function search_prod_basket(prodt_id, prodt_this) {
			$.ajax({
				type : "GET",
				url : "/SYJ_Mall/charItemBasketSet.action",
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
		
		/* 상품 클릭할때 생기는 이벤트 */
		$(document).on("click",".item-li",function(){
			let prodt_id = $(this).attr('id');
			location.href = "/SYJ_Mall/productDetailMain.action?prodtSeq=" + prodt_id;
			//alert(prodt_id);
		});
		
		//상품 카트에 관련 -> 카트에 넣어주기
		$(document).on("click",".cart",function(e){
			
			let prodt_id = $(this).parent().parent().attr('id');
			let prodt_this = $(this);
			
			search_prod_basket(prodt_id,prodt_this);
			
			e.stopPropagation();  
		});
		
		//상품 카트에 관련 -> 카트에서 빼주기
		$(document).on("click",".incart",function(e){
			
			let prodt_id = $(this).parent().parent().attr('id');
			let prodt_this = $(this);
			search_prod_basket(prodt_id,prodt_this);
			
			e.stopPropagation();  
		});
		
		//상품알림 관련 공통 함수
		function search_prod_alarm(prodt_id,prodt_this) {
			$.ajax({
            	type:"GET",
            	url: "/SYJ_Mall/charItemAlarmSet.action",
            	data : "productId=" + prodt_id,
            	dataType : "json",
            	success : function(result) {
            		console.log(result);
            		if (result == 1) {
            			$(prodt_this).attr('class','inalarm');
            		} else if (result == 2) {
            			$(prodt_this).attr('class','alarm');
            		} else {
            			//로그인해야 알람을 넣어줄 수 있는 경우
            			$('#login-product-modal').css('visibility','visible');
            			$(document.body).css('overflow','hidden');
            		}
            	},
            	error: function(a,b,c) {
					console.log(a,b,c);
			}
           });
		}
		
		//상품 알림 관련 -> 알림에 넣어주기
		$(document).on("click",".alarm",function(e){
			
			let prodt_id = $(this).parent().parent().attr('id');
			let prodt_this = $(this);
			search_prod_alarm(prodt_id,prodt_this);
			e.stopPropagation();  
		});
		
		//상품 알림 관련 -> 알림에서 빼주기
		$(document).on("click",".inalarm",function(e){
			
			let prodt_id = $(this).parent().parent().attr('id');
			let prodt_this = $(this);
			search_prod_alarm(prodt_id,prodt_this);
			e.stopPropagation();  
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
		
	
		/*--------------------필터링 조건---------------------------*/
		$('.sort-title').click(function() {
			$('#sort-modal').css('visibility', 'visible');
			$('.sort-modal-wrap').css('bottom', '0');
			$('#kakao-footer').css('background-color','#4C4C4C');
			$(document.body).css('overflow', 'hidden');
		});

		//판매량 순
		$('#buy-sort')
				.click(
						function() {
							location.href = "/SYJ_Mall/charAtProdtStart.action?charSeq=${charSeq}&sortedOption=1";
						});

		//신제품 순
		$('#new-sort')
				.click(
						function() {
							location.href = "/SYJ_Mall/charAtProdtStart.action?charSeq=${charSeq}&sortedOption=2";
						});

		//낮은 가격 순
		$('#low-price-sort')
				.click(
						function() {
							location.href = "/SYJ_Mall/charAtProdtStart.action?charSeq=${charSeq}&sortedOption=3";
						});

		//높은 가격 순
		$('#high-price-sort')
				.click(
						function() {
							location.href = "/SYJ_Mall/charAtProdtStart.action?charSeq=${charSeq}&sortedOption=4";
						});

		//모달 제거하는 용도
		$('.overlay-wrap').click(function() {
			$('.overlay-wrap').css('visibility', 'hidden');
			$('.sort-modal-wrap').css('bottom', '-170px');
			$('#kakao-footer').css('background-color','#FFF');
			$(document.body).css('overflow', 'visible');
		});
	</script>

</body>
</html>