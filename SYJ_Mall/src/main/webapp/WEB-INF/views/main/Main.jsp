<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="/WEB-INF/views/inc/board_list_inc.jsp"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0" />
<title>Main</title>
<style>
html {
	height: 100%;
	width: 100%;
	margin: 0px;
}

body {
	height: 100%;
	width: 100%;
	margin: 0px;
}

#wrap {
	height: 100%;
	width: 100%;
	text-align: center;
	font-family: SFProText, "Apple SD Gothic Neo", AppleSDGothicNeo,
		"Malgun Gothic", "맑은 고딕", sans-serif;
}

#Head {
	display: inline-block;
	width: 640px;
	height: 47px;
	width: 640px;
}

#btn_menu img {
	color: transparent;
	width: 18px;
	height: 18px;
}

#btn_menu {
	float: left;
	color: transparent;
	width: 32px;
	height: 32px;
	margin: 9px 3px 5px 6px;
	padding: 0px;
}

#kakao_friends {
	text-align: center;
}

#spn_kakao_friends img {
	width: 147px;
	height: 24px;
	vertical-align: middle;
	text-align: center;
}

#spn_kakao_friends:after {
	display: inline-block;
	height: 100%;
	content: "";
	vertical-align: middle;
}

button {
	border: 0 none;
	background-color: transparent;
	cursor: pointer;
}
</style>
</head>
<body>
	<div id="wrap">
		<div id="Head">
			<span>
				<button type="button" id="btn_menu">
					<img src="resources/images/main/ic_menu_2x.png">
				</button>
			</span> 
			<span id="spn_kakao_friends" > <img 
				src="resources/images/main/new-logo-mo.png">
			</span>
		</div>
	</div>
</body>
</html>