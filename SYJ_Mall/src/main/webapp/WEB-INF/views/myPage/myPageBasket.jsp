<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>
<!-- <link rel="stylesheet" href="resources/css/myPage/myPageBasket2.css"> -->

<style>
#mypage-basket-wrap {
}

hr.division {
  height: 10px;
  width: 100%;
  border: none;
  border-top: 1px solid rgb(227, 229, 232);
  background-color: rgb(247, 247, 247);
  margin: 0 !important;
}

.basket-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 54px;
  padding-right: 15px;
  padding-left: 20px;
}

.basket-header .basket-count {
  display: flex;
  font-size: 16px;
  color: rgb(51, 51, 51);
}

.product-checkbox-label {
  width: 20px;
  height: 20px;
  background: url(/SYJ_Mall/resources/images/mypage_basket/ico_checked.png) center center
    no-repeat;
  background-size: 20px 20px;
}

input[id="product-checkbox"] {
  display: none;
}

input[id="product-checkbox"]:checked {
  /* display: block; */
  border: 1px solid red;
}

.basket-header .basket-count .basket-count-text {
  margin-left: 10px;
}

.delete-all {
  display: flex;
  align-items: center;
  justify-content: center;
}

.delete-count {
  font-size: 14px;
  color: rgb(102, 102, 102);
  padding-right: 8px;
}

.delete-all-btn {
  width: 27px;
  height: 27px;
  background-image: url(/SYJ_Mall/resources/images/mypage_seen/garbage-27-grey.png);
  background-size: contain;
}

.basket-list-wrap {
  overflow-y: auto;
}

/* 상품 하나 */
.basket-list-item {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  border-bottom: 1px solid rgb(242, 242, 242);
  padding: 20px;
}

.basket-left {
  display: flex;
}

.basket-check {
  width: 20px;
  height: 20px;
  margin-right: 10px;
  background: url(/SYJ_Mall/resources/images/mypage_basket/ico_checked.png) center center no-repeat;
  background-size: 20px 20px;
}

.basket-content {
  display: flex;
}

.product-img {
  position: relative;
  width: 100px;
  height: 100px;
/*   background: url(/SYJ_Mall/resources/images/mypage_seen/20210729161639822_8809814920656_AW_00.jpg)
    no-repeat; 
  background-size: contain; */
}

.product-img::after {
  position: absolute;
  inset: 0px;
  background: rgba(0, 0, 0, 0.02);
  content: "";
  width: 100%;
  z-index: 0;
  padding-top: 100%;
/*   background: url(/SYJ_Mall/resources/images/mypage_seen/20210729161639822_8809814920656_AW_00.jpg)
    no-repeat; 
  background-size: contain; */
}

.basket-text {
  display: flex;
  flex-direction: column;
  margin-left: 20px;
}

.basket-text .product-name {
  font-size: 16px;
  color: rgb(0, 0, 0);
}
.basket-text .product-price {
  font-size: 16px;
  color: rgb(0, 0, 0);
}

.basket-text .product-price-dc {
  font-size: 16px;
  color: #9A9A9E;
  text-decoration: line-through;
}

.basket-text .product-count {
  width: 191px;
  height: 35px;
  border-radius: 4px;
}

.basket-text .product-count select {
  margin-top: 10px;
  width: 200px;
  height: 30px;
  text-indent: 10px;
  border: 1px solid rgb(227, 229, 232);
  font-size: 16px;
}

.basket-list-delete-btn {
  width: 24px;
  height: 24px;
  background: url(/SYJ_Mall/resources/images/mypage_seen/delete-small-18-light-grey.png)
    no-repeat;
  background-size: 16px 16px;
  cursor: pointer;
}

/* 선택 상품 총 금액 영역 */

.total-cost-bar-wrap {
  padding: 40px 20px 123px;
  display: flex;
  flex-direction: column;
  border-top: 1px solid rgb(227, 229, 232);
  
}

.total-cost-bar-wrap .row {
  display: flex;
  align-items: center;
  justify-content: space-between;
  font-size: 16px;
  
}

.total-cost-bar-wrap .row .title {
  font-weight: normal;
  display: flex;
}

.total-cost-bar-wrap .shipping-country {
  padding-bottom: 23px;
}

.total-cost-bar-wrap .shipping-country select {
  width: 200px;
  height: 30px;
  text-indent: 10px;
  border: 1px solid rgb(227, 229, 232);
  font-size: 16px;
}

