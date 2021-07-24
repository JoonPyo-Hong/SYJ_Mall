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
<script src="resources/js/jquery-1.12.4.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/bootstrap.js"></script>

<link rel="icon" href="resources/images/main/kakao_ryan.ico">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<style type="text/css">
html {
	margin: 0px;
	width: 100%;
}

body {
	margin: 0px;
	width: 100%;
}

#head {
	width: 640px;
	height: 47px;
	margin: 0px auto;
	display: flex;
	border-bottom: 1px solid rgb(227, 229, 232);
}

#head h1 {
	font-weight: bold;
	font-size: 16px;
	margin: 0px;
	font-size: 16px;
	text-align: center;
	margin-top: 5px;
}

#head div:nth-child(1) {
	width: 60px;
	height: 32px;
	margin: 8px 3px 7px 13px;
}

#head div:nth-child(2) {
	width: 214px;
	height: 24px;
	display: block;
	margin: 0px auto;
	margin-top: 11px;
}

#head div:nth-child(3) {
	width: 32px;
	height: 32px;
	margin-top: 8px;
}

#head div:nth-child(4) {
	width: 32px;
	height: 32px;
	margin: 8px 13px 7px 2px;
}

#head div img {
	cursor: pointer;
}

#head div:nth-child(1) img:nth-child(1) {
	width: 18px;
	height: 18px;
	margin: 6px 5px 7px;
}

#head div:nth-child(1) img:nth-child(2) {
	width: 18px;
	height: 18px;
	margin: 6px 5px 7px;
}

#head div:nth-child(3) img {
	width: 18px;
	height: 18px;
	margin-top: 8px;
}

#head div:nth-child(4) img {
	width: 18px;
	height: 18px;
	margin-top: 8px;
	margin: 8px 13px 7px 2px;
}

.content {
	margin: 0px auto;
	width: 640px;
	padding: 20px 20px 0px;
}

.top {
	height: 41px;
	width: 600px;
	margin-bottom: 16px;
	font-size: 14px;
	line-height: 1.5;
	display: flex;
}

.img_top {
	height: 40px;
	width: 40px;
	margin-right: 8px;
	cursor: pointer;
}

.txt_top p {
	font-size: 16px;
	letter-spacing: -0.25px;
	margin: 0px;
	height: 19px;
	width: 131.703px;
	font-weight: bold;
}

.txt_top span:nth-child(1) {
	margin: 0px;
	color: rgb(47, 126, 230);
	font-weight: bold;
	font-size: 13px;
	height: 19px;
	width: 71.656px;
}

.txt_top span:nth-child(2) {
	margin: 0px;
	color: rgb(47, 126, 230);
	font-weight: bold;
	font-size: 13px;
	height: 19px;
	width: 50.047px;
	color: rgb(154, 154, 158);
}

.etc {
	height: 32px;
	width: 600px;
	margin-top: 10px;
	display: flex;
}

.etc_1 {
	width: 32px;
	height: 32px;
	cursor: pointer;
	background-image: url(resources/images/main/heart-burst.png);
	background-size: cover;
	background-repeat: no-repeat;
}

.etc img {
	cursor: pointer;
	z-index: 100;
}

.etc span {
	cursor: pointer;
	z-index: 100;
}

.etc_2 {
	margin-left: 12px;
	width: 27px;
	height: 27px;
	cursor: pointer;
	margin-top: 2px;
}

.etc_3 {
	margin: 0px auto;
	margin-top: 2px;
}

.etc_4 {
	width: 27px;
	height: 27px;
	cursor: pointer;
	margin-top: 2px;
}

.txt_1 {
	height: 21px;
	width: 600px;
	margin-top: 12px;
	font-size: 14px;
	line-height: 1.5;
	color: #1e1e1e;
}

.txt_1 span {
	font-weight: bold;
}

.txt_2 {
	width: 600px;
	font-size: 20px;
	margin-top: 12px;
	letter-spacing: -0.31px;
	font-weight: bold;
	line-height: -1.2;
}

.txt_3 {
	width: 600px;
	font-size: 14px;
	letter-spacing: -0.22px;
	margin-top: 10px;
	line-height: 1.43;
}

.txt_4 {
	width: 600px;
	font-size: 14px;
	letter-spacing: -0.22px;
	color: rgb(154, 154, 158);
	margin-top: 7px;
}

.txt_5 {
	width: 600px;
	font-size: 14px;
	letter-spacing: -0.22px;
	line-height: 1.43;
	margin-top: 12px;
}

