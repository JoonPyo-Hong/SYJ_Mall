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
<link rel = "stylesheet" href = "resources/css/mainLayout/mainLayout.css"> 
</head>
<body>
	<!-- 모달 -->
	<div id="mask"></div>
    
    <!-- 레이아웃 -->
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
                            	<div class="user-info"><U id="login-need">로그인</U>이 필요해요!
                                	<span>비회원 주문조회</span>
                            	</div>
                            </c:if>
                            <c:if test="${not empty userinfo}">
                            	<div class="user-info"><U>${userinfo.userName}</U>님 반가워요!
                                	<span>여기 바꿔야함</span>
                            	</div>
                            </c:if>
                            <div class="banner"></div>
                            <div class="navigation-menu">
                                <ul class="navigation-menu-ul">
                                    <li class="navigation-menu-li">장바구니 내역</li>
                                    <li class="navigation-menu-li">주문·배송 내역</li>
                                    <hr>
                                    <li class="navigation-menu-li character-accordion-button">캐릭터<div class="drop-down"></div>
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
                                    <li class="navigation-menu-li category-accordion-button">카테고리<div class="drop-down"></div></li>
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
                                    <hr>
                                    <li class="navigation-menu-li">공지사항</li>
                                    <li class="navigation-menu-li">고객센터</li>
                                    <hr>
                                    <li class="navigation-menu-li">기프트카드 조회·환불</li>
                                    <hr>
                                    <li class="navigation-menu-li">브랜드 스토리</li>
                                    <li class="navigation-menu-li">매장안내</li>
                                    <hr>
                                </ul>
                            </div>
                            <c:if test="${empty userinfo}">
                            	<div class="login-or-out">로그인</div>
                            </c:if>
                            <c:if test="${not empty userinfo}">
                            	<div class="login-or-out" id="asd">로그아웃</div>
                            </c:if>
                            </div>
                	</div>
                </div>
                <div class="title"><button class="title-logo"></button></div>
                <div class="right-btn">
                    <button class="search"></button>
                    <button class="language"></button>
                </div>
            </div>
            
            <div id="kakao-content">
                <div id="inner-content">
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
                     <!-- 내용 타일즈 -->
					<tiles:insertAttribute name="body" ignore="false"/>
					
                 </div>           
            </div>
        </div>
    </div>


<script>
	

	var left_side_var_chr = false;// 왼쪽 사이드바 캐릭터 메뉴 구분
	var left_side_var_category = false;// 왼쪽 사이드바 카테고리 메뉴 구분
	
	$(document).ready(function() {
		
		// 왼쪽 사이드바 캐릭터 메뉴 -> 캐릭터탭 & 카테고리탭 누를때 처리1
		$("li.character-accordion-button").on("click", function () {
	
			if (!left_side_var_chr) {
	    		$(".character-menu").css("display", "inline-block");
	    		left_side_var_chr = true;
	    
		    	$(".character-accordion-button .drop-down").css(
		        	"transform",
	        		"rotate(180deg)"
	    		);   
			} else {
		    	$(".character-menu").css("display", "none");
		    	left_side_var_chr = false;
	
	    		$(".character-accordion-button .drop-down").css(
	        		"transform",
	        		"rotate(360deg)"
	    		);
			}
		});
		
		// 왼쪽 사이드바 카테고리 메뉴 -> 캐릭터탭 & 카테고리탭 누를때 처리2
		$("li.category-accordion-button").on("click", function () {
	
		    if (!left_side_var_category) {
		        $(".category-menu").css("display", "inline-block");
		        $(".category-accordion-button .drop-down").css(
		            "transform",
		            "rotate(180deg)"
		        );
		        left_side_var_category = true;
		    } else {
		        $(".category-menu").css("display", "none");
		        $(".category-accordion-button .drop-down").css(
		            "transform",
		            "rotate(360deg)"
		        );
		        left_side_var_category = false;
		    }    
		});
		
		
		//왼쪽 사이드바 클릭하면 나오게 되는것
		$("#burger-check").click(function(){
		    //모달 띄우기    
			wrapWindowByMask();
		    //스크롤 이벤트 막기
			$(document.body).css('overflow','hidden');
			
		});
		
		//모달제거 -> 바디를 아무데나 눌러서 사이드바 안보이게
		$('#mask').click(function () {  
				
			$(this).hide();  
			$('.window').hide(); 
			$("#burger-check").prop("checked", false);
			//스크롤 이벤트 막기 제거
			$(document.body).css('overflow','visible');

		}); 
		
		

	    function wrapWindowByMask(){
	        //화면의 높이와 너비를 구한다.
	        var maskHeight = $(document).height();  
	        var maskWidth = $(window).width();  
			
	        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	        $('#mask').css({'width':maskWidth,'height':maskHeight});  
			
	        //애니메이션 효과    
	        $('#mask').fadeTo("slow",0.8);    
	    }
		
	    
	    //-----------로그인 관련------------
	    //로그인 클릭
	    $('#login-need').click(function(){
	    	goLoginPage();
	    });
	    
	    $('.login-or-out').click(function(){
	    	if ($(this).attr('id') == null) {
	    		goLoginPage();
	    	} else {
	    		//로그아웃 -> 처리해야함
	    		//goLoginPage();
	    		location.href = "/SYJ_Mall/userLogout.action";
	    	}
	    	
	    });
	    
	    function goLoginPage(){
	    	location.href = "/SYJ_Mall/login.action";
	    }
		
	});


    
</script>
</body>
</html>