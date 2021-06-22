<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/board_list_inc.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				<div id="list_${list.seq}" class="list">
					<div class="title">${list.title}</div> 
					<div class="btn_notice">
						<img class="img_notice" id="img_notice_${list.seq}"
						onclick="notice_view(${list.seq})"
						src="resources/images/down.png">
					</div>
				<div class="date">${list.reg_dt}</div>
				</div>
			</c:forEach>
		</div>
		<div id="bottom">
			<div style="display: block; text-align: center;">		
				<c:if test="${paging.startPage != 1 }">
					<a href="/SYJ_Mall/notice_list.action?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a href="/SYJ_Mall/notice_list.action?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a href="/SYJ_Mall/notice_list.action?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
				</c:if>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function notice_view(list_seq){
		
	        $.ajax({
	            url: "list_btn.action",
	            type : 'post', 
	            data : { 
	            	seq : list_seq,
	            },       	
	            success: function(data){
	                /* alert(data[0].content); */
	                if ($('#list_add_' + list_seq).length) {
	                	$('#list_add_' + list_seq).remove();
	                	$('#img_notice_' + list_seq).attr("src", "resources/images/down.png");
	                }else{
	                	$('#list_' + list_seq).append("<div class='list_add' id ='list_add_"+list_seq+"'>"+data[0].content+"</div>");
	                	$('#img_notice_' + list_seq).attr("src", "resources/images/up.png");
	                }
	            },
	            error: function(){
	                alert("에러");
	            }
	        });
	
      
	}


</script>
</html>