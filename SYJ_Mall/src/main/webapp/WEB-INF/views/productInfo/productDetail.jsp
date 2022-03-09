<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/mainasset.jsp" %>		
		
<style>

/* 대표 이미지 슬라이더 */
.product-detail-wrap .swiper {
  min-height: 225px;
  position: relative;
  cursor: pointer;
}

.product-detail-wrap .swiper-slide {
  text-align: center;
  font-size: 18px;
  background: #fff;
  /* Center slide text vertically */
  display: -webkit-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  -webkit-justify-content: center;
  justify-content: center;
  -webkit-box-align: center;
  -ms-flex-align: center;
  -webkit-align-items: center;
  align-items: center;
}

.product-detail-wrap .swiper-slide img {
  max-height: 400px;
  width: 400px;
  position: relative;
}

.swiper-pagination .swiper-pagination-bullet {
  background: #e0e0e0;
}

/* 컨텐츠 헤더 */
.detail-header {
  display: flex;
  /* justify-content: center; */
  /* align-items: center; */
  flex-direction: column;
  margin: 25px 20px 0px;
}

.product-title {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  font-weight: bold;
}

.product-name {
  font-size: 30px;
  /* max-width: 250px; */
}

.share {
  width: 40px;
  height: 40px;
  background-image: url(/SYJ_Mall/resources/images/product-detail/btn_share.png);
  background-size: cover;
}

.product-pric {
  font-size: 14px;
}

.product-review {
  display: flex;
  /* justify-content: center; */
  align-items: center;
  margin-top: 10px;
}
.review-star {
  display: inline-block;
  width: 14px;
  height: 14px;
  background-image: url(/SYJ_Mall/resources/images/product-detail/star_on.png);
  background-size: cover;
  margin-right: 3px;
}

.review-star.off {
  background-image: url(/SYJ_Mall/resources/images/product-detail/star_off.png);
}

.review-count {
  margin-left: 6px;
}

/* 컨텐츠 */
.detail-content {
}

.detaul-content-title {
  font-size: 24px;
  font-weight: bold;
  margin: 50px 20px 30px;
}

.detaul-content-text {
  font-weight: 400;
  margin: 50px 20px 30px;
  font-size: 18px;
}

.detaul-content-image {
  width: 100%;
}

/* 상품 아래 하단 버튼 */
.detail-etc {
  display: flex;
  flex-direction: column;
}

.detail-etc button {
  display: flex;
  align-items: center;
  justify-content: space-between;
  /* width: 640px; */
  height: 80px;
  padding: 0px 20px;
  border-top: 1px solid rgb(227, 229, 232);
}

.detail-etc button div {
  font-size: 18px;
  font-weight: bold;
}

.detail-etc button .sub-title {
  font-size: 15px;
  font-weight: 400;
  margin-left: 15px;
  color: rgb(154, 154, 158);
}

.detail-etc button .drop-down-icon {
  width: 18px;
  height: 18px;
  background-image: url(/SYJ_Mall/resources/images/main/down-arrow.png);
  background-size: cover;
}

.detail-etc button.active .drop-down-icon {
  transform: rotate(180deg);
}

.detail-etc button .inquiry {
  font-size: 15px;
  font-weight: 400;
}

.detail-etc button .inquiry::before {
  content: "";
  display: inline-block;
  vertical-align: middle;
  width: 20px;
  height: 20px;
  margin-right: 5px;
  background-image: url(/SYJ_Mall/resources/images/product-detail/ico-talk-gry.png);
  background-size: cover;
}

hr.division {
  height: 10px;
  width: 100%;
  border: none;
  border-top: 1px solid rgb(227, 229, 232);
  background-color: rgb(247, 247, 247);
}

/* 세부정보 탭 */
.detail-etc .detail-contents {
  display: none;
  font-size: 15px;
  padding: 0px 20px 50px;
  line-height: 24px;
  letter-spacing: -0.2px;
  color: rgb(51, 51, 51);
  position: relative;
}

.detail-etc .detail-contents ul li {
  position: relative;
  padding-left: 8px;
}

.detail-etc .detail-contents ul li::before {
  position: absolute;
  left: 0px;
  content: "";
  width: 2.5px;
  height: 2.5px;
  background-color: rgb(51, 51, 51);
  border-radius: 50%;
  top: 10px;
}

/* 배송 반품 탭 */
.detail-etc .delivery-detail-wrap {
  display: none;
}

