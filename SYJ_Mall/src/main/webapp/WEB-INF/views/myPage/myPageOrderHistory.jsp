<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>


<style>

.mypage-orderlist-wrap {
  /* min-height: 750px; */
}

/* 주문 내역 데이터 없을 시  */
.order-list-nodata {
  min-height: 750px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  padding: 266px 0px;
  background-color: #fff;
}

.standing-ryan {
  width: 184px;
  height: 184px;
  background-image: url(/SYJ_Mall/resources/images/mypage_orderlist/standing-ryan.png);
  background-size: contain;
}

.empty-message {
  font-size: 16px;
  text-align: center;
  padding: 10px 0px;
  color: rgb(154, 154, 158);
}

/* 주문 내역 데이터 있을 시  */
.orderlist-history {
  padding: 26px 20px 100px;
  background-color: #f2f2f2;
}

.orderlist-history .box-history .history-date {
  font-size: 18px;
  line-height: 22px;
  font-weight: bold;
  margin-top: 15px;
}

.orderlist-history .box-history:first-child .history-date {
  margin-top: 0px;
}

.orderlist-history .box-history ul li {
  position: relative;
  height: 136px;
  padding: 18px 20px 18px 18px;
  margin-top: 10px;
  background-color: #fff;
  border-radius: 12px;
  box-shadow: 0 1px 2px rgb(0 0 0 / 4%);
  box-sizing: border-box;
  cursor: pointer;
}

.orderlist-history .box-history ul li::before {
  display: block;
  position: absolute;
  top: -1px;
  width: 17px;
  height: 140px;
  content: "";
  left: -2px;
  background: url(/SYJ_Mall/resources/images/mypage_orderlist/img_orderlist_left.png) no-repeat 0
    0;
  background-size: auto 100%;
}

.orderlist-history .box-history ul li::after {
  display: block;
  position: absolute;
  top: -1px;
  width: 17px;
  height: 140px;
  content: "";
  right: -2px;
  background: url(/SYJ_Mall/resources/images/mypage_orderlist/img_orderlist_right.png) no-repeat
    0 0;
  background-size: auto 100%;
}

.orderlist-history .box-history ul li .wrap-thumb {
  overflow: hidden;
  float: left;
  position: relative;
  width: 100px;
  height: 100px;
  border-radius: 6px;
}

.orderlist-history .box-history ul li .wrap-thumb::before {
  position: absolute;
  left: 0;
  top: 0;
  z-index: 1;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.02);
  content: "";
}

.orderlist-history .box-history ul li .wrap-thumb img {
  width: 100%;
  height: 100%;
}

.orderlist-history .box-history ul li .info-orderlist {
  position: relative;
  overflow: hidden;
  padding: 6px 0 6px 16px;
  box-sizing: border-box;
  height: 100%;
}

.orderlist-history .box-history ul li .info-orderlist .title {
  display: -webkit-box;
  overflow: hidden;
  font-weight: 400;
  font-size: 16px;
  line-height: 20px;
  max-height: 40px;
  text-overflow: ellipsis;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  word-break: break-all;
  letter-spacing: -0.025em;
}

.orderlist-history .box-history ul li .info-orderlist .state {
  font-size: 14px;
  line-height: 16px;
  padding: 35px 20px 0 0;
}

.orderlist-history .box-history ul li .info-orderlist .state .icon {
  display: inline-block;
  width: 16px;
  height: 16px;
  margin-right: 4px;
  vertical-align: top;
  background: url(/SYJ_Mall/resources/images/mypage_orderlist/ico_friends.png) 0 0 no-repeat;
  background-size: 700px 600px;
  background-position: -620px 0;
}

.orderlist-history .box-history ul li .info-orderlist .state .text {
  left: 16px;
  bottom: 6px;
  font-size: 14px;
  line-height: 16px;
  font-weight: bold;
  color: #0087ff;
}

/* 주문내역 관련 가이드 */
.list-guide-orderlist {
  padding-top: 12px;
}

.list-guide-orderlist li {
  position: relative;
  margin-top: 8px;
  padding-left: 7px;
  font-size: 14px;
  line-height: 16px;
  color: #909092;
}

.list-guide-orderlist li::before {
  position: absolute;
  left: 0;
  top: 7px;
  width: 2px;
  height: 2px;
  border-radius: 25px;
  background-color: #909092;
  content: "";
}


</style>




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
