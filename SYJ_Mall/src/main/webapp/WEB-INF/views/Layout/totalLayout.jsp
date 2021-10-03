<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>카카오 프렌즈샵</title>
<link rel = "stylesheet" href = "resources/css/mainLayout/mainTilesLayout.css">
<link rel = "stylesheet" href = "resources/css/mainLayout/searchLayout.css">
<link rel = "stylesheet" href = "resources/css/mainLayout/orderlist.css">
</head>
<body>
<!-- 모달 -->
<div id="mask"></div>
	
<div id="kakao-wrap">
      <div id="kakao-head">
        <div id="inner-head">
          <div class="left-btn">
            <!-- <button class="hamburger-menu"></button> -->
            <!-- hamburger-menu -->
            <input class="burger-check" type="checkbox" id="burger-check" />
            <label class="burger-icon" for="burger-check">
              <span class="burger-sticks"></span>
            </label>
            <!-- hamburger-menu open -->
            <div class="navigation">
              <div class="navigation-inner">
              <c:if test="${empty userinfo}">
              	<div class="user-info">
                  <u id=login-need>로그인</u>이 필요해요!
                  <span>비회원 주문조회</span>
                </div>
              </c:if>
              <c:if test="${not empty userinfo}">
              	<div class="user-info">
                  <u>${userinfo.userName}</u>님 반가워요!
                  <span>여기 바꿔야함</span>
                </div>
              </c:if>
                <div class="banner"></div>
                <div class="navigation-menu">
                  <ul class="navigation-menu-ul">
                    <li class="navigation-menu-li">장바구니 내역</li>
                    <li class="navigation-menu-li">주문·배송 내역</li>
                    <hr />
                    <li class="navigation-menu-li character-accordion-button">
                      캐릭터
                      <div class="drop-down"></div>
                    </li>
                    <div class="li-sub-menu character-menu">
                      <ul class="character-menu-ul">
                        <li class="character li-Ryan">라이언</li>
                        <li class="character li-Apeach">어피치</li>
                        <li class="character li-Muzi">무지</li>
                        <li class="character li-Frodo">프로도</li>
                        <li class="character li-Neo">네오</li>
                        <li class="character li-Tube">튜브</li>
                        <li class="character li-Jay">제이지</li>
                        <li class="character li-Con">콘</li>
                        <li class="character li-Choonsic">춘식</li>
                        <li class="character li-Jordy">죠르디</li>
                        <li class="character li-Scappy">스카피</li>
                        <li class="character li-Angmond">앙몬드</li>
                        <li class="character li-PendaJr">팬다주니어</li>
                        <li class="character li-Kereberony">케로&베로니</li>
                        <li class="character li-Kumdori">꿈돌이</li>
                      </ul>
                    </div>
                    <li class="navigation-menu-li category-accordion-button">
                      카테고리
                      <div class="drop-down"></div>
                    </li>
                    <div class="li-sub-menu category-menu">
                      <ul class="category-menu-ul">
                        <li class="category">전체</li>
                        <li class="category">테마 기획전</li>
                        <li class="category">토이</li>
                        <li class="category">리빙</li>
                        <li class="category">잡화</li>
                        <li class="category">문구</li>
                        <li class="category">의류</li>
                        <li class="category">파자마</li>
                        <li class="category">여행/레져</li>
                        <li class="category">생활테크</li>
                        <li class="category">폰 액세서리</li>
                        <li class="category">식품</li>
                      </ul>
                    </div>
                    <hr />
                    <li class="navigation-menu-li">공지사항</li>
                    <li class="navigation-menu-li">고객센터</li>
                    <hr />
                    <li class="navigation-menu-li">기프트카드 조회·환불</li>
                    <hr />
                    <li class="navigation-menu-li">브랜드 스토리</li>
                    <li class="navigation-menu-li">매장안내</li>
                    <hr />
                  </ul>
                </div>
                <c:if test="${empty userinfo}">
                	<div class="login-or-out">로그인</div>
              	</c:if>
              	<c:if test="${not empty userinfo}">
                	<div class="login-or-out">로그아웃</div>
              	</c:if>
              </div>
            </div>
          </div>
          <div class="title"><button class="title-logo"></button></div>
          <div class="right-btn">
            <button class="search"></button>
            <button class="language"></button>
            <!-- 검색 돋보기 아이콘 클릭 시 전체 검색 창-->
            <div id="search-wrap" style="display : none; overflow:scroll;">
	            <div id="inner-search">
	              <div class="search-form">
	                <form action = "searchresult.action" method="GET" id="search_enter">
	                  <input class="search-input" type="text" name="inputName" autocomplete="off"/>
	                </form>
	                <button class="search-close">취소</button>
	              </div>
	              <div class="search-bottom">
	                <div class = "search-result">
	                  <!-- 여기서 검색엔진을 통해 품목을 불러와준다. -->
	                  <ul id="search-content-prod"> 
	                 	<!-- 상품이름 리스트 -->
	                  </ul>
	                </div>
	                <div class="character-wrap">
	                  <ul>
	                    <li class="character-li"><a href="#" class="ryan"></a>
	                      <p>라이언</p>
	                    </li>
	                    <li class="character-li"><a href="#" class="apeach"></a>
	                      <p>어피치</p>
	                    </li>
	                    <li class="character-li"><a href="#" class="muzi"></a>
	                      <p>무지</p>
	                    </li>
	                    <li class="character-li"><a href="#" class="frodo"></a>
	                      <p>프로도</p>
	                    </li>
	                    <li class="character-li"><a href="#" class="neo"></a>
	                      <p>네오</p>
	                    </li>
	                    <li class="character-li"><a href="#" class="tube"></a>
	                      <p>튜브</p>
	                    </li>
	                    <li class="character-li"><a href="#" class="jayz"></a>
	                      <p>제이지</p>
	                    </li>
	                    <li class="character-li"><a href="#" class="con"></a>
	                      <p>콘</p>
	                    </li>
	                    <li class="character-li"><a href="#" class="choonsic"></a>
	                      <p>춘식</p>
	                    </li>
	                    <li class="character-li"><a href="#" class="jordy"></a>
	                      <p>죠르디</p>
	                    </li>
	                    <li class="character-li"><a href="#" class="scappy"></a>
	                      <p>스카피</p>
	                    </li>
	                    <li class="character-li"><a href="#" class="angmond"></a>
	                      <p>앙몬드</p>
	                    </li>
	                    <li class="character-li"><a href="#" class="pendajr"></a>
	                      <p>팬다주니어</p>
	                    </li>
	                    <li class="character-li"><a href="#" class="kereberony"></a>
	                      <p>케로&베로니</p>
	                    </li>
	                    <li class="character-li"><a href="#" class="kumdori"></a>
	                      <p>꿈돌이</p>
	                    </li>
	                  </ul>
	                </div>
	                <hr>
	                <div class="category-wrap">
	                  <div class="title">카테고리</div>
	                  <ul>
	                    <li class="category-li"><a href="#" >전체</a></li>
	                    <li class="category-li"><a href="#" >토이</a></li>
	                    <li class="category-li"><a href="#" >리빙</a></li>
	                    <li class="category-li"><a href="#" >잡화</a></li>
	                    <li class="category-li"><a href="#" >문구</a></li>
	                    <li class="category-li"><a href="#" >의류</a></li>
	                    <li class="category-li"><a href="#" >디지털</a></li>
	                    <li class="category-li"><a href="#" >여행/레져</a></li>
	                    <li class="category-li"><a href="#" >식품</a></li>
	                    <li class="category-li"><a href="#" >테마 기획전</a></li>
	                  </ul>
	                </div>
	              </div>
	            </div>
	          </div>
          </div>
        </div>
        <div id="inner-tab">
          <!-- 메인메뉴 tab -->
          <div class="main-tab">
            <ul class="main-tab-ul">
            	<c:if test="${seleted eq 'today'}">
              		<li class="main-tab-li active">오늘</li>
              		<li class="main-tab-li">신규</li>
              		<li class="main-tab-li">인기</li>
              		<li class="main-tab-li">마이</li>
              	</c:if>
            	<c:if test="${seleted eq 'new'}">
              		<li class="main-tab-li">오늘</li>
              		<li class="main-tab-li active">신규</li>
              		<li class="main-tab-li">인기</li>
              		<li class="main-tab-li">마이</li>
              	</c:if>
              	<c:if test="${seleted eq 'popular'}">
              		<li class="main-tab-li">오늘</li>
              		<li class="main-tab-li">신규</li>
              		<li class="main-tab-li active">인기</li>
              		<li class="main-tab-li">마이</li>
              	</c:if>
              	<c:if test="${seleted eq 'my'}">
              		<li class="main-tab-li">오늘</li>
              		<li class="main-tab-li">신규</li>
              		<li class="main-tab-li">인기</li>
              		<li class="main-tab-li active">마이</li>
              	</c:if>
            </ul>
          </div>
          <!-- 마이페이지 tab -->
          
          
        </div>
      </div>
      <div id="kakao-content">
        <div id="inner-content">
        	<!-- 여기에 타일즈 내용이 들어가야함 -->  
        	<tiles:insertAttribute name="body" ignore="false"/>
        </div>
      </div>
      
      <!-- footer -->
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
              <span class="toggler-logo"></span>
              <span class="toggler-icon"></span>
            </div>
            <div class="best-family"></div>
          </div>
        </div>
      </div>
    </div>
  