.txt_5 span {
	margin-right: 7px;
	font-weight: bold;
}

.comment {
	padding: 8px;
	border-radius: 0px 24px 24px;
	background-color: rgb(240, 241, 244);
	position: relative;
	display: flex;
	box-sizing: border-box;
	width: 600px;
	height: 44px;
	margin-top: 16px;
}

.comment img {
	width: 28px;
	height: 28px;
	cursor: pointer;
}

textarea {
	font-size: 14px;
	text-rendering: auto;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: start;
	white-space: pre-wrap;
	overflow-wrap: break-word;
	column-count: initial !important;
	font: 400 13.3333px Arial;
	flex-direction: column;
	width: 100%;
	max-height: 60px;
	border: none;
	background: none;
	outline: none;
	resize: none;
	overflow: hidden;
}

.etc_selected {
	background-color: rgb(0, 0, 0);
	margin: 0px 2.5px;
	width: 12px;
	height: 5px;
	border-radius: 2.5px;
	border: 1px solid black;
	display: inline-block;
}

.etc_unselected {
	background-color: rgb(224, 224, 224);
	margin: 0px 2.5px;
	width: 5px;
	height: 5px;
	border-radius: 2.5px;
	display: inline-block;
}

.swiper-container {
	height: 440px;
	width: 600px;
}

.swiper-slide {
	text-align: center;
	display: flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items: top; /* 위아래 기준 중앙정렬 */
	justify-content: center; /* 좌우 기준 중앙정렬 */
}

.swiper-slide img {
	width: 600px;
	height: 400px;
}

.swiper-pagination-bullet {
	background-color: rgb(224, 224, 224);
	margin: 0px 2.5px;
	width: 5px;
	height: 5px;
	border-radius: 2.5px;
	border: 1px solid black;
	display: inline-block;
}

.swiper-pagination-bullet-active {
	background-color: rgb(0, 0, 0);
	margin: 0px 2.5px;
	width: 12px;
	height: 5px;
	border-radius: 2.5px;
	border: 1px solid black;
	display: inline-block;
}

.swiper-button-prev {
	display: inline-block;
	background-image:
		url(resources/images/main/arrow-medium-circle-right-white.png);
	background-size: 27px 27px;
	background-position: center;
	background-repeat: no-repeat;
	transform: rotate(180deg);
}

.swiper-button-next {
	display: inline-block;
	background-image:
		url(resources/images/main/arrow-medium-circle-right-white.png);
	background-size: 27px 27px;
	background-position: center;
	background-repeat: no-repeat;
}

.swiper-button-disabled {
	display: none;
}

.part {
	position: relative;
	top: -45px;
	left: 0;
}

#modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.3);
	z-index: 1000;
}

#modal_content {
	width: 310px;
	height: 357px;
	display: flex;
	flex-direction: column;
}

.modal-con {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: #fff;
	z-index: 1000;
	border-radius: 15px;
}

body.s_no-scroll {
	overflow-y: hidden;
}

#close {
	padding-right: 15px;
	padding-top: 15px;
}

#close img {
	float: right;
	width: 24px;
	height: 24px;
	cursor: pointer;
}

#chracter {
	text-align: center;
}

#chracter img {
	width: 128px;
	height: 128px;
}

#modal_txt1 {
	text-align: center;
	font-size: 18px;
	margin-top: 6px;
	margin-bottom: 6px;
	font-weight: bold;
}

#modal_txt2 {
	text-align: center;
	font-size: 16px;
	letter-spacing: -0.25px;
	font-weight: normal;
	font-stretch: normal;
}

#modal_login {
	border-radius: 35px;
	background-color: rgb(255, 235, 0);
	outline: none;
	text-align: center;
	width: 220px;
	height: 48px;
	margin: 0px auto;
	margin-top: 20px;
	display: flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items: center; /* 위아래 기준 중앙정렬 */
	justify-content: center;
	cursor: pointer;
}

#modal_login img {
	width: 20px;
	height: 20px;
}

#modal_login p {
	font-size: 15px;
	margin-left: 5px;
	font-weight: bold;
	margin-bottom: 0px;
}

#modal_content2 {
	width: 310px;
	height: 184px;
	text-align: center;
}

#modal_content2 p {
	font-size: 16px;
	font-weight: bold;
	line-height: 1.5;
	letter-spacing: -0.25px;
	color: rgb(0, 0, 0);
	text-align: center;
	margin-top: 20px;
	padding-left: 37px;
}

#modal_icon {
	width: 240px;
	height: 128px;
	margin-left: 35px;
}