.detail-etc .delivery-tab {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 40px;
  margin-bottom: 0px;
  margin-top: 40px;
  padding: 0px;
  cursor: pointer;
}

.detail-etc .delivery-tab .delivery-tab-btn {
  flex: 1 1 0%;
  font-size: 15px;
  line-height: 15px;
  text-align: center;
  height: 30px;
  margin: 0 20px;
  color: rgb(154, 154, 154);
  border-bottom: 1px solid rgb(227, 229, 232);
}

.detail-etc .delivery-tab .delivery-tab-btn.active {
  color: rgb(0, 0, 0);
  border-bottom: 1px solid rgb(60, 64, 75);
}

.detail-etc .delivery-contents {
  display: none;
  font-size: 15px;
  padding: 0px 20px 50px;
  line-height: 24px;
  letter-spacing: -0.2px;
  color: rgb(51, 51, 51);
  position: relative;
}

.detail-etc .delivery-contents.active {
  display: block;
}

.detail-etc .delivery-contents ul li {
  position: relative;
  padding-left: 8px;
}

.detail-etc .delivery-contents span {
  display: inline-block;
  font-size: 15px;
  line-height: 24px;
  letter-spacing: -0.2px;
  margin-top: 20px;
  font-weight: bold;
}

.detail-etc .delivery-contents ul li::before {
  position: absolute;
  left: 0px;
  content: "";
  width: 2.5px;
  height: 2.5px;
  background-color: rgb(51, 51, 51);
  border-radius: 50%;
  top: 10px;
}

/* 리뷰 */

.detail-review {
  display: flex;
  flex-direction: column;
  padding: 35px 20px 40px;
}

.review-total {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.review-total .title {
  font-size: 24px;
  font-weight: bold;
}

.review-total .review-point {
  font-size: 14px;
  margin-left: 10px;
}

.review-total .review-point::after {
  content: "";
  display: inline-block;
  width: 1px;
  height: 10px;
  margin: 0 5px;
  background-color: rgb(233, 233, 233);
}

.review-total .review-perpect {
  color: rgb(154, 154, 158);
}

.review-text {
  /* border: rgb(154, 154, 158); */
  margin-top: 10px;
}

.review-text textarea {
  width: 100%;
  height: 100px;
  border: 1px solid rgb(233, 233, 233);
  color: #666;
  font-size: 13px;
  font-weight: normal;
  outline-style: none;
  padding: 10px;
  box-sizing: border-box;
  resize: none;
}

.review-text textarea::placeholder {
  color: #cacaca;
}

.review-text textarea:disabled {
  background-color: #f7f7f7;
  border: 1px solid rgb(233, 233, 233);
}

.review-button button {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 50px;
  margin: 16px 0px 0px;
  padding-right: 10px;
  font-size: 16px;
  background-color: rgb(60, 64, 75);
  color: rgb(255, 255, 255);
}

.review-button .review-icon {
  display: inline-block;
  width: 20px;
  height: 20px;
  margin-right: 7px;
  vertical-align: middle;
  background-image: url(/SYJ_Mall/resources/images/product-detail/review_pen.png);
  background-size: cover;
}

.review-list {
  margin-top: 40px;
}

/* 리뷰 정렬 */
.review-sort {
  margin-bottom: 20px;
}

.review-sort .sort-btn {
  width: 64px;
  height: 30px;
  margin-right: 6px;
  font-size: 13px;
  border: 1px solid rgb(228, 228, 228);
  color: rgb(128, 128, 128);
  background: none;
  border-radius: 20px;
}

.review-sort .sort-btn.recent {
  background-color: rgb(141, 146, 161);
  color: #fff;
}

/* 리뷰 리스트 아이템 */
.review-item {
  display: flex;
  flex-direction: column;
  height: auto;
  padding: 30px 0;
  border-top: 1px solid rgb(233, 233, 233);
}

.review-item .name {
  font-size: 17px;
  font-weight: bold;
}

.review-item .star {
  font-size: 17px;
  font-weight: bold;
  margin: 5px 0;
}

.review-item .star .date {
  font-size: 13px;
  color: rgb(154, 154, 158);
  margin-left: 10px;
  font-weight: 400;
}

.review-item .star .date {
  font-size: 13px;
  color: rgb(154, 154, 158);
  margin-left: 10px;
  font-weight: 400;
}

.review-item .star .contents {
  font-size: 15px;
  word-break: break-all;
}

.review-item .contents {
  font-size: 15px;
  font-weight: 400;
  word-break: break-all;
}
.review-item .like button {
  height: 25px;
  font-size: 14px;
  font-weight: 400;
  color: rgb(154, 154, 158);
  text-align: left;
  margin-top: 15px;
  padding-left: 30px;
  background-image: url(/SYJ_Mall/resources/images/product-detail/ryan_gray.png);
  background-size: contain;
  background-repeat: no-repeat;
  background-position: 0px center;
}

.pagination {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 30px;
  font-size: 15px;
  font-weight: bold;
  text-decoration: underline;
  line-height: 1.5;
}

/* 추천 상품 */
.detail-recommended {
  padding: 31px 20px 0px;
}

.detail-recommended .title {
  font-size: 22px;
  margin-bottom: 20px;
  font-weight: bold;
  line-height: 1.2;
}

.detail-recommended ul {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}

.detail-recommended .item-li {
  max-width: 160px;
  min-height: 280px;
  max-height: 280px;
}

.detail-recommended .item-li .thumbnail {
  position: relative;
  width: 160px;
  height: 160px;
  background-image: url(/SYJ_Mall/resources/images/product-detail/20210622180643348_8809721509975_AW_00.jpg);
  background-size: contain;
}

.detail-recommended .item-li .thumbnail::after {
  position: absolute;
  inset: 0px;
  background: rgba(0, 0, 0, 0.02);
  content: "";
  width: 100%;
  z-index: 0;
  padding-top: 100%;
}

.detail-recommended .item-li .name {
  display: flex;
  justify-content: space-between;
  font-size: 16px;
  color: #777777;
  font-weight: 400;
  margin: 15px 0 5px;
}

.detail-recommended .item-li .name .nametext {
  display: -webkit-box;
  word-wrap: break-word;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
  text-overflow: ellipsis;
}

.detail-recommended .item-li .name .cart {
  flex-shrink: 0;
  display: inline-block;
  width: 24px;
  height: 24px;
  background-image: url(/SYJ_Mall/resources/images/product-detail/Small_30_off.png);
  background-size: contain;
  background-repeat: no-repeat;
}

#prodt_cart_on {
	display : none;
}

