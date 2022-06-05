<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>



<style>
/* 주문번호 */
.order-number-box-wrap {
  text-align: center;
  padding: 50px 0px;
  border-bottom: 1px solid rgb(227, 229, 232);
}

.order-number-box-wrap .order-number {
  margin: 10px 0px 20px;
  font-size: 16px;
  font-weight: bold;
}

.order-number-box-wrap ul {
  font-size: 13px;
  color: rgb(157, 157, 161);
}

.order-number-box-wrap ul li {
  display: inline-block;
}

.order-number-box-wrap ul li.active {
  font-size: 14px;
  font-weight: bold;
  color: rgb(0, 0, 0);
}

.order-number-box-wrap ul li:not(:last-child)::after {
  content: "";
  display: inline-block;
  vertical-align: middle;
  width: 14px;
  height: 17px;
  margin: 0px 7px;
  background: url(../images/mypage_orderlist_detail/ico_step.png) 0% 0% / 14px
    no-repeat;
}

.order-number-box-wrap button.cancel {
  padding: 7px 0px;
  margin-top: 18px;
  border-radius: 4px;
  font-size: 13px;
  width: 112px;
  height: 35px;
  border: 1px solid rgb(240, 242, 245);
  color: rgb(102, 102, 102);
}

/* 주문제품 */
.order-item-box-wrap {
  padding: 0px 20px 25px;
  border-bottom: 1px solid rgb(227, 229, 232);
}

.order-item-box-wrap .title {
  font-size: 22px;
  letter-spacing: -0.2px;
  color: rgb(0, 0, 0);
  padding-top: 26px;
  padding-bottom: 11px;
}

.order-item-box-wrap ul li {
  display: flex;
  flex-direction: column;
  padding: 15px 0px;
}

.order-item-box-wrap ul li button.service {
  height: 35px;
  line-height: 34px;
  border-radius: 4px;
  font-size: 13px;
  font-weight: normal;
  color: rgb(102, 102, 102);
  border: 1px solid rgb(227, 229, 232);
  text-align: center;
  margin-top: 15px;
}

.order-item-box-wrap ul li .order-info {
  display: flex;
}

.order-item-box-wrap ul li .wrap-thumb {
  overflow: hidden;
  float: left;
  position: relative;
  width: 100px;
  height: 100px;
  border-radius: 6px;
}

.order-item-box-wrap ul li .wrap-thumb::before {
  position: absolute;
  left: 0;
  top: 0;
  z-index: 1;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.02);
  content: "";
}

.order-item-box-wrap ul li .wrap-thumb img {
  width: 100%;
  height: 100%;
}

.order-item-box-wrap ul li .info-orderlist {
  /* position: relative; */
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  justify-content: space-between;
  overflow: hidden;
  padding: 6px 0 6px 16px;
  box-sizing: border-box;
  height: 100%;
  height: 100px;
}

.order-item-box-wrap ul li .info-orderlist .info-title {
  font-size: 16px;
  padding-bottom: 5px;
}

.order-item-box-wrap ul li .info-orderlist .unit-price {
  font-size: 16px;
}

.order-item-box-wrap ul li .info-orderlist .state {
  font-size: 14px;
  color: rgb(0, 135, 255);
}

/* 결제정보 */
.purchase-box-wrap {
  padding: 0px 20px 25px;
  border-bottom: 1px solid rgb(227, 229, 232);
}

.purchase-box-wrap .title {
  font-size: 22px;
  letter-spacing: -0.2px;
  color: rgb(0, 0, 0);
  padding-top: 26px;
  padding-bottom: 11px;
}

.purchase-box-wrap ul.list-type {
  display: flex;
  flex-direction: column;
  font-size: 16px;
  padding-top: 15px;
}

.purchase-box-wrap ul.payment-info {
  border-bottom: 1px solid rgb(242, 242, 242);
  padding-bottom: 15px;
  margin-bottom: 15px;
}

.purchase-box-wrap ul.list-type li {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 7px;
}