.total-cost-bar-wrap .total-cost {
  margin-top: 5px;
}

.total-cost-bar-wrap .total-cost .title {
  font-weight: bold;
}

.total-cost-bar-wrap .total-cost .cost {
  font-weight: bold;
  font-size: 24px;
}

/* 하단 버튼 */
.bottom-bar {
  position: fixed;
  bottom: 0;
  background-color: rgba(251, 46, 69, 0.95);
  max-width: 640px;
  width: 100%;
  height: 80px;
  text-align: center;
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1;
}

.direct-purchase {
  color: #fff;
  font-size: 18px;
  font-weight : bold;
}

.clearfix:before, .clearfix:after, .dl-horizontal dd:before, .dl-horizontal dd:after, .container:before, .container:after, .container-fluid:before, .container-fluid:after, .row:before, .row:after, .form-horizontal .form-group:before, .form-horizontal .form-group:after, .btn-toolbar:before, .btn-toolbar:after, .btn-group-vertical > .btn-group:before, .btn-group-vertical > .btn-group:after, .nav:before, .nav:after, .navbar:before, .navbar:after, .navbar-header:before, .navbar-header:after, .navbar-collapse:before, .navbar-collapse:after, .pager:before, .pager:after, .panel-body:before, .panel-body:after, .modal-footer:before, .modal-footer:after {
    display: table;
    content:none;
    !important;
}




</style>



<!-- 마이페이지 컨텐츠 -->
<div class="container-wrap mypage-basket-wrap">
	<!-- 데이터 없을 시 -->
	<c:if test="${empty mbdtoList}">
		<div class="order-list-nodata">
	        <div class="standing-ryan"></div>
	     	<div class="empty-message">내역이 없어요</div>
	    </div>
    </c:if>
    <c:if test="${not empty mbdtoList}">
	<!-- 데이터 있을 시 -->
	<div class="basket-header">
		<div class="basket-count">
			<label class="product-checkbox-label" id = "total_click" for="product-checkbox">
				<input id="product-checkbox" type="checkbox"
				class="product-checkbox-input" />
			</label>
			<div class="basket-count-text">
				전체 <b>${mbdtoListSize}</b>
			</div>
		</div>
		<div class="delete-all">
			<div class="delete-count">2개 선택</div>
			<button class="delete-all-btn"></button>
		</div>
	</div>
	<hr class="division" />

	<div class="basket-list-wrap">
		
		<c:forEach var="mbdto" items="${mbdtoList}">
				
				<div class="basket-list-item" id="${mbdto.prodId}">
					<div class="basket-left">
						<!-- 상품 체크박스 -->
						<div class="basket-check">
							<label class="product-checkbox-label" id="pic${mbdto.prodId}"for="product-checkbox">
								<input id="product-checkbox" type="checkbox" class="product-checkbox-input" />
							</label>
						</div>
						<!-- 상품 내용 및 수량 -->
						<div class="basket-content">
							<a href="#">
								<div class="product-img" style="background : url(/SYJ_Mall/${mbdto.picUrl}) no-repeat; background-size: contain"></div>
							</a>
							<div class="basket-text">
								<c:choose>
									<c:when test='${mbdto.dcYn eq "Y"}'>
										<span class="product-name">${mbdto.prodNm}</span> <span class="product-price">${mbdto.dcPrice}원  <span class="product-price-dc">${mbdto.prodPrice}원</span></span>
									</c:when>
									<c:otherwise>
										<span class="product-name">${mbdto.prodNm}</span> <span class="product-price">${mbdto.prodPrice}원</span>
									</c:otherwise>
								</c:choose>
								<div class="product-count">
									<label content="4" class="select-box__Label-iihqm7-0">
										<select class="select-box__Select-iihqm7-2">
											<option value="1" selected>${mbdto.buyCount}</option>
											<c:forEach var="num" begin="2" end="20">
												<option value="${num}">${num}</option>
											</c:forEach>
										</select>
									</label>
								</div>
							</div>
						</div>
					</div>
					<!-- 상품 삭제 -->
					<div class="basket-list-delete-btn"></div>
				</div>
		</c:forEach>
	</div>

	<!-- 선택 상품 총 금액 영역-->
	<div class="total-cost-bar-wrap">
		<div class="shipping-country row">
			<div class="title">배송국가</div>
			<div class="cost">
				<label content="한국" height="45" class="select-label"> <select
					height="45" class="select-select" name="shippingCountry">
						<option value="KR">한국</option>
				</select></label>
			</div>
		</div>
		<div class="order-cost row">
			<div class="title">총 주문 금액</div>
			<div class="cost">94,000원</div>
		</div>
		<div class="delivery-cost row">
			<div class="title">배송비</div>
			<div class="cost">무료</div>
		</div>
		<div class="total-cost row">
			<div class="title">총 결제금액</div>
			<div class="cost">94,000원</div>
		</div>
	</div>

	<!-- 하단 바로구매 고정 버튼 -->
	<div class="bottom-bar">
		<button class="direct-purchase">94,000원 주문 하기</button>
	</div>
	</c:if>