.detail-recommended .item-li .price {
  font-size: 16px;
  font-weight: bold;
}

/* 최근 조회 상품 */
.detail-recently-viewed {
  padding: 31px 20px 0px;
  border-top: 1px solid rgb(227, 229, 232);
  margin-top: 40px;
}

.detail-recently-viewed .title {
  font-size: 22px;
  margin-bottom: 20px;
  font-weight: bold;
  line-height: 1.2;
}

.detail-recently-viewed ul {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}

.detail-recently-viewed .item-li {
  max-width: 160px;
  min-height: 280px;
  max-height: 280px;
}

.detail-recently-viewed .item-li .thumbnail {
  position: relative;
  width: 160px;
  height: 160px;
  background-image: url(/SYJ_Mall/resources/images/product-detail/20210622180615640_8809814920519_8809814920519_AW_00.jpg);
  background-size: contain;
}

.detail-recently-viewed .item-li .thumbnail::after {
  position: absolute;
  inset: 0px;
  background: rgba(0, 0, 0, 0.02);
  content: "";
  width: 100%;
  z-index: 0;
  padding-top: 100%;
}

.detail-recently-viewed .item-li .name {
  display: flex;
  justify-content: space-between;
  font-size: 16px;
  color: #777777;
  font-weight: 400;
  margin: 15px 0 5px;
}

.detail-recently-viewed .item-li .name .nametext {
  display: -webkit-box;
  word-wrap: break-word;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
  text-overflow: ellipsis;
}

.detail-recently-viewed .item-li .name .cart {
  flex-shrink: 0;
  display: inline-block;
  width: 24px;
  height: 24px;
  background-image: url(/SYJ_Mall/resources/images/product-detail/Small_30_off.png);
  background-size: contain;
  background-repeat: no-repeat;
}

.detail-recently-viewed .item-li .price {
  font-size: 16px;
  font-weight: bold;
}

/* 하단 버튼 */
.bottom-bar {
  cursor : pointer;
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
}

.add-to-cart {
  color: #fff;
  font-size: 18px;
  position: absolute;
  right: 0;
  width: 80px;
  height: 80px;
  background-image: url(/SYJ_Mall/resources/images/product-detail/ico_cart_off.png);
  background-size: 30%;
  background-repeat: no-repeat;
  background-position: center center;
}

