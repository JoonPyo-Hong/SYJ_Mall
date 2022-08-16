<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>        
 
 
 <style>
 .product-order {
  border-top: 1px solid rgb(227, 229, 232);
}

/* 공통 체크박스 이미지 */
input[type="checkbox"] {
  display: none;
}

input[type="checkbox"] + label {
  flex: 1 1 auto;
  background-size: 25px;
  width: 25px;
  height: 25px;
  max-width: 25px;
  max-height: 25px;
  background-image: url(/SYJ_Mall/resources/images/product_order/ico_checked.png);
}

input[type="checkbox"]:checked + label {
  background-image: url(/SYJ_Mall/resources/images/product_order/ico_checked_ok.png);
}

/* order-section */

.order-section {
  padding: 25px;
  border-bottom: 1px solid rgb(227, 229, 232);
}

.order-section-title {
  display: flex;
  justify-content: space-between;
  font-size: 22px;
  font-weight: bold;
  letter-spacing: -0.2px;
  color: rgb(0, 0, 0);
  padding-bottom: 11px;
}

.order-section-title.first-title {
  padding-top: 26px;
}

.order-section-title .point-popup {
  text-decoration: underline;
  font-size: 13px;
  color: rgb(154, 154, 158);
}

/* 01 주문제품 영역 */
/* 문 제품 아이템 리스트 */

.product-item-list {
  display: flex;
  align-items: flex-start;
  justify-content: flex-start;
  padding: 15px 0px;
  border-bottom: 1px solid rgb(242, 242, 242);
}

.product-imgs {
  position: relative;
  width: 100px;
  height: 100px;
  background-size: contain;
}

.product-text {
  width: 100%;
  display: flex;
  flex-direction: column;
}

.product-text-row {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
}

.product-text-row.name-row {
  margin-bottom: 30px;
}

.product-list-delete-btn {
  width: 24px;
  height: 24px;
  background: url(/SYJ_Mall/resources/images/mypage_seen/delete-small-18-light-grey.png)
    no-repeat;
  background-size: 16px 16px;
  cursor: pointer;
}

.product-text-row.count-row {
  align-items: flex-end;
}

.product-text-row .product-count {
  width: 80px;
  height: 35px;
}

.product-text-row .product-count select {
  width: 80px;
  height: 35px;
  border: 1px solid rgb(227, 229, 232);
  padding: 0px 10px;
}

.product-text-row .product-price {
  font-size: 16px;
}

/* 상품 총 가격 */

.product-total-price {
  padding-top: 22px;
  margin-top: 0px;
}
.product-total-price .price-list {
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 30px;
  line-height: 30px;
}
.product-total-price .price-list .title {
  font-weight: normal;
  font-size: 16px;
}

.product-total-price .price-list .price {
  font-size: 16px;
}

.product-total-price .price-list .price.free {
  color: rgb(154, 154, 158);
}

/* 02 배송지정보 */
/* 배송지 주소 입력 */

.delivery-address {
  display: flex;
  flex-direction: column;
}

.delivery-address .address-title {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding-top: 10px;
  margin-bottom: 7px;
}

.delivery-address .address-title .sub-title {
  height: 35px;
  font-size: 16px;
  font-weight: bold;
  line-height: 30px;
}

.delivery-address .address-title .check-box {
  display: flex;
  -webkit-box-align: center;
  align-items: center;
  justify-content: flex-end;
}

.delivery-address .address-title .check-box label {
  font-size: 15px;
}

.delivery-address .input-text-row {
  margin-bottom: 8px;
}

.delivery-address .input-text-row input,
textarea,
select {
  width: 100%;
  height: 45px;
  text-indent: 10px;
  border: 1px solid rgb(227, 229, 232);
  font-size: 16px;
}

.delivery-address .input-text-row.field-address {
  position: relative;
}

.delivery-address .input-text-row.field-address .field-address-search-icon {
  position: absolute;
  width: 45px;
  height: 45px;
  display: block;
  top: 0;
  right: 2px;
  background: url(/SYJ_Mall/resources/images/product_order/ico_search.png) center center
    no-repeat;
  background-size: 45%;
  cursor: pointer;
}

.delivery-address .input-text-row textarea {
  resize: none;
  height: 70px;
  line-height: 1.5;
  text-indent: 10px;
  padding: 15px 0;
}

.delivery-address .input-text-row .textarea-messages {
  margin-top: 5px;
  padding-bottom: 15px;
  font-size: 13px;
  color: rgb(154, 154, 154);
}

