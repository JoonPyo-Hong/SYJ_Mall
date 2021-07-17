<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/mainasset.jsp" %>
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
				<c:if test="${selected eq 'today'}">
				<div class="tab_selected">오늘</div>
				<div>신규</div>
				<div>인기</div>
				<div>마이</div>
				</c:if>
				<c:if test="${selected eq 'new'}">
				<div>오늘</div>
				<div class="tab_selected">신규</div>
				<div>인기</div>
				<div>마이</div>
				</c:if>
				<c:if test="${selected eq 'popular'}">
				<div>오늘</div>
				<div>신규</div>
				<div class="tab_selected">인기</div>
				<div>마이</div>
				</c:if>
				<c:if test="${selected eq 'my'}">
				<div>오늘</div>
				<div>신규</div>
				<div>인기</div>
				<div class="tab_selected">마이</div>
				</c:if>
			</div>
		</div>
		<input type="hidden" id="hid_seq" value="${seq}">
		<div class="scroll"></div>
	</div>    