.remove-to-cart {
  color: #fff;
  font-size: 18px;
  position: absolute;
  right: 0;
  width: 80px;
  height: 80px;
  background-image: url(/SYJ_Mall/resources/images/product-detail/ico_cart_on.png);
  background-size: 30%;
  background-repeat: no-repeat;
  background-position: center center;
}



/*  모달 작업 */
/* 모달창 배경 검정색 레이어드 화면 */
.overlay-wrap {
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 2;
  position: fixed;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.7);
  transition: all ease-in 0.3s;
}

/* 구매 옵션 모달창 */
.option-modal-wrap {
  position: absolute;
  position: fixed;
  height: auto;
  background-color: rgb(255, 255, 255);
  box-sizing: border-box;
  padding: 0px 20px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  bottom: 80px;
  width: 100%;
  max-width: 640px;
  height: 70px;
}

.option-modal-wrap .select-box select {
  border: 1px solid rgb(227, 229, 232);
  width: 80px;
  height: 36px;
  text-indent: 10px;
}

.option-modal-wrap .price-text {
  font-size: 22px;
  font-weight: bold;
}

#product_top_image{
	height: 400px;
}

@media (min-width: 640px) {
	
	#product_top_image{
		height: 638px;
	}
}


.product-price {
	font-size: 16px;
	font-weight: bold;
}
.product-price-discount {
	text-decoration: line-through;
	color: #9A9A9E;
	font-size: 16px;
	font-weight: bold;
}

.product-price-postdiscount {
	color: #FF447F;
	font-size: 16px;
	font-weight: bold;
}


</style>


