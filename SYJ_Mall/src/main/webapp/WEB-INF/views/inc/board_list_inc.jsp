<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<script src="resources/js/jquery-1.12.4.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/bootstrap.js"></script>

<style>
#wrap {
	height: 100%;
	width: 640px;
	margin: 0px auto;
}

#top {
	height: 220px;
	background-size: cover;
	margin-top: 47px;
	background-image: url("resources/images/banner_faq.png");
	background-size: cover;
	margin-top: 47px;
	margin-bottom: 10px;
	display: flex;
	align-items: center;
}

#middle {
	font-family: SFProText, "Apple SD Gothic Neo", AppleSDGothicNeo,
		"Malgun Gothic", "맑은 고딕", sans-serif;
}

.title {
	position: static;
	width: 590px;
	height: 20px;
	font-size: 17px;
	letter-spacing: -0.2px;
	padding-right: 0px;
	font-weight: bold;
	float: left;
}

.date {
	color: rgb(154, 154, 158);
	font-size: 13px;
	letter-spacing: -0.2px;
	margin: 3px 0px 0px;
}

.btn_notice {
	float: left;
}

.btn_notice img {
	top: auto;
	right: 16px;
	margin-top: 1px;
	width: 18px;
	height: 18px;
	background-size: 18px;
	padding-right: 0px;
	cursor: pointer;
}

#bottom {
	clear: both;
}

#bottom a {
	font-size: 15px;
	text-decoration: none;
	color: rgb(212, 215, 225);
}

#bottom b {
	font-size: 15px;
	cursor: pointer;
	text-decoration: underline;
}

.list_add {
	clear: both;
	padding: 30px;
}

.bottom_tag {
	margin: 10px;
	margin-top: 50px;
}

.list_add img {
	width: 26.8px;
	height: 24.8px;
	margin-right: 10px;
}

.list {
	padding: 30px 16px;
	position: relative;
	float: left;
}

.date {
	float: left;
	height: 19px;
}

.ryan {
	float: left;
}

.ajax_content {
	float: left;
}

#notice {
	color: white;
	font-size: 24px;
	letter-spacing: -0.2px;
	margin-left: 20px;
	font-weight: bold;
}

#pasing {
	display: block;
	text-align: center;
	padding-top:60px;
	height: 100%;
}
</style>