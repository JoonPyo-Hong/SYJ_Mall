<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">

<style>
/* 게시글 전체 */
.box-feed {
	padding: 20px;
}

/* 게시글 상단 */
.head-feed {
	display: flex;
	align-items: center;
	justify-content: start;
	padding-bottom: 15px;
}

.head-feed .profile {
	width: 40px;
	height: 40px;
	border-radius: 16px;
	background-color: #ededed;
	cursor: pointer;
}

.head-feed .info-head {
	display: flex;
	flex-direction: column;
	padding-left: 8px;
}

.head-feed .info-head .txt-profile {
	font-size: 16px;
	line-height: 24px;
	font-weight: bold;
}

.head-feed .info-head .txt-time {
	font-size: 13px;
	line-height: 16px;
	color: #909092;
}

/* 게시글 내용 */
/* 이미지 사진 */
.body-feed .slide-feed {
	min-height: 400px;
	background-color: #ededed;
	width: 600px;
	height: 600px;
}

.swiper-slide .swiper-slide-active .swiper-wrapper .swiper-container {
	width: 600px;
	height: 600px;
}

.swiper-slide img {
	width: 600px;
	height: 600px;
	
}
.swiper-button-prev {
	display: inline-block;
	background-image:
		url(/SYJ_Mall/resources/images/main/arrow-medium-circle-right-white.png);
	background-size: 27px 27px;
	background-position: center;
	background-repeat: no-repeat;
	transform: rotate(180deg);
}

.swiper-button-next {
	display: inline-block;
	background-image:
		url(/SYJ_Mall/resources/images/main/arrow-medium-circle-right-white.png);
	background-size: 27px 27px;
	background-position: center;
	background-repeat: no-repeat;
}

@media (max-width: 600px) {
	.body-feed .slide-feed {
	background-color: #ededed;
	width: 380px;
	height: 100px;
}
.swiper-slide img {
    width: 380px;
    height: 450px;
}
}
/* [+] 관련 상품 보러가기 텍스트 형식 */
.option-link-view {
	cursor: pointer;
	position: relative;
	height: 50px;
	padding: 0 30px 0 15px;
	box-sizing: border-box;
	margin-top: 10px;
	border: 1px solid #000;
	border-radius: 8px;
	font-weight: bold;
	line-height: 50px;
	font-size: 14px;
}

.option-link-view .icon-arrow {
	position: absolute;
	top: 16px;
	right: 11px;
	width: 16px;
	height: 16px;
	background: url(/SYJ_Mall/resources/today/ico_friends.png) -320px 0
		no-repeat;
	background-size: 699px 451px;
	color: transparent;
}

/* 정보 영역 */
.info-feed {
	position: relative;
	padding-top: 50px;
}

.info-feed .like-count {
	font-size: 14px;
	font-weight: bold;
}

.info-feed .title {
	padding-top: 10px;
	font-size: 20px;
	line-height: 24px;
	font-weight: bold;
}

.info-feed .desc {
	padding-top: 8px;
	font-size: 14px;
	line-height: 20px;
	word-break: break-all;
}

.info-feed .util-left {
	position: absolute;
	top: 6px;
	left: -2px;
	display: flex;
}

.info-feed .util-right {
	position: absolute;
	top: 6px;
	right: -2px;
}

.info-feed .util-left .like-btn {
	width: 32px;
	height: 32px;
	background: url(/SYJ_Mall/resources/images/today/ico_friends.png) -160px
		-100px no-repeat;
	background-size: 699px 451px;
	cursor: pointer;
}

.info-feed .util-left .reply-btn {
	width: 32px;
	height: 32px;
	background: url(/SYJ_Mall/resources/images/today/ico_friends.png) -120px
		-100px no-repeat;
	background-size: 699px 451px;
	cursor: pointer;
}

.info-feed .util-right .share-btn {
	width: 32px;
	height: 32px;
	background: url(/SYJ_Mall/resources/images/today/ico_friends.png) -80px
		-100px no-repeat;
	background-size: 699px 451px;
	cursor: pointer;
}

/* [+] 해당 게시글 태그 */
.option-list-tag {
	padding-top: 12px;
	cursor: pointer;
}