</div>

<script>
	
	
	let total_seleted = -1;//전체 선택 표시
	let prodct_check_arr = Array.from({length:${mbdtoListSize}}, ()=>-1);//장바구니에 존재하는 상품들 체크표시 위한 배열
	let prodct_id_arr = Array.from({length:${mbdtoListSize}}, ()=>-1);
	let id_index = 0;
	
	/* prodct_id_arr 리스트에 상품 아이디를 넣어준다. */
	<c:forEach var="mbdto" items="${mbdtoList}">
		prodct_id_arr[id_index] = ${mbdto.prodId};
		id_index++;
	</c:forEach>
	
	//전제 선택 or 전체 선택 헤제
	$(document).on("click","#total_click",function(e) {
		total_seleted *= -1;
		
		//1. 전체 선택이 안되어 있는 경우
		if (total_seleted == 1) {
			$('.product-checkbox-label').css({"background-image":"url(/SYJ_Mall/resources/images/mypage_basket/ico_checked_ok.png)"}); 
			
			for (let i = 0; i < prodct_check_arr.length; i++) {
				prodct_check_arr[i] = 1;
			}
		} 
		//2. 전체선택이 되어 있는 경우
		else {
			$('.product-checkbox-label').css({"background-image":"url(/SYJ_Mall/resources/images/mypage_basket/ico_checked.png)"});
			
			for (let i = 0; i < prodct_check_arr.length; i++) {
				prodct_check_arr[i] = -1;
			}
		} 
		e.preventDefault()
	});
	
	
	//선택한 물품을 체크해주거나 안해주거나 해주는 용도
	$(document).on("click",".product-checkbox-label",function(e) {
		let prodt_id = $(this).parent().parent().parent().attr("id");
		let object = $(this);

		const result = prodt_seleted_yn(prodt_id,prodct_check_arr,prodct_id_arr);
		//1. 체크 되어 있는 경우
		if (result == 1) $(object).css({"background-image":"url(/SYJ_Mall/resources/images/mypage_basket/ico_checked.png)"}); 	
		//2. 체크 되어 있지 않은 경우
		else if (result == -1) $(object).css({"background-image":"url(/SYJ_Mall/resources/images/mypage_basket/ico_checked_ok.png)"}); 	
		
		for (let i = 0; i < prodct_check_arr.length; i++) {
			console.log(i + " : " +prodct_check_arr[i] + "\n");
		}
		
		e.preventDefault();
	});
	
	
	
	function prodt_seleted_yn(id,check_arr,arr) {
		let prodt_id_index = arr.findIndex(data => data==id);
		
		if (check_arr[prodt_id_index] == -1) {
			check_arr[prodt_id_index] = 1;
			
			return -1;
		}
		else if (check_arr[prodt_id_index] == 1) {
			check_arr[prodt_id_index] = -1;
			
			return 1;
		}
		else return -2;
	}
	
	// 선택물품 장바구니 db 또는 쿠키에서 제거해주는 작업
	function prodt_delete(id,arr) {
		const find_index = prodt_id_list.findIndex(data => data==id);
		//arr[find_index] = -999;
		const new_arr_length = arr.length - 1;
		let new_arr = Array.from({length:new_arr_length}, ()=>-1);
		
		let new_index = 0;
		let old_index = 0;
		
		while(old_index != arr.length-1) {
			if (index != find_index) {
				new_arr[new_index] = arr[old_index];
				new_index++;
				old_index++;
			} else {
				old_index++;
			}		
		}
		
		return new_arr_length;
	}
	
	
	/* $(document).on("click",'.product-checkbox-label'.function(e){
		
		let object = $(this);
		//.parent();
		
		console.log(object);
	}); */
	
	

	

</script>


