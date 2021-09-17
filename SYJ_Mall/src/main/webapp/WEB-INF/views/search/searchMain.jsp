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
<link rel="stylesheet" href="resources/css/mainLayout/mainTilesLayout.css">
<link rel="stylesheet" href="resources/css/search/act1.css">
<link rel="stylesheet" href="resources/css/search/productSearchResult5.css">
<link rel="stylesheet" href="resources/css/search/seen1.css">
<link rel = "stylesheet" href = "resources/css/mainLayout/searchLayout.css">
<style>

</style>
</head>
<body>

	<div class="overlay-wrap" style="visibility: hidden;">
		<div class="character-modal-wrap">
			<div class="character-list all">
				<div class="character-image"></div>
				<div class="character-text">전체</div>
			</div>
			<div class="character-list ryan">
				<div class="character-image"></div>
				<div class="character-text">라이언</div>
			</div>
			<div class="character-list apeach">
				<div class="character-image"></div>
				<div class="character-text">어피치</div>
			</div>
			<div class="character-list muzi">
				<div class="character-image"></div>
				<div class="character-text">무지</div>
			</div>
			<div class="character-list frodo">
				<div class="character-image"></div>
				<div class="character-text">프로도</div>
			</div>
			<div class="character-list neo">
				<div class="character-image"></div>
				<div class="character-text">네오</div>
			</div>
			<div class="character-list tube">
				<div class="character-image"></div>
				<div class="character-text">튜브</div>
			</div>
			<div class="character-list jay">
				<div class="character-image"></div>
				<div class="character-text">제이지</div>
			</div>
			<div class="character-list con">
				<div class="character-image"></div>
				<div class="character-text">콘</div>
			</div>
			<div class="character-list choonsic">
				<div class="character-image"></div>
				<div class="character-text">춘식</div>
			</div>
			<div class="character-list jordy">
				<div class="character-image"></div>
				<div class="character-text">죠르디</div>
			</div>
			<div class="character-list scappy">
				<div class="character-image"></div>
				<div class="character-text">스카피</div>
			</div>
			<div class="character-list angmond">
				<div class="character-image"></div>
				<div class="character-text">앙몬드</div>
			</div>
			<div class="character-list pendaJr">
				<div class="character-image"></div>
				<div class="character-text">팬다주니어</div>
			</div>
			<div class="character-list kereberony">
				<div class="character-image"></div>
				<div class="character-text">케로&베로니</div>
			</div>
			<div class="character-list kumdori">
				<div class="character-image"></div>
				<div class="character-text">꿈돌이</div>
			</div>
		</div>
	</div>
	<div id="kakao-wrap">
		<div id="kakao-head">
			<div id="inner-head">
				<div class="left-btn">
					<!-- <button class="hamburger-menu"></button> -->
					<button class="back-button"></button>
					<!-- ic_back_2x.png -->
					<!-- gnb-home-18-black@2x.png -->
					<button class="home-button"></button>
				</div>
				<!-- <div class="title"><button class="title-logo"></button></div> -->
				<div class="title">검색</div>
				<div class="right-btn">
					<button class="search"></button>
					<button class="language"></button>
					<!-- 검색 돋보기 아이콘 클릭 시 전체 검색 창-->
					<div id="search-wrap" style="display: none;">
						<div id="inner-search">
							<div class="search-form">
								<form action="searchresult.action" method="GET"
									id="search_enter">
									<input class="search-input" type="text" name="inputName" autocomplete="off"/>
								</form>
								<button class="search-close">취소</button>
							</div>
							<div class="search-bottom">
								<div class="search-result">
									<!-- 여기서 검색엔진을 통해 품목을 불러와준다. -->
									<ul id="search-content-prod">
										<!-- 상품이름 리스트 -->
									</ul>
								</div>
								<div class="character-wrap">
									<ul>
										<li class="character-li"><a href="#" class="ryan"></a>
											<p>라이언</p></li>
										<li class="character-li"><a href="#" class="apeach"></a>
											<p>어피치</p></li>
										<li class="character-li"><a href="#" class="muzi"></a>
											<p>무지</p></li>
										<li class="character-li"><a href="#" class="frodo"></a>
											<p>프로도</p></li>
										<li class="character-li"><a href="#" class="neo"></a>
											<p>네오</p></li>
										<li class="character-li"><a href="#" class="tube"></a>
											<p>튜브</p></li>
										<li class="character-li"><a href="#" class="jayz"></a>
											<p>제이지</p></li>
										<li class="character-li"><a href="#" class="con"></a>
											<p>콘</p></li>
										<li class="character-li"><a href="#" class="choonsic"></a>
											<p>춘식</p></li>
										<li class="character-li"><a href="#" class="jordy"></a>
											<p>죠르디</p></li>
										<li class="character-li"><a href="#" class="scappy"></a>
											<p>스카피</p></li>
										<li class="character-li"><a href="#" class="angmond"></a>
											<p>앙몬드</p></li>
										<li class="character-li"><a href="#" class="pendajr"></a>
											<p>팬다주니어</p></li>
										<li class="character-li"><a href="#" class="kereberony"></a>
											<p>케로&베로니</p></li>
										<li class="character-li"><a href="#" class="kumdori"></a>
											<p>꿈돌이</p></li>
									</ul>
								</div>
								<hr>
								<div class="category-wrap">
									<div class="title">카테고리</div>
									<ul>
										<li class="category-li"><a href="#">전체</a></li>
										<li class="category-li"><a href="#">토이</a></li>
										<li class="category-li"><a href="#">리빙</a></li>
										<li class="category-li"><a href="#">잡화</a></li>
										<li class="category-li"><a href="#">문구</a></li>
										<li class="category-li"><a href="#">의류</a></li>
										<li class="category-li"><a href="#">디지털</a></li>
										<li class="category-li"><a href="#">여행/레져</a></li>
										<li class="category-li"><a href="#">식품</a></li>
										<li class="category-li"><a href="#">테마 기획전</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="inner-tab">
				<!-- 메인메뉴 tab -->
				<!-- <div class="main-tab">
        <ul class="main-tab-ul">
          <li class="main-tab-li">오늘</li>
          <li class="main-tab-li">신규</li>
          <li class="main-tab-li">인기</li>
          <li class="main-tab-li active">마이</li>
        </ul>
      </div> -->
				<!-- 마이페이지 tab -->
				<!-- <div class="mypage-tab">
        <ul class="mypage-tab-ul">
          <li class="mypage-tab-li">최근 본</li>
          <li class="mypage-tab-li active">내 활동</li>
          <li class="mypage-tab-li">장바구니</li>
          <li class="mypage-tab-li ">주문내역</li>
        </ul>
      </div> -->
			</div>
		</div>
		<div id="kakao-content">
			<div id="inner-content">
				<!-- 마이페이지 컨텐츠 -->
				<div class="container-wrap product-search-result">
					<!-- 검색 결과 배너 -->
					<div class="search-banner">
						<span class="search-text"><b>'${userinputName}'</b> 검색결과</span>
					</div>
					<hr class="division" />
					<!-- ##### 마이페이지랑 데이터 없을 때 태그 위치가 다릅니다 ##### -->
					
					<c:if test = "${searchProdCount == 0}">
					<!-- 데이터 없을 시 -->
					<div class="search-list-nodata">
						<div class="standing-ryan"></div>
						<div class="empty-message">검색 결과가 없습니다.</div>
						<div class="empty-sub-message">다른 검색어를 입력하시거나,</div>
						<div class="empty-sub-message">철자 및 띄어쓰기를 확인해주세요.</div>
					</div>
					</c:if>
					
					<c:if test = "${searchProdCount != 0}">
					<!-- 데이터 있을 시 -->
					<!-- 상품 정렬 및 개수 -->
					<div class="search-header" >
						<div class="sort-wrap">
							<div class="sort">
								<span class="sort-title">캐릭터 전체</span> <img class="sort-icon"
									src="/SYJ_Mall/resources/images/product_category/dropdown_down.png" />
							</div>
							<div class="sort-divider"></div>
							<div class="sort">
								<span class="sort-title">판매량 순</span> <img class="sort-icon"
									src="/SYJ_Mall/resources/images/product_category/dropdown_down.png" />
							</div>
						</div>
						<div class="detail">
							<div class="all-count">
								총 <b>${searchProdCount}</b>개
							</div>
							<div class="check-global">
								<img src="/SYJ_Mall/resources/images/product_category/ico_checked.png" /> <span>글로벌
									배송 가능상품 보기</span>
							</div>
						</div>
					</div>
					
					
					<!-- 해당 검색 상품 영역 -->
					<div class="search-product-wrap" style="border: 1px solid red;">
						<ul id = "search-item-lists">
							
							<!-- 여기서부터 조건이 붙어야 한다.***** -->
							<c:forEach var="dto" items="${searchProdto}">

								<c:if test="${dto.prodCnt eq 0}">
								<!-- 상품재고가 없는 경우 -->
								<li class="item-li" id="prodt${dto.prodId}">
                					<div class="thumbnail" style="background-image : url('${dto.picUrl}'); "><div class="soldout-label"></div></div>
                					<div class="name">
                						<div class="nametext">${dto.prodNm}</div>
                						<span class="alarm"></span>
                					</div>
                					<div class="price">${dto.prodPrice} 원</div>
              					</li>
              					</c:if>
              					
              					
              					<c:if test="${dto.prodCnt ne 0 && dto.discRate eq 0}">
              					<!-- 상품재고는 있고 할인이 없는경우 -->
									<li class="item-li" id="prodt${dto.prodId}"> 	
                						<div class="thumbnail" style="background-image : url('${dto.picUrl}'); "></div>
                						<div class="name">
                							<div class="nametext">${dto.prodNm}</div>
                							<span class="cart"></span>
                						</div>
                						<div class="price">${dto.prodPrice} 원</div>
              						</li>
              					</c:if>
              					
              					
              					<c:if test="${dto.prodCnt ne 0 && dto.discRate ne 0}">
              					<!-- 상품재고는 있고 할인이 있는 경우 -->
									<li class="item-li" id="prodt${dto.prodId}">	
                						<div class="thumbnail" style="background-image : url('${dto.picUrl}'); "></div>
                						<div class="name">
                							<div class="nametext">${dto.prodNm}</div>
                							<span class="cart"></span>
                						</div>
                						<div class="price" style="color : #FF447F;">${dto.discRate}% ${dto.dcPrice}원</div>
                						<div class="price" style="text-decoration:line-through; color : #9A9A9E;">${dto.prodPrice}원</div>
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