.purchase-box-wrap ul.list-type li .list-title {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.purchase-box-wrap ul.list-type li.final-cost {
  margin: 30px 0 7px;
  font-weight: bold;
}

.purchase-box-wrap ul.list-type li.final-cost .list-contents {
  font-size: 24px;
}

/* 배송지 정보 */
.address-box-wrap {
  padding: 0px 20px 25px;
}

.address-box-wrap .title {
  font-size: 22px;
  letter-spacing: -0.2px;
  color: rgb(0, 0, 0);
  padding-top: 26px;
  padding-bottom: 11px;
}

.address-box-wrap .order-customer {
  border-bottom: 1px solid rgb(227, 229, 232);
}

.address-box-wrap .info-box .customer {
  padding-top: 15px;
  margin-bottom: 10px;
  font-size: 16px;
}

.address-box-wrap .info-box .customer-info {
  margin-bottom: 25px;
  font-size: 16px;
  line-height: 170%;
}

.address-box-wrap .info-box .customer-info .name {
  margin-right: 5px;
}

/* 포인트 및 쿠폰 관련 유의사항 */
.notice-box-wrap {
  padding: 0px 20px 25px;
}

.notice-box {
  padding: 20px;
  margin-bottom: 30px;
  background: rgb(247, 247, 247);
}

.notice-box .title {
  font-size: 16px;
  padding-bottom: 5px;
}

.notice-box ul li {
  position: relative;
  color: rgb(154, 154, 158);
  font-size: 14px;
  line-height: 1.43;
  padding-left: 7px;
  margin-top: 6px;
  margin-bottom: 11px;
}

.notice-box ul li::before {
  display: inline-block;
  content: "";
  width: 3px;
  height: 3px;
  position: absolute;
  top: 8px;
  left: 0px;
  background-color: rgb(154, 154, 158);
  border-radius: 50%;
}




</style>


<div class="container-wrap product-order-detail">

          <!-- 주문번호 -->
          <div class="order-number-box-wrap">
            <div class="order-number">주문번호 K2112291627309793</div>
            <ul class="order-step">
              <li class="active">주문 접수</li>
              <li>배송 준비중</li>
              <li>배송중</li>
              <li>배송 완료</li>
            </ul>
            <!-- 전체 취소는 주문 접수 일 때 만 화면에 표기 -->
            <button class="cancel">전체 취소</button>
          </div>

          <!-- 주문제품 -->
          <div class="order-item-box-wrap">
            <div class="title">주문제품</div>
            <div class="order-item-list">
              <ul>
                <li>
                  <div class="order-info">
                    <div class="wrap-thumb">
                      <img src="./images/mypage_orderlist/product.jpg">
                    </div>
                    <div class="info-orderlist">
                      <div class="info">
                        <div class="info-title">2022 탁상용 캘린더_프렌즈</div>
                        <div class="unit-price">8000원 / 1개</div>
                      </div>
                      <div class="state">주문접수</div>
                    </div>
                  </div>
                  <button class="service">실시간 상담</button>
                </li>
              </ul>
            </div>
          </div>
          <!-- 결제정보 -->
          <div class="purchase-box-wrap">
            <div class="title">결제정보</div>
            <ul class="list-type payment-info">
              <li>
                <div class="list-title">결제수단</div>
                <div class="list-contents"><b>신용카드</b></div>
              </li>
              <li>
                <div class="list-title">결제일시</div>
                <div class="list-contents">2022-01-01 15:25:13</div>
              </li>
            </ul>
            <ul class="list-type product-info">
              <li>
                <div class="list-title">상품가</div>
                <div class="list-contents"><b>8,000원</b></div>
              </li>
              <li>
                <div class="list-title">배송비</div>
                <div class="list-contents">3,000원</div>
              </li>
              <li>
                <div class="list-title">포인트</div>
                <div class="list-contents">0원</div>
              </li>
              <li>
                <div class="list-title">기프트카드</div>
                <div class="list-contents">0원</div>
              </li>
              <li class="final-cost">
                <div class="list-title">최종 결제금액</div>
                <div class="list-contents">11,000원</div>
              </li>
            </ul>
          </div>
          <!-- 배송지 정보 -->
          <div class="address-box-wrap">
            <div class="title">배송지정보</div>
            <div class="order-customer info-box">
              <div class="customer">주문고객</div>
              <div class="customer-info">
                <div><b class="name">예림</b> 01012345678</div>
                <div>kakao@naver.com</div>
              </div>
            </div>
            <div class="receive-customer info-box">
              <div class="customer">받는 분</div>
              <div class="customer-info">
                <div><b class="name">예림</b> 01012345678</div>
                <div>[63309] 제주특별자치도 제주시 첨단로 242</div>
              </div>
            </div>
          </div>
          <!-- 포인트 및 쿠폰 관련 유의사항 -->
          <div class="notice-box-wrap">
            <div class="notice-box">
              <div class="title">포인트 및 쿠폰 관련 유의사항</div>
              <ul>
                <li>포인트/쿠폰 사용시 부분반품 및 부분환불이
                  불가합니다. 현재 시스템의 제약으로 부분반품을 원하시는 경우 전체반품 후 재구매 부탁드립니다.</li>
                <li>주문시 사용한 포인트/쿠폰의 유효기간이 남아있는
                  경우, 주문취소 및 반품 후 재사용이 가능한 상태로 변경됩니다. 단, 반품시 주문상태가 반품완료일 때 변경됩니다.</li>
                <li>구매취소시 취소/환불 규정에 따라 포인트 및 쿠폰이
                  회수될 수 있습니다.</li>
                <li>포인트/쿠폰 악용 사례를 주기적으로 조사하고 있으며,
                  리셀러의 경우 회원 박탈 및 피해보상 청구 등 법적 조치가 진행될 수 있습니다.</li>
              </ul>
            </div>
          </div>





        </div>