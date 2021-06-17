<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/board_list_inc.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0" />
<title>NoticeList</title>
<style>
</style>
</head>
<body>
	<div id="wrap">

		<div id="top"></div>
		<div id="middle">
			<c:forEach var="list" items="${list}">
				<div>
					<span class="title">${list.title}</span> <span class="btn_notice">
						<img class="img_notice" id="img_notice_${list.seq}"
						onclick="notice_view(${list.seq})"
						src="resources/images/kakao_ryan.png">
					</span>
				</div>
				<div class="date">${list.reg_dt}</div>
			</c:forEach>
		</div>
		<div id="bottom">
			<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">></a>
		</div>
	</div>
</body>
<script type="text/javascript">
	function notice_view(list_seq){
		
	        $.ajax({
	            url: "list_btn.action",
	            type : 'post', 
	            data : { 
	            	content : "test",
	            },       	
	            success: function(data){
	                alert(data);
	            },
	            error: function(){
	                alert("에러");
	            }
	        });
	
      
	}


</script>
</html>