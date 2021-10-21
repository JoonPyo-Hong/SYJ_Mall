<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel = "stylesheet" href = "resources/css/popular/popualMainNew.css"> 


<div class="container-wrap hot-wrap" id = "popularInnerContent">
    
    <div>
        <div class="basic-grid left-grid">
            <div class="grid-img" id="${popularDtoList[0].productId}" style="background-image : url(${popularDtoList[0].productImg})"><div class = "basket" style="background-image : url(resources/images/hot/${popularDtoList[0].basket})"></div></div>
            <div class="grid-img" id="${popularDtoList[1].productId}" style="background-image : url(${popularDtoList[1].productImg})"><div class = "basket" style="background-image : url(resources/images/hot/${popularDtoList[1].basket})"></div></div>
            <div class="grid-img" id="${popularDtoList[2].productId}" style="background-image : url(${popularDtoList[2].productImg})"><div class = "basket" style="background-image : url(resources/images/hot/${popularDtoList[2].basket})"></div></div>
        </div>
        <div class="basic-grid normal-grid">
            <div class="grid-img" id="${popularDtoList[3].productId}" style="background-image : url(${popularDtoList[3].productImg})"><div class = "basket" style="background-image : url(resources/images/hot/${popularDtoList[3].basket})"></div></div>
            <div class="grid-img" id="${popularDtoList[4].productId}" style="background-image : url(${popularDtoList[4].productImg})"><div class = "basket" style="background-image : url(resources/images/hot/${popularDtoList[4].basket})"></div></div>
            <div class="grid-img" id="${popularDtoList[5].productId}" style="background-image : url(${popularDtoList[5].productImg})"><div class = "basket" style="background-image : url(resources/images/hot/${popularDtoList[5].basket})"></div></div>
            <div class="grid-img" id="${popularDtoList[6].productId}" style="background-image : url(${popularDtoList[6].productImg})"><div class = "basket" style="background-image : url(resources/images/hot/${popularDtoList[6].basket})"></div></div>
            <div class="grid-img" id="${popularDtoList[7].productId}" style="background-image : url(${popularDtoList[7].productImg})"><div class = "basket" style="background-image : url(resources/images/hot/${popularDtoList[7].basket})"></div></div>
            <div class="grid-img" id="${popularDtoList[8].productId}" style="background-image : url(${popularDtoList[8].productImg})"><div class = "basket" style="background-image : url(resources/images/hot/${popularDtoList[8].basket})"></div></div>
        </div>
    </div>
    <div>
        <div class="basic-grid right-grid">
            <div class="grid-img" id="${popularDtoList[9].productId}" style="background-image : url(${popularDtoList[9].productImg})"><div class = "basket" style="background-image : url(resources/images/hot/${popularDtoList[9].basket})"></div></div>
            <div class="grid-img" id="${popularDtoList[10].productId}" style="background-image : url(${popularDtoList[10].productImg})"><div class = "basket" style="background-image : url(resources/images/hot/${popularDtoList[10].basket})"></div></div>
            <div class="grid-img" id="${popularDtoList[11].productId}" style="background-image : url(${popularDtoList[11].productImg})"><div class = "basket" style="background-image : url(resources/images/hot/${popularDtoList[11].basket})"></div></div>
        </div>
        <div class="basic-grid normal-grid">
            <div class="grid-img" id="${popularDtoList[12].productId}" style="background-image : url(${popularDtoList[12].productImg})"><div class = "basket" style="background-image : url(resources/images/hot/${popularDtoList[12].basket})"></div></div>
            <div class="grid-img" id="${popularDtoList[13].productId}" style="background-image : url(${popularDtoList[13].productImg})"><div class = "basket" style="background-image : url(resources/images/hot/${popularDtoList[13].basket})"></div></div>
            <div class="grid-img" id="${popularDtoList[14].productId}" style="background-image : url(${popularDtoList[14].productImg})"><div class = "basket" style="background-image : url(resources/images/hot/${popularDtoList[14].basket})"></div></div>
            <div class="grid-img" id="${popularDtoList[15].productId}" style="background-image : url(${popularDtoList[15].productImg})"><div class = "basket" style="background-image : url(resources/images/hot/${popularDtoList[15].basket})"></div></div>
            <div class="grid-img" id="${popularDtoList[16].productId}" style="background-image : url(${popularDtoList[16].productImg})"><div class = "basket" style="background-image : url(resources/images/hot/${popularDtoList[16].basket})"></div></div>
            <div class="grid-img" id="${popularDtoList[17].productId}" style="background-image : url(${popularDtoList[17].productImg})"><div class = "basket" style="background-image : url(resources/images/hot/${popularDtoList[17].basket})"></div></div>
        </div>
    </div>
	