.delivery-address .check-box-area .check-box-container {
  display: flex;
  align-items: center;
}

.delivery-address .check-box-text {
  margin: 0px 10px;
  font-size: 15px;
}

/* 배달 도착 예정일 및 공지 */
.delivery-information {
  margin-top: 30px;
  padding-top: 16px;
  border-top: 1px solid rgb(242, 242, 242);
}

.delivery-information .delivery-information-title {
  padding-left: 25px;
  font-size: 15px;
  background-size: 18px;
  margin-bottom: 10px;
  background: url(/SYJ_Mall/resources/images/product_order/ico_deliver.png) no-repeat;
  background-size: 20px auto;
}

.delivery-information .delivery-information-contents {
  font-size: 13px;
  color: rgb(154, 154, 158);
}

/* 03 결제하기 */
/* 결제수단 선택 */
.pay-select-wrap .pay-select-title {
  font-weight: bold;
  padding-top: 10px;
  height: 40px;
  font-size: 16px;
}

.pay-select-wrap .pay-methods-paylabel-wrap {
  display: flex;
  margin-bottom: 15px;
}

.pay-select-wrap .pay-methods-paylabel {
  display: block;
  width: calc(50% - 3px);
  height: 77px;
  padding-top: 35px;
  border: 2px solid rgb(227, 229, 232);
  text-align: center;
  color: rgb(212, 215, 225);
  font-weight: bold;
  font-size: 13px;
}

.pay-select-wrap .pay-methods-paylabel::before {
  content: "";
  display: block;
  height: 28px;
  background: url(/SYJ_Mall/resources/images/product_order/payment_kakaopay_default.png) center
    center / auto 21px no-repeat;
  margin-bottom: 18px;
}

.pay-select-wrap .pay-methods-paylabel.creditcard::before {
  background: url(/SYJ_Mall/resources/images/product_order/payment_creditcard_default.png) center
    center / auto 21px no-repeat;
}

input[type="radio"] {
  display: none;
}

.pay-select-wrap input[type="radio"]:checked + label {
  border-color: rgb(0, 0, 0);
  color: rgb(0, 0, 0);
  z-index: 1;
}

.pay-select-wrap input[type="radio"]:checked + .pay-methods-paylabel::before {
  background: url(/SYJ_Mall/resources/images/product_order/payment_kakaopay_selected.png) center
    center / auto 21px no-repeat;
}

.pay-select-wrap
  input[type="radio"]:checked
  + .pay-methods-paylabel.creditcard::before {
  background: url(/SYJ_Mall/resources/images/product_order/payment_creditcard_selected.png)
    center center / auto 21px no-repeat;
}

.pay-select-wrap .pay-methods-help {
  position: relative;
  background: rgb(255, 234, 1);
  padding: 10px 15px;
  font-size: 13px;
  border-radius: 18px;
  text-align: center;
  margin-bottom: 10px;
}

.pay-select-wrap .pay-methods-help::after {
  display: inline-block;
  content: "";
  position: absolute;
  border-right: 5px solid transparent;
  border-left: 5px solid transparent;
  top: -9px;
  left: 10%;
  border-bottom: 10px solid rgb(255, 234, 1);
}

/* 최종 금액 및 포인트 사용 */
.pay-list-ul {
  padding-top: 14px;
  display: flex;
  flex-direction: column;
  padding-bottom: 20px;
  padding-left : 10px;
  border-bottom: 1px solid rgb(245, 246, 246);

}

.pay-list-li {
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  min-height: 24px;
  height: auto;
  margin-bottom: 10px;
}

.pay-list-li input {
  width: 270px;
  height: 45px;
  line-height: 23px;
  font-size: 16px;
  border-radius: 4px !important;
  border: 1px solid rgb(227, 229, 232);
  text-align: right;
  padding: 0 15px;
}

.pay-list-li .point {
  display: flex;
  flex-direction: column;
}


.pay-list-li .point .total-point {
  display: inline-block;
  color: rgb(0, 135, 255);
  font-weight: bold;
  margin-left: 4px;
  font-size: 13px;
  line-height: 45px;
}

.pay-list-li .pay-detail-button {
  width: 100px;
  height: 46px;
  font-size: 15px;
  margin-left: 8px;
  line-height: 46px;
  background: rgb(239, 240, 244);
  border-radius: 4px;
  font-size: 16px;
  text-align: center;
}

