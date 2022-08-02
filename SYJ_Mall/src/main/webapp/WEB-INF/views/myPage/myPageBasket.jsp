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

#my_page_contents {
	height:1200px;
}


@media(max-width: 640px){
	#my_page_contents {
		height:1000px;
	}
	
}


</style>



<!-- 마이페이지 컨텐츠 -->
<div class="container-wrap mypage-basket-wrap" id="my_page_contents">
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
			<div class="delete-count">0개 선택</div>
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
									<input id="product-checkbox" type="checkbox" class="product-checkbox-input" value="0"/>
								</label>
							</div>
							<!-- 상품 내용 및 수량 -->
							<div class="basket-content">
								<a href='/SYJ_Mall/productDetailMain.action?prodtSeq=${mbdto.prodId}'>
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
											<select class="select-box__Select-iihqm7-2" onchange="buy_count_selected()">
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
				<label content="한국" height="45" class="select-label"> 
					<select height="45" class="select-select" name="shippingCountry">
						<option value="KR">한국</option>
					</select>
				</label>
			</div>
		</div>
		<div class="order-cost row">
			<div class="title">총 주문 금액</div>
			<div class="cost" id="total_order_money">0원</div>
		</div>
		<div class="delivery-cost row">
			<div class="title">배송비</div>
			<div class="cost">무료</div>
		</div>
		<div class="total-cost row">
			<div class="title">총 결제금액</div>
			<div class="cost" id="total_pay_money">0원</div>
		</div>
	</div>

	
	<!-- 하단 바로구매 고정 버튼 -->
	<div class="bottom-bar">
		<button class="direct-purchase">0원 주문 하기</button>
	</div>
	</c:if>
</div>

<form id = "prodt_pay_go" action="/SYJ_Mall/prodtPayMain.action" method="post">
	<input type="hidden" name="product_obj_id" id="product_obj_id">
	<input type="hidden" name="product_obj_cnt" id="product_obj_cnt">
</form>
 

