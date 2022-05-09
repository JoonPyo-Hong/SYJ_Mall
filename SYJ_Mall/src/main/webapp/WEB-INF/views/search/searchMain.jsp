<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>


<!-- <link rel="stylesheet" href="resources/css/search/seen1.css">
<link rel="stylesheet" href="resources/css/search/searchLoginModal.css">
<link rel="stylesheet" href="resources/css/mainLayout/searchTest.css"> -->
<link rel="stylesheet" href="resources/css/commoncss/sortModalWrap4.css">


<!-- 마이페이지 컨텐츠 -->
<div style="height: 50px;"></div>
<div id="testest" class="container-wrap product-search-result">

	<!-- ##### 마이페이지랑 데이터 없을 때 태그 위치가 다릅니다 ##### -->

	<c:if test="${prodtCount == 0}">
		<!-- 데이터 없을 시 -->
		<div class="search-list-nodata">
			<div class="standing-ryan"></div>
			<div class="empty-message">검색 결과가 없습니다.</div>
			<div class="empty-sub-message">다른 검색어를 입력하시거나,</div>
			<div class="empty-sub-message">철자 및 띄어쓰기를 확인해주세요.</div>
		</div>
	</c:if>



	<c:if test="${prodtCount != 0}">
		<!-- 데이터 있을 시 -->
		<!-- 해당 검색 상품 영역 -->
		<div class="search-product-wrap">
			<ul id="search-item-lists">

				<!-- 여기서부터 조건이 붙어야 한다.***** -->
				<c:forEach var="dto" items="${searchProdto}">
					<c:if test="${dto.prodCnt eq 0}">
						<!-- 상품재고가 없는 경우 -->
						<li class="item-li" id="${dto.prodId}">
							<div class="thumbnail"
								style="background-image : url('${dto.picUrl}'); ">
								<div class="soldout-label"></div>
							</div>
							<div class="name">
								<div class="nametext">${dto.prodNm}</div>
								<span class="alarm"></span>
							</div>
							<div class="price">${dto.prodPrice}원</div>
						</li>
					</c:if>


					<c:if test="${dto.prodCnt ne 0 && dto.discRate eq 0}">
						<!-- 상품재고는 있고 할인이 없는경우 -->
						<li class="item-li" id="${dto.prodId}">
							<div class="thumbnail"
								style="background-image : url('${dto.picUrl}'); "></div>
							<div class="name">
								<div class="nametext">${dto.prodNm}</div>
								<span class="${dto.cookieBasket}"></span>
							</div>
							<div class="price">${dto.prodPrice}원</div>
						</li>
					</c:if>


					<c:if test="${dto.prodCnt ne 0 && dto.discRate ne 0}">
						<!-- 상품재고는 있고 할인이 있는 경우 -->
						<li class="item-li" id="${dto.prodId}">
							<div class="thumbnail"
								style="background-image : url('${dto.picUrl}'); "></div>
							<div class="name">
								<div class="nametext">${dto.prodNm}</div>
								<span class="${dto.cookieBasket}"></span>
							</div>
							<div class="price" style="color: #FF447F;">${dto.discRate}%
								${dto.dcPrice}원</div>
							<div class="price"
								style="text-decoration: line-through; color: #9A9A9E;">${dto.prodPrice}원</div>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</c:if>

</div>