.pay-list-li .total-price {
  font-size: 24px;
  font-weight: bold;
}

.pay-agree-wrapper {
  margin-top: 20px;
}

.pay-agree-wrapper .check-box-area {
  display: flex;
  margin: 0px 0px 10px;
}

.pay-agree-wrapper .check-box-area .check-box-container {
  display: flex;
  align-items: center;
  margin: 0px 0px 10px 10px;
}

.pay-agree-wrapper .check-box-area .check-box-label {
  display: flex;
}

.pay-agree-wrapper .check-box-area .check-box-label .required {
  margin-left: 7px;
  font-size: 13px;
  color: rgb(154, 154, 158);
 
}

.pay-agree-wrapper .check-box-area .check-box-text {
  font-size: 15px;
  margin-left: 10px;
  width:300px;
}

.pay-agree-wrapper .check-box-area .check-box-text.underline {
  text-decoration: underline;
}

/* 결제하기 버튼 */
.pay-buttont-wrap {
  margin-top: 20px;
  margin-bottom: 30px;
}

.pay-buttont-wrap .pay-button {
  width: 100%;
  height: 60px;
  line-height: 60px;
  font-size: 16px;
  font-weight: bold;
  text-align: center;
  border-radius: 4px;
  background: rgb(212, 215, 225);
  color: rgb(255, 255, 255);
}

.pay-notice-wrap {
  padding: 20px;
  background: rgb(247, 247, 247);
}

.pay-notice-wrap strong {
  display: block;
  padding-bottom: 3px;
  font-size: 15px;
}

.pay-notice-wrap ul li {
  position: relative;
  padding-left: 7px;
  margin-top: 6px;
  font-size: 14px;
  color: rgb(154, 154, 158);
}

.pay-notice-wrap ul li::before {
  position: absolute;
  content: "";
  display: inline-block;
  background-color: rgb(154, 154, 158);
  width: 3px;
  height: 3px;
  top: 8px;
  left: 0px;
  border-radius: 50%;
  margin-right: 5px;
}


