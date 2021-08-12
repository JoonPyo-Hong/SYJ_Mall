<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="resources/css/bootstrap.css">

<link rel="stylesheet" href="resources/css/jquery-ui.css">
<link rel="stylesheet" href="resources/css/main/feed.css">
<script src="resources/js/jquery-1.12.4.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/bootstrap.js"></script>

<link rel="icon" href="resources/images/main/kakao_ryan.ico">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>


<meta name="viewport"
	content="user-scalable=no,
                               initial-scale=0.58,
                               maximum-scale=0.58,
                               minimum-scale=0.58,
                               width=device-width,
                               height=device-height">


<title>Feed</title>
</head>
<body>
	<div id="wrap">
		<div id="sticky">
			<div id="head">
				<div>
					<img src="resources/images/main/ic_back_2x.png"></img> <img
						src="resources/images/main/gnb-home-18-black@2x.png"></img>
				</div>
				<div>
					<h1>게시물</h1>
				</div>
				<div>
					<img src="resources/images/main/ic_search_2x.png"></img>
				</div>
				<div>
					<img src="resources/images/main/language-global-18-black@2x.png"></img>
				</div>
			</div>
		</div>
		<c:forEach items="${list1}" var="list1">
			<div class='content' id="content_${list1.seq}">
				<div class='top'>
					<img class='img_top'
						src="resources/images/main/${list1.reg_id}.png"></img>
					<div class='txt_top'>
						<p>${list1.reg_id}</p>
						<div>
							<span>${list1.gubn}</span><span><c:if
									test="${list1.gubn ne null}"> · </c:if>${list1.reg_dt}</span>
						</div>
					</div>
				</div>
				<div class='swiper-container' id='swiper1'>
					<div class='swiper-wrapper'>
						<c:forEach items="${list2}" var="list2">
							<div class='swiper-slide'>
								<img src='resources/images/main/${list2}'></img>
							</div>
						</c:forEach>
					</div>
					<div class='swiper-button-next'></div>
					<div class='swiper-button-prev'></div>
					<div class='swiper-pagination'></div>
				</div>
				<div class='part'>
					<div class='etc'>
						<span class='etc_1'></span><img class='etc_2'
							src='resources/images/main/reply-black.png'></img><span
							class='etc_3'></span><img class='etc_4'
							src='resources/images/main/share-black.png'></img>
					</div>
					<div class='txt_1'>
						좋아요<span></span>
					</div>
					<div class='txt_2'>${list1.title}</div>
					<div class='txt_3'>${list1.contents}</div>
					<div class='txt_4'></div>
					<div class='txt_5'>
						<span id='txt_span1'></span><span id='txt_span2'></span>
					</div>
					<div class='comment'>
						<textarea id="feed_txt" wrap="hard"
							placeholder="<c:if test='${seq eq 0}'>로그인 후 이용해주세요.</c:if><c:if test='${seq ne 0}'>댓글을 달아주세요.</c:if>"></textarea>
						<img src="resources/images/main/reply-off.png" id="feed_img"
							class='feed_img2'></img>
					</div>
				</div>
			</div>
		</c:forEach>
		<div id="feed">
			<div class="feed_click">
				<span class="feed_spn_1">최신순</span><span class="feed_spn_2"><img
					src="resources/images/main/arrow-small-down.png"></span>
			</div>
			<div id="sel_feed" class="sel_feeds">
				<button value="최신순" class="btn_feed btn_selected">최신순</button>
				<button value="과거순" class="btn_feed">과거순</button>
				<button value="좋아요순" class="btn_feed">좋아요순</button>
			</div>
			<div id="feed_content_div"></div>
		</div>
	</div>
	<input type="hidden" id="hid_seq" value="${seq}">
	<input type="hidden" id="hid_name" value="${name}">
	<div id="modal"></div>
	<div class="modal-con modal1">
		<div id="modal_content">
			<div id="close">
				<img src="resources/images/main/close-24.png">
			</div>
			<div id="chracter">
				<img src="resources/images/main/character-3-d-neo-128.png">
			</div>
			<div id="modal_txt1">앗! 로그인</div>
			<div id="modal_txt2">
				여러분의 좋아요 그리고 댓글은<br> 저에게 큰 힘이 될 거에요
			</div>
			<div id="modal_login">
				<img src="resources/images/main/kakaotalk-tiny-brown.png">
				<p>로그인하기</p>
			</div>
		</div>
	</div>
	<div class="modal-con modal2">
		<div id="modal_content2">
			<div id="close">
				<img src="resources/images/main/close-24.png">
			</div>
			<div>
				<p>공유하기</p>
			</div>
			<div id="modal_icon">
				<img src="resources/images/main/sns-kakao-talk-60.png"> <img
					src="resources/images/main/sns-facebook-60.png"> <img
					src="resources/images/main/sns-url-60.png">
			</div>
		</div>
	</div>
	<script src="resources/js/main/feed.js"></script>
</body>
</html>