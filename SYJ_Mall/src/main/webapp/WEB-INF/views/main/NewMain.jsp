<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<style>
/*  모달 작업 */
/* 모달창 배경 검정색 레이어드 화면 */
.overlay-wrap {
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 2;
  position: fixed;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.7);
  transition: all ease-in 0.3s;
}
/* 구매 옵션 모달창 */
.share-modal-wrap {
  position: absolute;
  position: fixed;
  height: auto;
  background-color: rgb(255, 255, 255);
  box-sizing: border-box;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: column;
  top: 50%;
  margin-top: -86px;
  /* bottom: 80px; */
  width: 310px;
  border-radius: 16px;
}

.share-modal-wrap .header {
  position: relative;
  padding: 17px 0;
  text-align: center;
  width: 100%;
}

.share-modal-wrap .header .title {
  font-size: 18px;
}

.share-modal-wrap .header .close {
  position: absolute;
  top: 0;
  right: 0;
  cursor: pointer;
  overflow: hidden;
  width: 24px;
  height: 24px;
  padding: 14px;
  background: url(/SYJ_Mall/resources/images/today/ico_close.png) center no-repeat;
  background-size: 24px 24px;
  color: transparent;
}

.share-modal-wrap .list-share {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  box-sizing: border-box;
  padding: 10px 40px 40px;
}

.share-modal-wrap .list-share-btn {
  width: 64px;
  height: 64px;
  cursor: pointer;
}

.share-modal-wrap .list-share .kakao {
  background: url(/SYJ_Mall/resources/images/today/ico_friends_1800.png) center no-repeat;
  background-position: -380px -140px;
  background-size: 700px 600px;
}

.share-modal-wrap .list-share .facebook {
  background: url(/SYJ_Mall/resources/images/today/ico_friends_1800.png) center no-repeat;
  background-position: -460px -140px;
  background-size: 700px 600px;
}

.share-modal-wrap .list-share .url-copy {
  background: url(/SYJ_Mall/resources/images/today/ico_friends_1800.png) center no-repeat;
  background-position: -540px -140px;
  background-size: 700px 600px;
}
/* 게시글 전체 */
.box-feed {
	padding: 20px;
}

/* 게시글 상단 */
.head-feed {
	display: flex;
	align-items: center;
	justify-content: start;
	padding-bottom: 15px;
}

.head-feed .profile {
	width: 40px;
	height: 40px;
	border-radius: 16px;
	background-color: #ededed;
	cursor: pointer;
}

.head-feed .info-head {
	display: flex;
	flex-direction: column;
	padding-left: 8px;
}

.head-feed .info-head .txt-profile {
	font-size: 16px;
	line-height: 24px;
	font-weight: bold;
}

.head-feed .info-head .txt-time {
	font-size: 13px;
	line-height: 16px;
	color: #909092;
}

/* 게시글 내용 */
/* 이미지 사진 */
.body-feed .slide-feed {
	min-height: 400px;
	background-color: #ededed;
	width: 600px;
	height: 600px;
}

.swiper-slide .swiper-slide-active .swiper-wrapper .swiper-container {
	width: 600px;
	height: 600px;
}

.swiper-slide img {
	width: 600px;
	height: 600px;
	
}
.swiper-button-prev::after {
	display: none;

}
.swiper-button-next::after {
	display: none;

}
.swiper-button-prev {
	display: inline-block;
	background-image:
		url(/SYJ_Mall/resources/images/main/arrow-medium-circle-right-white.png);
	background-size: 27px 27px;
	background-position: center;
	background-repeat: no-repeat;
	transform: rotate(180deg);
}

.swiper-button-next {
	display: inline-block;
	background-image:
		url(/SYJ_Mall/resources/images/main/arrow-medium-circle-right-white.png);
	background-size: 27px 27px;
	background-position: center;
	background-repeat: no-repeat;
}

@media (max-width: 600px) {
	.body-feed .slide-feed {
	background-color: #ededed;
	width: 380px;
	height: 100px;
}
.swiper-slide img {
    width: 380px;
    height: 450px;
}
}
/* [+] 관련 상품 보러가기 텍스트 형식 */
.option-link-view {
	cursor: pointer;
	position: relative;
	height: 50px;
	padding: 0 30px 0 15px;
	box-sizing: border-box;
	margin-top: 10px;
	border: 1px solid #000;
	border-radius: 8px;
	font-weight: bold;
	line-height: 50px;
	font-size: 14px;
}

.option-link-view .icon-arrow {
	position: absolute;
	top: 16px;
	right: 11px;
	width: 16px;
	height: 16px;
	background: url(/SYJ_Mall/resources/today/ico_friends.png) -320px 0
		no-repeat;
	background-size: 699px 451px;
	color: transparent;
}

/* 정보 영역 */
.info-feed {
	position: relative;
	padding-top: 50px;
}

