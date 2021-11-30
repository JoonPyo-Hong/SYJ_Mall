<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>
<link rel="stylesheet" href="resources/css/myPage/myPageBasket2.css">
	
 <!-- 마이페이지 컨텐츠 -->
<div class="container-wrap mypage-basket-wrap">
  <!-- 데이터 없을 시 -->
  <!-- <div class="order-list-nodata">
    <div class="standing-ryan"></div>
    <div class="empty-message">내역이 없어요</div>
  </div> -->
  <!-- 데이터 있을 시 -->
  <div class="basket-header">
    <div class="basket-count">
      <label class="product-checkbox-label" for="product-checkbox">
        <input id="product-checkbox" type="checkbox" class="product-checkbox-input">
      </label>
      <div class="basket-count-text">전체 <b>7</b></div>
    </div>
      <div class="delete-all">
        <div class="delete-count">2개 선택</div>
        <button class="delete-all-btn"></button>
      </div>
  </div>
  <hr class="division">

  <div class="basket-list-wrap">

    <!-- 상품 하나 -->
    <div class="basket-list-item">
      <div class="basket-left">
        <!-- 상품 체크박스 -->
        <div class="basket-check">
          <label class="product-checkbox-label" for="product-checkbox">
            <input id="product-checkbox" type="checkbox" class="product-checkbox-input">
          </label>
        </div>
        <!-- 상품 내용 및 수량 -->
        <div class="basket-content">
          <a href="#">
            <div class="product-img"></div>
          </a>
          <div class="basket-text">
            <span class="product-name">워치전용 충전 거치대_라이언&춘식이</span>
            <span class="product-price">25,000원</span>
            <div class="product-count">
              <label content="4" class="select-box__Label-iihqm7-0">
                <select class="select-box__Select-iihqm7-2">
                  <option value="1">2</option>
                </select>
              </label>
            </div>
          </div>
        </div>
      </div>
      <!-- 상품 삭제 -->
      <div class="basket-list-delete-btn"></div>
    </div>

    <!-- 상품 둘 -->
    <div class="basket-list-item">
      <div class="basket-left">
        <!-- 상품 체크박스 -->
        <div class="basket-check">
          <label class="product-checkbox-label" for="product-checkbox">
            <input id="product-checkbox" type="checkbox" class="product-checkbox-input">
          </label>
        </div>
        <!-- 상품 내용 및 수량 -->
        <div class="basket-content">
          <a href="#">
            <div class="product-img"></div>
          </a>
          <div class="basket-text">
            <span class="product-name">워치전용 충전 거치대_라이언&춘식이</span>
            <span class="product-price">25,000원</span>
            <div class="product-count">
              <label content="4" class="select-box__Label-iihqm7-0">
                <select class="select-box__Select-iihqm7-2">
                  <option value="1">1</option>
                </select>
              </label>
            </div>
          </div>
        </div>
      </div>
      <!-- 상품 삭제 -->
      <div class="basket-list-delete-btn"></div>
    </div>

  </div>
</div>