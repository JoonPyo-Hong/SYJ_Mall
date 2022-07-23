<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>카카오 프렌즈샵</title>
<link rel="stylesheet" href="resources/css/mainLayout/mainTilesLayout.css">
<link rel="stylesheet" href="resources/css/mainLayout/searchLayout.css">
<link rel="stylesheet" href="resources/css/mainLayout/orderlist.css">
<link rel="stylesheet" href="resources/css/mainLayout/loginModal2.css">

<style>
.user-info_login span {
    display:inline-block;
    width: 24px;
    height: 24px;
 	background: url(/SYJ_Mall/resources/images/login/ico_friends.png) 0 0  no-repeat;
  	background-size: 700px;
    background-position: -280px -60px;

}

.user-info_login:hover {
	cursor : pointer;
}

</style>

</head>

<body style="overflow-y: scroll;">
	<!-- 모달 -->
	<div id="mask"></div>

	<!-- 로그인 모달1 -->
	<div class="overlay-wrapper" id="login-product-modal" style="z-index:20;">
		<div class="login-modal-wrap">
			<div class="modal-close">
				<div class="close-btn"></div>
			</div>
			<img class="login-img"
				src="/SYJ_Mall/resources/images/login_modal/character-3-d-apeach-128-2.png" />
			<div class="login-text">
				<h3>앗! 로그인</h3>
				<p>
					로그인 후 재입고 알림을 신청해주세요<br/> 지금 로그인 화면으로 이동하시겠어요?
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
	
	
	<!-- 로그인 모달 2-->
	<div class="overlay-wrapper" id="login-product-modal_2" style="z-index:20;">
		<div class="login-modal-wrap">
			<div class="modal-close">
				<div class="close-btn"></div>
			</div>
			<img class="login-img"
				src="/SYJ_Mall/resources/images/login_modal/character-3-d-apeach-128-2.png" />
			<div class="login-text">
				<h3>앗! 로그인</h3>
				<p>
					앗 깜빡! 로그인하고 이용하기❤️
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
	 <!-- 공유하기 팝업창 -->
    <div class="overlay-wrap" id="testmodal1" style="visibility: hidden">
      <div class="share-modal-wrap">
        <div class="header">
          <div class="title">공유하기</div>
          <div class="close"></div>
        </div>
        <div class="list-share">
          <div class="list-share-btn kakao"></div>
          <div class="list-share-btn facebook"></div>
          <div class="list-share-btn url-copy"></div>
        </div>
      </div>
    </div>

	<div id="kakao-wrap">
		<div id="kakao-head" >
			<div id="inner-head" style="background-color : #FFFFFF;">
				<div class="left-btn">
					<!-- <button class="hamburger-menu"></button> -->
					<!-- hamburger-menu -->
					<input class="burger-check" type="checkbox" id="burger-check" /> <label
						class="burger-icon" for="burger-check"> <span
						class="burger-sticks"></span>
					</label>
					<!-- hamburger-menu open -->
					<div class="navigation">
						<div class="navigation-inner">
							<c:if test="${empty userinfo}">
								<div class="user-info">
									<u id=login-need>로그인</u>이 필요해요! <span id="not_user_buy_history">비회원 주문조회</span>
								</div>
							</c:if>
							<c:if test="${not empty userinfo}">
								<div class="user-info_login">
									<u>${userinfo.userName}</u>님 반가워요! <span></span>
								</div>
							</c:if>
							<div class="banner"></div>
							<div class="navigation-menu">
								<ul class="navigation-menu-ul">
									<li class="navigation-menu-li" onclick="location.href = '/SYJ_Mall/myPageMain.action?myPageNum=3'">장바구니 내역</li>
									<li class="navigation-menu-li" onclick="location.href = '/SYJ_Mall/myPageMain.action?myPageNum=4'">주문·배송 내역</li>
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
											<li class="category" value = "1">전체</li>
											<li class="category" value = "2">토이</li>
											<li class="category" value = "3">리빙</li>
											<li class="category" value = "4">잡화</li>
											<li class="category" value = "5">문구</li>
											<li class="category" value = "6">의류</li>
											<li class="category" value = "7">디지털</li>
											<li class="category" value = "8">여행/레져</li>
											<li class="category" value = "9">식품</li>
											<li class="category" value = "10">테마 기획전</li>
										</ul>
									</div>
									<hr />
									<li class="navigation-menu-li" id = "notice">공지사항</li>
									<li class="navigation-menu-li">고객센터</li>
									<hr />
									<li class="navigation-menu-li">기프트카드 조회·환불</li>
									<hr />
									<li class="navigation-menu-li">브랜드 스토리</li>
									<li class="navigation-menu-li" id = "marketPlace">매장안내</li>
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
				<div class="title">
					<button class="title-logo"></button>
				</div>
				<div class="right-btn">
					<button class="search"></button>
					<button class="language"></button>

				</div>
			</div>
			<div id="inner-tab">
				<!-- 메인메뉴 tab -->
				<div class="main-tab">
					<ul class="main-tab-ul">
						<c:if test="${seleted eq 'today'}">
							<li class="main-tab-li active" id="main_today">오늘</li>
							<li class="main-tab-li" id="main_new">신규</li>
							<li class="main-tab-li" id="main_popular">인기</li>
							<li class="main-tab-li" id="main_my">마이</li>
						</c:if>
						<c:if test="${seleted eq 'new'}">
							<li class="main-tab-li" id="main_today">오늘</li>
							<li class="main-tab-li active" id="main_new">신규</li>
							<li class="main-tab-li" id="main_popular">인기</li>
							<li class="main-tab-li" id="main_my">마이</li>
						</c:if>
						<c:if test="${seleted eq 'popular'}">
							<li class="main-tab-li" id="main_today">오늘</li>
							<li class="main-tab-li" id="main_new">신규</li>
							<li class="main-tab-li active" id="main_popular">인기</li>
							<li class="main-tab-li" id="main_my">마이</li>
						</c:if>
						<c:if test="${seleted eq 'my'}">
							<li class="main-tab-li" id="main_today">오늘</li>
							<li class="main-tab-li" id="main_new">신규</li>
							<li class="main-tab-li" id="main_popular">인기</li>
							<li class="main-tab-li active" id="main_my">마이</li>
						</c:if>
						<c:if test="${empty seleted}">
							<li class="main-tab-li active" id="main_today">오늘</li>
							<li class="main-tab-li" id="main_new">신규</li>
							<li class="main-tab-li" id="main_popular">인기</li>
							<li class="main-tab-li" id="main_my">마이</li>
						</c:if>
					</ul>
				</div>
				<!-- 마이페이지 tab이 들어가야함 -->
				<c:if test="${seleted eq 'my'}">
					<div class="mypage-tab">
						<ul class="mypage-tab-ul">
							<c:if test="${myPageNum eq 1}">
								<li class="mypage-tab-li active" value="1">최근 본</li>
								<li class="mypage-tab-li" value="2">내 활동</li>
								<li class="mypage-tab-li" value="3">장바구니 
								<!-- <span class="basket-count">2</span> -->
								</li>
								<li class="mypage-tab-li" value="4">주문내역</li>
							</c:if>
							<c:if test="${myPageNum eq 2}">
								<li class="mypage-tab-li" value="1">최근 본</li>
								<li class="mypage-tab-li active" value="2">내 활동</li>
								<li class="mypage-tab-li" value="3">장바구니 
								<!-- <span class="basket-count">2</span> -->
								</li>
								<li class="mypage-tab-li" value="4">주문내역</li>
							</c:if>
							<c:if test="${myPageNum eq 3}">
								<li class="mypage-tab-li" value="1">최근 본</li>
								<li class="mypage-tab-li" value="2">내 활동</li>
								<li class="mypage-tab-li active" value="3">장바구니 
								<!-- <span class="basket-count">2</span> -->
								</li>
								<li class="mypage-tab-li" value="4">주문내역</li>
							</c:if>
							<c:if test="${myPageNum eq 4}">
								<li class="mypage-tab-li" value="1">최근 본</li>
								<li class="mypage-tab-li" value="2">내 활동</li>
								<li class="mypage-tab-li" value="3">장바구니 
								<!-- <span class="basket-count">2</span> -->
								</li>
								<li class="mypage-tab-li active" value="4">주문내역</li>
							</c:if>
							
						</ul>
					</div>
				</c:if>

			</div>
		</div>
		<div id="kakao-content" style="overflow: scroll;">
			<div id="inner-content">
			<!-- style="overflow: scroll;" -->
				<!-- 여기에 타일즈 내용이 들어가야함 -->
				<tiles:insertAttribute name="body" ignore="false" />
			</div>
		</div>
	</div>


	<script>
			
	
				let left_side_var_chr = false;// 왼쪽 사이드바 캐릭터 메뉴 구분
				let left_side_var_category = false;// 왼쪽 사이드바 카테고리 메뉴 구분

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

					//$(this).hide();
					//$('.window').hide();
					//closeNavigation();
					black_out_end();
				});
				
				//모달제거 -> 검은색 배경화면 없애는 것.
				function black_out_end() {
					$('#mask').hide();
					$('.window').hide();
					closeNavigation();
				}

				/* -----------로그인 관련------------ */
				//로그인 되어있는지 체크해주는 함수
				function login_check() {
					
					let login_value = -1;
					
					$.ajax({
						type : "GET",
						url : "/SYJ_Mall/loginChecking.action",
						async : false,
						dataType : "json",
						success : function(result) {
							
							login_value = result;
						},
						error : function(a, b, c) {
							console.log(a, b, c);
							
						}
					});
					
					return login_value;
				}
			

				//로그인 클릭 -> 네비게이션 상단
				$('#login-need').click(function() {
					closeNavigation();
					goLoginPage();
				});

				//로그인 또는 로그아웃 클릭 -> 네비게이션 하단
				$('.login-or-out').click(function() {

					let login_checked = login_check();
					
					if (login_checked == -1) {
						closeNavigation();
						goLoginPage();
					} else {
						closeNavigation();
						//로그아웃 -> 처리해야함
						goLogOut();
					}
				});
				
				let login_etc_info_checking = 1;
				let login_etc_info = "";
				
				//로그인 처리
				function goLoginPage() {
					if (login_etc_info_checking == 1) location.href = "/SYJ_Mall/login.action";
					else {
						//console.log(login_etc_info);
						location.href = "/SYJ_Mall/login.action?addUrl=" +login_etc_info;
					}
				}
				//로그아웃 처리
				function goLogOut() {
					location.href = "/SYJ_Mall/userLogout.action";
				}

				/* -----------네비게이션 바 관련------------ */
				//네비게이션 바 숨김처리
				function closeNavigation() {
					$("#burger-check").prop("checked", false);
					//$('#mask').fadeTo("slow", 0);
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
					location.href = "/SYJ_Mall/searchStart.action";
				});


			
			//로그인 모달 열기
			function login_modal_open() {
			    const scrollLocation = window.scrollY;
				$('#login-product-modal').css('top',scrollLocation + 'px');
			    $(document.body).css('overflow', 'hidden');
			}
			
			//로그인 모달 닫기
			function login_modal_close() {
				$('#login-product-modal').css('top','-1400px');
			    $(document.body).css('overflow', 'scroll');
			}
			
			//로그인 모달창 로그인하기
		  	$(document).on("click",".login-btn",function(){
		  		goLoginPage();
			});
			
		  	//로그인 모달창 돌아가기
			$(document).on("click",".close-btn",function(){
				login_modal_close();
				my_login_modal_close();
			});
			
			/* -----------오늘/신규/인기/마이 탭 이동하기------------ */
		  	$('.main-tab-li').click(function(){
		  		
		  		const main_val = $(this).attr('id');
		  		
		  		if (main_val == 'main_today') location.href = "/SYJ_Mall/main.action";
		  		else if (main_val == 'main_new') location.href = "/SYJ_Mall/newProductMain.action";
		  		else if (main_val == 'main_popular') location.href = "/SYJ_Mall/popularMain.action";
		  		else location.href = "/SYJ_Mall/myPageMain.action";
		  		
		  	});
			
			/* -----------왼쪽 슬라이드 페이지 관련 -----------*/
			
			//캐릭터 눌러줄때 -> 캐릭터 관련 페이지 이동
			$('.character').click(function(){
				const charName = $(this).attr('class');
				black_out_end();
				location.href = "/SYJ_Mall/charAtProdtStartSlide.action?charName=" + charName;
				//closeNavigation();//왼쪽모달 없애주기	
			});
			
			//카테고리 눌러 줄 때
			$('.category').click(function(){
				const cateName = $(this).val();
				black_out_end();
				location.href = "/SYJ_Mall/newProductMainAdd.action?themeNum=" + cateName;
			});
			
			$('#notice').click(function(){
				location.href = "/SYJ_Mall/notice_list.action";
				closeNavigation();//왼쪽모달 없애주기
			});
			
			$('#marketPlace').click(function(){
				location.href = "/SYJ_Mall/info.action";
				closeNavigation();//왼쪽모달 없애주기
			});
			
			/* -----------마이페이지 탭 관련-----------*/
			$('.mypage-tab-li').click(function(){
				
				const page_value = $(this).val();
				
				if (page_value == 1 || page_value == 3) {
					location.href = "/SYJ_Mall/myPageMain.action?myPageNum="+page_value;
					//break;
				} else {
					if ( login_check() == 1) {
						location.href = "/SYJ_Mall/myPageMain.action?myPageNum="+page_value;
					}
					else {
						login_etc_info_checking = 2;
						login_etc_info = "myPageMain.action?myPageNum="+page_value;
						my_login_modal_open();
					}
				}
			});
			
			//로그인 모달 열기
			function my_login_modal_open() {
			    const scrollLocation = window.scrollY;
				$('#login-product-modal_2').css('top',scrollLocation + 'px');
			    $(document.body).css('overflow', 'hidden');
			}
			
			//로그인 모달 닫기
			function my_login_modal_close() {
				$('#login-product-modal_2').css('top','-1400px');
			    $(document.body).css('overflow', 'scroll');
			}
			
			//user-info_login
			$(document).on("click", ".user-info_login", function() {
				location.href = "/SYJ_Mall/myInfoEdited.action";
			});
			
			
	</script>
</body>
</html>