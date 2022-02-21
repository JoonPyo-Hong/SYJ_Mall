<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>
<link rel="stylesheet" href="resources/css/myPage/myPageOrderHistory.css">


<div class="container-wrap mypage-orderlist-wrap">

	<!-- 데이터 없을 시 -->
	<c:if test="${empty mpList}">
		<div class="order-list-nodata">
			<div class="standing-ryan"></div>
			<div class="empty-message">내역이 없어요</div>
		</div>
		
		<div style="height:140px;"></div>
		
	</c:if>
	
	<c:if test="${not empty mpList}">
		<!-- 데이터 있을 시 -->
		<div class="orderlist-history" style="height : 1400px;">

			<c:forEach var="md" items="${mpListDate}">
				<div class="box-history">
					<div class="history-date">${md}</div>
					<ul class="list-orderlist">
						<c:forEach var="mpl" items="${mpList}">
							<c:choose>
								<c:when test="${mpl.orderDatetime eq md}">
									<li class="orderlist-contents">
										<div class="order-info">
											<div class="wrap-thumb">
												<img src="/SYJ_Mall/${mpl.prodtImg}">
											</div>
											<div class="info-orderlist">
												<div class="title">${mpl.prodtName}</div>
												<div class="state">
													<span class="icon"></span> <span class="text">주문접수 ${mpl.orderState}</span>
												</div>
											</div>
										</div>
									</li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</c:forEach>
			
			<!-- 주문내역 관련 가이드  -->
			<ul class="list-guide-orderlist">
				<li>최근 2년 내역만 확인 가능합니다.</li>
				<li>취소/교환/반품신청은 상세 주문내역에서 가능합니다.</li>
			</ul>
			
		</div>
	</c:if>

</div>




<script>

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
	
	
	$('.order-info').click(function(){
		alert("!!");
	});
	

</script>
