<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.product {
	letter-spacing: -0.2px;
	padding: 46px 20px 25px;
	padding-bottom: 11px;
}

.product h3 {
	font-size: 22px;
	color: rgb(0, 0, 0);
	font-weight: 700;
	font-size: 22px;
	padding-bottom: 11px
}

.list {
	padding: 10px 0px;
}

.list_body {
	display: flex;
}

.list_body div {
	border: 1px solid black;
}

.list_left {
	width: 100px;
	height: 100px;
	margin-right: 13px
}

.list_right {
	width: calc(100% - 115px);
	padding-top: 5px;
	height: 100px;
}

.list_right button {
	float: right;
}

.list_right p {
	clear: both;
	height: 19px;
	margin-top: 3px;
	font-size: 13px
}

.list_right select {
	margin-top: 13px;
	height: 37px;
	line-height: 37px;
	font-size: 16px;
	letter-spacing: -0.2px;
	width: 80px;
	padding: 0px 10px;
	height: 37px;
}

.list_right div {
	float: right;
	margin-top: 12px;
	line-height: 37px;
	font-size: 16px;
	letter-spacing: -0.2px;
}

.product_total {
	border-top: 1px solid rgb(245, 246, 246);
	padding: 22px 20px 25px;
	line-height: 30px;
    height: 30px;
}

.product_total strong{
	font-size: 16px;
	clear: both;
	font-weight: 400;
}
.product_total p{
	float:right;
	font-size: 16px;

}
.product_total div:nth-child(3){
	font-weight: 700;
}
.product_total div:nth-child(3) strong{
	font-weight: 700;
}
</style>
</head>
<body>
	<div class="product">
		<h3>01 주문제품</h3>
		<!-- 비동기로 처리할것 jstl X -->
		<div class="list">
			<div class="list_body">
				<div class="list_left"></div>
				<div class="list_right">
					<strong>춘식이</strong>
					<button>버튼</button>
					<p></p>
					<select>
						<option>1</option>
					</select>
					<div>
						<span>55,000</span> <span>원</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="product_total">
		<div>
			<strong>상품가</strong>
			<p>55,000원</p>
		</div>
		<div>
			<strong>상품가</strong>
			<p>55,000원</p>
		</div>
		<div>
			<strong>상품가</strong>
			<p>55,000원</p>
		</div>
	</div>
</body>
</html>