<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<script src="resources/js/jquery-1.12.4.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="resources/css/icofont/icofont.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script type="text/javascript" src="resources/js/commonjs/common.js"></script>		


<style>

/* reset */
body,
div,
dl,
dt,
dd,
ul,
ol,
li,
h1,
h2,
h3,
h4,
h5,
h6,
pre,
code,
form,
fieldset,
legend,
textarea,
p,
blockquote,
th,
td,
input,
select,
textarea,
button {
  margin: 0;
  padding: 0;
}

fieldset,
img {
  border: 0 none;
}

dl,
ul,
ol,
menu,
li {
  list-style: none;
}

blockquote,
q {
  quotes: none;
}

blockquote:before,
blockquote:after,
q:before,
q:after {
  content: "";
  content: none;
}

input,
select,
textarea,
button {
  vertical-align: middle;
  font-size: 100%;
}

input::-ms-clear {
  display: none;
}

button {
  border: 0 none;
  background-color: transparent;
  cursor: pointer;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
}

body {
  -webkit-text-size-adjust: none;
}

/* placeholder 색상 변경 */
input::placeholder {
  color: #9a9a9e;
}
textarea::placeholder {
  color: #9a9a9e;
}

/* 뷰포트 변환시 폰트크기 자동확대 방지. */
input:checked[type="checkbox"] {
  background-color: #666;
  -webkit-appearance: checkbox;
}
input:focus {
  outline: none;
}

input[type="text"],
input[type="password"],
input[type="submit"],
input[type="search"],
input[type="tel"],
input[type="email"],
html input[type="button"],
input[type="reset"] {
  -webkit-appearance: none;
  border-radius: 0;
}

input[type="search"]::-webkit-search-cancel-button {
  -webkit-appearance: none;
}

body {
  background: #fff;
}

body,
th,
td,
input,
select,
textarea,
button {
  font-size: 14px;
  line-height: 1.5;
  font-family: "AppleSDGothicNeo", "맑은 고딕", sans-serif;
  color: #1e1e1e;
}

/* color값은 디자인가이드에 맞게사용 */

a {
  color: #1e1e1e;
  text-decoration: none;
}

a:active,
a:hover {
  text-decoration: none;
}

/* address,
caption,
cite,
code,
dfn,
em,
var {
  font-style: normal;
  font-weight: normal;
} */

@media (min-width: 640px) {
  #inner-head {
    width: 640px;
  }

  #inner-tab {
    width: 640px;
  }

  #inner-content {
    width: 640px;
  }

  #inner-footer {
    width: 640px;
  }

  #inner-search {
    width: 640px !important;
  }

  .navigation-inner {
    left: -400px !important;
    width: 400px !important;
  }
  .banner {
    height: 10% !important;
  }

  .basic-grid {
    grid-template-columns: 212px 212px 212px !important;
    grid-template-rows: 212px 212px !important;
  }

  .product-detail-wrap .main-image {
    /* height: 640px !important;
    width: 640px !important; */
  }

  .detail-recommended .item-li {
    max-width: 290px !important;
    min-height: 410px !important;
    max-height: 410px !important;
  }

  .detail-recommended .item-li .thumbnail {
    width: 290px !important;
    height: 290px !important;
  }

  .detail-recently-viewed .item-li {
    max-width: 290px !important;
    min-height: 410px !important;
    max-height: 410px !important;
  }

  .detail-recently-viewed .item-li .thumbnail {
    width: 290px !important;
    height: 290px !important;
  }

  .category-product-wrap .item-li {
    max-width: 290px !important;
    min-height: 410px !important;
    max-height: 410px !important;
  }

  .category-product-wrap .item-li .thumbnail {
    width: 290px !important;
    height: 290px !important;
  }

  .search-product-wrap .item-li {
    max-width: 290px !important;
    min-height: 410px !important;
    max-height: 410px !important;
  }

  .search-product-wrap .item-li .thumbnail {
    width: 290px !important;
    height: 290px !important;
  }

  .new-product-item-wrap .item-li {
    max-width: 275px !important;
    min-height: 410px !important;
    max-height: 410px !important;
  }

  .new-product-item-wrap .item-li .thumbnail {
    width: 275px !important;
    height: 275px !important;
  }

  .new-product-new .swiper-slide img {
    max-height: 360px !important;
  }

  .product-category-character .category-banner {
    min-height: 220px !important;
  }

  .product-category-character .category-banner select {
    min-height: 220px !important;
  }
  
  .product-category-character {
    width: 640px;
  }
 

  /* 검색 결과 팝업창 사이즈 */
  .character-modal-wrap {
    width: 640px !important;
    max-width: 640px !important;
    padding: 20px 19px !important;
  }
  .character-modal-wrap .character-list {
    margin: 8px !important;
  }
  .character-modal-wrap .character-list .character-image {
    width: 70px !important;
    height: 70px !important;
    background-size: 70px 70px !important;
  }

  .sort-modal-wrap {
    width: 640px !important;
  }

  .sort-modal-wrap .sort-list {
    max-width: 640px !important;
  }
  
  
 /*  #my_page_contents {
  	height:1200px;
  } */
  
  
}

/* font 영역 */

/* AppleSDGothicNeo */
@font-face {
  font-family: "AppleSDGothicNeo";
  font-weight: 300;
  src: url(/SYJ_Mall/resources/fonts/AppleSDGothicNeoL.woff) format("woff"),
    url(/SYJ_Mall/resources/fonts/AppleSDGothicNeoL.woff2) format("woff2"),
    url(/SYJ_Mall/resources/src/fonts/AppleSDGothicNeoL.otf) format("otf");
}

@font-face {
  font-family: "AppleSDGothicNeo";
  font-weight: 400;
  src: url(/SYJ_Mall/resources/fonts/AppleSDGothicNeoM.woff) format("woff"),
    url(/SYJ_Mall/resources/fonts/AppleSDGothicNeoM.woff2) format("woff2"),
    url(/SYJ_Mall/resources/fonts/AppleSDGothicNeoM.otf) format("otf");
}

@font-face {
  font-family: "AppleSDGothicNeo";
  font-weight: 700;
  src: url(/SYJ_Mall/resources/fonts/AppleSDGothicNeoB.woff) format("woff"),
    url(/SYJ_Mall/resources/fonts/AppleSDGothicNeoB.woff2) format("woff2"),
    url(/SYJ_Mall/resources/fonts/AppleSDGothicNeoB.otf) format("otf");
}




</style>