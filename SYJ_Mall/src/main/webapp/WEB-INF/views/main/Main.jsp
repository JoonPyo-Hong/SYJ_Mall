<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="/WEB-INF/views/inc/main.jsp"%> --%>
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

<%-- <script><%@ include file ="/resources/js/main/main.js"%></script> --%>
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
}

#head div:nth-child(1) {
	width: 32px;
	height: 32px;
	margin: 8px 3px 7px 13px;
}

#head div:nth-child(2) {
	width: 147px;
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

#head div:nth-child(1) img {
	width: 18px;
	height: 18px;
	margin: 6px 5px 7px;
	height: 18px;
}

#head div:nth-child(2) img {
	width: 147px;
	height: 25px;
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

#tab {
	width: 640px;
	height: 43px;
	margin: 0px auto;
	display: flex;
	border-bottom: 1px solid rgb(227, 229, 232);
	padding: 0px 17.5px;
	text-align: center;
	font-size: 16px;
}

#tab div {
	width: 146.25px;
	height: 43px;
	margin: 0px auto;
	line-height: 40px;
	cursor: pointer;
}

.tab_selected {
	border-bottom: 4px solid black;
	font-weight: bold;
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
	padding: 12px 59px 12px 14px;
	border-radius: 0px 24px 24px;
	height: 44px;
	background-color: rgb(240, 241, 244);
	position: relative;
	display: flex;
	box-sizing: border-box;
	width: 600px;
	height: 44px;
	margin-top: 16px;
	cursor: pointer;
}

textarea {
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
	border: none;
	background: none;
	outline: none;
	resize: none;
	cursor: pointer;
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
#modal_icon{
	width: 240px;
	height: 128px;
	margin-left: 35px;
}
#modal_icon img{
	width: 60px;
	height: 60px;
	margin: 7px;
	margin-top: 15px;
} 
</style>
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
		<input type="hidden" id="hid_seq" value="${seq}}">세션 seq =
		${seq}
		<div class="scroll"></div>

	</div>
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
				<img src="resources/images/main/sns-kakao-talk-60.png">
				<img src="resources/images/main/sns-facebook-60.png">
				<img src="resources/images/main/sns-url-60.png">
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).on("click", ".etc_4", function(e) {
			openModal("modal2");

		});

		$('#modal_login').click(function() {
			let f = document.createElement('form');

			let obj;
			obj = document.createElement('input');
			obj.setAttribute('type', 'hidden');
			obj.setAttribute('name', 'site');
			obj.setAttribute('value', "main.action");

			f.appendChild(obj);
			f.setAttribute('method', 'post');
			f.setAttribute('action', '/SYJ_Mall/login.action');
			document.body.appendChild(f);
			f.submit();

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
		$(document)
				.on(
						"click",
						".etc_1",
						function(e) {

							var l_seq = $(e.target).parent().parent().parent()
									.attr('id').replace("content_", "");
							var m_seq = parseInt($('#hid_seq').val());
							var type = "";
							if (m_seq != 0) {
								if ($(e.target).css("background-position") == "-96px 0px") {
									$(e.target).css('background-position',
											'0px 0');
									type = "D";

								} else {
									$(e.target).css('background-position',
											'-96px 0');
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

		var count = 0;
		window.onload = function() {
			list();
		}

		window
				.addEventListener(
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

		function img(list_seq) {

			$
					.ajax({
						url : "img.action",
						type : 'post',
						data : {
							seq : list_seq,
						},
						success : function(data) {
							for (var i = 0; i < data.length; i++) {
								$("#swiper" + list_seq + " .swiper-wrapper")
										.append(
												"<div class='swiper-slide'><img src='resources/images/main/" + data[i] + "'></img></div>");

							}
							new Swiper('#swiper' + list_seq, {
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

						},
						error : function() {
							alert("에러");
						}
					});
		}

		function list() {
			count = count + 2;
			$
					.ajax({
						url : "list.action",
						type : 'post',
						data : {
							num : count,
						},
						success : function(data) {

							$(data)
									.each(
											function() {

												var txt = "";
												var gubn = ""
												if (this.gubn) {
													txt = " · ";
													gubn = this.gubn;
												}
												$(".scroll")
														.append(
																"<div class ='content' id = 'content_"+this.seq +"'>"
																		+ "<div class='top'>"
																		+ "<img class='img_top' src='resources/images/main/" + this.reg_id + ".png'></img>"
																		+ "<div class='txt_top'>"
																		+ "<p>"
																		+ this.reg_id
																		+ "</p>"
																		+ "<div>"
																		+ "<span>"
																		+ gubn
																		+ "</span><span>"
																		+ txt
																		+ this.reg_dt
																		+ "</span>"
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
																		+ "<div class='part'>"
																		+ "<div class='etc'>"
																		+ "<span class='etc_1'></span>"
																		+ "<img class='etc_2' src='resources/images/main/reply-black.png'></img>"
																		+ "<span class='etc_3'>"
																		+ "</span>"
																		+ "<img class='etc_4' src='resources/images/main/share-black.png'></img>"
																		+ "</div>"
																		+ "<div class='txt_1'>좋아요"
																		+ "<span></span>"
																		+ "</div>"
																		+ "<div class='txt_2'>"
																		+ this.title
																		+ "</div>"
																		+ "<div class='txt_3'>"
																		+ this.contents
																		+ "</div>"
																		+ "<div class='txt_4'>"
																		+ "댓글 252개"
																		+ "</div>"
																		+ "<div class='txt_5'>"
																		+ "<span>"
																		+ "홍*표"
																		+ "</span>"
																		+ "내용 입니다."
																		+ "</div>"
																		+ "<div class='comment'>"
																		+ "<textarea placeholder='댓글을 달아주세요.' disabled></textarea>"
																		+ "</div>"
																		+ "</div>"
																		+ "</div>"
																		+ "</div>");
												heart_select(this.seq,
														parseInt($('#hid_seq')
																.val()));
												img(this.seq);
												heart(this.seq);
											}

									);
						},
						error : function() {
							alert("에러");
						}
					});

		}
	</script>
</body>
</html>