.option-list-tag .list-tag-txt {
	display: inline-block;
	line-height: 30px;
	height: 30px;
	font-size: 14px;
	color: #28619e;
	font-weight: bold;
	padding: 0 13px;
	border: 1px solid #c7d6e7;
	border-radius: 15px;
	margin-right: 5px;
}

.option-list-tag .list-tag-txt span {
	display: block;
}

/* [+] 관련 상품 보러가기 이미지 형식 */
.option-list-product {
	margin-top: 12px;
	border: 1px solid #dedfe0;
	border-radius: 10px;
}

.option-list-product li {
	position: relative;
	padding-right: 10px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	cursor: pointer;
	border-bottom: 1px solid #dedfe0;
}

.option-list-product li:last-child {
	border-bottom: none;
}

.option-list-product .list-product-contents {
	padding: 4px 0 4px 7px;
	display: flex;
}

.option-list-product .list-product-contents .img-product {
	width: 70px;
	height: 70px;
}

.option-list-product .list-product-contents .info-product {
	padding: 15px 0 0 10px;
	display: flex;
	flex-direction: column;
}

.option-list-product .list-product-contents .info-product .title-product
	{
	font-size: 14px;
	line-height: 16px;
	color: #747475;
}

.option-list-product .list-product-contents .info-product .price-product
	{
	font-size: 15px;
	line-height: 24px;
	font-weight: bold;
}

.option-list-product .list-product-cart .cart-btn {
	width: 24px;
	height: 24px;
	background: url(/SYJ_Mall/resources/images/today/ico_friends.png)-280px -220px
		no-repeat;
	background-size: 699px 451px;
	color: transparent;
}

/* 댓글 영역 */
.body-feed .link-comments {
	margin-top: 12px;
}

.body-feed .txt_count {
	display: block;
	line-height: 20px;
	color: #909092;
}

.body-feed .info-comments {
	display: block;
	padding: 8px 0 16px;
}

.body-feed .info-comments .name {
	font-weight: bold;
	height: 20px;
	margin-right: 4px;
	line-height: 20px;
}

.body-feed .info-comments .comments {
	line-height: 20px;
	color: #747475;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.body-feed .comments-input {
	position: relative;
	padding: 13px 62px 13px 14px;
	border-radius: 0 24px 24px 24px;
	background-color: #f2f2f2;
	color: #aeaeaf;
	line-height: 20px;
	cursor: pointer;
}

.profile img {
	width: 43px;
}
/* 게시글 전체 */
.box-feed {
  padding: 20px;
}

/* 게시글 상단 */
.head-feed {
  display: flex;
  align-items: center;
  justify-content: start;
  padding-bottom: 15px;
}

.head-feed .profile {
  width: 40px;
  height: 40px;
  border-radius: 16px;
  background-color: #ededed;
  cursor: pointer;
}

.head-feed .info-head {
  display: flex;
  flex-direction: column;
  padding-left: 8px;
}

.head-feed .info-head .txt-profile {
  font-size: 16px;
  line-height: 24px;
  font-weight: bold;
}

.head-feed .info-head .txt-time {
  font-size: 13px;
  line-height: 16px;
  color: #909092;
}

/* 게시글 내용 */
/* 이미지 사진 */
.body-feed .slide-feed {
  min-height: 400px;
  background-color: #ededed;
}

/* [+] 관련 상품 보러가기 텍스트 형식 */
.option-link-view {
  cursor: pointer;
  position: relative;
  height: 50px;
  padding: 0 30px 0 15px;
  box-sizing: border-box;
  margin-top: 10px;
  border: 1px solid #000;
  border-radius: 8px;
  font-weight: bold;
  line-height: 50px;
  font-size: 14px;
}

.option-link-view .icon-arrow {
  position: absolute;
  top: 16px;
  right: 11px;
  width: 16px;
  height: 16px;
  background: url(.././images/today/ico_friends.png) -320px 0 no-repeat;
  background-size: 699px 451px;
  color: transparent;
}

/* 정보 영역 */
.info-feed {
  position: relative;
  padding-top: 50px;
}

.info-feed .like-count {
  font-size: 14px;
  font-weight: bold;
}

.info-feed .title {
  padding-top: 10px;
  font-size: 20px;
  line-height: 24px;
  font-weight: bold;
}