.info-feed .like-count {
	font-size: 14px;
	font-weight: bold;
}

.info-feed .title {
	padding-top: 10px;
	font-size: 20px;
	line-height: 24px;
	font-weight: bold;
}

.info-feed .desc {
	padding-top: 8px;
	font-size: 14px;
	line-height: 20px;
	word-break: break-all;
}

.info-feed .util-left {
	position: absolute;
	top: 6px;
	left: -2px;
	display: flex;
}

.info-feed .util-right {
	position: absolute;
	top: 6px;
	right: -2px;
}

.info-feed .util-left .like-btn {
	width: 32px;
	height: 32px;
	background: url(/SYJ_Mall/resources/images/today/ico_friends.png) -160px
		-100px no-repeat;
	background-size: 699px 451px;
	cursor: pointer;
}

.info-feed .util-left .reply-btn {
	width: 32px;
	height: 32px;
	background: url(/SYJ_Mall/resources/images/today/ico_friends.png) -120px
		-100px no-repeat;
	background-size: 699px 451px;
	cursor: pointer;
}

.info-feed .util-right .share-btn {
	width: 32px;
	height: 32px;
	background: url(/SYJ_Mall/resources/images/today/ico_friends.png) -80px
		-100px no-repeat;
	background-size: 699px 451px;
	cursor: pointer;
}

/* [+] 해당 게시글 태그 */
.option-list-tag {
	padding-top: 12px;
	cursor: pointer;
}

.option-list-tag .list-tag-txt {
	display: inline-block;
	line-height: 30px;
	height: 30px;
	font-size: 14px;
	color: #28619e;
	font-weight: bold;
	padding: 0 13px;
	border: 1px solid #c7d6e7;
	border-radius: 15px;
	margin-right: 5px;
}

.option-list-tag .list-tag-txt span {
	display: block;
}

/* [+] 관련 상품 보러가기 이미지 형식 */
.option-list-product {
	margin-top: 12px;
	border: 1px solid #dedfe0;
	border-radius: 10px;
}

.option-list-product li {
	position: relative;
	padding-right: 10px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	cursor: pointer;
	border-bottom: 1px solid #dedfe0;
}

.option-list-product li:last-child {
	border-bottom: none;
}

.option-list-product .list-product-contents {
	padding: 4px 0 4px 7px;
	display: flex;
}

.option-list-product .list-product-contents .img-product {
	width: 70px;
	height: 70px;
}

.option-list-product .list-product-contents .info-product {
	padding: 15px 0 0 10px;
	display: flex;
	flex-direction: column;
}

.option-list-product .list-product-contents .info-product .title-product
	{
	font-size: 14px;
	line-height: 16px;
	color: #747475;
}

.option-list-product .list-product-contents .info-product .price-product
	{
	font-size: 15px;
	line-height: 24px;
	font-weight: bold;
}

.option-list-product .list-product-cart .cart-btn {
	width: 24px;
	height: 24px;
	background: url(/SYJ_Mall/resources/images/today/ico_friends.png) -280px -220px
		no-repeat;
	background-size: 699px 451px;
	color: transparent;
}

/* 댓글 영역 */
.body-feed .link-comments {
	margin-top: 12px;
}

.body-feed .txt_count {
	display: block;
	line-height: 20px;
	color: #909092;
}

.body-feed .info-comments {
	display: block;
	padding: 8px 0 16px;
}

.body-feed .info-comments .name {
	font-weight: bold;
	height: 20px;
	margin-right: 4px;
	line-height: 20px;
}

.body-feed .info-comments .comments {
	line-height: 20px;
	color: #747475;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.body-feed .comments-input {
	position: relative;
	padding: 13px 62px 13px 14px;
	border-radius: 0 24px 24px 24px;
	background-color: #f2f2f2;
	color: #aeaeaf;
	line-height: 20px;
	cursor: pointer;
}

.profile img {
	width: 43px;
}
</style>


<form class="form-login" action="/SYJ_Mall/payment.action" method="post">
	<input type="hidden" class="input" name="p_seq" value='1,2,3'>
	<input type="hidden" class="input" name="sum" value='10,20,30'>
	<button class="btn" type="submit">test</button>
</form>

    
<div class="container-wrap today-wrap">
	
</div>


<!-- <div class="swiper-container slide">
	<div class="swiper-wrapper ">
		<div class="swiper-slide">
		<img alt="" src='resources/images/today/story/bool_mung/media_0_20211214171149.jpg'>
	</div>
	<div class="swiper-slide">test</div>
	</div>
	<div class="swiper-pagination"></div>
</div> -->


<input type="hidden" id="hid_seq" value="${seq}">
<script type="text/javascript">
/* $(".login-or-out").click(function () {
    alert($(this).attr("id"));
  }); */