<div class="container-wrap product-detail-wrap">
                    <!-- 대표 이미지 -->
                    <!-- <div class="main-image"></div> -->
                    <!-- 배너 슬라이드 작업  -->
                    <div class="swiper mySwiper" id="product_top_image" style="margin-top:50px;">
                        <div class="swiper-wrapper">
                            <c:forEach var="headImgUrls" items="${headImgUrls}">
                            	<div class="swiper-slide" style="background-image : url(${headImgUrls}); background-size: cover; background-position: center; background-repeat: no-repeat;"></div>
                            </c:forEach>    
                        </div>
                        <div class="swiper-pagination"></div>
                    </div>
                    <!-- 상품 주요 정보 -->
                    <div class="detail-header">
                        <div class="product-title">
							<div class="product-name">
                            	${prodtInfo.prodNm}
                            </div>
                            <button class="share"></span>
                        </div>
                        <c:if test="${prodtInfo.discRate eq 0}">
                        	<div class="product-price">
                            	${prodtInfo.prodPrice}원
                        	</div>
                        </c:if>
                        <c:if test="${prodtInfo.discRate ne 0}">
                        	<div class="product-price-postdiscount">
                            	${prodtInfo.discRate}% ${prodtInfo.dcPrice}원
                        	</div>
                        	<div class="product-price-discount">
                            	${prodtInfo.prodPrice}원
                        	</div>
                        </c:if>
                        <div class="product-review">
                       		<c:forEach var="i" begin="1" end="${prodtInfo.prodStars}">
                       			<span class="review-star"></span>
                       		</c:forEach>
                            <c:forEach var="i" begin="1" end="${prodtInfo.prodStarsRemain}">
                       			<span class="review-star off"></span>
                       		</c:forEach>
                            
                       
                            <span class="review-count">(${prodtInfo.prodBuyCnt})</span>
                        </div>
                    </div>
                    <!-- 상품 상세 이미지 -->
                    <div class="detail-content">
                        <div class="detaul-content-title">
                            시크릿 포레스트의 사고뭉치<br>
                            다섯 복숭아, 피치파이브!
                        </div>
                        <img src="./../images/product-detail/20210803160153497_peachfiv_러피치.jpg"
                            class="detaul-content-image">
                        <div class="detaul-content-text">
                            순수한 매력과 초절정의 귀여움이 넘치는 사랑스러운 러피치!<br>
                            항상 몰려다니기를 좋아하는 신비한 세쌍둥이 털복숭아 퍼피치가 함께 등장 했어요.
                        </div>
                        <img src="./../images/product-detail/20210622211801186_8809721509937_BW_00.jpg"
                            class="detaul-content-image">
                        <img src="./../images/product-detail/20210622211807615_8809721509937_BW_02.jpg"
                            class="detaul-content-image">
                        <div class="detaul-content-text">
                            달콤한 복숭아 안에 퍼.피.치가 쏙!<br>
                            복숭아 안의 퍼피치는 분리될 수 있답니다.
                        </div>
                        <img src="./../images/product-detail/20210622211813042_8809721509937_BW_03.jpg"
                            class="detaul-content-image">
                        <img src="./../images/product-detail/20210622211821956_8809721509937_BW_05.jpg"
                            class="detaul-content-image">
                        <img src="./../images/product-detail/20210622211825936_8809721509937_BW_06.jpg"
                            class="detaul-content-image">
                        <img src="./../images/product-detail/20210622211831716_8809721509937_BW_08.jpg"
                            class="detaul-content-image">
                        <div class="detaul-content-text">
                            말랑말랑 귀여운 퍼피치와 복숭아가 떼구르르~
                        </div>
                        <img src="./../images/product-detail/20210622211835912_8809721509937_BW_09.jpg"
                            class="detaul-content-image">
                        <img src="./../images/product-detail/20210802154818202_8809721509937_BW_00.jpg"
                            class="detaul-content-image">
                        <img src="./../images/product-detail/20210802154818270_8809721509937_BW_01.jpg"
                            class="detaul-content-image">
                        <img src="./../images/product-detail/20210802154818276_8809721509937_BW_02.jpg"
                            class="detaul-content-image">
                        <img src="./../images/product-detail/20210802154818371_8809721509937_BW_03.jpg"
                            class="detaul-content-image">
                        <img src="./../images/product-detail/20210802154818433_8809721509937_BW_04.jpg"
                            class="detaul-content-image">
                        <img src="./../images/product-detail/20210802154818523_8809721509937_BW_05.jpg"
                            class="detaul-content-image">
                        <img src="./../images/product-detail/20210802154818653_8809721509937_BW_06.jpg"
                            class="detaul-content-image">
                        <img src="./../images/product-detail/20210802170327762_210719_CP_plush_toy_M.jpg"
                            class="detaul-content-image">
                    </div>
                    <!-- 상품 아래 하단 버튼 -->
                    <div class="detail-etc">
                        <button class="detail-btn">
                            <div>세부정보</div>
                            <div class="drop-down-icon"></div>
                        </button>
                        <div class="detail-contents">
                            <ul>
                                <li>품명 및 모델명 : 라이언과 춘식이의 만년달력 8809814921707
                                </li>
                                <li>법에 의한 인증, 허가 등을 받았음을 확인할 수 있는 경우 그에 대한 사항 : 해당없음
                                </li>
                                <li>제조국 또는 원산지 : 중국
                                </li>
                                <li>제조자, 수입품의 경우 수입자를 함께 표기 : ㈜클로스업
                                </li>
                                <li>품질보증 기준 : 본 제품은 공정거래위원회 고시 소비자 분쟁해결기준에 의거 교환 및 보상을 받으실 수 있습니다.
                                </li>
                                <li>A/S 책임자와 전화번호 또는 소비자상담 관련 전화번호 : 카카오프렌즈 고객센터 1577-6263
                                </li>
                            </ul>
                        </div>
                        <button class="delivery-btn">
                            <div>배송·반품<span class="sub-title">국내배송만 가능한 상품입니다</span></div>
                            <div class="drop-down-icon"></div>
                        </button>

                        <div class="delivery-detail-wrap">
                            <div class="delivery-tab">
                                <div class="delivery-tab-btn active" data-tab="tab-1">국내 배송</div>
                                <div class="delivery-tab-btn" data-tab="tab-2">글로벌 배송</div>
                            </div>
                            <div id="tab-1" class="delivery-contents active">
                                <span>배송</span>
                                <ul>
                                    <li>배송사 : CJ대한통운</li>
                                    <li>배송비 : 국내 3,000원 (3만 원 이상 구매 시 무료배송)</li>
                                    <li>오후 3시 이전 결제 완료 주문건은 당일 출고, 오후 3시 이후 주문 건은 익일 출고됩니다.</li>
                                    <li>출고 이후 영업일 기준 평균 3일 이내 제품을 수령하실 수 있습니다.</li>
                                    <li>단, 제품의 재고 상황, 배송량, 배송 지역에 따라 배송기일이 추가로 소요될 수 있는 점 양해 부탁드립니다</li>
                                    <li>주문취소 및 배송지 변경은 “주문접수” 단계에서만 가능합니다. 마이페이지에서 취소·변경하실 수 있습니다.</li>
                                </ul>
                                <span>취소·교환·반품</span>
                                <ul>
                                    <li>주문취소 및 배송지 변경은 “주문접수” 단계에서만 가능합니다. 마이페이지에서 취소·변경하실 수 있습니다.</li>
                                    <li>교환·반품은 배송완료 후 7일 이내만 가능합니다. 단, 재화 등의 내용이 표시, 광고 내용과 다르거나 계약내용을 다르게 이행한 경우에는 재화
                                        등을
                                        공급받은 날로부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날로부터 30일 이내에 교환·반품이 가능합니다.</li>
                                    <li>상품의 불량·하자 및 표시광고 및 계약 내용이 다른 경우 해당 상품의 회수 비용은 무료이나, 고객님의 단순변심에 의한 교환·반품일 경우에는
                                        교환·반품
                                        배송비를 고객님께서 직접 부담하셔야 합니다.</li>
                                    <li>상품 불량·하자의 경우, 상품 불량을 증명할 수 있는 사진과 함께 마이페이지 1:1 문의로 접수해주시면 확인 뒤 교환·반품이 진행됩니다.
                                    </li>
                                    <li>여러 상품을 함께 주문 시 2개 이상의 택배 박스로 분할 출고 될 수 있으며, 단순변심에 의한 교환/반품 시 배송비는 송장 별로 발생됩니다.
                                    </li>
                                    <li>미성년자가 구매하는 경우, 법정대리인이 동의하지 않으면 미성년자 또는 법정대리인이 구매를 취소할 수 있습니다.</li>
                                </ul>
                                <span>교환·반품이 불가한 경우</span>
                                <ul>
                                    <li>이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우
                                    </li>
                                    <li>포장이 훼손되어 상품가치가 상실된 경우 (예: 택과 라벨이 훼손된 경우 등)
                                    </li>
                                    <li>이용자의 사용 또는 일부 소비에 의해 재화 등의 가치가 현저히 감소한 경우
                                    </li>
                                    <li>복제가 가능한 재화 등의 포장을 훼손한 경우
                                    </li>
                                    <li>시간 경과에 의해 재판매가 곤란할 정도로 상품의 가치가 현저히 감소한 경우
                                    </li>
                                    <li>고객의 주문에 따라 개별 생산되는 상품의 경우
                                    </li>
                                </ul>
                                <span>환불</span>
                                <ul>
                                    <li>주문취소 및 반품 시 환불은 주문 시 이용하신 결제수단으로 2~7 영업일 이내 환불됩니다.</li>
                                </ul>
                                <span>기타 문의</span>
                                <ul>
                                    <li>기타 교환 및 반품에 대한 문의는 1:1 문의하기 또는 1577-6263으로 문의해주세요.
                                    </li>
                                </ul>
                            </div>
                            <div id="tab-2" class=" delivery-contents">
                                <span>배송</span>
                                <ul>
                                    <li>배송사 : EMS</li>
                                    <li>배송비 : EMS 요금 적용 (국가별 배송비는 글로벌 배송 안내페이지를 참고해주세요)</li>
                                    <li>배송기간 : 주문일로부터 1~3일 이내 출고</li>
                                    <li> 단, 상품의 재고상황, 배송량에 따라 배송기일이 추가 소요될 수 있는 점 양해 부탁드립니다..</li>
                                    <li>단, 제품의 재고 상황, 배송량, 배송 지역에 따라 배송기일이 추가로 소요될 수 있는 점 양해 부탁드립니다</li>
                                    <li>주문취소 및 배송지 변경은 “주문접수” 단계에서만 가능합니다. 마이페이지에서 취소·변경하실 수 있습니다.</li>
                                </ul>
                                <span>취소·교환·반품</span>
                                <ul>
                                    <li>주문취소 및 배송지 변경은 “주문접수” 단계에서만 가능합니다. 마이페이지에서 취소·변경하실 수 있습니다.</li>
                                    <li>글로벌 배송 구매 시, 단순 변심에 의한 교환 및 반품이 불가합니다.</li>
                                </ul>
                                <span>통관·관세</span>
                                <ul>
                                    <li>국가 세관 규정에 따르면, 배송 과정에서 나라별로 관세가 발생할 수 있으며 관세는 고객 부담입니다. 상세 문의사항은 가까운 우체국이나 세관 또는
                                        거주하시는 국가의 우체국에 문의바랍니다.</li>
                                    <li>배송 국가별 금지· 제한 품목을 주문 전 확인 바랍니다.</li>
                                </ul>
                                <span>기타 문의</span>
                                <ul>
                                    <li>기타 문의사항은 1:1 문의하기 또는 global@kakaofriends.com 으로 문의해주세요.</li>
                                </ul>
                            </div>
                        </div>
                        <button>
                            <div>실시간 문의</div>
                            <div class="inquiry">상담하기</div>
                        </button>
                        <hr class="division">
                    </div>
                    <!-- 리뷰 -->
                    <div class="detail-review">
                        <div class="review-total">
                            <div class="title">리뷰 4개</div>
                            <div class="product-review">
                                <span class="review-star"></span>
                                <span class="review-star"></span>
                                <span class="review-star"></span>
                                <span class="review-star"></span>
                                <span class="review-star off"></span>
                                <span class="review-point">5</span>
                                <span class="review-perpect">5.0</span>
                            </div>
                        </div>
                        <div class="review-text">
                            <!-- 로그인 전 사용자 표시 -->
                            <!-- <textarea disabled placeholder="로그인 후 리뷰 작성이 가능합니다."></textarea> -->
                            <!-- 로그인 후 구매하지 않은 사용자 표시 -->
                            <textarea disabled placeholder="상품을 구매 후 리뷰 작성이 가능합니다."></textarea>
                            <!-- 로그인 후 실 구매 사용자 표시 -->
                            <!-- <textarea  placeholder="최소 10자 이상 입력해주세요."></textarea> -->
                        </div>
                        <div class="review-button">
                            <button>
                                <span class="review-icon"></span>
                                <span>리뷰를 남겨주세요</span>
                            </button>
                        </div>
                        <div class="review-list">
                            <div class="review-sort">
                                <button class="sort-btn like">좋아요순</button>
                                <button class="sort-btn recent">최신순</button>
                            </div>
                            <ul>
                                <li class="review-item">
                                    <div class="name">한*창</div>
                                    <div class="star">
                                        <span class="review-star"></span>
                                        <span class="review-star"></span>
                                        <span class="review-star"></span>
                                        <span class="review-star"></span>
                                        <span class="review-star"></span>
                                        <span class="date">2021.08.14</span>
                                    </div>
                                    <div class="contents">
                                        전 시간낭비에 타고난 재능이 있습니다. 이런 제가 낭비를 하지 않았습니다. 긴말하지 않겠습니다.
                                    </div>
                                    <div class="like">
                                        <button>좋아요 1명</button>
                                    </div>

                                </li>
                                <li class="review-item">
                                    <div class="name">손*린</div>
                                    <div class="star">
                                        <span class="review-star"></span>
                                        <span class="review-star"></span>
                                        <span class="review-star"></span>
                                        <span class="review-star"></span>
                                        <span class="review-star"></span>
                                        <span class="date">2021.08.11</span>
                                    </div>
                                    <div class="contents">
                                        어피치를 좋아한다면 빚을 내서라도 사십시오<br>
                                        너무 귀여우니까 다시 한번 말합니다<br>
                                        빚을 내서라도 사십시오
                                    </div>
                                    <div class="like">
                                        <button>좋아요 4명</button>
                                    </div>

                                </li>
                            </ul>
                            <div class="pagination">
                                <div class="pagination-left-arrow"></div>
                                <div class="pagination-page">1</div>
                                <div class="pagination-right-arrow"></div>
                            </div>

                        </div>
                    </div>
                    <hr class="division">
                    <!-- 추천 상품 -->
                    <div class="detail-recommended">
                        <div class="title">잠깐만,<br>이 상품은 어때요?</div>
                        <ul>
                            <li class="item-li">
                                <div class="thumbnail"></div>
                                <div class="name">
                                    <div class="nametext">피치파이브 미니키체인_치</div>
                                    <span class="cart"></span>
                                </div>
                                <div class="price">10,000원</div>
                            </li>
                            <li class="item-li">
                                <div class="thumbnail"></div>
                                <div class="name">
                                    <div class="nametext">피치파이브 미니키체인_치</div>
                                    <span class="cart"></span>
                                </div>
                                <div class="price">10,000원</div>
                            </li>
                            <li class="item-li">
                                <div class="thumbnail"></div>
                                <div class="name">
                                    <div class="nametext">피치파이브 미니키체인_치</div>
                                    <span class="cart"></span>
                                </div>
                                <div class="price">10,000원</div>
                            </li>
                            <li class="item-li">
                                <div class="thumbnail"></div>
                                <div class="name">
                                    <div class="nametext">피치파이브 미니키체인_치</div>
                                    <span class="cart"></span>
                                </div>
                                <div class="price">10,000원</div>
                            </li>
                        </ul>
                    </div>
                    <!-- 최근 조회 상품 -->
                    <div class="detail-recently-viewed">
                        <div class="title">최근 본 상품이<br>요기 있네</div>
                        <ul>
                            <li class="item-li">
                                <div class="thumbnail"></div>
                                <div class="name">
                                    <div class="nametext">피치파이브 페이스인형_피</div>
                                    <span class="cart"></span>
                                </div>
                                <div class="price">15,000원</div>
                            </li>
                            <li class="item-li">
                                <div class="thumbnail"></div>
                                <div class="name">
                                    <div class="nametext">피치파이브 페이스인형_피</div>
                                    <span class="cart"></span>
                                </div>
                                <div class="price">15,000원</div>
                            </li>
                        </ul>
                    </div>
                    
                    <!-- 하단 바로구매 고정 버튼 -->
                    <div class="bottom-bar">
                        <button class="direct-purchase">구매하기</button>
                       <!--  <button class="add-to-cart" id="prodt_cart_on"></button> -->
                        <button class="remove-to-cart" id="prodt_cart_on"></button>
                    </div>
                </div>
               
				<div id="kakao-footer" style="height: 230px;">
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
		
		
		
                
<script>

        // 신규 슬라이드 관련
        var swiper = new Swiper(".mySwiper", {
            scrollbar: {
                el: '.swiper-scrollbar',
                draggable: false,
            },
            autoplay: {
                delay: 3000,
                disableOnInteraction: false,
            },
            pagination: {
                el: ".swiper-pagination",
            },
        });


        // 세부 정보 및 배송 관련 탭
        $(document).ready(function () {

            $('.delivery-tab .delivery-tab-btn').click(function () {
                var tab_id = $(this).attr('data-tab');

                $('.delivery-tab .delivery-tab-btn').removeClass('active');
                $('.delivery-contents').removeClass('active');

                $(this).addClass('active');
                $("#" + tab_id).addClass('active');
            })

            $('.detail-etc .detail-btn').click(function () {
                // 세부 정보
                if ($('.detail-etc  .detail-contents').css('display') == 'block') {
                    $('.detail-etc .detail-btn').removeClass('active');
                    $('.detail-etc  .detail-contents').css('display', 'none');
                } else {
                    $('.detail-etc .detail-btn').addClass('active');
                    $('.detail-etc  .detail-contents').css('display', 'block');
                }
            })

            $('.detail-etc .delivery-btn').click(function () {
                // 배송 반품 버튼
                if ($('.detail-etc  .delivery-detail-wrap').css('display') == 'block') {
                    $('.detail-etc .delivery-btn').removeClass('active');
                    $('.detail-etc  .delivery-detail-wrap').css('display', 'none');
                } else {
                    $('.detail-etc .delivery-btn').addClass('active');
                    $('.detail-etc  .delivery-detail-wrap').css('display', 'block');
                }
            })
			
            let buy_btn_tn = -1;
            
            // 구매하기 클릭 시 팝업창
            $(".bottom-bar").click(function () { 
            	$(".bottom-bar").css("z-index",11);
            	$(".direct-purchase").text("즉시 구매하기");
				$("#testmodal1").css("visibility", "visible");
                $(".option-modal-wrap").css("bottom", "80px;");
                $(document.body).css("overflow", "hidden");
            });


            //모달 제거하는 용도
            $(".overlay-wrap-up").click(function () {
                $(".overlay-wrap-up").css("visibility", "hidden");
                $(".option-modal-wrap").css("bottom", "80px");
                $(document.body).css("overflow", "visible");
                $(".direct-purchase").text("구매하기");
            });
            
            //개수 선택할 경우
            $(".option-modal-wrap").click(function(){
            	
            	return false;
            });
			
            //select 의 값이 변하는 경우
			$("#product_buy_cnt").on("change",function(){
				console.log(this.value);	
			});
            

        })
    </script>
                
                