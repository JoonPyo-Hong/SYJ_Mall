<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel = "stylesheet" href = "resources/css/main/mainTop.css">
    <!-- 메인화면 최 상단 -->
	<div id="wrap">
		<div id="sticky">
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
		</div>
		<input type="hidden" id="hid_seq" value="${seq}">
		<div class="scroll"></div>
	</div>    