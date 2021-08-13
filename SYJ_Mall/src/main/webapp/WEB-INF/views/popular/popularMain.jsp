<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp" %>
<link rel = "stylesheet" href = "resources/css/popular/popularMain.css"> 

<div class="container-wrap hot-wrap" style="height: 900px;">
	<div class="item" id="1"><div class="basket" ></div></div>
	<div class="item" id="2"><div class="basket" ></div></div>
	<div class="item" id="3"><div class="basket" ></div></div>
	<div class="item" id="4"><div class="basket" ></div></div>
	<div class="item" id="5"><div class="basket" ></div></div>
	<div class="item" id="6"><div class="basket" ></div></div>
	<div class="item" id="7"><div class="basket" ></div></div>
	<div class="item" id="8"><div class="basket" ></div></div>
	<div class="item" id="9"><div class="basket" ></div></div>
	<div class="item" id="10"><div class="basket"></div></div>
	<div class="item" id="11"><div class="basket" ></div></div>
	<div class="item" id="12"><div class="basket" ></div></div>
</div>


<script>
	
	
	$('.item').click(function(){
		alert("checked");
	});
	
	
	$('.basket').click(function(e){
		const test = $(this).css('background-image','url(resources/images/hot/cart_on.png)');
		console.log($(this).parent().attr('id'));
		e.stopPropagation();  
	});
	
</script>