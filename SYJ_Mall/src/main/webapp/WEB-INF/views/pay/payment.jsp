<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
					<div class="order-section">
						<div class="order-section-title">01 주문제품</div>
						<div class="product-item-list">
							<div class="product-img">
								<a href="#">
									<div class="product-img"></div>
								</a>
							</div>
							<div class="product-text">
								<div class="product-text-row name-row">
									<div class="product-name">워치전용 충전 거치대_라이언&춘식이</div>
									<div class="product-list-delete-btn"></div>
								</div>
								<div class="product-text-row">
									<div class="product-count">
										<label content="4" class="select-box__Label-iihqm7-0">
											<select class="select-box__Select-iihqm7-2">
												<option value="1">1</option>
												<option value="2">2</option>
										</select>
										</label>
									</div>
									<div class="product-price">36,000원</div>
								</div>
							</div>
						</div>
						<div class="product-total-price">
							<div class="price-list">
								<span class="title">상품가</span> <span class="price">85,000원</span>
							</div>
							<div class="price-list">
								<span class="title">배송비</span> <span class="price free">무료</span>
							</div>
							<div class="price-list">
								<span class="title"><b>총합</b></span> <span class="price"><b>85,000원</b></span>
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
									<label for="sameAsBuyer" class="check-box__Label-sc-1p7znud-3"><span
										class="check-box__Text-sc-1p7znud-4">주문고객과 동일</span></label>
									<div class="check-box__CheckBoxContainer-sc-1p7znud-6">
										<input type="checkbox"
											class="check-box__InputCheckBox-sc-1p7znud-5"
											id="sameAsBuyer" name="sameAsBuyer" checked="" /><label
											for="sameAsBuyer"></label>
									</div>
								</div>
							</div>
							<!-- 나라 -->
							<div class="select-country__CountryWrap-sc">
								<label content="한국" height="45"
									class="select__Label-sc-1x3hzs7-0 "><select height="45"
									class="select__Select-sc-1x3hzs7-1 kPJRTF"
									name="shippingCountry">
										<option value="KR">한국</option>
								</select></label>
							</div>
							<div required="" class="input-text__InputTextWrap">
								<input placeholder="이름" error="0" align="left" padding="15"
									class="input-text__CustomText-sc-1ihjajs-1 kSCrfF"
									name="shippingName" value="" />
							</div>
							<div class="field-phone__PhoneWrap">
								<span class="field-phone__InputTextWrap">
									<div required=""
										class="input-text__InputTextWrap-sc-1ihjajs-0 ">
										<input type="tel" placeholder="전화번호 (-없이 입력)" error="0"
											align="left" padding="15"
											class="input-text__CustomText-sc-1ihjajs-1 kSCrfF"
											name="shippingPhone" value="" />
									</div>
								</span>
							</div>
							<div class="field-address__AddressSearch-sc-1oj7856-0 ">
								<div required="" class="input-text__InputTextWrap-sc-1ihjajs-0 ">
									<input placeholder="주소 찾기" readonly="" error="0" align="left"
										padding="15" name="shippingAddress1" value=""
										style="display: none" />
									<div class="field-address__CustomValue-sc-1oj7856-2 efjLkX">
										주소 찾기</div>
								</div>
								<div class="field-address__SearchIcon-sc-1oj7856-1 LwkbN">
									주소 찾기</div>
							</div>
							<div required="" class="input-text__InputTextWrap-sc-1ihjajs-0 ">
								<input placeholder="나머지 주소" error="0" align="left" padding="15"
									class="input-text__CustomText-sc-1ihjajs-1 kSCrfF"
									name="shippingAddress2" value="" />
							</div>
							<textarea maxlength="50"
								placeholder="배송 요청메시지가 있으시면 남겨주세요. (주소 작성란이 아닙니다.)"
								class="textarea__CustomTextArea-sc-1avhspc-0 "
								name="shippingMemo"></textarea>
							<p class="textarea__HelpMessages-sc-1avhspc-1 ">50자 이내로
								입력해주세요 (0 / 50)</p>
							<!-- 자동 저장 -->
							<div class="tab-new__CheckboxWrap ">
								<div
									class="
                      check-box__AreaCheckbox-sc-1p7znud-0
                      check-box__AreaLeftCheckbox-sc-1p7znud-2
                      gbMEDt
                      cwRylY
                    ">
									<div class="check-box__CheckBoxContainer ">
										<input type="checkbox" class="check-box__InputCheckBox "
											id="saveAddress" name="saveAddress" /><label
											for="saveAddress"></label>
									</div>
									<label for="saveAddress" class="check-box__Label"><span
										class="check-box__Text-sc-1p7znud-4">내 정보 및 기본 배송지로 저장</span></label>
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
								<div>85,000원</div>
							</li>
							<li class="pay-list-li">
								<div>배송비</div>
								<div>무료</div>
							</li>
							<li class="pay-list-li">
								<div>포인트</div>
								<div>
									<input type="tel" align="right" padding="15"
										class="input-text__CustomText-sc-1ihjajs-1" name="pointToUse"
										value="0">
								</div>
							</li>
							<li class="pay-list-li">
								<div>기프트카드</div>
								<div>
									<button type="button" class="pay-detail__Button">카드 조회</button>
								</div>
							</li>
							<li class="pay-list-li">
								<div>최종 결제금액</div>
								<div>85,000원</div>
							</li>
						</ul>
						<!-- 결제수단 선택 -->
						<div class="pay-select-wrap">
							<div class="pay-select-title">결제수단 선택</div>
							<div class="pay-methods__PayLabelWrap-sc-1k6buzz-1 ">
								<label for="kakaopay"
									class="pay-methods__PayLabel-sc-1k6buzz-2 pay-methods__LabelKakaopay-sc-1k6buzz-3  ">카카오페이
									<input id="kakaopay" type="radio" value="kakaopay" checked="">
								</label> <label for="creditcard"
									class="pay-methods__PayLabel-sc-1k6buzz-2 pay-methods__LabelCard-sc-1k6buzz-4  ">신용카드
									<input id="creditcard" type="radio" value="creditcard">
								</label>
							</div>
							<p
								class="pay-methods__Help-sc-1k6buzz-6 pay-methods__KakaopayHelp-sc-1k6buzz-7  ">
								<strong>카카오페이</strong>로 간편하고 안전하게 결제!
							</p>
						</div>
						<div
							class="check-box__AreaCheckbox check-box__AreaLeftCheckbox-sc-1p7znud-2  ">
							<div class="check-box__CheckBoxContainer-sc-1p7znud-6 cdrBpL">
								<input type="checkbox" required=""
									class="check-box__InputCheckBox-sc-1p7znud-5 fcEqTp"
									id="agree1" name="agree1"><label for="agree1"></label>
							</div>
							<label for="agree1" class="check-box__Label-sc-1p7znud-3 "><span
								class="check-box__Text-sc-1p7znud-4 ccvlHl">상품 주문 및 배송정보
									수집에 동의합니다</span><span class="check-box__Required-sc-1p7znud-7 hwvnDj">[필수]</span></label>
						</div>
						<div class="check-box__AreaCheckboxcheck-box__AreaLeftCheckbox">
							<div class="check-box__CheckBoxContainer">
								<input type="checkbox" required=""
									class="check-box__InputCheckBox" id="agree2" name="agree2"><label
									for="agree2"></label>
							</div>
							<label for="agree2" class="check-box__Label"><span
								class="check-box__Text">주문 상품의 명시내용과 사용조건을 확인하였으며, 취소환불
									규정에 동의합니다</span><span class="check-box__Required">[필수]</span></label>
						</div>
						<div class="pay-buttont-wrap"></div>
						<div class="pay-notice-wrap"></div>
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
</body>
</html>