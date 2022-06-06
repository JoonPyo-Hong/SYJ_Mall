<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/mainasset.jsp" %>		

<c:set var="path" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${path}/resources/js/commonjs/commonLogin.js"></script>		
<script type="text/javascript" src="${path}/resources/js/commonjs/commonBasketAlarm.js"></script>	
<script type="text/javascript" src="${path}/resources/js/commonjs/commonLike.js"></script>		

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

#review_star .review-star:hover{
	cursor : pointer;
}

#review_star .review-star off:hover{
	cursor : pointer;
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

.review-item-ul {
  padding-left: 0px;
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

.review-item .like {
  display: flex;
  align-items: center;
  /* justify-content: center; */
  margin-top: 15px;
  cursor: pointer;
}

.review-item .like .heart {
  display: inline-block;
  width: 32px;
  height: 32px;
  background-image: url(/SYJ_Mall/resources/images/product-detail/ico_friends_new.png);
  background-size: 700px 700px;
  background-position: 0 -400px;
}

.review-item .like .heart.check {
  background-position: -40px -400px;
}

.review-item .like button {
  font-size: 14px;
  color: rgb(154, 154, 158);
  text-align: left;
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

/* 리뷰 더보기 */
div.theme-more-view:hover{
	cursor : pointer;
}

div.theme-more-view {
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 auto;
	width: 340px;
	height: 50px;
	line-height: 50px;
	border-radius: 4px;
	border-width: 1px;
	color: rgb(30, 30, 30);
	font-size: 15px;
	font-weight: normal;
	background: rgb(255, 255, 255);
	border: 1px solid rgb(230, 230, 230);
	box-sizing: border-box;
}

div.theme-more-view::after {
	content: "";
	display: inline-block;
	width: 13px;
	height: 13px;
	margin-top: -4px;
	margin-left: 2px;
	background-size: 13px;
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
  padding-left: 0px;/* 수정사항 */
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
  background-repeat : no-repeat;
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

.detail-recommended .item-li .name .incart {
  flex-shrink: 0;
  display: inline-block;
  width: 24px;
  height: 24px;
  background-image: url(/SYJ_Mall/resources/images/product-detail/Small_30_on.png);
  background-size: contain;
  background-repeat: no-repeat;
}

.detail-recommended .item-li .name .alarm {
  flex-shrink: 0;
  display: inline-block;
  width: 24px;
  height: 24px;
  background-image: url(/SYJ_Mall/resources/images/product-detail/ico-notification-empty-24.png);
  background-size: contain;
  background-repeat: no-repeat;
}

.detail-recommended .item-li .name .inalarm {
  flex-shrink: 0;
  display: inline-block;
  width: 24px;
  height: 24px;
  background-image: url(/SYJ_Mall/resources/images/product-detail/ico-notification-solid-24.png);
  background-size: contain;
  background-repeat: no-repeat;
}


.soldout-label {
	
	width: 61px;
  	height: 22px;
  	position: absolute;
  	top: 12px;
  	left: 12px;
  	background-image: url(/SYJ_Mall/resources/images/product-detail/tag-soldout.png);
  	background-size: contain;

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
  padding-left: 0px;/* 수정함 */
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
  background-repeat : no-repeat;
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

.detail-recently-viewed .item-li .name .incart {
  flex-shrink: 0;
  display: inline-block;
  width: 24px;
  height: 24px;
  background-image: url(/SYJ_Mall/resources/images/product-detail/Small_30_on.png);
  background-size: contain;
  background-repeat: no-repeat;
}

.detail-recently-viewed .item-li .name .alarm {
  flex-shrink: 0;
  display: inline-block;
  width: 24px;
  height: 24px;
  background-image: url(/SYJ_Mall/resources/images/product-detail/ico-notification-empty-24.png);
  background-size: contain;
  background-repeat: no-repeat;
}

.detail-recently-viewed .item-li .name .inalarm {
  flex-shrink: 0;
  display: inline-block;
  width: 24px;
  height: 24px;
  background-image: url(/SYJ_Mall/resources/images/product-detail/ico-notification-solid-24.png);
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

.bottom-bar-alarm {
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

.direct-alarm {
	color: #fff;
  	font-size: 18px;
}


#plus_cart {
  color: #fff;
  font-size: 18px;
  position: absolute;
  width: 30px;
  height: 25px;
  background-image: url(/SYJ_Mall/resources/images/product-detail/ico_friends.png); 
  background-repeat: no-repeat;
  background-position: -277px  -20px;
  background-size: 700px  600px;
  right: 30px;
}

#remove_cart {
  color: #fff;
  font-size: 18px;
  position: absolute;
  width: 30px;
  height: 25px;
  background-image: url(/SYJ_Mall/resources/images/product-detail/ico_friends.png); 
  background-repeat: no-repeat;
  background-position: -648px  -330px;
  background-size: 700px  600px;
  right: 30px;
}

#plus_alarm {
  color: #fff;
  font-size: 18px;
  position: absolute;
  width: 30px;
  height: 25px;
  background-image: url(/SYJ_Mall/resources/images/product-detail/ico_friends.png); 
  background-repeat: no-repeat;
  background-position: -567px  -460px;
  background-size: 700px  600px;
  right: 30px;
}

#remove_alarm {
  color: #fff;
  font-size: 18px;
  position: absolute;
  width: 30px;
  height: 25px;
  background-image: url(/SYJ_Mall/resources/images/product-detail/ico_friends.png); 
  background-repeat: no-repeat;
  background-position: -597px  -460px;
  background-size: 700px  600px;
  right: 30px;
}


/* no-repeat -1962px -995px; */

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

.thumbnail {
	cursor : pointer;
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
                    <!-- 상품 상세설명 이미지 -->
                   <!--  <div class="detail-content">
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
                    </div> -->
                    <!-- 상품 아래 하단 버튼 -->
                    <div class="detail-etc">
                        <button class="detail-btn">
                            <div>세부정보</div>
                            <div class="drop-down-icon"></div>
                        </button>
                        <div class="detail-contents">
                            <ul>
                                <li>품명 및 모델명 : ${prodtInfo.prodNm}
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
                            <div class="title">리뷰 ${totalReviewCount}개</div>
                            <div class="product-review" id="review_star">
								<c:forEach var="i" begin="1" end="5">
									<c:if test="${i le prodtInfo.prodStars}">
										<span class="review-star" id="star_${i}"></span>
									</c:if>
									<c:if test="${i gt prodtInfo.prodStars}">
										<span class="review-star off" id="star_${i}"></span>
									</c:if>
								</c:forEach>

								<span class="review-point">${prodtInfo.prodStars}</span>
                                <span class="review-perpect">5.0</span>
                            </div>
                        </div>
                        
                        
                        <!-- 로그인이 된 경우 -->
                        <c:if test="${not empty dtoSeq}">
                        	<c:if test="${prodtBuyReviewCheck eq 1}">
		                        <div class="review-text">
		                            <!-- 로그인 후 실 구매 사용자 표시 -->
		                            <textarea placeholder="최소 10자 이상 입력해주세요."></textarea>
		                        </div>
		                        
		                        <div class="review-button">
	                            	<button>
	                                	<span class="review-icon"></span>
	                                	<span>리뷰를 남겨주세요</span>
	                            	</button>
	                        	</div>
	                        </c:if>
	                        <c:if test="${prodtBuyReviewCheck eq -2}">
		                        <div class="review-text">
		                            <!-- 로그인 후 구매하지 않은 사용자 표시 -->
		                            <textarea disabled placeholder="상품을 구매 후 리뷰 작성이 가능합니다."></textarea>
		                        </div>
		                        
		                        <div class="review-button">
	                            	<button disabled='disabled'>
	                                	<span class="review-icon"></span>
	                                	<span>리뷰를 남겨주세요</span>
	                            	</button>
	                        	</div>
		                        
	                        </c:if>
	                        <c:if test="${prodtBuyReviewCheck eq -3}">
		                        <div class="review-text">
		                            <!-- 이미 상품 후기를 쓴 경우 -->
		                            <textarea disabled placeholder="이미 상품후기를 써주셨습니다."></textarea>
		                        </div>
		                        
		                         <div class="review-button">
	                            	<button disabled='disabled'>
	                                	<span class="review-icon"></span>
	                                	<span>리뷰를 남겨주세요</span>
	                            	</button>
	                        	</div>
	                        </c:if>
                        
	                        
	                    </c:if>
	                    
	                    <!-- 로그인이 되지 않은 경우 -->
                        <c:if test="${empty dtoSeq}">
	                        <div class="review-text">
	                            <!-- 로그인 전 사용자 표시 -->
	                            <textarea disabled placeholder="로그인 후 리뷰 작성이 가능합니다."></textarea>
	                        </div>
                        
	                        <div class="review-button">
	                            <button disabled='disabled'>
	                                <span class="review-icon"></span>
	                                <span>리뷰를 남겨주세요</span>
	                            </button>
	                        </div>
	                    </c:if>
	                    
	                    
                        <div class="review-list">
                            <div class="review-sort">
                                <button class="sort-btn like" id="like_btns">좋아요순</button>
                                <button class="sort-btn recent" id="recent_btns">최신순</button>
                            </div>
                            
                            <!-- 리뷰관련 로그인 하지 않은 경우-->
                            <c:if test="${empty dtoSeq}">
	                            <ul id = "review_content" class="review-item-ul">
	                                <c:forEach var="reviewDto" items="${prodtReviewInfo}">
	                                	<li class="review-item">
		                                    <div class="name">${reviewDto.userId}</div>
		                                    <div class="star">
			                                    <c:forEach var="i" begin="1" end="${reviewDto.starCount}">
		                       						<span class="review-star"></span>
		                       					</c:forEach>
		                       					<c:forEach var="i" begin="1" end="${reviewDto.starCountRemain}">
		                       						<span class="review-star off"></span>
		                       					</c:forEach>
		                       					<span class="date">${reviewDto.reviewDate}</span>
		                                    </div>
		                                    <div class="contents">
		                                        ${reviewDto.comment}
		                                    </div>
		      								<div class="like">
		      									<div class="heart" id="${reviewDto.pdOrderSeq}#${reviewDto.productId}"></div>
		      									<button>좋아요 ${reviewDto.likeCount}명</button>
		                                    </div>
	                                	</li>
	                                </c:forEach>
	                            </ul>
                            </c:if>
                            
                            <!-- 리뷰관련 로그인 한 경우-->
                            <c:if test="${not empty dtoSeq}">
	                            <ul id = "review_content" class="review-item-ul">
	                                <c:forEach var="reviewDto" items="${prodtReviewInfo}">
	                                	<li class="review-item">
		                                    <div class="name">${reviewDto.userId}</div>
		                                    <div class="star">
			                                    <c:forEach var="i" begin="1" end="${reviewDto.starCount}">
		                       						<span class="review-star"></span>
		                       					</c:forEach>
		                       					<c:forEach var="i" begin="1" end="${reviewDto.starCountRemain}">
		                       						<span class="review-star off"></span>
		                       					</c:forEach>
		                       					<span class="date">${reviewDto.reviewDate}</span>
		                                    </div>
		                                    <div class="contents">
		                                        ${reviewDto.comment}
		                                    </div>
		      								<c:if test="${reviewDto.likeYn eq 'N'}">
		      									<div class="like">
		      										<div class="heart" id="${reviewDto.pdOrderSeq}#${reviewDto.productId}"></div>
		      										<button>좋아요 ${reviewDto.likeCount}명</button>
		                                    	</div>
		      								</c:if>
		      								<c:if test="${reviewDto.likeYn eq 'Y'}">
		      									<div class="like">
		      										<div class="heart check" id="${reviewDto.pdOrderSeq}#${reviewDto.productId}"></div>
		      										<button>좋아요 ${reviewDto.likeCount}명</button>
		                                    	</div>
		      								</c:if>
	                                	</li>
	                                </c:forEach>
	                            </ul>
                            </c:if>
                            
                            
                            <c:if test="${totalReviewPage ne 1}">
                            	<div class="theme-more-view">더 보기</div>
                            </c:if>
                            
                            <!-- <div class="pagination">
                                <div class="pagination-left-arrow"></div>
                                <div class="pagination-page">1</div>
                                <div class="pagination-right-arrow"></div>
                            </div> -->

                        </div>
                    </div>
                    <hr class="division">
                    <!-- 잠깐만 이 상품은 어떄요 탭 -->
                    <div class="detail-recommended">
                        <div class="title">잠깐만,<br>이 상품은 어때요?</div>
                       	
                       	<ul>
							<c:forEach var="phdto" items="${prodtHowInfo}">
								<c:if test="${phdto.prodCnt eq 0}">
									<!-- 상품재고가 없는 경우 -->
									<li class="item-li" id="${phdto.prodId}">
										<div class="thumbnail"
											style="background-image : url('${phdto.picUrl}'); ">
											<div class="soldout-label"></div>
										</div>
										<div class="name">
											<div class="nametext">${phdto.prodNm}</div>
											<span class="${phdto.alarmYn}"></span>
										</div>
										<div class="price">${phdto.prodPrice}원</div>
									</li>
								</c:if>
	
	
								<c:if test="${phdto.prodCnt ne 0 && phdto.discRate eq 0}">
									<!-- 상품재고는 있고 할인이 없는경우 -->
									<li class="item-li" id="${phdto.prodId}">
										<div class="thumbnail"
											style="background-image : url('${phdto.picUrl}'); "></div>
										<div class="name">
											<div class="nametext">${phdto.prodNm}</div>
											<span class="${phdto.cookieBasket}"></span>
										</div>
										<div class="price">${phdto.prodPrice}원</div>
									</li>
								</c:if>
	
	
								<c:if test="${phdto.prodCnt ne 0 && phdto.discRate ne 0}">
									<!-- 상품재고는 있고 할인이 있는 경우 -->
									<li class="item-li" id="${phdto.prodId}">
										<div class="thumbnail"
											style="background-image : url('${phdto.picUrl}'); "></div>
										<div class="name">
											<div class="nametext">${phdto.prodNm}</div>
											<span class="${phdto.cookieBasket}"></span>
										</div>
										<div class="price" style="color: #FF447F;">${phdto.discRate}%
											${phdto.dcPrice}원</div>
										<div class="price"
											style="text-decoration: line-through; color: #9A9A9E;">${phdto.prodPrice}원</div>
									</li>
								</c:if>
							</c:forEach>
						</ul>
                       
                       
                    </div>
                    
                    <c:if test = "${not empty recentSeenList}">
                    <!-- 최근 조회 상품 -->
                    <div class="detail-recently-viewed">
                        <div class="title">최근 본 상품이<br>요기 있네</div>
                        <ul>
                            <c:forEach var="rcdto" items="${recentSeenList}">
								<c:if test="${rcdto.prodCnt eq 0}">
									<!-- 상품재고가 없는 경우 -->
									<li class="item-li" id="${rcdto.prodId}">
										<div class="thumbnail"
											style="background-image : url('${rcdto.picUrl}'); ">
											<div class="soldout-label"></div>
										</div>
										<div class="name">
											<div class="nametext">${rcdto.prodNm}</div>
											<span class="${rcdto.alarmYn}"></span>
										</div>
										<div class="price">${rcdto.prodPrice}원</div>
									</li>
								</c:if>
	
	
								<c:if test="${rcdto.prodCnt ne 0 && rcdto.discRate eq 0}">
									<!-- 상품재고는 있고 할인이 없는경우 -->
									<li class="item-li" id="${rcdto.prodId}">
										<div class="thumbnail"
											style="background-image : url('${rcdto.picUrl}'); "></div>
										<div class="name">
											<div class="nametext">${rcdto.prodNm}</div>
											<span class="${rcdto.cookieBasket}"></span>
										</div>
										<div class="price">${rcdto.prodPrice}원</div>
									</li>
								</c:if>
	
	
								<c:if test="${rcdto.prodCnt ne 0 && rcdto.discRate ne 0}">
									<!-- 상품재고는 있고 할인이 있는 경우 -->
									<li class="item-li" id="${rcdto.prodId}">
										<div class="thumbnail"
											style="background-image : url('${rcdto.picUrl}'); "></div>
										<div class="name">
											<div class="nametext">${rcdto.prodNm}</div>
											<span class="${rcdto.cookieBasket}"></span>
										</div>
										<div class="price" style="color: #FF447F;">${rcdto.discRate}%
											${rcdto.dcPrice}원</div>
										<div class="price"
											style="text-decoration: line-through; color: #9A9A9E;">${rcdto.prodPrice}원</div>
									</li>
								</c:if>
							</c:forEach>
                        </ul>
                    </div>
                    </c:if>
                    
                    <!-- 하단 바로구매 고정 버튼 -->
                    <c:if test="${prodtInfo.prodCnt ne 0}">
	                    <div class="bottom-bar">
	                        <button class="direct-purchase">구매하기</button>
	                        <button class="this_prodt_cart" id="plus_cart" style="visibility: hidden;"></button>
	                        <button class="this_prodt_cart" id="remove_cart" style="visibility: hidden;"></button>
	                    </div>
                    </c:if>
                    <c:if test="${prodtInfo.prodCnt eq 0}">
	                    <div class="bottom-bar-alarm">
	                        <button class="direct-alarm">알림설정</button>
	                        <button class="this_prodt_alarm" id="plus_alarm" style="visibility: hidden; "></button>
	                        <button class="this_prodt_alarm" id="remove_alarm" style="visibility: hidden; "></button>
	                    </div>
                    </c:if>
                    
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

        // 상단 슬라이드 관련
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

		
        
        /*============================= 구매하기 관련 탭 / 세부정보 배송정보 =============================*/
        // 세부 정보 및 배송 관련 탭
        $(document).ready(function() {

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

            $('.detail-etc .delivery-btn').click(function() {
                // 배송 반품 버튼
                if ($('.detail-etc  .delivery-detail-wrap').css('display') == 'block') {
                    $('.detail-etc .delivery-btn').removeClass('active');
                    $('.detail-etc  .delivery-detail-wrap').css('display', 'none');
                } else {
                    $('.detail-etc .delivery-btn').addClass('active');
                    $('.detail-etc  .delivery-detail-wrap').css('display', 'block');
                }
            })
			
            
            
            
            let cart_yn = "${prodtInfo.cookieBasket}";// 들어있으면 Y 안들어 있으면 N
            let alarm_yn = "${prodtInfo.alarmYn}";// 들어있으면 Y 안들어 있으면 N
            let alarm_look = -1;//알람 상세창 구분
            let selected_prodt_seq = ${prodtInfo.prodtId};//현재 상세페이지에 관한 물품 번호
            let to_buy_cnt = 0;//구매 원하는 개수정보
            let this_prodt_price = '${prodtInfo.dcPrice}';
            
            // 구매하기 클릭 시 팝업창
            $(".bottom-bar").click(function () { 
            	$(".bottom-bar").css("z-index",11);
            	$(".direct-purchase").text("즉시 구매하기");
				$("#testmodal1").css("visibility", "visible");
                $(".option-modal-wrap").css("bottom", "80px;");
                $(document.body).css("overflow", "hidden");
                
                if (cart_yn == 'N') {
                	cart_off_display();
                } else if (cart_yn == 'Y') {
                	cart_on_display();
                }
                
            });
			
            
			function cart_on_display() {
				$("#plus_cart").css('visibility','hidden');
          	   	$("#remove_cart").css('visibility','visible');
			}
            
			function cart_off_display() {
				$("#plus_cart").css('visibility','visible');
          	   	$("#remove_cart").css('visibility','hidden');
			}
            
			//카트 상태 변경 함수 -> 현재 상품에 관한 장바구니만 적용!
			//장바구니 버튼 누를 경우
			$('.this_prodt_cart').click(function(){
				//여기서 ajax 로 값을 받아와야 한다
            	const result = prodt_basket_checking(selected_prodt_seq);
            	
            	 if (result == 1) {
              	   //장바구니에 추가
              	   cart_yn = 'Y';
              	   cart_on_display();
                 } else if (result == 2){
               		//장바구니에서 제거
               	   	cart_yn = 'N';
               		cart_off_display();
                 } else {
              	   //에러 처리
              	   location.href = "/SYJ_Mall/totalError.action";
                 } 
				return false;//이벤트 버블링 발생 제거
			});
			
			//알람관련1
			function alarm_on_display() {
				$(".direct-alarm").text("즉시 알람설정 해제하기");
				$("#plus_alarm").css('visibility','hidden');
          	   	$("#remove_alarm").css('visibility','visible');
			}
			
			//알람관련2
			function alarm_off_display() {
				$(".direct-alarm").text("즉시 알람설정 하기");
				$("#plus_alarm").css('visibility','visible');
          	   	$("#remove_alarm").css('visibility','hidden');
			}
			
			// 알람설정 클릭 시 팝업창 -> 로그인 해줬는지 확인해준다. && 알람 설정 관련
            $(".bottom-bar-alarm").click(function() { 
            	
            	const login_yn = common_login_user_checking();
            	
            	//1. 첫번째로 알람 설정을 눌러줬을 경우(로그인 된 경우)
            	if (login_yn == 1 && alarm_look == -1) {
            		$(".bottom-bar-alarm").css("z-index",11);
             	   	$("#testmodal2").css("visibility", "visible");
                    $(".option-modal-wrap").css("bottom", "80px;");
                    $(document.body).css("overflow", "hidden");
                    
                    if (alarm_yn == 'Y') {
                    	alarm_on_display();
                    } else {
                    	alarm_off_display();
                    }
                    alarm_look = 1;
            	}
            	//2. 한번 누르고 다시 눌러줬을 경우(로그인 된 경우)
            	else if (login_yn == 1 && alarm_look == 1){
            		const alarm_yn_check = prodt_alarm_checking(selected_prodt_seq);
            		
            		if (alarm_yn_check == 1) {//알람 설정
       					alarm_on_display();
       					alarm_yn = 'Y'
            		} else if (alarm_yn_check == 2) {//알람 해제
       					alarm_off_display();
       					alarm_yn = 'N'
            		} else if (alarm_yn_check == 3) {//로그인이 안되었을 경우
            			common_login_modal_open();
            		}
            	}
            	//3. 로그인 되지 않은 경우
            	else if (login_yn == -1){
            		common_login_modal_open();
            	} else {
            		location.href = "/SYJ_Mall/totalError.action";
            	}            		
            });
			
            //모달 제거하는 용도
            $(".overlay-wrap-up").click(function () {
            	$(".overlay-wrap-up").css("visibility", "hidden");
                $(".option-modal-wrap").css("bottom", "80px");
                $(document.body).css("overflow", "visible");
                $(".direct-purchase").text("구매하기");
                $(".direct-alarm").text("알람설정");
                
                alarm_look = -1;
                $('.this_prodt_alarm').css("visibility","hidden");//알람 모달 끔
                $('.this_prodt_cart').css("visibility","hidden");//장바구니 모달 끔
            });
            
            
          
            //개수 선택할 경우 -> 계산식 넣어줘야함.
            $(".option-modal-wrap").click(function(){
            	return false;
            });
			
            //select 의 값이 변하는 경우
			$("#product_buy_cnt").on("change",function(){
				
				const buy_cnt = this.value;//구매할 제품 개수
				let prodt_price = this_prodt_price.replaceAll(',','') * buy_cnt;
				
				$('.price-text').text(prodt_price.toLocaleString() + "원");
				
			});
            
			/*============================= 리뷰 관련 =============================*/
          	const review_total_count = ${totalReviewCount};//해당상품에 관한 총 리뷰 개수
          	const total_page_count = ${totalReviewPage};//총 몇번의 리뷰 더보기를 할 수 있는지 정해주는 인덱스
          	let review_show_day = "${currentTime}";//리뷰 관련 정보 고정 날짜기준으로 보기 -> 새로운 리뷰가 갑자기 생길때 믹스 될수 있으므로
          	let	review_sorted_option = 1;//기본적으로 정렬옵션은 1로고정
          	let current_page = 1;
          	
          	
          	//리뷰 더 보기 버튼 눌렀을 경우
          	$('.theme-more-view').click(function(){
          		current_page++;
          		if (total_page_count >= current_page) {
          			review_add();
          		}
          	});
          	
          	
          	function review_add() {
          		
          		$.ajax({
                	type:"GET",
                    url: "/SYJ_Mall/productReviewAdd.action" ,
                    async : false,
                    data : {"selected_prodt_seq" : selected_prodt_seq, "sortOption" : review_sorted_option, "current_page" : current_page, "review_show_day" : review_show_day},
                    dataType : "json",
                    success : function(result) {
                    	
                    	if (result == null) alert('error');
                    	
                    	let review_length = result.length;
                    	let comment = "";
                    	
                    	for (let i = 0; i < review_length; i++) {
                    		comment += '<li class="review-item">';
                    		comment += '<div class="name">' + result[i].userId + '</div>'
                    		comment += '<div class="star">'
                    		
                    		for (let j = 0; j < result[i].starCount; j++) {
                    			comment += '<span class="review-star"></span>'
                    		}
                    		
                    		for (let j = 0; j < result[i].starCountRemain; j++) {
                    			comment += '<span class="review-star off"></span>'	
                    		}
                    		
                    		comment += '<span class="date">'+ result[i].reviewDate +'</span>'
                    		comment += '</div>';
                    		comment += '<div class="contents">' + result[i].comment + '</div>';
                    		comment += '<div class="like">';
                    		
                    		if (result[i].likeYn == 'Y') comment += '<span class="heart check" id="' + result[i].pdOrderSeq +'#'+ result[i].productId + '"></span>';
                    		else comment += '<div class="heart" id="' + result[i].pdOrderSeq +'#'+ result[i].productId + '"></div>';
                    		
                    		comment += '<button>좋아요 ' + result[i].likeCount + '명</button>'
                    		comment += '</div>'
                    		comment += '</li>'
                    	}
                    	
                    	$("#review_content").append(comment);
                    	
                    	if (total_page_count == current_page) {
                    		$(".theme-more-view").css('visibility','hidden');
                    	}
                    	
                    },
                    error: function(a,b,c) {
        					console.log(a,b,c);
        			}
                });	
          	}
          	
          	//좋아요순 눌렀을 경우에
          	$("#like_btns").click(function(){
          		popular_like();
          	});
          	
          	//최신순 눌렀을 경우에
            $("#recent_btns").click(function(){
            	recent_like();
          	});
          	
          	
          	function popular_like() {
          		review_sorted_option = 2;
          		current_page = 1;
          		$('#like_btns').css("background-color","rgb(141, 146, 161)");
          		$('#like_btns').css("color","#fff");
          		$('#recent_btns').css("background-color","#fff");
          		$('#recent_btns').css("color","#808080");
          		$('#review_content').empty();
          		review_add();
          		$(".theme-more-view").css('visibility','visible');
          	}
          	
          	function recent_like() {
          		review_sorted_option = 1;
          		current_page = 1;
          		$('#recent_btns').css("background-color","rgb(141, 146, 161)");
          		$('#recent_btns').css("color","#fff");
          		$('#like_btns').css("background-color","#fff");
          		$('#like_btns').css("color","#808080");
          		$('#review_content').empty();
          		review_add();
          		$(".theme-more-view").css('visibility','visible');
          	}
          	
          	//해당 리뷰에 대해서 좋아요 버튼 눌렀을 경우
          	$(document).on("click",'.heart',function(e){
				
          		const object = $(this);
          		const click_info = $(this).attr('id');
          		
          		const login_result = common_login_user_checking();
          		
          		//로그인 안한경우 - 좋아요 누를 수 없다.
				if (login_result == -1) common_login_modal_like_open();
          		//로그인 한 경우 - 좋아요 누를 수 있다.
				else if (login_result == 1) {
					//여기서 좋아요 누르기 작업 진행
					let review_result = review_like_checking(click_info);
					
					if (review_result == 1) {//좋아요 + 1
						$(object).attr('class','heart check');
						get_review_like_cnt(object);
					}
					if (review_result == 2) {//좋아요 - 1
						 $(object).attr('class','heart');
						 get_review_like_cnt(object);
					}
				}
			});
			
          	//리뷰에 좋아요 눌렀을 경우에 현재 좋아요 개수 가져오기
          	function get_review_like_cnt(object) {
          		const review_like_id = $(object).attr('id');
          		
          		$.ajax({
                	type:"GET",
                    url: "/SYJ_Mall/productReviewLikeCnt.action" ,
                    async : false,
                    data : {"reviewId" : review_like_id},
                    dataType : "json",
                    success : function(result) {
						
                    	$(object).siblings('button').text('좋아요 ' + result + '명' );
                    	
                    },
                    error: function(a,b,c) {
        					console.log(a,b,c);
        			}
          		
          		});
          	}
          	
          	let star_count = ${prodtInfo.prodStars};//별의 개수
          	
          	
          	//해당 상품에 대한 리뷰를 작성한다.
          	function review_write(text_info,selected_prodt_seq,star_count) {
          		
          		$.ajax({
                	type:"POST",
                    url: "/SYJ_Mall/productReviewWrite.action" ,
                    async : false,
                    data : {"write_info" : text_info, "selected_prodt_seq" : selected_prodt_seq, "star_count" : star_count},
                    dataType : "json",
                    success : function(result) {
                    	
                    	console.log(result);
                    	
                    	if (result == -1) {
                    		location.href = "/SYJ_Mall/totalError.action";
                    	} else if (result == 1) {
                    		//글동록 -> 바로 적어주는 로직이 필요해보인다.
                    		setTimeout(function() {
                    			location.reload();
                    		},1200);
                    	} else if (result == -2) {
                    		//구입한 적이 없음
                    	} else if (result == -3) {
                    		//이미 글을 작성함
                    	}
                    	
                    },
                    error: function(a,b,c) {
        					console.log(a,b,c);
        			}
                });	
          	}

          	//별점 지정해주기
          	$('#review_star .review-star').click(function(){
          		const star_index = $(this).attr('id').split('_')[1];
          		
          		if (star_index == star_count) {
          			star_count = 0;
          			
          			for (let i = 1; i <= 5; i++) {
          				$('#star_' + i).attr('class','review-star off');
          			}
          			
          		} else {
          			star_count = star_index;
          			
          			for (let i = 1; i <= 5; i++) {
          				if (i <= star_index) $('#star_' + i).attr('class','review-star');
          				else $('#star_' + i).attr('class','review-star off');
          			}          			
          		}
          		
          		$('.review-point').text(star_count);
          	});
          	
          	
          	const prodt_review_check = ${prodtBuyReviewCheck};
          	
          	//리뷰 쓰기
          	$('.review-button').click(function(){
          		
          		if (prodt_review_check == 1) {
          			
          			const write_info = $('.review-text').children('textarea').val();
              		
              		$('.review-text').children('textarea').val('');
              		review_write(write_info,selected_prodt_seq,star_count);
              		
          		} else if (prodt_review_check == -2) {
          			//구입한 적이 없는 경우
          		} else if (prodt_review_check == -3) {
          			//이미 해당 제품에 대해서 리뷰를 남긴 경우
          		} else {
          			//로그인이 안된 경우
          			
          		}
          	});
          	
          	
			/*============================= 잠깐만 이 상품은 어때요 탭 =============================*/
            //부분 사진 선택했을 경우 -> 상세페이지로 넘어간다.
			$('.thumbnail').click(function(){
				const prodtSeq = $(this).parent('li').attr('id');
				location.href = "/SYJ_Mall/productDetailMain.action?prodtSeq=" + prodtSeq;
			});
   
            
            //해당 물품 장바구니 선택했을 경우
            $('.cart').click(function(){
            	const this_object = $(this);
            	const prodt_id = $(this).parent().parent().attr("id");
            	const result = prodt_basket_checking(prodt_id);
            	
            	if (result == 1) {
            		$(this_object).attr('class','incart');
            	} else if (result == 2) {
            		$(this_object).attr('class','cart');
            	} else {
            		location.href = "/SYJ_Mall/totalError.action";
            	}
            });
            
            
          	//해당 물품 장바구니 선택했을 경우
            $('.incart').click(function(){
            	const this_object = $(this);
            	const prodt_id = $(this).parent().parent().attr("id");
            	const result = prodt_basket_checking(prodt_id);
            	
            	console.log("result : " + result);
            	
            	if (result == 1) {
            		$(this_object).attr('class','incart');
            	} else if (result == 2) {
            		$(this_object).attr('class','cart');
            	} else {
            		location.href = "/SYJ_Mall/totalError.action";
            	}
            });
            
            
            
            //해당 물품 알람 선택했을 경우
            $('.alarm').click(function(){
            	const this_object = $(this);
            	const prodt_id = $(this).parent().parent().attr("id");
            	const logon_yn = common_login_user_checking()
            	
            	if (logon_yn == -1) {
            		common_login_modal_open();
            	}
            	
            	const result = prodt_alarm_checking(prodt_id);
            	
            	if (result == 1) {
            		$(this_object).attr('class','inalarm');
            	} else if (result == 2) {
            		$(this_object).attr('class','alarm');
            	} else if (result == 3){
            		common_login_modal_open();
            	} else {
            		location.href = "/SYJ_Mall/totalError.action";
            	}
            });
            
            
        })
        
        
        
       
        
    </script>
                
                