// 공유하기 클릭 시 팝업창
$(document).on("click",".share-btn",function(){
  $("#testmodal1").css("visibility", "visible");
  $(".option-modal-wrap").css("bottom", "80px;");
  $(document.body).css("overflow", "hidden");
});

//모달 제거하는 용도
$(document).on("click",".share-modal-wrap .header .close",function(){
  $(".overlay-wrap").css("visibility", "hidden");
  $(".option-modal-wrap").css("bottom", "80px");
  $(document.body).css("overflow", "visible");
});

	var hid_seq = $('#hid_seq').val();
	//alert(hid_seq);
	var count = 0;

	
	//로그인 모달창 돌아가기
	$(document).on("click",".close-btn",function(){
		$('#login-product-modal').css('visibility','hidden');
	});
	

	function heart_select(a, b) {
		$.ajax({
			url : "new_heart_select.action",
			type : 'post',
			data : {
				list_seq : a,
				session_seq : b
			},
			success : function(data) {
				//alert(data);
				if (data != 0) {
					$("#like-btn_" + a).css('background-position',
							'-200px -100');
				}

			},
			error : function() {
				alert("에러");
			}
		});
	}
	function heart_count(seq) {
		$.ajax({
			url: "heart_count.action",
			type: 'post',
			data: {
				num: seq,
			},
			success: function(data) {
				//alert(data);

				$("#like-count_" + seq ).text("좋아요 " + data + "명");
			},
			error: function() {
				alert("에러");
			}
		});
	}

	$(document).on("click", ".comments-input", function(e) {
		var seq = $(this).attr("id");
		my_login_modal_open();
		location.href = "/SYJ_Mall/feed.action?seq=" + seq;
	});

	$(document).on("click", ".txt-count", function(e) {
		var seq = $(this).attr("id");
		my_login_modal_open();
		location.href = "/SYJ_Mall/feed.action?seq=" + seq;
	});
	$(document).on("click", ".reply-btn", function(e) {
		var seq = $(this).attr("id");
		my_login_modal_open();
		location.href = "/SYJ_Mall/feed.action?seq=" + seq;
		//$('#login-product-modal').css('visibility','visible');

		//location.href = "/SYJ_Mall/login.action";
		//location.href = "/SYJ_Mall/feed.action?seq=" + seq;
	});

	
	
	//좋아요 눌러줄때 -> 로그인 안되있는 경우에는 로그인 유도해줘야함.
	$(document).on("click", ".like-btn", function(e) {
		const id = $(this).attr("id").replace('like-btn_','');
		
		var count= parseInt($("#like-count_" + id).text().replace('좋아요','').replace('명',''));
		
		$("#like-count_" + id).text("좋아요 "+count+ "명");
		//로그인 모달!!
		//my_login_modal_open();
		
		var type = "";
		 if ($(this).css('background-position') == '-200px -100px') {
			//alert();
			$(this).css(
					'background-position', '-160px -100px');
			count = count-1;
			$("#like-count_" + id).text("좋아요 "+count+ "명");
			type = "D";
		} else if($(this).css('background-position') == '-160px -100px'){
			$(this).css(
					'background-position', '-200px -100px');
			count = count+1;
			$("#like-count_" + id).text("좋아요 "+count+ "명");
			type = "I";
		}  
		if(type!=""){
			$.ajax({
				url: "new_heart_update.action",
				type: 'post',
				data: {
					list_seq: id,
					member_seq: hid_seq,
					gubn: type
				},
				success: function(data) {
					heart(id);
				},
				error: function() {
					alert("에러");
				}
			});
		}
	});

	window.addEventListener("scroll", function() {
		const SCROLLED_HEIGHT = window.scrollY;
		const WINDOW_HEIGHT = window.innerHeight;
		const DOC_TOTAL_HEIGHT = document.body.offsetHeight;

		const IS_BOTTOM = WINDOW_HEIGHT + SCROLLED_HEIGHT === DOC_TOTAL_HEIGHT;

		if (IS_BOTTOM) {
			console.log("스크롤바 이벤트");
			new_main();
		}
	});
	new_main();
	function sub(list_seq) {

		$.ajax({
			url : "new_main_sub.action",
			type : 'post',
			data : {
				seq : list_seq,
			},
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					sub_img(data[i]);

				}
			},
			error : function() {
				alert("에러");
			}
		});
	}
	function sub_img(list_seq) {

		$
				.ajax({
					url : "new_main_sub_img.action",
					type : 'post',
					data : {
						seq : list_seq,
					},
					success : function(data) {
						for (var i = 0; i < data.length; i++) {
							//alert(data[i].product_id);
							//alert(data[i].product_nm);
							//alert(data[i].product_price);
							//alert(data[i].product_img);
							$("#option-list-tag_" + list_seq)
									.append(
											"<ul class='option-list-product'>"
													+ "<li>"
													+ "<div class='list-product-contents'>"
													+ "<img class='img-product' src='"+data[i].product_img+"'>"
													+ "<div class='info-product'>"
													+ "<span class='title-product'>"
													+ data[i].product_nm
													+ "</span> <span"
									+"class='price-product'>"
													+ data[i].product_price
															.replace(".0000",
																	"")
															.toString()
															.replace(
																	/\B(?=(\d{3})+(?!\d))/g,
																	',')
													+ "원</span>"
													+ "</div>"
													+ "</div>"
													+ "<div class='list-product-cart'>"
													+ "<div class='cart-btn'></div>"
													+ "</div>" + "</li>"
													+ "</ul>");

						}
					},
					error : function() {
						alert("에러");
					}
				});
	}
	function img(list_seq) {

		$
				.ajax({
					url : "new_main_img.action",
					type : 'post',
					data : {
						seq : list_seq,
					},
					success : function(data) {
						for (var i = 0; i < data.length; i++) {
							$("#swiper" + list_seq + " .swiper-wrapper")
									.append(
											"<div class='swiper-slide'><img src='resources/images/today/story/" + data[i] + "'></img></div>");

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
	function char_img(char_seq, seq) {
		//alert(char_seq);
		$.ajax({
			url : "char_img.action",
			type : 'post',
			data : {
				name : char_seq,
			},
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					$("#profile_" + seq).attr("src", "" + data[i] + "");
					/* alert(seq);
					alert(data[i]); */

				}

			},
			error : function() {
				alert("에러");
			}
		});
	}
	function new_main() {

		count = count + 2;
		$
				.ajax({
					url : "new_list.action",
					type : 'post',
					data : {
						num : count,
					},
					success : function(data) {
						$(data)
								.each(
										function() {
											//alert(this.seq);
											var tag = "";
											if (this.tag != null) {
												tag = "<li class='list-tag-txt'>"
														+ this.tag + "</li>"
											}
											$(".container-wrap")
													.append(
															"<div class='box-feed'>"
																	+ "<div class='head-feed'>"
																	+ "<div class='profile'><img id = 'profile_"+ this.seq+ "' ></img></div>"
																	+ "<div class='info-head'>"
																	+ "<span class='txt-profile'>"
																	+ this.character_name
																	+ "</span> <span class='txt-time'>"
																	+ this.reg_dt
																	+ "</span>"
																	+ "</div>"
																	+ "</div>"
																	+ "<div class='body-feed'>"

																	+ "<div class='swiper-container slide-feed' id='swiper"+ this.seq +"'>"
																	+ "<div class='swiper-wrapper'>"
																	+ "</div>"
																	+ "<div class='swiper-button-next'></div>"
																	+ "<div class='swiper-button-prev'></div>"
																	+ "<div class='swiper-pagination'></div>"
																	+ "</div>"

																	+ "<div class='option-link-view'>"
																	+ "풀꽃 주차번호판 방향제 세트 보러 가기 <span class='icon-arrow'></span>"
																	+ "</div>"
																	+ "<div class='info-feed'>"
																	+ "<div class='like-count' id ='like-count_"+ this.seq + "'></div>"
																	+ "<div class='title'>"
																	+ this.title
																	+ "</div>"
																	+ "<div class='desc'>"
																	+ "<p>"
																	+ this.content
																	+ "</p>"
																	+ "</div>"
																	+ "<div class='util-left'>"
																	+ "<div class='like-btn' id = 'like-btn_"+this.seq +"'></div>"
																	+ "<div class='reply-btn' id='"+this.seq+"'></div>"
																	+ "</div>"
																	+ "<div class='util-right'>"
																	+ "<div class='share-btn'></div>"
																	+ "</div>"
																	+ "</div>"
																	+ "<ul class='option-list-tag' id ='option-list-tag_"+this.seq +"'>"

																	+ "</ul>"
																	+ tag
																	+ "</ul>"
																	+ "<ul class='option-list-product'>"
																	+ "<div class='link-comments'>"
																	+ "<span class='txt-count'id='"+this.seq+"'>댓글 13개</span> <span class='info-comments'>"
																	+ "<span class='name'>최**</span> <span class='comments'>라이언"
																	+ "귀여웡~~!</span>"
																	+ "</span>"
																	+ "<div class='comments-input' id='"+this.seq+"'>댓글을 남겨주세요</div>"
																	+ "</div>"
																	+ "</div>"
																	+ "</div>");
											img(this.seq);
											sub(this.seq);
											char_img(this.character_name,
													this.seq);
											heart_select(this.seq, parseInt($(
													'#hid_seq').val()));
											heart_count(this.seq);
											
										}// foreach 끝

								);
					},
					error : function() {
						alert("에러");
					}
				});

	}
</script>