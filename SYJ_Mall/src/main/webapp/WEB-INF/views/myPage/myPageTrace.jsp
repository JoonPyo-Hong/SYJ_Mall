<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>

<style>
.act-list-wrap {
  border-top: 1px solid rgb(242, 242, 242);
  overflow-y: auto;
}

.act-list-item {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  border-bottom: 1px solid rgb(242, 242, 242);
  padding: 20px;
}

.act-content {
  display: flex;
}

.act-img {
  position: relative;
  width: 64px;
  height: 64px;
  background: url(/SYJ_Mall/resources/images/mypage_act/media_0_20210817163520.jpg) no-repeat;
  background-size: cover;
  background-position: center center;
  border-radius: 8px;
}

.act-img.coffee {
  background: url(/SYJ_Mall/resources/images/mypage_act/media_0_20210811173154.jpg) no-repeat;
  background-size: cover;
  background-position: center center;
  border-radius: 8px;
}

.act-text {
  display: flex;
  flex-direction: column;
  margin-left: 20px;
}

.act-text .act-name {
  font-size: 15px;
  font-weight: bold;
  color: rgb(0, 0, 0);
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  max-width: 182px;
}
.act-text .act-description {
  font-size: 13px;
  color: rgb(102, 102, 102);
}
.act-text .act-date {
  font-size: 13px;
  margin-top: 5px;
  color: rgb(154, 154, 158);
}

.act-list-delete-btn {
  width: 24px;
  height: 24px;
  background: url(/SYJ_Mall/resources/images/mypage_seen/delete-small-18-light-grey.png)
    no-repeat;
  background-size: 16px 16px;
  cursor: pointer;
}



</style>

<!-- 마이페이지 컨텐츠 -->
<div class="container-wrap mypage-seen-wrap">
	<!-- 데이터 없을 시 -->
	<!-- <div class="order-list-nodata">
              <div class="standing-ryan"></div>
              <div class="empty-message">내역이 없어요</div>
            </div> -->
	<!-- 데이터 있을 시 -->
	<div class="act-list-wrap">

		<!-- 활동 이력 하나 -->
		<div class="act-list-item">
			<!-- 활동 내용 -->
			<div class="act-content">
				<a href="#">
					<div class="act-img"></div>
				</a>
				<div class="act-text">
					<span class="act-name">웰컴 투 춘식이 방🏡</span> <span
						class="act-description">게시물에 댓글을 작성했습니다.</span> <span
						class="act-date">7분 전</span>
				</div>
			</div>
			<!-- 상품 삭제 -->
			<div class="act-list-delete-btn"></div>
		</div>

		<!-- 활동 이력 하나 -->
		<div class="act-list-item">
			<!-- 활동 내용 -->
			<div class="act-content">
				<a href="#">
					<div class="act-img coffee"></div>
				</a>
				<div class="act-text">
					<span class="act-name">커피 한 잔 할래요☕️ 커피 한 잔 할래요?🎤</span> <span
						class="act-description">게시물을 좋아했습니다.</span> <span class="act-date">2021.08.12</span>
				</div>
			</div>
			<!-- 상품 삭제 -->
			<div class="act-list-delete-btn"></div>
		</div>

	</div>
</div>



<script>

	
	
	
	
	
</script>