<script>

	let left_side_var_chr = false;// 왼쪽 사이드바 캐릭터 메뉴 구분
	let left_side_var_category = false;// 왼쪽 사이드바 카테고리 메뉴 구분

	let searchYn = -1;//검색창을 켰는지 안켰는지 구분해주는 숫자  -1 이 안켜짐 1이 켜짐

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

				// 왼쪽 사이드바 캐릭터 메뉴 -> 캐릭터탭 & 카테고리탭 누를때 처리1
				$("li.character-accordion-button").on(
						"click",
						function() {

							if (!left_side_var_chr) {
								$(".character-menu").css("display",
										"inline-block");
								left_side_var_chr = true;

								$(".character-accordion-button .drop-down")
										.css("transform", "rotate(180deg)");
							} else {
								$(".character-menu").css("display", "none");
								left_side_var_chr = false;

								$(".character-accordion-button .drop-down")
										.css("transform", "rotate(360deg)");
							}
						});

				// 왼쪽 사이드바 카테고리 메뉴 -> 캐릭터탭 & 카테고리탭 누를때 처리2
				$("li.category-accordion-button").on(
						"click",
						function() {

							if (!left_side_var_category) {
								$(".category-menu").css("display",
										"inline-block");
								$(".category-accordion-button .drop-down").css(
										"transform", "rotate(180deg)");
								left_side_var_category = true;
							} else {
								$(".category-menu").css("display", "none");
								$(".category-accordion-button .drop-down").css(
										"transform", "rotate(360deg)");
								left_side_var_category = false;
							}
						});

				//왼쪽 사이드바 클릭하면 나오게 되는것
				$("#burger-check").click(function() {
					openNavigation();

				});

				//모달제거 -> 바디를 아무데나 눌러서 사이드바 안보이게
				$('#mask').click(function() {

					$(this).hide();
					$('.window').hide();
					closeNavigation();
				});

				/* -----------로그인 관련------------ */
				//로그인 클릭 -> 네비게이션 상단
				$('#login-need').click(function() {
					closeNavigation();
					goLoginPage();
				});

				//로그인 클릭 -> 네비게이션 하단
				$('.login-or-out').click(function() {
					if ($(this).attr('id') == null) {
						closeNavigation();
						goLoginPage();
					} else {
						closeNavigation();
						//로그아웃 -> 처리해야함
						goLogOut();
					}
				});

				//로그인 처리
				function goLoginPage() {
					location.href = "/SYJ_Mall/login.action";
				}
				//로그아웃 처리
				function goLogOut() {
					location.href = "/SYJ_Mall/userLogout.action";
				}

				/* -----------네비게이션 바 관련------------ */
				//네비게이션 바 숨김처리
				function closeNavigation() {
					$("#burger-check").prop("checked", false);
					$(document.body).css('overflow', 'visible');
				}

				//네비게이션 바 보임처리
				function openNavigation() {

					//화면의 높이와 너비를 구한다.
					let maskHeight = $(document).height();
					let maskWidth = $(window).width();

					//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
					$('#mask').css({
						'width' : maskWidth,
						'height' : maskHeight
					});

					//애니메이션 효과    
					$('#mask').fadeTo("slow", 0.8);

					$(document.body).css('overflow', 'hidden');
				}

				/* 검색관련 */
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

			});
	
	
	
</script>
</body>
</html>