<script>
	
	
	let total_seleted = -1;//전체 선택 표시
	let mbdto_json_arr = ${mbdtoJsonArr};//장바구니 내의 제품 json array
	
	
	//선택한 물품을 체크해주거나 안해주거나 해주는 용도
	$(document).on("click",".product-checkbox-label",function(e) {
		
		if ($(this).attr("id") == "total_click") return 0;
		
		let prodt_id = $(this).parent().parent().parent().attr("id");
		
		const result = prodt_seleted_yn(prodt_id);
		
		
		//1. 체크 되어 있는 경우 -> 체크를 풀어준다.
		if (result == 1) $("#pic"+prodt_id).css({"background-image":"url(/SYJ_Mall/resources/images/mypage_basket/ico_checked.png)"}); 	
		//2. 체크 되어 있지 않은 경우 -> 체크를 넣어준다.
		else if (result == -1) $("#pic"+prodt_id).css({"background-image":"url(/SYJ_Mall/resources/images/mypage_basket/ico_checked_ok.png)"}); 	
		
		const select_count = total_select_count() + "개 선택";
		
		$('.delete-count').text(select_count);
		buy_count_selected();
		
		e.preventDefault();
	});
	
	
	
	function prodt_seleted_yn(prodt_id) {

		let prodt_id_index = -1;

		for (let i = 0; i < mbdto_json_arr.length; i++) {
			if (mbdto_json_arr[i].prodId == parseInt(prodt_id))
				prodt_id_index = i;
		}


		if (mbdto_json_arr[prodt_id_index].checkYn == "Y") {
			mbdto_json_arr[prodt_id_index].checkYn = "N";
			return 1;
		} else if (mbdto_json_arr[prodt_id_index].checkYn == "N") {
			mbdto_json_arr[prodt_id_index].checkYn = "Y";
			return -1;
		} else
			return -2;
	}
	
	
	//전제 선택 or 전체 선택 헤제
	$(document).on("click","#total_click",function(e) {
		total_seleted *= -1;
		
		//1. 전체 선택이 안되어 있는 경우 -> 전체 선택 눌러줌
		if (total_seleted == 1) {
			$('.product-checkbox-label').css({"background-image":"url(/SYJ_Mall/resources/images/mypage_basket/ico_checked_ok.png)"}); 
			
			for (let i = 0; i < mbdto_json_arr.length; i++) {
				mbdto_json_arr[i].checkYn = "Y";
			} 
		} 
		//2. 전체선택이 되어 있는 경우 -> 전체 선택 풀어줌
		else {
			$('.product-checkbox-label').css({"background-image":"url(/SYJ_Mall/resources/images/mypage_basket/ico_checked.png)"});
			
			for (let i = 0; i < mbdto_json_arr.length; i++) {
				mbdto_json_arr[i].checkYn = "N";
			}
		} 
		
		const select_count = total_select_count() + "개 선택";
		$('.delete-count').text(select_count);
		buy_count_selected();
		
		
		e.preventDefault();
	});
	
	
	//선택된 제품이 몇개인지 카운트 해주는 함수
	function total_select_count() {
		
		try {
			let count = 0;
			
			for (let i = 0; i < mbdto_json_arr.length; i++) {
				if (mbdto_json_arr[i].checkYn == 'Y') count++;
			} 
			
			return count;
		} catch(error) {
			return 0;
		}
	}
	
	//구매갯수 바뀔때마다 동작하는 함수
	function buy_count_selected() {
		let total_money = 0;
		
		for (let i = 0; i < mbdto_json_arr.length; i++) {
			if (mbdto_json_arr[i].checkYn == 'Y'){
				const prodt_id = mbdto_json_arr[i].prodId;	
				const prodt_cost = mbdto_json_arr[i].prodPrice;
				const buy_count = $('#'+ prodt_id +' .select-box__Select-iihqm7-2 option:selected').val();
				mbdto_json_arr[i].buyCount = buy_count;
				
				total_money += (parseInt(prodt_cost) * parseInt(buy_count));
			}
		}
		
		const result_money = money_dot(total_money)
		
		$('#total_order_money').text(result_money+'원');
		$('#total_pay_money').text(result_money+'원');
		$('.direct-purchase').text(result_money+'원 주문 하기');

	}
	
	
	//장바구니에서 상품 제거해주는 기능
	$('.basket-list-delete-btn').click(function(){
		
		const prodt_id = $(this).parent().attr("id")
		
		$.ajax({
        	type:"GET",
            url: "/SYJ_Mall/myPageBasketDelete.action" ,
            async : false,
            data : {"prodtId" : prodt_id },
            dataType : "json",
            success : function(result) {
                
            	if (result == 1) {
            		for (let i = 0; i < mbdto_json_arr.length; i++) {
            			if (mbdto_json_arr[i].prodId == prodt_id) {
            				mbdto_json_arr.splice(i,1);
            				$("#"+prodt_id).remove();
            			}
            		}
            	}
            	
            },
            error: function(a,b,c) {
					console.log(a,b,c);
			}
        });
		
		//아무것도 없는 경우에 아무것도 없다는 페이지를 보내줘야한다.
		if (mbdto_json_arr.length == 0) basket_f5();
	});
	
	//장바구니 전체 제거해주는 기능
	$('.delete-all-btn').click(function(){
		
		let delete_prodt_string = '';
		
		for (let i = 0; i < mbdto_json_arr.length; i++) {
			if (mbdto_json_arr[i].checkYn == 'Y') delete_prodt_string += (mbdto_json_arr[i].prodId + '#');
		}
		
		if (delete_prodt_string != '') {
			
			$.ajax({
	        	type:"GET",
	            url: "/SYJ_Mall/myPageBasketSeletedDelete.action" ,
	            async : false,
	            data : {"prodtIds" : delete_prodt_string },
	            dataType : "json",
	            success : function(result) {
	            	
	            	for (let i = 0; i < result.length; i++) {
	            		const prodt_id = result[i];
	            		
	            		let prodt_index = 0;
	            		const prodt_list_size = mbdto_json_arr.length;
	            		let flag = true;
	            		
	            		while(flag) {
	            			if (mbdto_json_arr[prodt_index].prodId == prodt_id) {
	            				
	            				mbdto_json_arr.splice(prodt_index,1);
	            				$("#"+prodt_id).remove();
	            				flag = false;
	            			}
	            			
	            			prodt_index++;
	            			if (prodt_index == prodt_list_size) flag = false;
	            		}
	            	}
	            	
	            	
	            },
	            error: function(a,b,c) {
						console.log(a,b,c);
				}
	        });
		}
		
		//아무것도 없는 경우에 아무것도 없다는 페이지를 보내줘야한다.
		if (mbdto_json_arr.length == 0) basket_f5();
	});
	
	
	//장바구니에서 물품을 모두 지워서 상품이 하나도 없는경우 장바구니가 비어있다는 표시를 해줘야한다.
	function basket_f5() {
		location.href = "/SYJ_Mall/myPageMain.action?myPageNum=3";
	}

	
 	$('.bottom-bar').click(function(){
 		//결제페이지로 정보를 넘겨야 한다.
 		let prodt_id_list = '';
 		let prodt_cnt_list = '';
 				
 		
 		for (let i = 0; i < mbdto_json_arr.length; i++) {
 			
 			if (mbdto_json_arr[i].checkYn == 'Y') {
 				
 				prodt_id_list += mbdto_json_arr[i].prodId;
 				prodt_id_list += '#';
 				
 				prodt_cnt_list += mbdto_json_arr[i].buyCount;
 				prodt_cnt_list += '#';
 				
 			}
 		}
 		
 		$('#product_obj_id').val(prodt_id_list);
 		$('#product_obj_cnt').val(prodt_cnt_list);
		

 		$('#prodt_pay_go').submit();
 		
 	});
	

	
	
	
</script>


