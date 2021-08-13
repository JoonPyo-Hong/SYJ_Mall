<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp" %>
<link rel = "stylesheet" href = "resources/css/popular/popularMain.css"> 

<div class="container-wrap hot-wrap" style="border: 1px solid red; height: 900px;">
	<div class="item" id="1"><div class="basket" id="a1" style="background-image: url(resources/images/hot/cart_on.png)"></div></div>
	<div class="item" id="2"><div class="basket" id="a2"></div></div>
	<div class="item" id="3"><div class="basket" id="a3"></div></div>
	<div class="item" id="4"><div class="basket" id="a4"></div></div>
	<div class="item" id="5"><div class="basket" id="a5"></div></div>
	<div class="item" id="6"><div class="basket" id="a6"></div></div>
	<div class="item" id="7"><div class="basket" id="a7"></div></div>
	<div class="item" id="8"><div class="basket" id="a8"></div></div>
	<div class="item" id="9"><div class="basket" id="a9"></div></div>
	<div class="item" id="10"><div class="basket" id="a10"></div></div>
	<div class="item" id="11"><div class="basket" id="a11"></div></div>
	<div class="item" id="12"><div class="basket" id="a12"></div></div>
</div>


<script>
	
	/* $('.item').before().click(function(e){
		//console.log($(this).parent().attr('id'));
		//const img = $(this).attr('id');
		//$('#'+ img)
		//console.log($(this).parent().attr('id'));
		//event.preventDefault();
		//console.log($(this).children().attr('id'));
		console.log($(this).children());
		event.preventDefault(e);
	}); */
	
	
	$('.item').click(function(){
		alert("checked");
	});
	
	
	$('.basket').click(function(e){
		console.log($(this).parent().attr('id'));
		const test = $(this).parent().attr('id');
		$("#a2").css('background-image','url(resources/images/hot/cart_on.png)');
		//console.log($('#'+ test).children('.basket'));
		//$('#'+ test).children('.basket').css('background-image','resources/images/hot/cart_on.png');
		//$('#'+ test).children().css('background-image','resources/images/hot/cart_on.png');
		e.stopPropagation();  
	});
	
</script>