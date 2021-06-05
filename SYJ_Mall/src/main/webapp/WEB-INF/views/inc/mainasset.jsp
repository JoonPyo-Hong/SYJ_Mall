<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<link rel = "stylesheet" href = "resources/css/bootstrap.css">
<link rel = "stylesheet" href = "resources/css/jquery-ui.css">
<script src = "resources/js/jquery-1.12.4.js"></script>
<script src = "resources/js/jquery-ui.js"></script>
<script src = "resources/js/bootstrap.js"></script>

<style>

         /* 넥슨 글씨체 */
        @font-face {
            font-family: 'NEXON Lv1 Gothic OTF';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }


		select{
		/*ios대응*/
		-webkit-appearance: none;
		-moz-appearance: none; 
		appearance: none;
		
		/*화살표 배경 넣기*/
		background: url('이미지경로') no-repeat 98% 50% #fff; /*화살표 select박스 오른쪽 중앙 배치,배경 흰색*/
		}
		
		
		select::-ms-expand{ 
		display:none; /* 화살표 없애기 for IE10, 11*/
		}
		
		input{
		/*ios대응*/
		appearance: none;
		-webkit-appearance: none;
		-webkit-border-radius: 0;
		}
	
</style>