<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<script src="resources/js/jquery-1.12.4.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/bootstrap.js"></script>

<style>
html {
	margin: 0px;
	width: 100%;
	height: 100%;
}

body {
	margin: 0px;
	width: 100%;
	height: 100%;
}

#head {
	width: 640px;
	height: 47px;
	margin: 0px auto;
	display: flex;
	border: 1px solid black;
}

#head div:nth-child(1) {
	border: 1px solid black;
	width: 32px;
	height: 32px;
	margin: 8px 3px 7px 13px;
}

#head div:nth-child(2) {
	border: 1px solid black;
	width: 147px;
	height: 24px;
	display: block;
	margin: 0px auto;
	margin-top: 11px;
}

#head div:nth-child(3) {
	border: 1px solid black;
	width: 32px;
	height: 32px;
	margin-top: 8px;
}

#head div:nth-child(4) {
	border: 1px solid black;
	width: 32px;
	height: 32px;
	margin: 8px 13px 7px 2px;
}

#img_menu {
	width: 18px;
	height: 18px;
}

#spn_menu {
	width: 32px;
	height: 32px;
	cursor: pointer;
}

#tab {
	width: 605px;
	height: 43px;
	margin: 0px auto;
	display: flex;
	border-bottom: 1px solid rgb(227, 229, 232);
	padding: 0px 17.5px;
	text-align: center;
}

#tab div {
	width: 146.25px;
	height: 40px;
	margin: 0px auto;
	line-height: 40px;
}

.tab_selected {
	border-bottom: 4px solid black;
	font-weight: bold;
}

.content {
	margin: 0px auto;
	height: 932px;
	width: 600px;
	padding: 20px 20px 30px;
	border: 1px solid black;
}

.top {
	height: 41px;
	width: 600px;
	margin-bottom: 16px;
	border: 1px solid black;
	font-size: 14px;
	line-height: 1.5;
	display: flex;
}

.img_top {
	height: 40px;
	width: 40px;
	margin-right: 8px;
	border: 1px solid black;
}

.txt_top p {
	font-size: 16px;
	letter-spacing: -0.25px;
	margin: 0px;
	height: 19px;
	width: 131.703px;
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

.media {
	height: 600px;
	width: 600px;
	border: 1px solid black;
}

.etc {
	height: 27px;
	width: 600px;
	margin-top: 10px;
	border: 1px solid black;
	display: flex;
}

.etc_1 {
	width: 27px;
	height: 27px;
	border: 1px solid black;
	cursor: pointer;
}

.etc_2 {
	margin-left: 12px;
	width: 27px;
	height: 27px;
	border: 1px solid black;
	cursor: pointer;
}

.etc_3 {
	width: 27px;
	height: 27px;
	border: 1px solid black;
	cursor: pointer;
	margin-left: auto;
}

.txt_1 {
	height: 21px;
	width: 600px;
	margin-top: 12px;
	font-size: 14px;
	line-height: 1.5;
	color: #1e1e1e;
	border: 1px solid black;
}

.txt_1 span {
	font-weight: bold;
}

.txt_2 {
	height: 24px;
	width: 600px;
	font-size: 20px;
	margin-top: 12px;
	letter-spacing: -0.31px;
	border: 1px solid black;
	font-weight: bold;
	line-height: -1.2;
}

.txt_3 {
	width: 600px;
	font-size: 14px;
	letter-spacing: -0.22px;
	margin-top: 10px;
	border: 1px solid black;
	line-height: 1.43;
}

.txt_4 {
	width: 600px;
	font-size: 14px;
	letter-spacing: -0.22px;
	border: 1px solid black;
	color: rgb(154, 154, 158);
	margin-top: 7px;
}

.txt_5 {
	width: 600px;
	font-size: 14px;
	letter-spacing: -0.22px;
	border: 1px solid black;
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
</style>