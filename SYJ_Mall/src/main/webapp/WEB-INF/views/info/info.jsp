<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="resources/js/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">


<style type="text/css">
.slide {
	width: 640px;
	height: 885px;
}

.swiper-slide img {
	width: 640px;
	height: 885px;
}

.swiper-pagination-bullet-active {
	opacity: 1;
	background: white;
}

#language {
	width: 640px;
	height: 90px;
	border: 1px solid black;
	text-align: center
}

#language ul {
padding:40px 18px;
	width: 460px;
	height: 32px;
	text-align: center;
	display: inline-block;
	vertical-align: top;
	list-style: none;
}

#language li {
	color: rgb(178, 178, 178);
	display: inline-block;
	position: relative;
	font-weight: bold;
	vertical-align: top;
	padding: 0px 12px;
}

#language a {
	color: rgb(178, 178, 178)
	text-decoration: none;
}

#language a:hover {
	cursor: pointer;
}
.a_select{
	padding-bottom:5px;
	border-bottom: 2px solid black;
}
.a_un_select{
	color: rgb(178, 178, 178);
}
</style>
</head>
<body>
	<div class="swiper-container slide">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img src='resources/images/info/bg_storeInfo_01_M.jpg'></img>
			</div>
			<div class="swiper-slide">
				<img src='resources/images/info/bg_storeInfo_02_M.jpg'></img>
			</div>
			<div class="swiper-slide">
				<img src='resources/images/info/bg_storeInfo_03_M.jpg'></img>
			</div>
			<div class="swiper-slide">
				<img src='resources/images/info/bg_storeInfo_04_M.jpg'></img>
			</div>
			<div class="swiper-slide">
				<img src='resources/images/info/bg_storeInfo_05_M.jpg'></img>
			</div>
		</div>
		<div class="swiper-pagination"></div>
	</div>
	<div id="language">
		<ul>
			<li><a class="a_select">한국어</a></li>
			<li><a class="a_un_select">English</a></li>
			<li><a class="a_un_select">日本語</a></li>
			<li><a class="a_un_select">中文(简体)</a></li>
			<li><a class="a_un_select">中文(繁體)</a></li>
		</ul>
	</div>
	<script type="text/javascript">
		var mySwiper = new Swiper('.swiper-container', {
			loop : true,
			pagination : {
				el : '.swiper-pagination',
			},
			touchRatio : 0, // 드래그 X
			autoplay : { // 자동 슬라이드 설정 , 비 활성화 시 false
				delay : 3000, // 시간 설정
				disableOnInteraction : false, // false로 설정하면 스와이프 후 자동 재생이 비활성화 되지 않음
			},
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},

		})
	</script>
</body>
</html>