#modal_icon img {
	width: 60px;
	height: 60px;
	margin: 7px;
	margin-top: 15px;
}

#sticky {
	position: sticky;
	top: 0px;
	left: 0px;
	z-index: 500;
	background-color: white;
}

#feed {
	border-top: 1px solid rgb(227, 229, 232);
	padding: 20px;
	margin: 0px auto;;
	width: 640px;
	position: relative;
}

.feed_spn_1 {
	font-size: 14px;
	font-weight: bold;
}

.feed_spn_2 {
	margin-left: 5px;
}

.feed_spn_2 img {
	width: 18px;
	height: 18px;
}

.feed_content2 {
	margin-left: 30px;
}

.feed_content {
	padding: 12px 0px;
	margin-top: 10px;
	width: 600px;
	display: felx;
	padding: 12px 0px;
	margin-top: 10px;
	height: auto;
}

.feed_content div:nth-child(1) {
	font-size: 14px;
	font-weight: bold;
}

/* feed textarea */
.feed_content div:nth-child(2) {
	padding: 15px;
	border-radius: 0px 24px 24px;
	background-color: rgb(240, 241, 244);
	margin-top: 10px;
	margin-bottom: 10px;
	cursor: pointer;
	display: inline-block;
}

.feed_content div:nth-child(3) {
	font-size: 13px;
	font-weight: normal;
	color: rgb(154, 154, 158);
}

.feed_content div:nth-child(3) span {
	margin-right: 7px;
	cursor: pointer;
}

.feed_content div:nth-child(3) span:nth-child(2) span:nth-child(1) {
	margin-right: 0px;
}

.feed_img {
	margin-right: 0px;
}

.feed_img img {
	width: 15px;
	height: 15px;
	margin-bottom: 4px;
}

#sel_feed {
	position: absolute;
	top: 54px;
	left: 20px;
	padding: 10px;
	width: 99px;
	border-radius: 6px;
	border: 1px solid rgb(242, 242, 242);
	background-color: rgb(255, 255, 255);
	box-sizing: border-box;
	z-index: 101;
	display: none;
}

.btn_feed {
	color: rgb(0, 0, 0);
	width: 100%;
	text-align: left;
	outline: none;
	border: 0 none;
	background-color: transparent;
	cursor: pointer;
	padding: 6px;
}

.btn_selected {
	font-weight: bold;
}

.feed_click {
	width: 80px;
	cursor: pointer;
	z-index: 10;
}

.feed_heart {
	cursor: pointer;
}

.feed_like_selected {
	font-weight: bold;
	color: rgb(255, 68, 127);
}

.delete_search {
	width: 18px;
	height: 18px;
}