.info-feed .desc {
  padding-top: 8px;
  font-size: 14px;
  line-height: 20px;
  word-break: break-all;
}

.info-feed .util-left {
  position: absolute;
  top: 6px;
  left: -2px;
  display: flex;
}

.info-feed .util-right {
  position: absolute;
  top: 6px;
  right: -2px;
}

.info-feed .util-left .like-btn {
  width: 32px;
  height: 32px;
  background: url(.././images/today/ico_friends.png) -160px -100px no-repeat;
  background-size: 699px 451px;
  cursor: pointer;
}

.info-feed .util-left .reply-btn {
  width: 32px;
  height: 32px;
  background: url(.././images/today/ico_friends.png) -120px -100px no-repeat;
  background-size: 699px 451px;
  cursor: pointer;
}

.info-feed .util-right .share-btn {
  width: 32px;
  height: 32px;
  background: url(.././images/today/ico_friends.png) -80px -100px no-repeat;
  background-size: 699px 451px;
  cursor: pointer;
}

/* [+] 해당 게시글 태그 */
.option-list-tag {
  padding-top: 12px;
  cursor: pointer;
}

.option-list-tag .list-tag-txt {
  display: inline-block;
  line-height: 30px;
  height: 30px;
  font-size: 14px;
  color: #28619e;
  font-weight: bold;
  padding: 0 13px;
  border: 1px solid #c7d6e7;
  border-radius: 15px;
  margin-right: 5px;
}

.option-list-tag .list-tag-txt span {
  display: block;
}

/* [+] 관련 상품 보러가기 이미지 형식 */
.option-list-product {
  margin-top: 12px;
  border: 1px solid #dedfe0;
  border-radius: 10px;
}

.option-list-product li {
  position: relative;
  padding-right: 10px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  cursor: pointer;
  border-bottom: 1px solid #dedfe0;
}

.option-list-product li:last-child {
  border-bottom: none;
}

.option-list-product .list-product-contents {
  padding: 4px 0 4px 7px;
  display: flex;
}

.option-list-product .list-product-contents .img-product {
  width: 70px;
  height: 70px;
}

.option-list-product .list-product-contents .info-product {
  padding: 15px 0 0 10px;
  display: flex;
  flex-direction: column;
}

.option-list-product .list-product-contents .info-product .title-product {
  font-size: 14px;
  line-height: 16px;
  color: #747475;
}

.option-list-product .list-product-contents .info-product .price-product {
  font-size: 15px;
  line-height: 24px;
  font-weight: bold;
}

.option-list-product .list-product-cart .cart-btn {
  width: 24px;
  height: 24px;
  background: url(.././images/today/ico_friends.png) -280px -220px no-repeat;
  background-size: 699px 451px;
  color: transparent;
}

/* 댓글 영역 */
.link-comments .input-box {
  margin: 0 20px;
  position: relative;
  padding: 13px 62px 13px 14px;
  border-radius: 0 24px 24px 24px;
  background-color: #f2f2f2;
}

.link-comments .input-box textarea {
  display: block;
  width: 100%;
  height: 20px;
  border: 0;
  line-height: 20px;
  background-color: transparent;
  resize: none;
}

.link-comments .input-box button {
  position: absolute;
  bottom: 0;
  right: 0;
  padding: 8px;
}

.link-comments .input-box button .icon-upload {
  display: block;
  width: 30px;
  height: 30px;
  background: url(../images/today/ico_friends.png) 0 0 no-repeat;
  background-size: 699px 451px;
  background-position: -150px -320px;
  color: transparent;
}

.wrap-comments {
  margin-top: 24px;
  padding: 16px 20px 0;
  border-top: 1px solid #eff0f2;
}

.wrap-comments .sorting-filter {
  display: block;
  font-size: 13px;
  line-height: 20px;
  color: #747475;
  letter-spacing: -0.02em;
  cursor: pointer;
}

.wrap-comments .sorting-filter .ico-sorting {
  display: inline-block;
  width: 16px;
  height: 16px;
  margin-left: 2px;
  vertical-align: top;
  background: url(../images/today/ico_friends.png) 0 0 no-repeat;
  background-size: 699px 451px;
  background-position: -400px 0;
  color: transparent;
}

