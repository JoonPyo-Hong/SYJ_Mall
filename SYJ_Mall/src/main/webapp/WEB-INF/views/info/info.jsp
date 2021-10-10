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
	border: 1px solid black;
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
	<div class="language-tab__TabWrap-sc-cgukfq-0 kkhjuY"><ul class="language-tab__TabList-sc-cgukfq-1 kHcMe"><li class="language-tab__TabItem-sc-cgukfq-2 dhCuzP"><a href="#" class="language-tab__TabItemLink-sc-cgukfq-3 llXddO">한국어</a></li><li class="language-tab__TabItem-sc-cgukfq-2 hlEGfu"><a href="#" class="language-tab__TabItemLink-sc-cgukfq-3 bzPCRo">English</a></li><li class="language-tab__TabItem-sc-cgukfq-2 dhCuCj"><a href="#" class="language-tab__TabItemLink-sc-cgukfq-3 bzPCRo">日本語</a></li><li class="language-tab__TabItem-sc-cgukfq-2 RLhIf"><a href="#" class="language-tab__TabItemLink-sc-cgukfq-3 bzPCRo">中文(简体)</a></li><li class="language-tab__TabItem-sc-cgukfq-2 RLhMY"><a href="#" class="language-tab__TabItemLink-sc-cgukfq-3 bzPCRo">中文(繁體)</a></li></ul></div>

	<script type="text/javascript">
		var mySwiper = new Swiper('.swiper-container', {
			loop : true,
			pagination : {
				el : '.swiper-pagination',
			},
			touchRatio: 0, // 드래그 X
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