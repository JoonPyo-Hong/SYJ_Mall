<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/main.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="icon" href="resources/images/main/kakao_ryan.ico">
<%-- <script><%@ include file ="/resources/js/main/main.js"%></script> --%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<title>Main</title>

</head>
<body>

	<div id="wrap">
		<div id="head">
			<div>
				<img src="resources/images/main/ic_menu_2x.png"></img>
			</div>
			<div>
				<img src="resources/images/main/new-logo-mo.png"></img>
			</div>
			<div>
				<img src="resources/images/main/ic_search_2x.png"></img>
			</div>
			<div>
				<img src="resources/images/main/language-global-18-black@2x.png"></img>
			</div>
		</div>
		<div id="tab">
			<div class="tab_selected">오늘</div>
			<div>신규</div>
			<div>인기</div>
			<div>마이</div>
		</div>
		<div class="scroll"></div>
	</div>
</body>
<script type="text/javascript">

var count = 0;
window.onload = function() {
	list();
}

window.addEventListener(
				"scroll",
				function() {
					const SCROLLED_HEIGHT = window.scrollY;
					const WINDOW_HEIGHT = window.innerHeight;
					const DOC_TOTAL_HEIGHT = document.body.offsetHeight;

					const IS_BOTTOM = WINDOW_HEIGHT + SCROLLED_HEIGHT === DOC_TOTAL_HEIGHT;

					if (IS_BOTTOM) {
						console.log("스크롤바 이벤트");
						list();
					}
				});
				
function swiper(list_seq){
	
	
}
function img(list_seq){
	
    $.ajax({
        url: "img.action",
        type : 'post', 
        data : { 
        	seq : list_seq,
        },       	
        success: function(data){           
           for(var i = 0; i<data.length; i++){
        	   $("#swiper" + list_seq + " .swiper-wrapper").append("<div class='swiper-slide'><img src='resources/images/main/" + data[i] + "'></img></div>");
        	 
			   
			}
			new Swiper('#swiper' + list_seq, {
				pagination : { // 페이징 설정
					el : '.swiper-pagination',
					clickable : false, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
				},
				navigation : { // 네비게이션 설정
					nextEl : '.swiper-button-next', // 다음 버튼 클래스명
					prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
				},
			});
			/* $('.swiper-pagination-bullet').css('background-color', 'rgb(224, 224, 224)');
			$('.swiper-pagination-bullet').css('margin', '0px 2.5px');
			$('.swiper-pagination-bullet').css('width', '5px');
			$('.swiper-pagination-bullet').css('height', '5px');
			$('.swiper-pagination-bullet').css('border-radius', '2.5px');
			$('.swiper-pagination-bullet').css('border-radius', '1px solid black');
			$('.swiper-pagination-bullet').css('display', 'inline-block');
			
			$('.swiper-pagination-bullet-active').css('background-color', 'rgb(0, 0, 0)');
			$('.swiper-pagination-bullet-active').css('margin', '0px 2.5px');
			$('.swiper-pagination-bullet-active').css('width', '12px');
			$('.swiper-pagination-bullet-active').css('height', '5px');
			$('.swiper-pagination-bullet-active').css('border-radius', '2.5px');
			$('.swiper-pagination-bullet-active').css('border-radius', '1px solid black');
			$('.swiper-pagination-bullet-active').css('display', 'inline-block');
			
			$('.swiper-button-prev').css('background-image', 'url("resources/images/main/arrow-medium-circle-right-white.png")');
			$('.swiper-button-prev').css('transform', 'rotate(180deg)');
			$('.swiper-button-next').css('background-image', 'url("resources/images/main/arrow-medium-circle-right-white.png")');
			$('.swiper-button-prev').css('background-size', '27px');
			$('.swiper-button-next').css('background-size', '27px');
			$('.swiper-button-prev').css('width', '27px');
			$('.swiper-button-prev').css('height', '27px');
			$('.swiper-button-next').css('width', '27px');
			$('.swiper-button-next').css('height', '27px');
			
			$('.swiper-container').css('height', '400px');
			$('.swiper-container').css('width', '600px');
			
			$('.swiper-slide img').css('height', '400px');
			$('.swiper-slide img').css('width', '600px');
			
			$('.swiper-slide').css('text-align-image', 'center');
			$('.swiper-slide').css('display', 'flex');
			$('.swiper-slide').css('align-items', 'center');
			$('.swiper-slide').css('justify-content', 'center');
			
			$('.swiper-button-disabled').css('display', 'none');
			$('.swiper-pagination').css('margin-top', '50px;'); */
			
		


			

			
        },
        error: function(){
            alert("에러");
        }
    });
    
    $('.swiper-pagination-bullet').css('background-color', 'rgb(224, 224, 224)');
	$('.swiper-pagination-bullet').css('margin', '0px 2.5px');
	$('.swiper-pagination-bullet').css('width', '5px');
	$('.swiper-pagination-bullet').css('height', '5px');
	$('.swiper-pagination-bullet').css('border-radius', '2.5px');
	$('.swiper-pagination-bullet').css('border-radius', '1px solid black');
	$('.swiper-pagination-bullet').css('display', 'inline-block');
	
	$('.swiper-pagination-bullet-active').css('background-color', 'rgb(0, 0, 0)');
	$('.swiper-pagination-bullet-active').css('margin', '0px 2.5px');
	$('.swiper-pagination-bullet-active').css('width', '12px');
	$('.swiper-pagination-bullet-active').css('height', '5px');
	$('.swiper-pagination-bullet-active').css('border-radius', '2.5px');
	$('.swiper-pagination-bullet-active').css('border-radius', '1px solid black');
	$('.swiper-pagination-bullet-active').css('display', 'inline-block');
	
	$('.swiper-button-prev').css('background-image', 'url("resources/images/main/arrow-medium-circle-right-white.png")');
	$('.swiper-button-prev').css('transform', 'rotate(180deg)');
	$('.swiper-button-next').css('background-image', 'url("resources/images/main/arrow-medium-circle-right-white.png")');
	$('.swiper-button-prev').css('background-size', '27px');
	$('.swiper-button-next').css('background-size', '27px');
	$('.swiper-button-prev').css('width', '27px');
	$('.swiper-button-prev').css('height', '27px');
	$('.swiper-button-next').css('width', '27px');
	$('.swiper-button-next').css('height', '27px');
	
	$('.swiper-container').css('height', '400px');
	$('.swiper-container').css('width', '600px');
	
	$('.swiper-slide img').css('height', '400px');
	$('.swiper-slide img').css('width', '600px');
	
	$('.swiper-slide').css('text-align-image', 'center');
	$('.swiper-slide').css('display', 'flex');
	$('.swiper-slide').css('align-items', 'center');
	$('.swiper-slide').css('justify-content', 'center');
	
	$('.swiper-button-disabled').css('display', 'none');
	$('.swiper-pagination').css('margin-top', '50px;'); 
}

