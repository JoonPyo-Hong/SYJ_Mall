<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<!-- <meta name="viewport" content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0" /> -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>카카오 프렌즈샵</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- <script type="text/javascript" src="./js/main.js"></script> -->
<!--  <link rel="shortcut icon" href="./images/favicon.ico" type="image/x-ico" /> -->
<link rel="stylesheet" type="text/css"
	href="resources/css/pay/fonts.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/pay/common.css" />
<link rel="stylesheet" type="text/css" href="resources/css/pay/main.css" />
<!-- <link rel="stylesheet" type="text/css" href="./css/basket.css" /> -->
<link rel="stylesheet" type="text/css" href="resources/css/pay/seen.css" />
<link rel="stylesheet" type="text/css" href="resources/css/pay/act.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/pay/product_order.css" />
</head>
<body>


	<div id="kakao-wrap">
		<div id="kakao-head">
			<div id="inner-head">
				<div class="left-btn">
					<!-- <button class="hamburger-menu"></button> -->
					<button class="back-button"></button>
					<!-- ic_back_2x.png -->
					<!-- gnb-home-18-black@2x.png -->
					<button class="home-button"></button>
				</div>
				<!-- <div class="title"><button class="title-logo"></button></div> -->
				<div class="title">주문하기</div>
				<div class="right-btn">
					<button class="search"></button>
					<button class="language"></button>
				</div>
			</div>
			<div id="inner-tab">
				<!-- 메인메뉴 tab -->
				<!-- <div class="main-tab">
        <ul class="main-tab-ul">
          <li class="main-tab-li">오늘</li>
          <li class="main-tab-li">신규</li>
          <li class="main-tab-li">인기</li>
          <li class="main-tab-li active">마이</li>
        </ul>
      </div> -->
				<!-- 마이페이지 tab -->
				<!-- <div class="mypage-tab">
        <ul class="mypage-tab-ul">
          <li class="mypage-tab-li">최근 본</li>
          <li class="mypage-tab-li active">내 활동</li>
          <li class="mypage-tab-li">장바구니</li>
          <li class="mypage-tab-li ">주문내역</li>
        </ul>
      </div> -->
			</div>
		</div>
		<div id="kakao-content">
			<div id="inner-content">
				<!-- 마이페이지 컨텐츠 -->
				<div class="container-wrap product-order">
					<!-- 데이터 없을 시 -->
					<!-- <div class="order-list-nodata">
              <div class="standing-ryan"></div>
              <div class="empty-message">내역이 없어요</div>
            </div> -->
					<!-- 데이터 있을 시 -->
					<!-- 상품 주문서 -->
					<!-- 01 주문제품 -->
					<c:set var="num" value="0"></c:set>
					<div class="order-section">
						<div class="order-section-title first-title">01 주문제품</div>
						<!-- 주문 제품 아이템 리스트 -->
						<!-- 하나 -->

						<c:forEach var="p_seq" items="${list1}" varStatus="stat">

							<div class="product-item-list">
								<div class="product-img"
									style="background-image: url('${p_seq.product_img}');">
									<a href="#">
										<div class="product-img"></div>
									</a>
								</div>
								<div class="product-text">
									<div class="product-text-row name-row">
										<div class="product-name">${p_seq.product_nm}</div>
										<div class="product-list-delete-btn"></div>
									</div>
									<div class="product-text-row count-row">
										<div class="product-count">
											<label content="4" class="select-box-label"> <select
												class="select-box-select">

													<c:forEach var="i" begin='1' end='100' varStatus="stat1">
														<c:choose>
															<c:when test="${list2[stat.index] eq i}">
																<option selected="selected" value="${i}">${i}</option>
															</c:when>
															<c:otherwise>
																<option value="${i}">${i}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
											</select>
											</label>
										</div>
										<c:set var="money"
											value="${fn:replace(p_seq.product_price, '.0000', '')}"></c:set>
										<div class="product-price">
											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="${money}" />
											원
										</div>
										<c:set var="num"
											value="${num + fn:replace(p_seq.product_price, '.0000', '')}" />
									</div>
								</div>
							</div>
						</c:forEach>
	
						<div class="product-total-price">
							<div class="price-list">
								<span class="title">상품가</span> <span class="price"><div
										class="product-price">
										<fmt:formatNumber type="number" maxFractionDigits="3"
											value="${num}" />
										원
									</div></span>
							</div>
							<div class="price-list">
								<span class="title">배송비</span> <span class="price free">무료</span>
							</div>
							<div class="price-list">
								<span class="title"><b>총합</b></span> <span class="price"><b><div
											class="product-price">
											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="${num}" />
											원
										</div></b></span>
							</div>
						</div>
					</div>
					<!-- 02 배송지정보 -->
					<div class="order-section">
						<div class="order-section-title">02 배송지정보</div>
						<!-- 배송지 주소 입력 -->
						<div class="delivery-address">
							<div class="address-title">
								<div class="sub-title">받는분</div>
								<div class="check-box">
									<label for="sameAsBuyer" class="check-box-label"> <span
										class="check-box-text">주문고객과 동일</span>
									</label> <input type="checkbox"
										class="check-box__InputCheckBox-sc-1p7znud-5" id="sameAsBuyer"
										name="sameAsBuyer" checked="" /> <label for="sameAsBuyer"></label>
								</div>
							</div>
							<!-- 입력 창 -->
							<!-- 나라 -->
							<div class="input-text-row select-country">
								<label content="한국" height="45" class="select-label"> <select
									`
									height="45" class="select-select"
									name="shippingCountry">
										<option value="KR">한국</option>
								</select></label>
							</div>
							<div required="" class="input-text-row field-name">
								<input placeholder="이름" error="0" align="left" padding="15"
									class="input-text" name="shippingName" value="" />
							</div>
							<div class="input-text-row field-phone">
								<input placeholder="전화번호 (-없이 입력)" error="0" align="left"
									padding="15" class="input-text" name="shippingName" value="" />
							</div>
							<div class="input-text-row field-address">
								<input placeholder="주소 찾기" error=" 0" align="left" padding="15"
									class="input-text" name="shippingName" value="" />
								<div class="field-address-search-icon"></div>
							</div>
							<div class="input-text-row field-address-detail">
								<input placeholder="나머지 주소" error=" 0" align="left" padding="15"
									class="input-text" name="shippingName" value="" />
							</div>
							<div class="input-text-row field-text-area">
								<textarea maxlength="50"
									placeholder="배송 요청메시지가 있으시면 남겨주세요. (주소 작성란이 아닙니다.)"></textarea>
								<p class="textarea-messages">50자 이내로 입력해주세요 (0 / 50)</p>
							</div>
							<!-- 자동 저장 -->
							<div class="check-box-area">
								<div class="check-box-container">
									<input type="checkbox" class="check-box-input" id="saveAddress"
										name="saveAddress" /> <label for="saveAddress"></label> <label
										for="saveAddress" class="check-box-label"><span
										class="check-box-text">내 정보 및 기본 배송지로 저장</span></label>
								</div>
							</div>
						</div>
						<!-- 배달 도착 예정일 및 공지 -->
						<div class="delivery-information">
							<p class="delivery-information-title">9/7(화) 도착 예정</p>
							<div class="delivery-information-contents">
								<p>오후 3시 이전 주문 시 당일 출고</p>
								<p>출고 후 평균 1~2영업일 이내 수령 (상황에 따라 변동 가능)</p>
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
								<div>
									<b><fmt:formatNumber type="number" maxFractionDigits="3"
											value="${num}" /> 원</b>
								</div>
							</li>
							<li class="pay-list-li">
								<div>배송비</div>
								<div>무료</div>
							</li>
							<li class="pay-list-li">
								<div class="point">
									포인트
									<div class="total-point">(0p)</div>
								</div>
								<div>
									<input align="right" padding="15" class="input-text" value="0">
								</div>
							</li>
							<li class="pay-list-li">
								<div>기프트카드</div>
								<div>
									<button type="button" class="pay-detail-button">카드 조회</button>
								</div>
							</li>
							<li class="pay-list-li">
								<div>
									<b>최종 결제금액</b>
								</div>
								<div class="total-price">
									<b><fmt:formatNumber type="number" maxFractionDigits="3"
											value="${num}" /> 원</b>
								</div>
							</li>
						</ul>
						<!-- 결제수단 선택 -->
						<div class="pay-select-wrap">
							<div class="pay-select-title">결제수단 선택</div>
							<div class="pay-methods-paylabel-wrap">
								<input id="kakaopay" type="radio" value="kakaopay" checked=""
									name="paylabel"> <label for="kakaopay"
									class="pay-methods-paylabel kakaopay">카카오페이</label> <input
									id="creditcard" type="radio" value="creditcard" name="paylabel">
								<label for="creditcard" class="pay-methods-paylabel creditcard">신용카드</label>
							</div>
							<p class="pay-methods-help">
								<strong>카카오페이</strong>로 간편하고 안전하게 결제!
							</p>
						</div>
						<div class="pay-agree-wrapper">
							<div class="check-box-area">
								<div class="check-box-container">
									<input type="checkbox" class="check-box-input" id="agree1"
										name="agree1" /> <label for="agree1"></label> <label
										for="agree1" class="check-box-label"> <span
										class="check-box-text underline">상품 주문 및 배송정보 수집에 동의합니다<span
											class="required">[필수]</span></span>
									</label>
								</div>
							</div>
							<div class="check-box-area">
								<div class="check-box-container">
									<input type="checkbox" class="check-box-input" id="agree2"
										name="agree2" /> <label for="agree2"></label> <label
										for="agree2" class="check-box-label"> <span
										class="check-box-text">주문 상품의 명시내용과 사용조건을 확인하였으며, 취소환불
											규정에 동의합니다<span class="required">[필수]</span>
									</span>
									</label>
								</div>
							</div>
						</div>
						<!-- 결제하기 버튼 -->
						<div class="pay-buttont-wrap">
							<button type="button" class="pay-button">결제하기</button>
						</div>
						<div class="pay-notice-wrap">
							<strong class="notice__Title-c5fdj-1 etxuRQ">글로벌 배송 유의사항</strong>
							<ul>
								<li class="notice__Li-c5fdj-2 bACJGW">결제수단별 기준 통화가 달라 최종
									결제금액에 차이가 날 수 있습니다. (신용카드 : KRW / 페이팔 : USD)</li>
								<li class="notice__Li-c5fdj-2 bACJGW">글로벌 배송비는 상품 무게와 배송박스
									무게를 합산하여 책정합니다.</li>
								<li class="notice__Li-c5fdj-2 bACJGW">주문하신 상품 부피에 따라 1개의
									주문건을 1박스로 포장할 수 없는 경우 박스가 추가됩니다.</li>
								<li class="notice__Li-c5fdj-2 bACJGW">현재 고객님께서 신청하신 배송은 글로벌
									배송으로, “주문접수” 상태에서만 구매 취소가 가능합니다. 이후 배송단계부터는 교환/취소/반품이 불가함을 원칙으로
									하되, 상품에 원시적인 하자가 있어 회사가 승인하는 경우에만 교환이 가능합니다. 상품의 원시적 하자에 따른 교환을
									요청하시려면 객관적 증빙 자료를 바탕으로 1:1 문의 게시판 또는 이메일
									(global@kakaofriends.com)로 연락주시기 바랍니다.</li>
								<li class="notice__Li-c5fdj-2 bACJGW">해외 통관 거부, 주소지 불명, 수취인
									거부에 따른 반송은 구매자 귀책으로 간주하여 이로 인하여 발생하는 추가 배송비는 고객님께서 부담하셔야 합니다.
									또한 글로벌 배송 서비스 이용시 배송 국가에 따라 발생할 수 있는 관세 및 각종 세금 등 기타 비용은 수취인이
									부담하셔야 합니다.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="kakao-footer">
		<div id="inner-footer">
			<div class="info-service">
				<ul>
					<li>제휴문의</li>
					<span class="footer-divider"></span>
					<li>고객문의</li>
					<span class="footer-divider"></span>
					<li>이용약관</li>
					<span class="footer-divider"></span>
					<li>개인정보처리방침</li>
					<span class="footer-divider"></span>
					<li>지식재산권보호센터</li>
				</ul>
			</div>
			<div class="logo">
				<div class="toggler">
					<span class="toggler-logo"></span> <span class="toggler-icon"></span>
				</div>
				<div class="best-family"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
	</script>
</body>
</html>