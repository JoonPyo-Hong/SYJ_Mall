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
</style>




<div class="container-wrap today-wrap">
	test
</div>


<script type="text/javascript">

</script>