function list() {
	count = count + 2;
	$.ajax({
		url : "list.action",
		type : 'post',
		data : {
			num : count,
		},
		success : function(data) {
			$(".scroll").empty();
			$(data).each(function() {
				
				var txt = "";
				var gubn = ""
				if(this.gubn){
					txt = " · ";
					gubn = this.gubn;
				}
				$(".scroll").append(
				"<div class ='content'>"
				+ "<div class='top'>" 
				+ "<img class='img_top' src='resources/images/main/" + this.reg_id + ".png'></img>"
				+ "<div class='txt_top'>"
				+ "<p>" + this.reg_id + "</p>"
				+ "<div>"
				+ "<span>" + gubn + "</span><span>" + txt + this.reg_dt + "</span>"
				+ "</div>"
				+ "</div>"
				+ "</div>"
				+ "<div class='swiper-container' id='swiper"+ this.seq +"'>"
				+ "<div class='swiper-wrapper'>"
				+ "</div>"
				+ "<div class='swiper-button-next'></div>"
				+ "<div class='swiper-button-prev'></div>"
				+ "<div class='swiper-pagination'></div>"
				+ "</div>"
				+ "<div class='etc'>"
				+ "<span class='etc_1'></span>"
				+ "<img class='etc_2' src='resources/images/main/reply-black.png'></img>"
				+ "<span class='etc_3'>" 
				+ "</span>"
				+ "<img class='etc_4' src='resources/images/main/share-black.png'></img>"
				+ "</div>"
				+ "<div class='txt_1'>좋아요"
				+ "<span>213개</span>"
				+ "</div>"
				+ "<div class='txt_2'>" + this.title + "</div>"
				+ "<div class='txt_3'>" + this.contents + "</div>"
				+ "<div class='txt_4'>" + "댓글 252개" + "</div>"
				+ "<div class='txt_5'>" + "<span>" + "홍*표" + "</span>" + "내용 입니다." + "</div>"
				+ "<div class='comment'>" + "<textarea placeholder='댓글을 달아주세요.' disabled></textarea>" + "</div>"
				+ "</div>"
				+ "</div>"
				);
				
				img(this.seq);
			}

			);
		},
		error : function() {
			alert("에러");
		}
	});

}

</script>
</html>