let searchYn = -1;//검색창을 켰는지 안켰는지 구분해주는 숫자  -1 이 안켜짐 1이 켜짐
let checkdDevice = 0;//맨처음 디바이스 체크!

//PC, MOBILE 구별
function deviceCheck() {
	// 디바이스 종류 설정
	var pcDevice = "win16|win32|win64|mac|macintel";

	// 접속한 디바이스 환경
	if (navigator.platform) {
		if (pcDevice.indexOf(navigator.platform.toLowerCase()) < 0) {
			return 1//mobile 인 경우
		} else {
			return 2;//pc 인경우
		}
	}
}

$(document).ready(
		function() {

			/*----------------------- 검색관련 -------------------------------*/
			$('.search').click(function() {
				searchYn *= -1;
				const devcheck = deviceCheck();

				if (searchYn == 1) {
					$('#search-wrap').css('z-index', 9999);
					$('#search-wrap').css('display', 'flex');
					$('#kakao-content').css('display', 'none');

					$('body').css('height', '580px');
					$('html').css('height', '580px');

					if (deviceCheck() == 1) {
						$('.search-input').css('width', '300px');
					}

				} else {
					$('#search-wrap').css('z-index', -10);
					$('#search-wrap').css('display', 'none');
					$('#kakao-content').css('display', 'block');
				}
			});

			//검색창 쓸때 이벤트
			$('.search-input').keyup(function(e){
				
				//검색글자 길이
				const SEARCHLEN = $('.search-input').val().length;
				const SEARCHVAL = $('.search-input').val();
				
				//검색글자가 있으면 .search-bottom 을 숨김
				if (SEARCHLEN == 0) {
					searchVisible(0);
				} else {
					searchVisible(1);
					
					//검색엔진 불러오기
					$.ajax({
						type : "GET",
						url : "/SYJ_Mall/searchword.action",
						data : "inputWord=" + SEARCHVAL,
						dataType : "json",
						success : function(result) {
							//기존에 존재하는 li 태그 모두 지워줌
							$('.search-content-context').remove();
							
							//여기서 품목 불러오는 처리 수행해야함
							let prodLen = result.length;
							
							if (prodLen != 0 ) {
								for (let i = 0; i < prodLen; i++) {
									//키워드가 들어가는 품목 보여주기
									$('#search-content-prod').append(
											'<li class="search-content-context"><a href="/SYJ_Mall/searchresult.action?inputName=' + result[i].inputName+'&productSeq='+result[i].productSeq +'">'
											+ result[i].searchName + '</a></li>'
									)
								}
							}
						},
						error : function(a, b, c) {
							console.log(a, b, c);
						}
					});
				}

			});
			
			//엔터키 눌러준 경우에
			$('.search-input').keydown(function(e) {
				if (e.keyCode == 13) $('.search-input').submit();
			});
			
			
			
			//취소버튼
			$('.search-close').click(function() {
				$('.search-input').val('');
				searchVisible(0);
				searchYn = -1;
				$('#search-wrap').css('z-index', -10);
				$('#search-wrap').css('display', 'none');
				$('#kakao-content').css('display', 'block');
			});

			//검색결과에 따라 내용 숨길지 정해주는 함수
			function searchVisible(searchFlag) {
				if (searchFlag == 0) {
					$('.character-wrap').css('display', 'flex');
					$('.category-wrap').css('visibility', 'visible');
					$('.search-result').css('display', 'none');
				} else {
					$('.character-wrap').css('display', 'none');
					$('.category-wrap').css('visibility', 'hidden');
					$('.search-result').css('display', 'flex');
				}
			}

			/* 뒤로가기 관련 */
			$('.back-button').click(function(){
				location.href = "/SYJ_Mall/searchback.action";	
			});	
			
			/* 메인페이지로 보내주기 */
			$('.home-button').click(function(){
				location.href = "/SYJ_Mall/searchbackmain.action";	
			});

		});
		
		
		let totalProdCounting  = ${searchProdCount};
		let totalPagingCount = ${pageAjaxCount};
		let paging = 1;//페이징
		let height = 0;//높이지정
		const userinputName = "${userinputName}";//유저가 넘긴 검색단어정보
		
		//검색결과를 몇개씩 보여줄지 처리 -> ajax 처리
		window.addEventListener(
				"scroll",
				function scrollEvent(){
					
					console.log(totalPagingCount);
					
					const DEV = deviceCheck();
					
					if (checkdDevice == 0) {
						checkdDevice = 1;
						
						if (DEV == 1) {
							alert();
							$('#kakao-content').css('height','1200px');
							$('#inner-content').css('height','1200px');
							
						}
						else if (DEV == 2) {
							//pc인 경우
						
							$('#kakao-content').css('height','1405px');
							$('#inner-content').css('height','1405px');

							height = 1230;
							
						}
					} 
					
					
					const SCROLLED_HEIGHT = window.scrollY;
					const WINDOW_HEIGHT = window.innerHeight;
					const DOC_TOTAL_HEIGHT = document.body.offsetHeight;	
					

					if ((SCROLLED_HEIGHT + WINDOW_HEIGHT >= DOC_TOTAL_HEIGHT * 0.9) && paging < totalPagingCount) {
						
						alert("plus");
						paging++;
						alert(paging);
						
						const INNER = parseInt($('#inner-content').css('height').replace('px','')) + height;
						const KAKAO_CONTENT = parseInt($('#kakao-content').css('height').replace('px','')) + height;
						const BODY = parseInt($('body').css('height').replace('px','')) + height;
						const HTML = parseInt($('html').css('height').replace('px','')) + height;
						
						$('#inner-content').css('height',INNER + 'px');
						$('#kakao-content').css('height',KAKAO_CONTENT + 'px');
						$('body').css('height',BODY + 'px');
						$('HTML').css('height',HTML + 'px');
						
						$.ajax({
				        	type:"POST",
				            url: "/SYJ_Mall/searchresultscroll.action" ,
				            data : {"paging" : paging, "inputWord" : userinputName},
				            dataType : "json",
				            success : function(result) {
				                
				            	let selectCount = result.length;
				            	
				            	//console.log("selectCount : " + selectCount);
				            	
				            	for (let i = 0; i < selectCount; i++) {
				            		
				            		let url = "'" + result[i].picUrl + "'";
				            		
				            		//재고가 있는경우와 없는경우로 나눠준다.
				            		//1. 재고 없는 경우
				            		if (result[i].prodCnt == 0) {
				            			$('#search-item-lists').append(
							            		
						            			'<li class="item-li" id="prodt'+ result[i].prodId + '">'
												+	'<div class="thumbnail" style="background-image : url('+url+')"><div class="soldout-label"></div></div>'
												+	'<div class="name">'
												+		'<div class="nametext">' + result[i].prodNm + '</div>'  
												+		'<span class="cart"></span>'
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
								            		
					            					'<li class="item-li" id="prodt'+ result[i].prodId + '">'
													+	'<div class="thumbnail" style="background-image : url('+url+')"></div>'
													+	'<div class="name">'
													+		'<div class="nametext">' + result[i].prodNm + '</div>'  
													+ 		'<span class="cart"></span>'
													+	'</div>'
													+	'<div class="price">' + result[i].prodPrice + '원</div>'
													+'</li>'
										            	
								            	);
					            		} 
					            		//2. 할인되는 품목인 경우
					            		else {
					            			$('#search-item-lists').append(
								            		
					            					'<li class="item-li" id="prodt'+ result[i].prodId + '">'
													+	'<div class="thumbnail" style="background-image : url('+url+')"></div>'
													+	'<div class="name">'
													+		'<div class="nametext">' + result[i].prodNm + '</div>'  
													+ 		'<span class="cart"></span>'
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
		$(document).on("click",".cart",function(e){
			
			let prodt_id = $(this).parent().parent().attr('id');
			
			$(this).attr('class','incart');
			e.stopPropagation();  
		});
		
		$(document).on("click",".incart",function(e){
			let prodt_id = $(this).parent().parent().attr('id');
			
			$(this).attr('class','cart');
			e.stopPropagation();  
		});

		$(document).on("click",".alarm",function(e){
			let prodt_id = $(this).parent().parent().attr('id');
			
			$(this).attr('class','inalarm');
			e.stopPropagation();  
		});

		$(document).on("click",".inalarm",function(e){
			let prodt_id = $(this).parent().parent().attr('id');
			
			$(this).attr('class','alarm');
			e.stopPropagation();  
		});

		
		

</script>



</body>
</html>