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
		<!--  -->
		<div class="content">
<!-- 			<div class="top">
				<img class="img_top" src="resources/images/main/${list.reg_id}.png"></img>
				<div class="txt_top">
					<p>${list.reg_id}</p>
					<div>
						<span>${list.gubn}</span> <span> <c:if
								test="${not empty list.gubn}"> · </c:if>${list.reg_dt}
						</span>
					</div>
				</div>
			</div>
			<div class="media">
				<span id="img_media_1"></span>
			</div>
			<div class="etc">
				<span class="etc_1"></span> <img class="etc_2"
					src="resources/images/main/reply-black.png"></img> <span
					class="etc_3"> <span class="etc_selected"></span> <span
					class="etc_unselected"></span> <span class="etc_unselected"></span>
					<span class="etc_unselected"></span> <span class="etc_unselected"></span>
				</span> <img class="etc_4" src="resources/images/main/share-black.png"></img>
			</div>
			<div class="txt_1">
				좋아요 <span>213개</span>
			</div>
			<div class="txt_2">${list.title}</div>
			<div class="txt_3">${list.contents}</div>
			<div class="txt_4">댓글 252개</div>
			<div class="txt_5">
				<span>박*린</span>어쩌구
			</div>
			<div class="comment">
				<textarea placeholder="댓글을 달아주세요." disabled></textarea>
			</div> -->
		</div>
		<!--  -->
	</div>
</body>
<script type="text/javascript">
	
	window.onload = function() {

		list();
	}

	window.addEventListener(
					"scroll",
					function() {
						const SCROLLED_HEIGHT = window.scrollY;
						const WINDOW_HEIGHT = window.innerHeight;
						const DOC_TOTAL_HEIGHT = document.body.offsetHeight;

						const IS_BOTTOM = WINDOW_HEIGHT + SCROLLED_HEIGHT > DOC_TOTAL_HEIGHT - 300;

						if (IS_BOTTOM) {
							console.log("스크롤바 이벤트");
						}
					});
	function list() {
		
		$.ajax({
			url : "list.action",
			type : 'post',
			data : {

			},
			success : function(data) {

				$(data).each(function() {
					var txt = "";
					if(this.gubn){
						txt = " · ";
					}
					$(".content").append(
					   "<div class='top'>" 
					+ "<img class='img_top' src='resources/images/main/" + this.reg_id + ".png'></img>"
					+ "<div class='txt_top'>"
					+ "<p>" + this.reg_id + "</p>"
					+ "<div>"
					+ "<span>" + this.gubn + "</span><span>" + txt + "</span>"
					+ "</div>"
					+ "</div>"
					+ "</div>"
					+ "<div class='media'>"
					+ "<span id="img_media_1"></span>"
					+ "</div>"
					+ "<div class='etc'>"
					+ "<span class='etc_1'></span>"
					+ "<img class='etc_2' src='resources/images/main/reply-black.png'></img>"
					+ "<span class='etc_3'>" 
					+ "<span class='etc_selected'></span>"
					+ "<span class='etc_unselected'></span>"
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
					+ "<div class='comment'>" + "<textarea placeholder="댓글을 달아주세요." disabled></textarea>" + "</div>"
					+ "</div>"
					);
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
