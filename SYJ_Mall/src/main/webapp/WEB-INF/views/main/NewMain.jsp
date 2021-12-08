<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
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
  background: url(/SYJ_Mall/resources/today/ico_friends.png) -320px 0 no-repeat;
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
  background: url(/SYJ_Mall/resources/images/today/ico_friends.png) -160px -100px no-repeat;
  background-size: 699px 451px;
  cursor: pointer;
}

.info-feed .util-left .reply-btn {
  width: 32px;
  height: 32px;
  background: url(/SYJ_Mall/resources/images/today/ico_friends.png) -120px -100px no-repeat;
  background-size: 699px 451px;
  cursor: pointer;
}

.info-feed .util-right .share-btn {
  width: 32px;
  height: 32px;
  background: url(/SYJ_Mall/resources/images/today/ico_friends.png) -80px -100px no-repeat;
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

.option-list-product .list-product-contents .info-product .title-product {
  font-size: 14px;
  line-height: 16px;
  color: #747475;
}

.option-list-product .list-product-contents .info-product .price-product {
  font-size: 15px;
  line-height: 24px;
  font-weight: bold;
}

.option-list-product .list-product-cart .cart-btn {
  width: 24px;
  height: 24px;
  background: url(.././images/today/ico_friends.png) -280px -220px no-repeat;
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



</style>




 <div class="container-wrap today-wrap">
 <!--
	<form class="form-login" action = "/SYJ_Mall/payment.action" method = "post">
	<input type = "hidden" class="input" name = "p_seq" value ='1,2,3'>
	<input type = "hidden" class="input" name = "sum" value='10,20,30'>
	<button class="btn" type="submit">test </button>
	</form>
	
	게시글 하나 박스
	<div class="box-feed">
		게시글 상단
		<div class="head-feed">
			<div class="profile"></div>
			<div class="info-head">
				<span class="txt-profile">라이언</span> <span class="txt-time">3시간
					전</span>
			</div>
		</div>
		게시글 내용
		<div class="body-feed">
			이미지 사진
			<div class="slide-feed"></div>
			[+] 관련 상품 보러가기 텍스트 형식
			<div class="option-link-view">
				풀꽃 주차번호판 방향제 세트 보러 가기 <span class="icon-arrow"></span>
			</div>
			정보 영역
			<div class="info-feed">
				<div class="like-count">좋아요 2,092명</div>
				<div class="title">
					콜록콜록😵‍💫<br>쌀쌀해진 이 맘 때 필요한 건 뭐?
				</div>
				<div class="desc">
					<p>
						갑자기 추워진 날씨<br> 담요와 머그로 따뜻하게 겨울 맞이하기!🙌🏻
					</p>
				</div>
				<div class="util-left">
					<div class="like-btn"></div>
					<div class="reply-btn"></div>
				</div>
				<div class="util-right">
					<div class="share-btn"></div>
				</div>
			</div>
			[+] 해당 게시글 태그
			<ul class="option-list-tag">
				<li class="list-tag-txt">#프렌즈도감</li>
				<li class="list-tag-txt">#라이언</li>
			</ul>
			[+] 관련 상품 보러가기 이미지 형식 
			<ul class="option-list-product">
				<li>
					<div class="list-product-contents">
						<img class="img-product" src="images/today/product-list.jfif">
						<div class="info-product">
							<span class="title-product">집콕 입는 담요_라이언&춘식이</span> <span
								class="price-product">39,000</span>
						</div>
					</div>
					<div class="list-product-cart">
						<div class="cart-btn"></div>
					</div>
				</li>
				<li>
					<div class="list-product-contents">
						<img class="img-product" src="images/today/product-list.jfif">
						<div class="info-product">
							<span class="title-product">따뜻한극세사이불담요_라이언</span> <span
								class="price-product">39,000</span>
						</div>
					</div>
					<div class="list-product-cart">
						<div class="cart-btn"></div>
					</div>
				</li>
			</ul>
			댓글 영역
			<div class="link-comments">
				<span class="txt-count">댓글 13개</span> <span class="info-comments">
					<span class="name">최**</span> <span class="comments">라이언
						귀여웡~~!</span>
				</span>
				<div class="comments-input">댓글을 남겨주세요</div>
			</div>
		</div>
	</div>


--> 
</div>
 

<script type="text/javascript">




$(document).on(
		"click",
		".etc_2",
		function(e) {
			/* 	var m_seq = parseInt($('#hid_seq').val());
				if (m_seq != 0) { */

			var seq = $(e.target).parent().parent().parent().attr('id')
					.replace("content_", "");
			location.href = "/SYJ_Mall/feed.action?seq=" + seq;
			/* 	}else{
					openModal("modal1");
				} */

		});
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
function main_feed(list_seq) {
	var result = new Array();
	$.ajax({
		url : "main_feed.action",
		type : 'post',
		async : false,
		data : {
			seq : list_seq,
		},
		success : function(data) {

			result.push(data.reg_id);
			result.push(data.feed);

		},
		error : function() {
			alert("에러");
		}
	});

	return result;

}

function main_feed_count(list_seq) {
var count = 0;
	$.ajax({
		url : "main_feed_count.action",
		type : 'post',
		async : false,
		data : {
			seq : list_seq,
		},
		success : function(data) {
			count = data;
		},
		error : function() {
			alert("에러");
		}
	});

return count;

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
										var result = main_feed(this.seq);
										var spn1 = result[0];
										var spn2 = result[1];
										if (typeof spn1 == "undefined") {
											spn1 = "";
											spn2 = "";
										}else{
										
											spn2 = spn2.replace('<br/>', ' ');
										
										}
								
										var count = main_feed_count(this.seq);
										
										$(".today-wrap")
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
																+ "댓글 "+count+"개"
																+ "</div>"
																+ "<div class='txt_5'>"
																+ "<span>"
																+ spn1
																+ "</span>"
																+ spn2
																+ "</div>"
																+ "<div class='comment'>"
																+ "<textarea placeholder='댓글을 달아주세요.' disabled></textarea>"
																+ "</div>"
																+ "</div>"
																+ "</div>"
																+ "</div>");
										/* heart_select(this.seq,
												parseInt($('#hid_seq')
														.val())); */
										//img(this.seq);
										//heart(this.seq);
									}

							);
				},
				error : function() {
					alert("에러");
				}
			});

}

</script>