.wrap-comments .list-comments {
  display: flex;
  flex-direction: column;
  float: left;
}

/* 답글 */
/* .wrap-comments .list-comments2 {
  float: left;
} */

.wrap-comments .list-comments2 li {
  padding-top: 20px;
  padding-left: 32px;
}

.wrap-comments .list-comments li {
  padding-top: 20px;
}

.wrap-comments .list-comments li:first-child {
  padding-top: 16px;
}

.wrap-comments .list-comments li .comments-head {
  padding-bottom: 3px;
  font-weight: bold;
}

.wrap-comments .list-comments li .comments-inp {
  display: inline-block;
  margin: 0;
  padding-right: 14px;
  max-width: 480px;
  vertical-align: top;
  box-sizing: border-box;
  position: relative;
  padding: 13px 14px;
  border-radius: 0 24px 24px 24px;
  background-color: #f2f2f2;
  word-break: break-all;
}

.wrap-comments .list-comments li .comments-info {
  padding: 4px 0 0 14px;
}

.wrap-comments .list-comments li .comments-info .txt-date {
  float: left;
  font-size: 13px;
  line-height: 26px;
  color: #aeaeaf;
}

.wrap-comments .list-comments li .comments-info .txt-like {
  float: left;
  margin-left: 10px;
  padding: 4px 0;
  font-weight: 700;
  font-size: 13px;
  line-height: 18px;
  color: #aeaeaf;
}

.wrap-comments .list-comments li .comments-info .txt-like .on {
  font-weight: 700;
  color: #ff447f;
}

.wrap-comments .list-comments li .comments-info .txt-like .ico-like {
  display: inline-block;
  width: 16px;
  height: 16px;
  vertical-align: top;
  background: url(../images/today/ico_friends.png) 0 0 no-repeat;
  background-size: 699px 451px;
  background-position: -210px -280px;
  color: transparent;
}

.wrap-comments .list-comments li .comments-info .txt-like .ico-like.on {
  background-position: -210px -300px;
}

.wrap-comments .list-comments li .comments-info .txt-reply {
  float: left;
  margin-left: 10px;
  padding: 4px 0;
  font-weight: 700;
  font-size: 13px;
  line-height: 18px;
  color: #aeaeaf;
}

</style>

<input type="hidden" id="l_seq" value="${l_seq}">


