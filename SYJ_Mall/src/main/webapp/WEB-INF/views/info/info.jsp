<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	text-align: center
}

#language ul {
	padding: 40px 18px;
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
	color: rgb(178, 178, 178) text-decoration: none;
}

#language a:hover {
	cursor: pointer;
}

.a_select {
	padding-bottom: 5px;
	border-bottom: 2px solid black;
}

.a_un_select {
	color: rgb(178, 178, 178);
}

.content {
	padding-top: 20px; //
	border: 1px solid black;
}

.content_img img {
	width: 640px;
	height: 435px;
}

.content_map { //
	border: 1px solid black;
	width: 600px;
	height: 490px;
	margin: 30px 20px;
}

.title {
	margin-bottom: 17px;
	width: 600px;
	height: 33px;
	font-size: 22px;
	font-weight: bold;
}

.txt {
	line-height: 27px;
	font-size: 15px;
	color: black;
	margin-bottom: 5px;
}

.txt img {
	width: 27px;
	height: 27px;
	margin-right: 5px;
}
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=870121f6abb2197a2dd62290574add55"></script>
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
	<div class="content">
		<c:forEach var="temp" items="${list}" varStatus="stat">
			<div class="content_img">
				<img alt="" src="resources/images/info/${temp.image_url}">
			</div>
			<div class="content_map">
				<div class="title">${temp.title}</div>
				<div class="txt" id="txt1">
					<img src='resources/images/info/ico_map.png'></img>
					${temp.phone_number}
				</div>
				<div class="txt" id="txt2">
					<img src='resources/images/info/ico_phone.png'></img>
					${temp.opening_hours}
				</div>
				<div class="txt" id="txt3">
					<img src='resources/images/info/ico_time.png'></img> ${temp.adress}
				</div>
				<div id="map_${stat.count}" style="width: 600; height: 311px; margin-top: 40px;"></div>
			</div>
			<%-- <c:out value="${stat.count}"></c:out> --%>
			<c:set var="count" value="${stat.count}" />
		</c:forEach>
		<%--<c:out value="${count}"></c:out>--%>
	</div>

	<script type="text/javascript">
		var count = ${count};
	
				
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

		});
	
		for(var i = 1; i <=count; i++){
			var container = document.getElementById('map_' + i); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
	
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
		}		
	</script>
</body>
</html>