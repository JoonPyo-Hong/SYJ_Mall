<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>
<link rel="stylesheet" href="resources/css/myPage/myPageSeen.css">

<div class="container-wrap mypage-seen-wrap" id="ctwmsw" style="overflow : scroll;">

	<div class="seen-header">
		<div class="seen-text">최대 50개까지 저장됩니다.</div>
		<div class="delete-all">
			<button class="delete-all-btn">전체삭제</button>
			<div class="delete-all-icon"></div>
		</div>
	</div>

	<c:if test="${empty mpsList}">
		<!-- 데이터 없을 시 -->
		<div class="order-list-nodata">
			<div class="standing-ryan"></div>
			<div class="empty-message">내역이 없어요</div>
		</div>
	</c:if>
	<c:if test="${not empty mpsList}">
		<!-- 데이터 있을 시 -->
		<div class="recent-list-wrap">

			<c:forEach var="mpsList" items="${mpsList}">
				<div class="recent-list-item" id = "${mpsList.prodId}">
					<!-- 이미지 및 상품 내용-->
					<div class="product-content">
						<a href="/SYJ_Mall/productDetailMain.action?prodtSeq=${mpsList.prodId}">
							<div class="product-img" style="background : url(/SYJ_Mall/${mpsList.picUrl}) no-repeat; background-size: cover"></div>
						</a>
						<!-- 할인 하는 경우 -->
						<c:if test="${mpsList.discRate ne 0}">
							<div class="product-text">
								<span class="product-name">${mpsList.prodNm}</span> 
								<span class="product-price-discount">${mpsList.discRate}% ${mpsList.dcPrice}원</span>
								<span class="product-price-prediscount">${mpsList.prodPrice}원</span>
							</div>
						</c:if>
						<!-- 할인 하지 않는 경우  -->
						<c:if test="${mpsList.discRate eq 0}">
							<div class="product-text">
								<span class="product-name">${mpsList.prodNm}</span> 
								<span class="product-price">${mpsList.prodPrice}원</span>
							</div>
						</c:if>
					</div>
					<!-- 상품 삭제 -->
					<div class="recent-list-delete-btn"></div>
				</div>
			</c:forEach>
		</div>
	</c:if>
</div>



<script>

	
	/* 물품에 대한 삭제 버튼을 눌렀을 경우  -> 페이지에서 없애고 쿠키에서도 제거해준다.*/
	$(document).on("click",'.recent-list-delete-btn',function(e){
		myPageProdDelete($(this).parent());
	});
	
	/* 모든 물품에 대한 삭제 버튼을 눌렀을 경우  -> 페이지에서 없애고 쿠키에서도 제거해준다.*/
	$(document).on("click",'.delete-all-btn',function(e){
		myPageAllProdDelete();
	});
	
	$(document).on("click",'.delete-all-icon',function(e){
		myPageAllProdDelete();
	});
	
	
	function myPageProdDelete(object) {
		
		const prod_id = $(object).attr('id');
		
		$.ajax({
			type : "GET",
			url : "/SYJ_Mall/myPageProdSeenDelete.action",
			async : false,
			data : {
				"prodId" : prod_id
			},
			dataType : "json",
			success : function(result) {
				
				//쿠키에서 정상적으로 상품을 제거한 경우 -> 아직 상품이 남아 있는 경우
				if (result == 1) {
					$(object).remove();
				} 
				//쿠키에서 정상적으로 상품을 제거했고 모든 상품이 제거된 경우
				else {
					$('.recent-list-wrap').remove();
					$('.order-list-nodata').remove();
					
					$('#ctwmsw').append(
							'<div class="order-list-nodata">'
							+		'<div class="standing-ryan"></div>'
							+		'<div class="empty-message">내역이 없어요</div>'
							+	'</div>'
						)
				}
				
			},
			error : function(a, b, c) {
				console.log(a, b, c);
			}
		}); 
	}
	
	function myPageAllProdDelete() {
		
		$.ajax({
			type : "GET",
			url : "/SYJ_Mall/myPageAllProdSeenDelete.action",
			async : false,
			dataType : "json",
			success : function(result) {
				//쿠키에서 정상적으로 상품을 제거한 경우
				if (result == 1) {
					
					$('.recent-list-wrap').remove();
					$('.order-list-nodata').remove();
					
					$('#ctwmsw').append(
							'<div class="order-list-nodata">'
						+		'<div class="standing-ryan"></div>'
						+		'<div class="empty-message">내역이 없어요</div>'
						+	'</div>'
					)
				} 	
			},
			error : function(a, b, c) {
				console.log(a, b, c);
			}
		});
	}
	
	
	let page_end = 0;//푸터 자연스럽게 보여주기 위함
	
	$('#kakao-content').on(
		"scroll",
		function(){
			
			const scrollHeight = document.getElementById('kakao-content').scrollHeight;
			const scrollTop = document.getElementById('kakao-content').scrollTop;
			const height = $('#kakao-content').height();
			
			console.log("scrollHeight : " + scrollHeight);
			console.log("scrollTop : " + scrollTop);
			console.log("height : " + height);
			
			if ((scrollTop + height >= scrollHeight) && page_end == 0) {	
				call_footer();
				
				page_end = -1;
			}
	});	
	
	
	
</script>
