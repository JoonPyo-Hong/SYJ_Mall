<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <!-- <meta name="viewport" content="width=380, height=740, user-scalable=yes, initial-scale=1.0, maximum-scale=2.0" /> -->
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>카카오 프렌즈샵</title>
<!-- <link rel="stylesheet" type="text/css" href="resources/css/userlogin/loginGuide.css"> -->
<style>
@charset "UTF-8";

.login-wrap {
  position: fixed;
  width: 100%;
  max-width: 640px;
  height: 100%;
  min-height: 530px;
  text-align: center;
  background-color: #fdce00;
  box-sizing: border-box;
}

.login-wrap .background-img {
  position: fixed;
  bottom: 0;
  width: 420px;
  height: auto;
  margin-left: -210px;
}

.login-wrap .login-box {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 220px;
}

.login-wrap .login-text {
  font-size: 32px;
  line-height: 44px;
  text-align: center;
  z-index: 1;
}

.login-wrap .login-text span {
  display: block;
  font-weight: 300;
}

.login-wrap .login-text span.bold {
  display: block;
  font-weight: bold;
}

.login-wrap .login-btn {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 272px;
  height: 60px;
  margin-top: 18px;
  font-size: 16px;
  font-weight: bold;
  line-height: 61px;
  color: #3c1e1e;
  background: #ffeb00;
  border-radius: 35px;
  box-shadow: 0 1px 3px rgb(0 0 0 / 8%);
  z-index: 1;
}

.login-wrap .login-btn span {
  display: block;
  width: 24px;
  height: 24px;
  margin-right: 5px;
  background: url(/SYJ_Mall/resources/images/login/ico_friends.png) 0 0 no-repeat;
  background-position: -480px -20px;
  background-size: 699px 451px;
  color: transparent;
}



</style>
</head>
<body>

    <div id="kakao-wrap">
        <div id="kakao-head">
            <div id="inner-head">
                <div class="left-btn">
                    <!-- <button class="back-button"></button> -->
                    <button class="home-button"></button>
                </div>
                <div class="title">로그인</div>
                <div class="right-btn">
                    <button class="search"></button>
                    <button class="language"></button>
                </div>
            </div>
            <div id="inner-tab">
            </div>
        </div>
        <div id="kakao-content">
            <div id="inner-content">
                <div class="container-wrap login-wrap">
                    <img class="background-img" src="/SYJ_Mall/resources/images/login/bg_login.png" />
                    <div class="login-box">
                        <div class="login-text">
                            <span>일상의 즐거움이 가득한</span>
                            <span class="bold">카카오프렌즈</span>
                        </div>
                             <button  class="login-btn">
                                <span></span>
                                    카카오 계정으로 로그인
                            </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
    </script>
</body>
</html>