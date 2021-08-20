<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp" %>
<link rel = "stylesheet" href = "resources/css/popular/popularMain.css"> 


<div class="container-wrap hot-wrap" id = "popularInnerContent">
    
    <div>
        <div class="basic-grid left-grid">
            <div class="grid-img" id="${popularDtoList[0].productId}" style="background-image : url(${popularDtoList[0].productImg})"></div>
            <div class="grid-img" id="${popularDtoList[1].productId}" style="background-image : url(${popularDtoList[1].productImg})"></div>
            <div class="grid-img" id="${popularDtoList[2].productId}" style="background-image : url(${popularDtoList[2].productImg})"></div>
        </div>
        <div class="basic-grid normal-grid">
            <div class="grid-img" id="${popularDtoList[3].productId}" style="background-image : url(${popularDtoList[3].productImg})"></div>
            <div class="grid-img" id="${popularDtoList[4].productId}" style="background-image : url(${popularDtoList[4].productImg})"></div>
            <div class="grid-img" id="${popularDtoList[5].productId}" style="background-image : url(${popularDtoList[5].productImg})"></div>
            <div class="grid-img" id="${popularDtoList[6].productId}" style="background-image : url(${popularDtoList[6].productImg})"></div>
            <div class="grid-img" id="${popularDtoList[7].productId}" style="background-image : url(${popularDtoList[7].productImg})"></div>
            <div class="grid-img" id="${popularDtoList[8].productId}" style="background-image : url(${popularDtoList[8].productImg})"></div>
        </div>
    </div>
    <div>
        <div class="basic-grid right-grid">
            <div class="grid-img" id="${popularDtoList[9].productId}" style="background-image : url(${popularDtoList[9].productImg})"></div>
            <div class="grid-img" id="${popularDtoList[10].productId}" style="background-image : url(${popularDtoList[10].productImg})"></div>
            <div class="grid-img" id="${popularDtoList[11].productId}" style="background-image : url(${popularDtoList[11].productImg})"></div>
        </div>
        <div class="basic-grid normal-grid">
            <div class="grid-img" id="${popularDtoList[12].productId}" style="background-image : url(${popularDtoList[12].productImg})"></div>
            <div class="grid-img" id="${popularDtoList[13].productId}" style="background-image : url(${popularDtoList[13].productImg})"></div>
            <div class="grid-img" id="${popularDtoList[14].productId}" style="background-image : url(${popularDtoList[14].productImg})"></div>
            <div class="grid-img" id="${popularDtoList[15].productId}" style="background-image : url(${popularDtoList[15].productImg})"></div>
            <div class="grid-img" id="${popularDtoList[16].productId}" style="background-image : url(${popularDtoList[16].productImg})"></div>
            <div class="grid-img" id="${popularDtoList[17].productId}" style="background-image : url(${popularDtoList[17].productImg})"></div>
        </div>
    </div>
	
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
	
	
	var paging = 1;//페이지 넘버
	
	//무한스크롤 지원해주기 위함!
	window.onscroll = function(e) {
		
		if(($(window).scrollTop() + $(window).height()) >= $(document).height()) {
			//alert("caution");
			paging++;
			
			if (paging <= 2){
				$.ajax({
	                type:"POST",
	                url: "/SYJ_Mall/popularItemAjax.action" ,
	                data : {"paging" : paging},
	                dataType : "xml",
	                success : function(result) {
	                    
	                	console.log(result);
	                	console.log(result["productId"]);
	                	//console.log(result[productId]);
	                	console.log(result.productId);
	                	console.log(result[0]);
	                	//var data = JSON.parse(result);
	                	//console.log(data);
	                	//type
	                	
	                	//console.log(result.indexOf(0));
	                	//console.log(typeof result.indexOf(0));
	                	
	                   //여기에 추가 로직이 들어가야 한다.
	                   	
	                },
	                error: function(a,b,c) {
						console.log(a,b,c);
						console.log(typeof result);
					}
	            });	
			}
			
			
			
		}
		
	}
	
	
	
	
	
	
</script>