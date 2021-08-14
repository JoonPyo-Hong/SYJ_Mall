<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp" %>
<link rel = "stylesheet" href = "resources/css/popular/popularMainNew.css"> 

<div class="container-wrap hot-wrap" id ="layout" style="height: 900px;">
	<c:forEach var="pdto" items="${popularDtoList}">
		<div class="item" id="${pdto.productId}" style="background-image : url(${pdto.productImg})"><div class="basket" ></div></div>
	</c:forEach>
</div>


<script>
	
	
	$('.item').click(function(){
		alert("checked");
	});
	
	//장바구니 모양 클릭하면 색깔 변환하게 해준다.
	$('.basket').click(function(e){
		const test = $(this).css('background-image','url(resources/images/hot/cart_on.png)');
		console.log($(this).parent().attr('id'));
		e.stopPropagation();  
	});
	
	
	
</script>