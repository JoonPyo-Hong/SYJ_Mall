<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>

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
<link rel="stylesheet" href="resources/css/search/act1.css">
<link rel="stylesheet"
	href="resources/css/search/productSearchResult7.css">
<link rel="stylesheet" href="resources/css/search/seen1.css">
<link rel="stylesheet" href="resources/css/search/searchLoginModal.css">
<link rel="stylesheet" href="resources/css/mainLayout/searchTest.css">
<link rel="stylesheet" href="resources/css/commoncss/sortModalWrap4.css"> 
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
				<!-- 검색 결과 배너 -->
				<div class="search-banner">
					<span class="search-text"><b>'${userinputName}'</b> 검색결과</span>
				</div>
				<hr class="division" />
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
				<!-- 마이페이지 컨텐츠 -->
				<div id="testest" class="container-wrap product-search-result">

					<!-- ##### 마이페이지랑 데이터 없을 때 태그 위치가 다릅니다 ##### -->

					<c:if test="${searchProdCount == 0}">
						<!-- 데이터 없을 시 -->
						<div class="search-list-nodata">
							<div class="standing-ryan"></div>
							<div class="empty-message">검색 결과가 없습니다.</div>
							<div class="empty-sub-message">다른 검색어를 입력하시거나,</div>
							<div class="empty-sub-message">철자 및 띄어쓰기를 확인해주세요.</div>
						</div>
					</c:if>



					<c:if test="${searchProdCount != 0}">
						<!-- 데이터 있을 시 -->



						<!-- 해당 검색 상품 영역 -->
						<div class="search-product-wrap">
							<ul id="search-item-lists">

								<!-- 여기서부터 조건이 붙어야 한다.***** -->
								<c:forEach var="dto" items="${searchProdto}">
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
		
		let totalProdCounting  = ${searchProdCount};
		let totalPagingCount = ${pageAjaxCount};
		let paging = 1;//페이징
		let height = 0;//높이지정
		const userinputName = "${userinputName}";//유저가 넘긴 검색단어정보
		const productSeq = "${productSeq}";
		
		//검색결과를 몇개씩 보여줄지 처리 -> ajax 처리
		$('#kakao-content').on(
				"scroll",
				function(){

					const scrollHeight = document.getElementById('kakao-content').scrollHeight;
					const scrollTop = document.getElementById('kakao-content').scrollTop;
					const height = $('#kakao-content').height();
					
					//console.log("scrollHeight : " + scrollHeight);
					//console.log("scrollTop : " + scrollTop);
					//console.log("height : " + height);
					
					if ((scrollTop + height >= scrollHeight) && paging <= totalPagingCount) {	

						paging++;
						
						$.ajax({
				        	type:"POST",
				            url: "/SYJ_Mall/searchresultscroll.action" ,
				            async : false,
				            data : {"paging" : paging, "inputWord" : userinputName,"sortedOption" : filter_option, "sortedCharOption" : sortedCharOption},
				            dataType : "json",
				            success : function(result) {
				                
				            	let selectCount = result.length;
				            	
				            	for (let i = 0; i < selectCount; i++) {
				            		
				            		let url = "'" + result[i].picUrl + "'";
				            		
				            		//재고가 있는경우와 없는경우로 나눠준다.
				            		//1. 재고 없는 경우
				            		if (result[i].prodCnt == 0) {
				            			$('#search-item-lists').append(
							            		
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
					            			$('#search-item-lists').append(
								            		
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
					            			$('#search-item-lists').append(
								            		
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
		});		
		
		
		
		/* sold out 처리도 해줘야할것이다. */
		
		/* 상품 클릭할때 생기는 이벤트 */
		$(document).on("click",".item-li",function(){
			let prodt_id = $(this).attr('id');
			alert(prodt_id);
		});
		
		/* 아래부분은 일단 장바구니 또는 알림표시 클릭하면 생기는 이벤트 */	
		
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
		
		//상품카트 관련 공통 함수
		function search_prod_basket(prodt_id,prodt_this) {
			$.ajax({
            	type:"GET",
            	url: "/SYJ_Mall/searchItemBasketSet.action",
            	data : "productId=" + prodt_id,
            	dataType : "json",
            	success : function(result) {
            		
            		if (result == 1) {
            			//$("#"+prodt_id).attr('class','incart');
            			$(prodt_this).attr('class','incart');
            		} else if (result == 2) {
            			$(prodt_this).attr('class','cart');
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
		//~~ 순 정하는 필터링
		$('#content-sort-name').click(function() {
			$('#sort-modal').css('visibility', 'visible');
			$('.sort-modal-wrap').css('bottom', '0');
			$('#kakao-footer').css('background-color','#4C4C4C');
			$(document.body).css('overflow', 'hidden');
		});
		
		
		$('#buy-sort').click(function () {
			<c:if test="${empty productSeq}">
				location.href = "/SYJ_Mall/searchresult.action?inputName=${userinputName}&sortedOption=1&sortedCharOption="+ sortedCharOption;
			</c:if>
			<c:if test="${not empty productSeq}">
				location.href = "/SYJ_Mall/searchresult.action?productSeq=${productSeq}&sortedOption=1&sortedCharOption="+ sortedCharOption;
			</c:if>

		});
		
		$('#new-sort').click(function () {
			<c:if test="${empty productSeq}">
				location.href = "/SYJ_Mall/searchresult.action?inputName=${userinputName}&sortedOption=2&sortedCharOption="+ sortedCharOption;
			</c:if>
			<c:if test="${not empty productSeq}">
				location.href = "/SYJ_Mall/searchresult.action?productSeq=${productSeq}&sortedOption=2&sortedCharOption="+ sortedCharOption;
			</c:if>

		});

		$('#low-price-sort').click(function () {
			<c:if test="${empty productSeq}">
				location.href = "/SYJ_Mall/searchresult.action?inputName=${userinputName}&sortedOption=3&sortedCharOption="+ sortedCharOption;
			</c:if>
			<c:if test="${not empty productSeq}">
				location.href = "/SYJ_Mall/searchresult.action?productSeq=${productSeq}&sortedOption=3&sortedCharOption="+ sortedCharOption;
			</c:if>

		});
		    
		$('#high-price-sort').click(function () {
			<c:if test="${empty productSeq}">
				location.href = "/SYJ_Mall/searchresult.action?inputName=${userinputName}&sortedOption=4&sortedCharOption="+ sortedCharOption;
			</c:if>
			<c:if test="${not empty productSeq}">
				location.href = "/SYJ_Mall/searchresult.action?productSeq=${productSeq}&sortedOption=4&sortedCharOption="+ sortedCharOption;
			</c:if>

		});
		
		
		//캐릭터순 필터
	    $('.character-list').click(function(){
	    	
	    	sortedCharOption = $(this).attr('id');
	    	
	    	if (userinputName == null) {
	    		location.href = "/SYJ_Mall/searchresult.action?productSeq=" + productSeq + "&sortedOption=" + filter_option + "&sortedCharOption=" + sortedCharOption;
	    	} else {
		    	location.href = "/SYJ_Mall/searchresult.action?inputName=" + userinputName + "&sortedOption=" + filter_option + "&sortedCharOption=" + sortedCharOption;
	    	}
	    	
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



</body>
</html>