<script>

		let filter_option = ${sortedOption};//정렬필터링 옵션
		let sortedCharOption = ${sortedCharOption};//캐릭터 필터링 옵션

		//prodtCount
		let totalProdCounting  = ${prodtCount};
		let totalPagingCount = ${pageAjaxCount};
		let paging = 2;//페이징
		let height = 0;//높이지정
		const userinputName = "${userinputName}";//유저가 넘긴 검색단어정보
		const productSeq = "${productSeq}";
		
		
		/* 상품 클릭할때 생기는 이벤트  -> 상품페이지로 보내줄것이다.*/
		$(document).on("click", ".item-li", function() {
			let prodt_id = $(this).attr('id');
			location.href = "/SYJ_Mall/productDetailMain.action?prodtSeq=" + prodt_id;
		});

		
		//검색결과를 몇개씩 보여줄지 처리 -> ajax 처리
		$('#kakao-content').on(
				"scroll",
				function(){
					
					const scrollHeight = document.getElementById('kakao-content').scrollHeight;
					const scrollTop = document.getElementById('kakao-content').scrollTop;
					const height = $('#kakao-content').height();
					
					if ((scrollTop + height >= scrollHeight)) {	
						if (paging <= totalPagingCount && paging >= 0) {
							search_ajax_prodt();
							paging++;
						} else if (paging == totalPagingCount + 1) {
							paging = -1;
							call_footer();
						}
					}
		});		
		
		
		function search_ajax_prodt() {
			$.ajax({
	        	type:"GET",
	            url: "/SYJ_Mall/searchresultscroll.action" ,
	            async : false,
	            data : {"paging" : paging, "inputWord" : userinputName,"sortedOption" : filter_option, "sortedCharOption" : sortedCharOption},
	            dataType : "json",
	            success : function(result) {
	                
	            	let selectCount = result.length;
	            	
	            	for (let i = 0; i < selectCount; i++) {
	            		
	            		let url = "'" + result[i].picUrl + "'";
	            		
	            		//재고가 있는경우와 없는경우로 나눠준다.
	            		//1. 재고 없는 경우
	            		if (result[i].prodCnt == 0) {
	            			$('#search-item-lists').append(
				            		
			            			'<li class="item-li" id="'+ result[i].prodId + '">'
									+	'<div class="thumbnail" style="background-image : url('+url+')"><div class="soldout-label"></div></div>'
									+	'<div class="name">'
									+		'<div class="nametext">' + result[i].prodNm + '</div>'  
									+		'<span class="' + result[i].alarmYn + '"></span>'
									+	'</div>'
									+	'<div class="price">' + result[i].prodPrice + '원</div>'
									+'</li>'
						            	
				            	);
	            		}
	            		//2. 재고 있는 경우
	            		else {
	            			//재고 있는 경우 : 할인되는 품목과 안되는 품목을 나눠서 추가하도록 하자.
		            		//1. 할인안되는 품목인 경우
		            		if(result[i].discRate == 0) {
		            			$('#search-item-lists').append(
					            		
		            					'<li class="item-li" id="'+ result[i].prodId + '">'
										+	'<div class="thumbnail" style="background-image : url('+url+')"></div>'
										+	'<div class="name">'
										+		'<div class="nametext">' + result[i].prodNm + '</div>'  
										+ 		'<span class="' + result[i].cookieBasket + '"></span>'
										+	'</div>'
										+	'<div class="price">' + result[i].prodPrice + '원</div>'
										+'</li>'
							            	
					            	);
		            		} 
		            		//2. 할인되는 품목인 경우
		            		else {
		            			$('#search-item-lists').append(
					            		
		            					'<li class="item-li" id="'+ result[i].prodId + '">'
										+	'<div class="thumbnail" style="background-image : url('+url+')"></div>'
										+	'<div class="name">'
										+		'<div class="nametext">' + result[i].prodNm + '</div>'  
										+ 		'<span class="' + result[i].cookieBasket + '"></span>'
										+	'</div>'
										+	'<div class="price" style="color : #FF447F;">' + result[i].discRate + '% '+ result[i].dcPrice + '원</div>'
										+	'<div class="price" style="text-decoration:line-through; color : #9A9A9E;">' + result[i].prodPrice + '원</div>'
										+'</li>'
							            	
					            	);
		            		}
	            		}//else
	            	}//for	
	            },
	            error: function(a,b,c) {
						console.log(a,b,c);
				}
	        	});	
		}
		
		
		/* 아래부분은 일단 장바구니 또는 알림표시 클릭하면 생기는 이벤트 */	
		
		//상품 카트에 관련 -> 카트에 넣어주기
		$(document).on("click",".cart",function(e){
			
			let prodt_id = $(this).parent().parent().attr('id');
			let prodt_this = $(this);
			search_prod_basket(prodt_id,prodt_this);
			
			e.stopPropagation();  
		});
		//상품 카트에 관련 -> 카트에서 빼주기
		$(document).on("click",".incart",function(e){
			
			let prodt_id = $(this).parent().parent().attr('id');
			let prodt_this = $(this);
			search_prod_basket(prodt_id,prodt_this);
			
			e.stopPropagation();  
		});
		
		//상품카트 관련 공통 함수
		function search_prod_basket(prodt_id,prodt_this) {
			$.ajax({
            	type:"GET",
            	url: "/SYJ_Mall/searchItemBasketSet.action",
            	data : "productId=" + prodt_id,
            	dataType : "json",
            	success : function(result) {
            		
            		if (result == 1) {
            			//$("#"+prodt_id).attr('class','incart');
            			$(prodt_this).attr('class','incart');
            		} else if (result == 2) {
            			$(prodt_this).attr('class','cart');
            		}
            	
            	},
            	error: function(a,b,c) {
					console.log(a,b,c);
			}
           });
		}
		
		//상품 알림 관련 -> 알림에 넣어주기
		$(document).on("click",".alarm",function(e){
			
			let prodt_id = $(this).parent().parent().attr('id');
			let prodt_this = $(this);
			search_prod_alarm(prodt_id,prodt_this);
			e.stopPropagation();  
		});
		
		//상품 알림 관련 -> 알림에서 빼주기
		$(document).on("click",".inalarm",function(e){
			
			let prodt_id = $(this).parent().parent().attr('id');
			let prodt_this = $(this);
			search_prod_alarm(prodt_id,prodt_this);
			e.stopPropagation();  
		});
		
		//상품알림 관련 공통 함수
		function search_prod_alarm(prodt_id,prodt_this) {
			$.ajax({
            	type:"GET",
            	url: "/SYJ_Mall/searchItemAlarm.action",
            	data : "productId=" + prodt_id,
            	dataType : "json",
            	success : function(result) {
            		console.log(result);
            		if (result == 1) {
            			$(prodt_this).attr('class','inalarm');
            		} else if (result == 2) {
            			$(prodt_this).attr('class','alarm');
            		} else {
            			//로그인해야 알람을 넣어줄 수 있는 경우
            			$('#login-product-modal').css('visibility','visible');
            			$(document.body).css('overflow','hidden');
            		}
            	},
            	error: function(a,b,c) {
					console.log(a,b,c);
			}
           });
		}
		
		
		//로그인 모달창 로그인하기
		$(document).on("click",".login-btn",function(){
			$('#login-product-modal').css('visibility','hidden');
			location.href = "/SYJ_Mall/login.action";
		}); 
		
		//로그인 모달창 돌아가기
		$(document).on("click",".close-btn",function(){
			$('#login-product-modal').css('visibility','hidden');
		}); 
		
		/*--------------------필터링 조건---------------------------*/
		//~~ 순 정하는 필터링
		$('#content-sort-name').click(function() {
			$('#sort-modal').css('visibility', 'visible');
			$('.sort-modal-wrap').css('bottom', '0');
			$('#kakao-footer').css('background-color','#4C4C4C');
			$(document.body).css('overflow', 'hidden');
		});
		
		
		$('#buy-sort').click(function () {
			<c:if test="${empty productSeq}">
				location.href = "/SYJ_Mall/searchresult.action?inputName=${userinputName}&sortedOption=1&sortedCharOption="+ sortedCharOption;
			</c:if>
			<c:if test="${not empty productSeq}">
				location.href = "/SYJ_Mall/searchresult.action?productSeq=${productSeq}&sortedOption=1&sortedCharOption="+ sortedCharOption;
			</c:if>

		});
		
		$('#new-sort').click(function () {
			<c:if test="${empty productSeq}">
				location.href = "/SYJ_Mall/searchresult.action?inputName=${userinputName}&sortedOption=2&sortedCharOption="+ sortedCharOption;
			</c:if>
			<c:if test="${not empty productSeq}">
				location.href = "/SYJ_Mall/searchresult.action?productSeq=${productSeq}&sortedOption=2&sortedCharOption="+ sortedCharOption;
			</c:if>

		});

		$('#low-price-sort').click(function () {
			<c:if test="${empty productSeq}">
				location.href = "/SYJ_Mall/searchresult.action?inputName=${userinputName}&sortedOption=3&sortedCharOption="+ sortedCharOption;
			</c:if>
			<c:if test="${not empty productSeq}">
				location.href = "/SYJ_Mall/searchresult.action?productSeq=${productSeq}&sortedOption=3&sortedCharOption="+ sortedCharOption;
			</c:if>

		});
		    
		$('#high-price-sort').click(function () {
			<c:if test="${empty productSeq}">
				location.href = "/SYJ_Mall/searchresult.action?inputName=${userinputName}&sortedOption=4&sortedCharOption="+ sortedCharOption;
			</c:if>
			<c:if test="${not empty productSeq}">
				location.href = "/SYJ_Mall/searchresult.action?productSeq=${productSeq}&sortedOption=4&sortedCharOption="+ sortedCharOption;
			</c:if>

		});
		
		
		//캐릭터순 필터
	    $('.character-list').click(function(){
	    	
	    	sortedCharOption = $(this).attr('id');
	    	
	    	if(productSeq == null || productSeq == "") {
	    		location.href = "/SYJ_Mall/searchresult.action?inputName=" + userinputName + "&sortedOption=" + filter_option + "&sortedCharOption=" + sortedCharOption;
	    	} else {
	    		location.href = "/SYJ_Mall/searchresult.action?productSeq=" + productSeq + "&sortedOption=" + filter_option + "&sortedCharOption=" + sortedCharOption;
	    	}
	    	
	    	/* if (productSeq != null) {
	    		location.href = "/SYJ_Mall/searchresult.action?productSeq=" + productSeq + "&sortedOption=" + filter_option + "&sortedCharOption=" + sortedCharOption;
	    	} else {
		    	location.href = "/SYJ_Mall/searchresult.action?inputName=" + userinputName + "&sortedOption=" + filter_option + "&sortedCharOption=" + sortedCharOption;
	    	} */
	    	
	    });
		
		
		//캐릭터별 모달
	    $("#char-sort-name").click(function () {
	      $('#charac-modal').css("visibility", "visible");
	      $('.character-modal-wrap').css('bottom', '0');
	      $('#kakao-footer').css('background-color','#4C4C4C');
	      $(document.body).css('overflow','hidden');
	    });
		
	    //모달 제거하는 용도
	    $('.overlay-wrap').click(function () {
	    	$('.overlay-wrap').css('visibility', 'hidden');
	      	$('.sort-modal-wrap').css('bottom', '-180px');
	     	$('.character-modal-wrap').css('bottom', '-180px');
	      	$('#kakao-footer').css('background-color','#FFF');
	      	$(document.body).css('overflow','visible');
	    });
		
	</script>



</body>
</html>