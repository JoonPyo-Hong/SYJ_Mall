<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
.guest-order-inquiry-wrap {
  padding: 30px 20px 100px;
}

.guest-login .item-form {
  padding-bottom: 20px;
}

.guest-login .item-form label {
  display: block;
  padding-bottom: 8px;
  font-size: 15px;
  line-height: 20px;
}

.guest-login .item-form input {
  height: 48px;
  width: 100%;
  padding: 13px 16px;
  font-size: 16px;
  border: 1px solid #dedfe0;
  border-radius: 8px;
  line-height: 20px;
  background-color: #fff;
  box-sizing: border-box;
}

/* 로그인 입력 영역 */
.guest-login .login-btn {
  margin-top: 20px;
  height: 60px;
  width: 100%;
  font-weight: bold;
  font-size: 16px;
  line-height: 60px;
  border-radius: 8px;
  border-color: #3c404b;
  background-color: #3c404b;
  color: #fff;
  cursor: pointer;
}

.guest-login .login-btn:disabled {
  border-color: #d4d7e1;
  background-color: #d4d7e1;
  cursor: default;
}

/* 하단 안내 사항 */
.list-notice {
  margin-top: 26px;
  padding-top: 18px;
  border-top: 1px solid #eff0f2;
}

.list-notice li {
  position: relative;
  padding-left: 8px;
  font-size: 13px;
  line-height: 18px;
  color: #747475;
}

.list-notice li::before {
  position: absolute;
  top: 8px;
  left: 1px;
  width: 2px;
  height: 2px;
  border-radius: 50%;
  background-color: #909092;
  content: "";
}


</style>



<div class="container-wrap guest-order-inquiry-wrap" >
	<!-- 로그인 입력 영역 -->
	<form class="guest-login" style="margin-top : 40px;">
		<div class="item-form">
			<label for="order-number">주문번호</label> <input id="order-number"
				placeholder="주문번호를 입력해주세요." onkeyup="check()">
		</div>
		<div class="item-form">
			<label for="order-name">이름</label> <input id="order-name"
				placeholder="한글 또는 영어로 입력해주세요." onkeyup="check()">
		</div>
		<button class="login-btn" id="login-btn" disabled>확인</button>

	</form>
	<!-- 하단 안내 사항 영역-->
	<ul class="list-notice">
		<li>주문 조회를 위해 이름, 주문번호를 수집 및 이용하며, <b>목적 달성시 지체없이 파기합니다.</b></li>
		<li>'확인'을 진행하시면 동의한 것으로 간주됩니다.</li>
		<li>비회원 주문 조회는 배송완료일로부터 3개월까지 가능합니다.</li>
	</ul>
</div>







