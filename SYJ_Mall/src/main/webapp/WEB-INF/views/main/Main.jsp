<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/main.jsp"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Main</title>

</head>
<body>
	
        <div id="wrap">
			<div id ="head">
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
			<div class="content">
				<div class="top">
					<img class="img_top" src="resources/images/main/npc_20210429161734.png"></img>
					<div class="txt_top">
						<p>튜브</p>
						<div>
							<span>Daily Story</span>
							<span> · 4시간 전</span>
						</div>
					</div>
				</div>
				<div class="media">
					<span id="img_media_1"></span>
				</div>
				<div class="etc">
					<span class="etc_1"></span>
					<img class="etc_2" src="resources/images/main/reply-black.png"></img>
					<span class="etc_3">
						<span class="etc_selected"></span>
						<span class="etc_unselected"></span>
						<span class="etc_unselected"></span>
						<span class="etc_unselected"></span>
						<span class="etc_unselected"></span>
					</span>
					<img class="etc_4" src="resources/images/main/share-black.png"></img>
				</div>
				<div class="txt_1">
					좋아요 <span>213개</span> 
				</div>
				<div class="txt_2">
					입맛 특이 취향 모여라🙆🏼‍♂️
				</div>
				<div class="txt_3">
					하늘이 두 쪽 나도 민초단 (손)🙋🏻‍♀️<br>
					고수 듬뿍 넣은 파스타 (손)🙋🏻‍♂️
				</div>
				<div class="txt_4">
					댓글 252개
				</div>
				<div class="txt_5">
				<span>박*린</span>어쩌구
				</div>
				<div class="comment">
					<textarea placeholder="댓글을 달아주세요." disabled  ></textarea>
				</div>
			</div>
        </div>
</body>
</html>