</div>

<script>
	
	let total_count = ${popularDtoListCount};
	let paging = 1;//페이지 넘버
	let searchYn = -1;//검색창을 켰는지 안켰는지 구분해주는 숫자  -1 이 안켜짐 1이 켜짐
	
	$('#inner-content').on(
			'scroll',
			function() {

				let scrollHeight = document.getElementById('inner-content').scrollHeight;
				const scrollTop = document.getElementById('inner-content').scrollTop;
				
				if (paging == 1) scrollHeight = Math.ceil(scrollHeight * 0.18);	
				else scrollHeight = Math.ceil(scrollHeight * 0.5);
				
				if (scrollTop >= scrollHeight && paging < total_count-1 && searchYn == -1) {
					paging++;
					
					$.ajax({
			        	type:"POST",
			            url: "/SYJ_Mall/popularItemAjax.action" ,
			            async : false,
			            data : {"paging" : paging},
			            dataType : "json",
			            success : function(result) {
			                    
			            console.log("================================!==========================");	
			            	
			            $("#popularInnerContent").append
			            (
			            		'<div>'
			                    +'<div class="basic-grid left-grid">'
			                    +'    <div class="grid-img" id="' + result[0].productId + '" style="background-image : url(' + result[0].productImg + ')"><div class = "basket" style="background-image : url(resources/images/hot/' + result[0].basket + ')"></div></div>'
			                    +'    <div class="grid-img" id="' + result[1].productId + '" style="background-image : url(' + result[1].productImg + ')"><div class = "basket" style="background-image : url(resources/images/hot/' + result[1].basket + ')"></div></div>'
			                    +'    <div class="grid-img" id="' + result[2].productId + '" style="background-image : url(' + result[2].productImg + ')"><div class = "basket" style="background-image : url(resources/images/hot/' + result[2].basket + ')"></div></div>'
			                    +'</div>'
			                    +'<div class="basic-grid normal-grid">'
			                    +'    <div class="grid-img" id="' + result[3].productId + '" style="background-image : url(' + result[3].productImg + ')"><div class = "basket" style="background-image : url(resources/images/hot/' + result[3].basket + ')"></div></div>'
			                    +'    <div class="grid-img" id="' + result[4].productId + '" style="background-image : url(' + result[4].productImg + ')"><div class = "basket" style="background-image : url(resources/images/hot/' + result[4].basket + ')"></div></div>'
			                    +'    <div class="grid-img" id="' + result[5].productId + '" style="background-image : url(' + result[5].productImg + ')"><div class = "basket" style="background-image : url(resources/images/hot/' + result[5].basket + ')"></div></div>'
			                    +'    <div class="grid-img" id="' + result[6].productId + '" style="background-image : url(' + result[6].productImg + ')"><div class = "basket" style="background-image : url(resources/images/hot/' + result[6].basket + ')"></div></div>'
			                    +'    <div class="grid-img" id="' + result[7].productId + '" style="background-image : url(' + result[7].productImg + ')"><div class = "basket" style="background-image : url(resources/images/hot/' + result[7].basket + ')"></div></div>'
			                    +'    <div class="grid-img" id="' + result[8].productId + '" style="background-image : url(' + result[8].productImg + ')"><div class = "basket" style="background-image : url(resources/images/hot/' + result[8].basket + ')"></div></div>'
			                    +'</div>'
			                    +'</div>'
			                    +'<div>'
			                    +'<div class="basic-grid right-grid">'
			                    +'    <div class="grid-img" id="' + result[9].productId + '" style="background-image : url(' + result[9].productImg + ')"><div class = "basket" style="background-image : url(resources/images/hot/' + result[9].basket + ')"></div></div>'
			                    +'    <div class="grid-img" id="' + result[10].productId + '" style="background-image : url(' + result[10].productImg + ')"><div class = "basket" style="background-image : url(resources/images/hot/' + result[10].basket + ')"></div></div>'
			                    +'    <div class="grid-img" id="' + result[11].productId + '" style="background-image : url(' + result[11].productImg + ')"><div class = "basket" style="background-image : url(resources/images/hot/' + result[11].basket + ')"></div></div>'
			                    +'</div>'
			                    +'<div class="basic-grid normal-grid">'
			                    +'    <div class="grid-img" id="' + result[12].productId + '" style="background-image : url(' + result[12].productImg + ')"><div class = "basket" style="background-image : url(resources/images/hot/' + result[12].basket + ')"></div></div>'
			                    +'    <div class="grid-img" id="' + result[13].productId + '" style="background-image : url(' + result[13].productImg + ')"><div class = "basket" style="background-image : url(resources/images/hot/' + result[13].basket + ')"></div></div>'
			                    +'    <div class="grid-img" id="' + result[14].productId + '" style="background-image : url(' + result[14].productImg + ')"><div class = "basket" style="background-image : url(resources/images/hot/' + result[14].basket + ')"></div></div>'
			                    +'    <div class="grid-img" id="' + result[15].productId + '" style="background-image : url(' + result[15].productImg + ')"><div class = "basket" style="background-image : url(resources/images/hot/' + result[15].basket + ')"></div></div>'
			                    +'    <div class="grid-img" id="' + result[16].productId + '" style="background-image : url(' + result[16].productImg + ')"><div class = "basket" style="background-image : url(resources/images/hot/' + result[16].basket + ')"></div></div>'
			                    +'    <div class="grid-img" id="' + result[17].productId + '" style="background-image : url(' + result[17].productImg + ')"><div class = "basket" style="background-image : url(resources/images/hot/' + result[17].basket + ')"></div></div>'
			                    +'</div>'
			                    +'</div>'		
			            
			            )
			                	
			            },
			            error: function(a,b,c) {
								console.log(a,b,c);
						}
			        	});	
				}
			});

	
	
	//사진 클릭해줬을때 처리해줄것. -> 상품페이지로 넘길것
	$(document).on("click",".grid-img",function(){
	 	alert($(this).attr('id')); 
  	});
	
	//장바구니 클릭해줬을때 처리해줄것. -> 쿠키에 넘길것!(비로그인시) or db에 넘길것(로그인 한 경우)	
	$(document).on("click",".basket",function(e){
	 	const cart_yn  = $(this).css('background-image');
	 	const product_id = $(this).parent().attr('id');//상품번호
	
	 	console.log(cart_yn);
	 	console.log(product_id);
	 	
	 	//이미 장바구니에 담겼을 경우
	    if (cart_yn.includes('cart_on')) {
	 		//console.log('장바구니에서 나옴');
	 		
	 		
		 	$.ajax({
	            	type:"GET",
	            	url: "/SYJ_Mall/popularItemBasketOutput.action" ,
	            	data : "productId=" + product_id,
	            	dataType : "json",
	            	success : function(result) {
	            	
	            		if (result == 1) {
	            			$('#' + product_id).children('.basket').css('background-image','url(resources/images/hot/cart.png)');
	            		}
	            	
	            	},
	            	error: function(a,b,c) {
						console.log(a,b,c);
				}
	           });
	 		
	 		
	 	} else {//장바구니에 안담긴경우
	 		//console.log('장바구니에 담김');
	 	
	 		
		 	$.ajax({
	            	type:"GET",
	            	url: "/SYJ_Mall/popularItemBasketInput.action" ,
	            	data : "productId=" + product_id,
	            	dataType : "json",
	            	success : function(result) {
	            		
	            		console.log(result);
	            		
	            		if (result == 1) {
	            			$('#' + product_id).children('.basket').css('background-image','url(resources/images/hot/cart_on.png)');
	            		}
	            	
	             	},
	             error: function(a,b,c) {
					console.log(a,b,c);
				}
	        });
	 		
	 	}

	 	//버블링 제거
	 	e.stopPropagation();  
  	});
	
	
	
</script>