.comment2 {
	margin-left: 50px;
}
</style>
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
						1<span>2</span>1
					</div>
					<div class='comment'>
						<textarea id="feed_txt" wrap="hard"
							placeholder="<c:if test='${seq eq 0}'>로그인 후 이용해주세요.</c:if><c:if test='${seq ne 0}'>댓글을 달아주세요.</c:if>"></textarea>
						<img src="resources/images/main/reply-off.png" id="feed_img"></img>
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
	<script>
		var l_seq = $(".etc_1").parent().parent().parent().attr('id').replace(
				"content_", "");

		var m_seq = parseInt($('#hid_seq').val());
		var hid_name = $('#hid_name').val();

		var feed_sel = "최신순";
		var scroll = 0;

		heart_select(l_seq, m_seq);
		heart(l_seq);
		feed_select();

		function re_feed(seq) {
			$("#feed_content_" + seq)
					.append(
							"<div class='feed_content feed_content2'>"
									+ "<div>"
									+ "</div>"
									+ "<div><span> 테스트"
									+ "</span></div>"
									+ "<div><span>"
									+ "5일전 </span> <span class='feed_heart' value='" +  "'><span class='feed_img'><img src='resources/images/main/like-"
				+"grey"+".png'></span>"
									+ "<span class='feed_like'> 좋아요"
									+ " </span></span></div></div>");
		}
		$(document)
				.on(
						"click",
						".feed_content div:nth-child(3) span:nth-child(3)",
						function() {

							if ($(this).children("div").attr('class') == 're_feed_update') {
								return;
							}
							$(this)
									.append(
											"<div class='re_feed_update'><img src='resources/images/main/delete-search.png'class='delete_search'>"
													+ "<div class='comment comment2' >"
													+ "<textarea id='feed_txt' wrap='hard' placeholder='답글을 달아주세요.'></textarea>"
													+ "<img  src='resources/images/main/reply-off.png' id='feed_img'>"
													+ "</div></div>");
						});

		$(document)
				.on(
						"click",
						".feed_heart",
						function() {
							if (m_seq == 0) {
								openModal("modal1");
								return;
							}
							var feed_heart_val = $(this).attr('value');
							var feed_like = "";
							var type;
							if ($(this).children('.feed_img').children('img')
									.attr("src") == 'resources/images/main/like-grey.png') {
								$(this)
										.children('.feed_img')
										.children('img')
										.attr("src",
												'resources/images/main/like-pink.png');
								$(this).children('.feed_like').attr("style",
										'color:red');
								type = "I";
								if ($(this).children('.feed_like').text() == " 좋아요 ") {

									feed_like = " 좋아요 1개 ";
								} else {
									//문자 앞뒤 공백 제거후 가운데 공백으로 나눔
									var feed_like_text = $(this).children(
											'.feed_like').text().trim().split(
											' ');

									feed_like = " 좋아요 "
											+ (parseInt(feed_like_text[1]
													.replace('개', '')) + 1)
											+ " 개 ";
								}
							} else {
								$(this)
										.children('.feed_img')
										.children('img')
										.attr("src",
												'resources/images/main/like-grey.png');
								type = "D";
								$(this).children('.feed_like').attr("style",
										'color:rgb(154, 154, 158)');
								//.removeClass("feed_like_selected");
								//.removeAttr('class');
								//.attr("class", '');
								if ($(this).children('.feed_like').text() == " 좋아요 ") {

									feed_like = " 좋아요 1개 ";
								} else {
									//문자 앞뒤 공백 제거후 가운데 공백으로 나눔
									var feed_like_text = $(this).children(
											'.feed_like').text().trim().split(
											' ');
									if (parseInt(feed_like_text[1].replace('개',
											'')) == 1) {
										feed_like = " 좋아요 "
									} else {

										feed_like = " 좋아요 "
												+ (parseInt(feed_like_text[1]
														.replace('개', '')) - 1)
												+ " 개 ";
									}
								}
							}

							/* scroll = $(document).scrollTop(); */
							/* feed_select(); */

							$(this).children('.feed_like').text(feed_like);
							feed_heart_update(feed_heart_val, type);
						});

		function feed_heart_update(f_seq, type) {

			$.ajax({
				url : "feed_heart_update.action",
				type : 'post',
				data : {
					feed_seq : f_seq,
					member_seq : m_seq,
					gubn : type
				},
				success : function(data) {

				},
				error : function() {
					alert("에러");
				}
			});

		}
		function feed_heart(seq) {
			var result = 0;
			$.ajax({
				url : "feed_heart.action",
				type : 'post',
				async : false,
				data : {
					feed_seq : seq,
				},
				success : function(data) {

					result = data;

				},
				error : function() {
					alert("에러");
				}
			});
			return result;
		}

		$('#wrap').click(
				function() {
					$(".feed_spn_2 img").attr("src",
							"resources/images/main/arrow-small-down.png");
					$('#sel_feed').hide();

				});

		$('.feed_click').click(
				function() {
					event.stopPropagation();
					if ($('#sel_feed').css('display') === 'none') {
						$(".feed_spn_2 img").attr("src",
								"resources/images/main/arrow-small-up.png");

						$('#sel_feed').show();
					} else {
						$(".feed_spn_2 img").attr("src",
								"resources/images/main/arrow-small-down.png");
						$('#sel_feed').hide();
					}
				});
		$('.btn_feed').click(function(e) {
			$(".feed_spn_1").text(e.target.value);
			feed_sel = e.target.value;
			$(".btn_selected").removeClass("btn_selected");

			scroll = $(document).scrollTop();
			$(e.target).attr('class', 'btn_feed btn_selected');

			feed_select();

		});

		function feed_select() {
			$("#feed_content_div").empty();
			$
					.ajax({
						url : "feed_select.action",
						type : 'post',
						data : {
							list_seq : l_seq,
							sel : feed_sel
						},
						success : function(data) {
							$
									.each(
											data,
											function(index, value) {
												var feed_heart_count = feed_heart(value.seq);
												var feed_heart_txt = "";
												var feed_heart_img = "";
												var feed_heart_red = "";

												if (feed_heart_count == 0) {
													feed_heart_txt = "";
													feed_heart_img = "grey";
													feed_heart_red = "> 좋아요";
												} else {
													feed_heart_txt = " "
															+ feed_heart_count
															+ "개";
													feed_heart_img = "pink";
													feed_heart_red = " style='color:red;'> 좋아요";
												}
												$("#feed_content_div")
														.append(
																"<div class='feed_content' id ='feed_content_"+value.seq+"'>"
																		+ "<div>"
																		+ value.reg_id
																		+ "</div>"
																		+ "<div><span>"
																		+ value.feed
																		+ "</span></div>"
																		+ "<div><span>"
																		+ value.reg_dt
																		+ "</span> <span class='feed_heart' value='" + value.seq + "'><span class='feed_img'><img src='resources/images/main/like-"+
																		feed_heart_img+".png'></span>"
																		+ "<span class='feed_like'"
																		+ feed_heart_red
																		+ feed_heart_txt
																		+ " </span></span><span value='true'>답글달기</span></div></div>");

											});
							if (scroll != 0) {
								$(window).scrollTop(scroll);
							}
							//test
							re_feed("29");
						},
						error : function() {
							alert("에러");
						}
					});

		}

		$('#feed_txt').click(function() {
			if (m_seq == 0) {
				openModal("modal1");
				return;
			}

		});
		$('#feed_img').click(function() {
			if (m_seq == 0) {
				openModal("modal1");
				return;
			}
			if ($('#feed_txt').val() == "") {
				return;
			}
			feed_insert();
		});
		function feed_insert() {
			var feed_txt = $('#feed_txt').val().replace(/(?:\r\n|\r|\n)/g,
					'<br/>');

			$.ajax({
				url : "feed_insert.action",
				type : 'post',
				data : {
					list_seq : l_seq,
					member_seq : m_seq,
					feed : feed_txt,
					name : hid_name
				},
				success : function(data) {
					$('#feed_txt').val('');
					feed_select();
				},
				error : function() {
					alert("에러");
				}
			});

		}
		$(document).on("click", ".etc_4", function(e) {
			openModal("modal2");

		});

		function openModal(modalname) {
			document.get
			$("#modal").fadeIn(300);
			$("." + modalname).fadeIn(300);
			document.body.classList.add('s_no-scroll');
		}

		$("#modal, #close").on('click', function() {
			$("#modal").fadeOut(300);
			$(".modal-con").fadeOut(300);
			document.body.classList.remove('s_no-scroll');

		});

		$('#modal_login').click(function() {
			let f = document.createElement('form');

			let obj;
			obj = document.createElement('input');
			obj.setAttribute('type', 'hidden');
			obj.setAttribute('name', 'site');
			obj.setAttribute('value', "feed.action?seq=" + l_seq);

			f.appendChild(obj);
			f.setAttribute('method', 'post');
			f.setAttribute('action', '/SYJ_Mall/login.action');
			document.body.appendChild(f);
			f.submit();

		});

		$(document).on("click", ".etc_1", function(e) {

			var type = "";
			if (m_seq != 0) {
				if ($(e.target).css("background-position") == "-96px 0px") {
					$(e.target).css('background-position', '0px 0');
					type = "D";

				} else {
					$(e.target).css('background-position', '-96px 0');
					type = "I";

				}
				$.ajax({
					url : "heart_update.action",
					type : 'post',
					data : {
						list_seq : l_seq,
						member_seq : m_seq,
						gubn : type
					},
					success : function(data) {
						heart(l_seq);
					},
					error : function() {
						alert("에러");
					}
				});
			} else {
				openModal("modal1");
			}
		});
		function heart_select(a, b) {
			$.ajax({
				url : "heart_select.action",
				type : 'post',
				data : {
					list_seq : a,
					session_seq : b
				},
				success : function(data) {

					if (data != 0) {
						$("#content_" + a + " .etc_1").css(
								'background-position', '-96px 0');
					}

				},
				error : function() {
					alert("에러");
				}
			});
		}
		function heart(seq) {
			$.ajax({
				url : "heart.action",
				type : 'post',
				data : {
					num : seq,
				},
				success : function(data) {

					$("#content_" + seq + " .txt_1 span")
							.text(" " + data + "개");

				},
				error : function() {
					alert("에러");
				}
			});
		}
		new Swiper('#swiper1', {
			allowTouchMove : false,
			watchOverflow : true,
			pagination : { // 페이징 설정
				el : '.swiper-pagination',
				clickable : false, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
			},
			navigation : { // 네비게이션 설정
				nextEl : '.swiper-button-next', // 다음 버튼 클래스명
				prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
			},
		});
	</script>
</body>
</html>