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
<link rel = "stylesheet" href = "resources/css/mainLayout/mainTotalLayout.css"> 
</head>
<body>
	 <div id="mask"></div>
    <div id="kakao-wrap">
        <div id="kakao-head" >
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
                            <div class="navigation-inner" >
                            <div class="user-info"><U>로그인</U>이 필요해요!
                                <span>비회원 주문조회</span>
                            </div>
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
                            <div class="login-or-out">로그인</div>
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
                            <li class="main-tab-li active">오늘</li>
                            <li class="main-tab-li">신규</li>
                            <li class="main-tab-li">인기</li>
                            <li class="main-tab-li">마이</li>
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
		// 왼쪽 사이드바 캐릭터 메뉴
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
	
		// 왼쪽 사이드바 카테고리 메뉴
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
	});
    
    
    
    $(".language").click(function(){
        //$("#myModal").modal();
        $("#burger-check").prop("checked", false);
        $(".navigation").css("left",-325);
        $(".navigation-inner").css("left",-325);
    });

    var check = false;

    $("#burger-check").click(function(){
        wrapWindowByMask();
         
    });

    $(".item").click(function(){
        alert('tlqkf');
    });

    $('#mask').click(function () {  
        $(this).hide();  
        $('.window').hide(); 
         $("#burger-check").prop("checked", false);
        //$('.window').css('background-color','#FFF'); 
    }); 

    // if (check == false) {
        //     //$(".navigation").css("left",0);
            
        //     //$(".navigation-inner").css("left",0);
           
        //     //check = true;
        // }

        // if ( $("#burger-check").is(":checked") == false){
        //     alert('asd');
            
        //     //$("body").css("background-color",'#4C4C4C');
        // } else {
            
        //     $(".navigation").css("left",-325);
        //     $(".navigation-inner").css("left",-325);
        // }

    //닫기 버튼을 눌렀을 때
    // $('.window .close').click(function (e) {  
    //     //링크 기본동작은 작동하지 않도록 한다.
    //     e.preventDefault();  
    //     $('#mask, .window').hide();  
    // });    

    // $(document).ready(function(){
    //     //검은 막 띄우기
    //     $('#burger-check').click(function(e){
    //         e.preventDefault();
    //         //if ( $("#burger-check").is(":checked")){
    //         //$(".navigation").css("left",0);
    //         //$(".navigation-inner").css("left",0);
    //         //$("body").css("background-color",'#4C4C4C');
    //         //} 
    //         wrapWindowByMask();
    //     });

           

    //     //검은 막을 눌렀을 때
    //     $('#mask').click(function () {  
    //         $(this).hide();  
    //         $('.window').hide(); 
    //         //$('.window').css('background-color','#FFF'); 
    //     });      
    // });
    
    function wrapWindowByMask(){
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height();  
        var maskWidth = $(window).width();  
		
        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $('#mask').css({'width':maskWidth,'height':maskHeight});  
		
        //애니메이션 효과
        //$('#mask').fadeIn(1000);      
        $('#mask').fadeTo("slow",0.8);    
    }

    


    //4C4C4C
</script>
</body>
</html>