/* 검색결과 없을 시 */
.order-list-nodata {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  padding: 100px 0px;
}
 
 
 
 
 </style>
 
 
 
 <!-- 마이페이지 컨텐츠 -->
 <div class="container-wrap product-order">
  
  <c:if test="${empty prodtList}">
  	<!-- 데이터 없을 시 -->
   	<div class="order-list-nodata">
       <div class="standing-ryan"></div>
       <div class="empty-message">내역이 없어요</div>
   	</div> 
  </c:if>

	<c:if test="${not empty prodtList}">
     <!-- 데이터 있을 시 -->
   <!-- 상품 주문서 -->
   <!-- 01 주문제품 -->
   <div class="order-section">
     <div class="order-section-title first-title">01 주문제품</div>
     
     <div id="prodt_lists_infos">
     <!-- 주문 제품 아이템 리스트 -->
     <c:forEach var="pdl" items="${prodtList}">
		
		<div class="product-item-list" id='${pdl.prodtSeq}'>
			<div class="product-imgs">
				<a href="#">
					<div class="product-imgs" style="background-image : url('${pdl.prodtImgUrl}')"></div>
				</a>
			</div>
			<div class="product-text">
				<div class="product-text-row name-row">
					<div class="product-name">${pdl.prodtName}</div>
					<div class="product-list-delete-btn"></div>
				</div>
				
				<div class="product-text-row count-row">
					<div class="product-count">
						<label content="4" class="select-box-label"> 
							<select class="select-box-select">
								<c:if test="${pdl.possibleProdtCnt eq 0}">
									<!-- 재고없음으로 처리해야한다. -->
								</c:if>
								<c:if test="${pdl.possibleProdtCnt ge 20}">
									<c:forEach var="num" begin="1" end="20">
										<c:if test="${num eq pdl.prodtBuyCnt}">
											<option selected value="${num}">${num}</option>
										</c:if>
										<c:if test="${num ne pdl.prodtBuyCnt}">
											<option value="${num}">${num}</option>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${pdl.possibleProdtCnt lt 20}">
									<c:forEach var="num" begin="1" end="${pdl.possibleProdtCnt}">
										<c:if test="${num eq pdl.prodtBuyCnt}">
											<option selected value="${num}">${num}</option>
										</c:if>
										<c:if test="${num ne pdl.prodtBuyCnt}">
											<option value="${num}">${num}</option>
										</c:if>
									</c:forEach>
								</c:if>
							</select>
						</label>
					</div>
					<div class="product-price">${pdl.prodtPrice}원</div>
				</div>
				
			</div>
		</div>
	
	</c:forEach>
	</div>
     
     
     <div class="product-total-price">
       <div class="price-list">
         <span class="title">상품가</span>
         <span class="price" id="prodt_cost">${totalProdtPay}원</span>
       </div>
       <div class="price-list">
         <span class="title">배송비</span>
         <span class="price free" id="shipping_cost">${shipFee}원</span>
       </div>
       <div class="price-list">
         <span class="title"><b>총합</b></span>
         <span class="price" id="total_prodt_cost" style="font-weight: bolder;">${totalProdtPayShip}원</span>
       </div>
     </div>
   </div>
   
   
   <!-- 02 배송지정보 -->
   <div class="order-section">
     <div class="order-section-title">02 배송지정보</div>
     
     
     <!-- 배송지 주소 입력 -->
     <c:if test="${empty userDtoList}">
	    <div class="delivery-address">
	       <div class="address-title">
	         <div class="sub-title">받는분</div>
	         <div class="check-box">
	           <label for="sameAsBuyer" class="check-box-label">
	             <span class="check-box-text">주문고객과 동일</span>
	           </label>
	           <input type="checkbox" class="check-box__InputCheckBox-sc-1p7znud-5" id="sameAsBuyer"
	             name="sameAsBuyer" checked="" />
	           <label for="sameAsBuyer"></label>
	         </div>
	       </div>
	       <!-- 입력 창 -->
	       <!-- 나라 -->
	       <div class="input-text-row select-country">
	         <!-- <label content="한국" height="45" class="select-label"> -->
	           <select height="45" class="select-select" name="shippingCountry">
	             <option value="KR">한국</option>
	           </select>
	       	<!-- </label> -->
	       </div>
	       <div required="" class="input-text-row field-name">
	         <input placeholder="이름" error="0" align="left" padding="15" class="input-text" name="shippingName"
	           value="" />
	       </div>
	       <div class="input-text-row field-phone">
	         <input placeholder="전화번호 (-없이 입력)" error="0" align="left" padding="15" class="input-text"
	           name="shippingName" value="" />
	       </div>
	       <div class="input-text-row field-address">
	         <input placeholder="주소 찾기" error=" 0" align="left" padding="15" class="input-text" name="shippingName" id="ship_name_first" value="" />
	         <div class="field-address-search-icon" id="addr_search_icon"></div> 
	       </div>
	       <div class="input-text-row field-address-detail">
	         <input placeholder="나머지 주소" error=" 0" align="left" padding="15" class="input-text" name="shippingName" id="ship_name_second" value="" />
	       </div>
	       <div class="input-text-row field-text-area">
	         <textarea id="msg_input" maxlength="50" placeholder="배송 요청메시지가 있으시면 남겨주세요. (주소 작성란이 아닙니다.)"></textarea>
	         <p class="textarea-messages" id="msg_len_check">50자 이내로 입력해주세요 (0 / 50)</p>
	       </div>
	       <!-- 자동 저장 -->
	       <div class="check-box-area">
	         <div class="check-box-container">
	           <input type="checkbox" class="check-box-input" id="saveAddress" name="saveAddress" />
	           <label for="saveAddress"></label>
	           <label for="saveAddress" class="check-box-label"><span class="check-box-text">내 정보 및 기본
	               배송지로 저장</span></label>
	         </div>
	       </div>
	     </div>
     </c:if>
     
     
     <c:if test="${not empty userDtoList}">
	    <div class="delivery-address">
	       <div class="address-title">
	         <div class="sub-title">받는분</div>
	         <div class="check-box">
	           <label for="sameAsBuyer" class="check-box-label">
	             <span class="check-box-text">주문고객과 동일</span>
	           </label>
	           <input type="checkbox" class="check-box__InputCheckBox-sc-1p7znud-5" id="sameAsBuyer"
	             name="sameAsBuyer" checked="" />
	           <label for="sameAsBuyer"></label>
	         </div>
	       </div>
	       <!-- 입력 창 -->
	       <!-- 나라 -->
	       <div class="input-text-row select-country">
	         <!-- <label content="한국" height="45" class="select-label"> -->
	           <select height="45" class="select-select" name="shippingCountry">
	             <option value="KR">한국</option>
	           </select>
	       	<!-- </label> -->
	       </div>
	       <div required="" class="input-text-row field-name">
	         <input placeholder="이름" error="0" align="left" padding="15" class="input-text" id="ship_user_name" name="ship_user_name" value="${userDtoList.userName}" />
	       </div>
	       <div class="input-text-row field-phone">
	         <input placeholder="전화번호 (-없이 입력)" error="0" align="left" padding="15" class="input-text" id="ship_user_phone" name="ship_user_phone" value="${userDtoList.userPhoneNum}" />
	       </div>
	       <div class="input-text-row field-address">
	         <input placeholder="주소 찾기" error=" 0" align="left" padding="15" class="input-text" name="ship_name_first" id="ship_name_first" value="${userDtoList.userFirstAddr}" />
	         <div class="field-address-search-icon" id="addr_search_icon"></div> 
	       </div>
	       <div class="input-text-row field-address-detail">
	         <input placeholder="나머지 주소" error=" 0" align="left" padding="15" class="input-text" name="ship_name_second" id="ship_name_second" value="${userDtoList.userSecondAddr}" />
	       </div>
	       <div class="input-text-row field-text-area">
	         <textarea id="msg_input" maxlength="50" placeholder="배송 요청메시지가 있으시면 남겨주세요. (주소 작성란이 아닙니다.)"></textarea>
	         <p class="textarea-messages" id="msg_len_check">50자 이내로 입력해주세요 (0 / 50)</p>
	       </div>
	       <!-- 자동 저장 -->
	       <div class="check-box-area">
	         <div class="check-box-container">
	           <input type="checkbox" class="check-box-input" id="saveAddress" name="saveAddress" />
	           <label for="saveAddress"></label>
	           <label for="saveAddress" class="check-box-label"><span class="check-box-text">내 정보 및 기본
	               배송지로 저장</span></label>
	         </div>
	       </div>
	     </div>
     </c:if>
     

     
     
     
     <!-- 배달 도착 예정일 및 공지 -->
     <div class="delivery-information">
       <p class="delivery-information-title">9/7(화) 도착 예정</p>
       <div class="delivery-information-contents">
         <p>오후 3시 이전 주문 시 당일 출고</p>
         <p>
           출고 후 평균 1~2영업일 이내 수령 (상황에 따라 변동 가능)
         </p>
       </div>
     </div>
   </div>
   <div class="order-section">
     <!-- 03 결제하기 -->
     <div class="order-section-title">
       03 결제하기
       <button class="point-popup">포인트안내</button>
     </div>
     <ul class="pay-list-ul">
       <li class="pay-list-li">
         <div>상품가</div>
         <div id='pay_prodt_cost' style="font-weight: bolder;">${totalProdtPay}원</div>
       </li>
       <li class="pay-list-li">
         <div>배송비</div>
         <div>${shipFee}원</div>
       </li>
       <li class="pay-list-li">
         <div class="point">카카오 포인트
           <div class="total-point" id="have_kakao_point" >(${userHasCoin}p)</div>
         </div>
         <div>
           <input align="right" padding="15" class="input-text" id='kakao_has_point' maxlength="9" value="0" style="width:180px;">
         </div>
       </li>
       <li class="pay-list-li">
         <div class="point" id="user_gift_card">기프트카드
         	<c:if test="${not empty userGiftBalance}">
         		<div class="total-point" id="have_gift_point">(${userGiftBalance}p)</div>
         	</c:if>
         </div>
         
         <c:if test="${empty userGiftBalance}">
         	<div id='gift_card_balance'>
           		<button type="button" class="pay-detail-button">카드 조회</button>
         	</div>
         </c:if>
         
		 <c:if test="${not empty userGiftBalance}">
         	<input align="right" padding="15" class="input-text" id="kakao_has_gift" maxlength="9" value="0" style="width:180px;">
         </c:if>
          

       </li>
       <li class="pay-list-li">
         <div><b>최종 결제금액</b></div>
         <div class="total-price" id='pay_prodt_total_cost' style="font-weight: bolder;">${totalProdtPayShip}원</div>
       </li>
     </ul>
     <!-- 결제수단 선택 -->
     <div class="pay-select-wrap">
       <div class="pay-select-title">
         결제수단 선택
       </div>
       <div class="pay-methods-paylabel-wrap" >
         <input id="kakaopay" type="radio" value="kakaopay" checked="" name="paylabel" >
         <label for="kakaopay" class="pay-methods-paylabel kakaopay"  style="height : 116px;">카카오페이</label>
         <input id="creditcard" type="radio" value="creditcard" name="paylabel">
         <label for="creditcard" class="pay-methods-paylabel creditcard"  style="height : 116px;">신용카드</label>
       </div>
       <p class="pay-methods-help">
         <strong>카카오페이</strong>로 간편하고 안전하게 결제!
       </p>
     </div>
     <div class="pay-agree-wrapper">
       <div class="check-box-area">
         <div class="check-box-container">
           <input type="checkbox" class="check-box-input" id="agree1" name="agree1" />
           <label for="agree1"></label>
           <label for="agree1" class="check-box-label">
             <span class="check-box-text underline">상품 주문 및 배송정보 수집에
               동의합니다<span class="required">[필수]</span></span>
           </label>
         </div>
       </div>
       <div class="check-box-area">
         <div class="check-box-container">
           <input type="checkbox" class="check-box-input" id="agree2" name="agree2"/>
           <label for="agree2"></label>
           <label for="agree2" class="check-box-label">
             <span class="check-box-text underline">주문 상품의 명시내용과 사용조건을
               확인하였으며, 취소환불 규정에 동의합니다<span class="required">[필수]</span></span>
           </label>  
         </div>
       </div>
     </div>
     <!-- 결제하기 버튼 -->
      <div class="pay-buttont-wrap">
        <button type="button" class="pay-button">결제하기
        </button>
      </div>
      <div class="pay-notice-wrap">
        <strong class="notice__Title-c5fdj-1 etxuRQ">글로벌 배송
          유의사항</strong>
        <ul>
          <li class="notice__Li-c5fdj-2 bACJGW">결제수단별 기준 통화가 달라 최종 결제금액에 차이가 날 수 있습니다. (신용카드 : KRW / 페이팔 : USD)
          </li>
          <li class="notice__Li-c5fdj-2 bACJGW">글로벌 배송비는 상품 무게와 배송박스 무게를 합산하여 책정합니다. </li>
          <li class="notice__Li-c5fdj-2 bACJGW">주문하신 상품 부피에 따라 1개의 주문건을 1박스로 포장할 수 없는 경우 박스가 추가됩니다. </li>
          <li class="notice__Li-c5fdj-2 bACJGW">현재 고객님께서 신청하신 배송은 글로벌 배송으로, “주문접수” 상태에서만 구매 취소가 가능합니다. 이후
            배송단계부터는 교환/취소/반품이 불가함을 원칙으로 하되, 상품에 원시적인 하자가 있어 회사가 승인하는 경우에만 교환이 가능합니다. 상품의 원시적 하자에 따른 교환을 요청하시려면
            객관적 증빙 자료를 바탕으로 1:1 문의 게시판 또는 이메일 (global@kakaofriends.com)로 연락주시기 바랍니다. </li>
          <li class="notice__Li-c5fdj-2 bACJGW">해외 통관 거부, 주소지 불명, 수취인 거부에 따른 반송은 구매자 귀책으로 간주하여 이로 인하여 발생하는 추가
            배송비는 고객님께서 부담하셔야 합니다. 또한 글로벌 배송 서비스 이용시 배송 국가에 따라 발생할 수 있는 관세 및 각종 세금 등 기타 비용은 수취인이 부담하셔야 합니다. </li>
        </ul>
      </div>
    </div> 	
   	
   	
   	</c:if>

  </div>
  
  
  
  <script>
  	
	 /* 배송요청 메시지 작성 이벤트 처리  */
	 let text_flag = true;
	 
	 $(document).on('keyup','#msg_input',function(e){
		const text_len = $('#msg_input').val().length;
		
		let inner_msg = '50자 이내로 입력해주세요';
		inner_msg += ' (';
		inner_msg += text_len;
		inner_msg += ' / ';
		inner_msg += '50)';
		
		$('#msg_len_check').text(inner_msg);
		
		
	});
	 	
	 
	 /* 주소 찾아주기 */	
	 $('#ship_name_first').click(function(){
	  	search_user_addr('ship_name_first'); 
	 });
	 
	 $('#addr_search_icon').click(function(){
	  	search_user_addr('ship_name_first'); 
	 });
	 		
	 
	 let same_as_buyer_flag = 1;
	 
	 $('#sameAsBuyer').click(function(){
		same_as_buyer_flag *= -1;	 
		
		if (same_as_buyer_flag == -1) {
			$('#ship_user_name').val('');
			$('#ship_user_phone').val('');
			$('#ship_name_first').val('');
			$('#ship_name_second').val('');
		} else {
			user_shipping_info_basic_ajax();
		}
		
	 });
	 
	 /* 고객 기본 배송정보 가져오기 */
	 function user_shipping_info_basic_ajax() {
			
		 $.ajax({
            	type:"GET",
            	url: "/SYJ_Mall/prodtPayUserInfos.action",
            	success : function(result) {
            		
            		if (result == null) {
            			alert('오류 발생');
            		} else {
            			$('#ship_user_name').val(result.userName);
            			$('#ship_user_phone').val(result.userPhoneNum);
            			$('#ship_name_first').val(result.userFirstAddr);
            			$('#ship_name_second').val(result.userSecondAddr);
            		}
            	},
            	error: function(a,b,c) {
					console.log(a,b,c);
			}
           });
	 }
	 
	 //제품의 개수를 바꿀 경우에 로직 처리
	 $(document).on('change','.select-box-select',function(e){
		 
		 const prodt_cnt = $(this).val();
		 const prodt_seq = $(this).parents('.product-item-list').attr('id');
		 
		 let kakao_has_point = not_money_dot($('#kakao_has_point').val());
		 let kakao_has_gift = $('#kakao_has_gift').val();
		 
		 if (kakao_has_gift == null) kakao_has_gift = 0;
		 else kakao_has_gift = not_money_dot(kakao_has_gift);
		 
		 user_shipping_info_ajax(prodt_seq,prodt_cnt,kakao_has_point,kakao_has_gift);
		 
	 });
	 
	 
	 /* 제품 개수 선택할때 해당 제품 수량,값 정보 가져와주기 */
	function user_shipping_info_ajax(prodt_seq,prodt_cnt,kakao_has_point,kakao_has_gift) {
	
		$.ajax({
			type : "GET",
			url : "/SYJ_Mall/prodtcheckInfos.action",
			async : true,
	        data : {"selectProdtSeq" : prodt_seq, "selectProdtCnt" : prodt_cnt},
	        dataType : "json",
			success : function(result) {
				
				let inner_text = '';
				let total_prodt_cost = 0;
				let total_prodt_ship_cost_first = 3000;
				let total_prodt_ship_cost = 3000;
				

				
				for (let i = 0; i < result.length; i++) {
					
					let prodt_cost_int = parseInt(not_money_dot(result[i].prodtPrice));
					
					total_prodt_cost += prodt_cost_int;
					
					inner_text += '<div class="product-item-list" id="' + result[i].prodtSeq + '">';
					inner_text += '<div class="product-imgs">';
					inner_text += '<a href="#">';
					inner_text += '<div class="product-imgs" style="background-image : url(' + result[i].prodtImgUrl +')"></div>'
					inner_text += '</a>'
					inner_text += '</div>'
					inner_text += '<div class="product-text">'
					inner_text += '<div class="product-text-row name-row">';
					inner_text += '<div class="product-name">' + result[i].prodtName +'</div>';
					inner_text += '<div class="product-list-delete-btn"></div>';
					inner_text += '</div>'
					inner_text += '<div class="product-text-row count-row">'
					inner_text += '<div class="product-count">'
					inner_text += '<label content="4" class="select-box-label">'
					inner_text += '<select class="select-box-select">'
					
					let ps_cnt = result[i].possibleProdtCnt;
					let cur_cnt = result[i].prodtBuyCnt;
					
					if (ps_cnt == 0) {
						//재고없음으로 처리해야함.
					} else if (ps_cnt >= 20) {
						for(let j = 1; j <= 20; j++) {
							if (cur_cnt == j) {
								inner_text += '<option selected value="'+j+'">'+j+'</option>'
							} else {
								inner_text += '<option value="'+j+'">'+j+'</option>'
							}
						}
					} else {
						for(let j = 1; j <= ps_cnt; j++) {
							if (cur_cnt == j) {
								inner_text += '<option selected value="'+j+'">'+j+'</option>'
							} else {
								inner_text += '<option value="'+j+'">'+j+'</option>'
							}
						}
					}
					
					inner_text += '</select>';
					inner_text += '</label>';
					inner_text += '</div>';
					inner_text += '<div class="product-price">'+result[i].prodtPrice+'원</div>';
					inner_text += '</div></div></div>';
				}
				
				//기존에 모든 사진 등등의 정보를 없애고 다시 정보를 덮어씌워주면 된다.
				$('.product-item-list').remove();//삭제
				$('#prodt_lists_infos').append(inner_text);//삽입
				
				//아래에서는 요금을 산정해준다.
				total_prodt_ship_cost += total_prodt_cost;
				total_prodt_ship_cost_first += total_prodt_cost;
				let additional_price = parseInt(kakao_has_point) + parseInt(kakao_has_gift);
				total_prodt_ship_cost = total_prodt_ship_cost - additional_price;

				
				$('#prodt_cost').text(money_dot(total_prodt_cost) + '원');
				$('#total_prodt_cost').text(money_dot(total_prodt_ship_cost_first) + '원');
				$('#pay_prodt_cost').text(money_dot(total_prodt_cost) + '원');
				$('#pay_prodt_total_cost').text(money_dot(total_prodt_ship_cost) + '원');

				
			},
			error : function(a, b, c) {
				console.log(a, b, c);
			}
		});
		
	}
	
	 
	/* 제품삭제 해주는 로직 */
	$('.product-list-delete-btn').click(function(){
		let parent = $(this).parent().parent().parent();
		$(parent).remove();//현재 리무브 처리 되어있지만 애를 연동해서 지워야 한다. -> 장바구니와도 연동 시켜야 한다.
	}) 
	
	
	/* 카드 조회해주기 */
	$('.pay-detail-button').click(function(){
		user_has_gift_card();
	}); 
	 
	/* 카드 조회 관련 함수 */
	function user_has_gift_card() {
		 $.ajax({
         	type:"GET",
         	url: "/SYJ_Mall/prodtPayUserGiftCard.action",
         	success : function(result) {
         		
         		if (result != null) {
         			$('.pay-detail-button').remove();
             		$('#gift_card_balance').append('<input align="right" padding="15" class="input-text" id="kakao_has_gift" value="0" style="width:180px;">');
             		$('#user_gift_card').append('<div class="total-point" id="have_gift_point">(' + result +'p)</div>')
         		}
         	},
         	error: function(a,b,c) {
				console.log(a,b,c);
			}
        });
	}
	
	$(document).on('blur','#kakao_has_point',function(e){
		point_checking($(this),1);
	});
	
	$(document).on('blur','#kakao_has_gift',function(e){
		point_checking($(this),2);
	});
	
	
	/* 카카오 포인트 또는 기프트 카드 블러 처리되었을때 사용할 수 있는 범위의 금액을 넣었는지 확인해주는 작업 */
	function point_checking(object_id,check_num) {
		
		const use_cost = $(object_id).val();
		
		let kakao_has_point_val = not_money_dot($('#kakao_has_point').val());
		let kakao_has_gift_val = $('#kakao_has_gift').val();
		//not_money_dot($('#kakao_has_gift').val());
		
		if (kakao_has_gift_val == null) kakao_has_gift_val = 0;
		else kakao_has_gift_val = not_money_dot(kakao_has_gift_val);
		
		//문자인지 숫자인지 걸러내는 작업
		if (use_cost.length <= 9 && !isNaN(use_cost)) {
			$.ajax({
	         	type:"GET",
	         	url: "/SYJ_Mall/prodtPayUserBalanceCheck.action",
		        data : {"useCost" : use_cost, "checkNum" : check_num, "kakaoHasPoint" : kakao_has_point_val,"kakaoHasGift" : kakao_has_gift_val},
		        dataType : "json",
	         	success : function(result) {
	         		
	         		
	         		const user_point_balance = result[0];
	         		const user_gift_balance = result[1];
	         		const total_payment = result[2];
	         		
	         		if (check_num == 1) {
	         			$('#kakao_has_point').val(money_dot(user_point_balance));
	         		} else if (check_num == 2) {
	         			$('#kakao_has_gift').val(money_dot(user_gift_balance));
	         		} 
	         		
	         		$('#pay_prodt_total_cost').text(money_dot(total_payment)+'원');
	         		
	         	},
	         	error: function(a,b,c) {
					console.log(a,b,c);
				}
	        });
		} else {
			if (check_num == 1) {
     			$('#kakao_has_point').val(0);
     		} else if (check_num == 2) {
     			$('#kakao_has_gift').val(0);
     		}     		
		}
	}
	
	
	
	
	 
	 
</script>
  
  
  
  
  