<div id="kakao-wrap" style="height: 100%">

	
        <div id="kakao-content">
          <div id="inner-content">
            <!-- <div id="kakao-search-content">
                    <div class="main-tab">
                        <ul class="main-tab-ul">
                            <li class="main-tab-li active">오늘</li>
                            <li class="main-tab-li">신규</li>
                            <li class="main-tab-li">인기</li>
                            <li class="main-tab-li">마이</li>
                        </ul>
                    </div>
       
            <div class="container-wrap today-wrap">
              <!-- 게시글 하나 박스 -->
              <div class="box-feed">
                <!-- 게시글 상단 -->
                <div class="head-feed">
                  <div class="profile"></div>
                  <div class="info-head">
                    <span class="txt-profile">라이언</span>
                    <span class="txt-time">3시간 전</span>
                  </div>
                </div>
                <!-- 게시글 내용 -->
                <div class="body-feed">
                  <!-- 이미지 사진 -->
                  <div class="slide-feed"></div>
                  <!-- [+] 관련 상품 보러가기 텍스트 형식 -->
                  <div class="option-link-view">
                    풀꽃 주차번호판 방향제 세트 보러 가기
                    <span class="icon-arrow"></span>
                  </div>
                  <!-- 정보 영역 -->
                  <div class="info-feed">
                    <div class="like-count">좋아요 2,092명</div>
                    <div class="title">
                      콜록콜록😵‍💫<br />쌀쌀해진 이 맘 때 필요한 건 뭐?
                    </div>
                    <div class="desc">
                      <p>
                        갑자기 추워진 날씨<br />
                        담요와 머그로 따뜻하게 겨울 맞이하기!🙌🏻
                      </p>
                    </div>
                    <div class="util-left">
                      <div class="like-btn"></div>
                      <div class="reply-btn"></div>
                    </div>
                    <div class="util-right">
                      <div class="share-btn"></div>
                    </div>
                  </div>
                  <!-- [+] 해당 게시글 태그 -->
                  <ul class="option-list-tag">
                    <li class="list-tag-txt">#프렌즈도감</li>
                    <li class="list-tag-txt">#라이언</li>
                  </ul>
                  <!-- [+] 관련 상품 보러가기 이미지 형식  -->
                  <ul class="option-list-product">
                    <li>
                      <div class="list-product-contents">
                        <img
                          class="img-product"
                          src="images/today/product-list.jfif"
                        />
                        <div class="info-product">
                          <span class="title-product"
                            >집콕 입는 담요_라이언&춘식이</span
                          >
                          <span class="price-product">39,000</span>
                        </div>
                      </div>
                      <div class="list-product-cart">
                        <div class="cart-btn"></div>
                      </div>
                    </li>
                    <li>
                      <div class="list-product-contents">
                        <img
                          class="img-product"
                          src="images/today/product-list.jfif"
                        />
                        <div class="info-product">
                          <span class="title-product"
                            >따뜻한극세사이불담요_라이언</span
                          >
                          <span class="price-product">39,000</span>
                        </div>
                      </div>
                      <div class="list-product-cart">
                        <div class="cart-btn"></div>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>

              <!-- box-feed 분리 -->
              <!-- 댓글 영역 -->
              <div class="link-comments">
                <!-- 댓글 작성 영역 -->
                <div class="input-box">
                  <textarea
                    class="comments-input"
                    placeholder="로그인 후 이용해주세요."
                    readonly
                  ></textarea>
                  <button class="btn-upload">
                    <span class="icon-upload"></span>
                  </button>
                </div>
                <!-- 댓글 View -->
                <div class="wrap-comments">
                  <!-- 정렬 -->
                  <div class="sorting-filter">
                    최신순
                    <span class="ico-sorting"></span>
                  </div>
                  <!-- 댓글 리스트 -->
                  <ul class="list-comments">
                    <li class="item-comments">
                      <div class="comments-head">최*림</div>
                      <div class="comments-inp">
                        크리스마스 선물은 어피치로 부탁햄🎄
                      </div>
                      <div class="comments-info">
                        <span class="txt-date">33분 전</span>
                        <button class="txt-like">
                          <span class="ico-like"></span>
                          <!-- 기본 타입 -->
                          <!-- <span>좋아요</span> -->
                          <!-- 좋아요 수 표기 타입 -->
                          <span>좋아요 1명</span>
                          <!-- 좋아요 누른 상태 표기 타입 -->
                          <!-- <span class="on">좋아요 2명</span> -->
                        </button>
                        <button class="txt-reply">답글달기</button>
                      </div>

                      <!-- 답글 댓글 -->
                      <ul class="list-comments list-comments2">
                        <li class="item-comments">
                          <div class="comments-head">신*환</div>
                          <div class="comments-inp">
                            그래그래 선물 보내주마🎅
                          </div>
                          <div class="comments-info">
                            <span class="txt-date">7분 전</span>
                            <button class="txt-like">
                              <span class="ico-like"></span>
                              <!-- 기본 타입 -->
                              <!-- <span>좋아요</span> -->
                              <!-- 좋아요 수 표기 타입 -->
                              <span>좋아요 1명</span>
                              <!-- 좋아요 누른 상태 표기 타입 -->
                              <!-- <span class="on">좋아요 2명</span> -->
                            </button>
                          </div>
                        </li>
                      </ul>
                    </li>
                    <li class="item-comments">
                      <div class="comments-head">홍*표</div>
                      <div class="comments-inp">어피치 갖고싶어😺</div>
                      <div class="comments-info">
                        <span class="txt-date">40분 전</span>
                        <button class="txt-like">
                          <span class="ico-like on"></span>
                          <!-- 기본 타입 -->
                          <!-- <span>좋아요</span> -->
                          <!-- 좋아요 수 표기 타입 -->
                          <!-- <span>좋아요 1명</span> -->
                          <!-- 좋아요 누른 상태 표기 타입 -->
                          <span class="on">좋아요 2명</span>
                        </button>
                        <button class="txt-reply">답글달기</button>
                      </div>
                    </li>
                  </ul>
                </div>
                <!-- 댓글 리스트 끝-->
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

 
 

<script type="text/javascript">

</script>