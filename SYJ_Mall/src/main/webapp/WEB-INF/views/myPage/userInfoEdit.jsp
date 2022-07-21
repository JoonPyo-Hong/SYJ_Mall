<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>

<style>
.modify-info-wrap {
  padding: 30px 20px 100px;
  border-top: 1px solid rgb(227, 229, 232);
  min-height: 460px;
}

.modify-info .item-form {
  padding-bottom: 20px;
}

.modify-info .title {
  font-size: 24px;
  padding: 0px 0px 22px;
}

.modify-info .item-form label {
  display: block;
  padding-bottom: 8px;
  font-size: 15px;
  line-height: 20px;
}

.modify-info .item-form input {
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

.modify-info .btn-wrap {
  display: flex;
}

.modify-info .btn {
  margin-top: 20px;
  height: 60px;
  width: 50%;
  font-weight: bold;
  font-size: 16px;
  border-radius: 8px;
  border-color: #3c404b;
  background-color: #3c404b; 
  color: #fff;
  cursor: pointer;
}

.modify-info .cancel-btn {
  border: 1px solid rgb(227, 229, 232);
  background-color: #fff;
  color: #1e1e1e;
  margin-right: 10px;
}

.modify-info .save-btn:disabled {
  border-color: #d4d7e1;
  background-color: #d4d7e1;
  cursor: default;
}


</style>


 <div class="container-wrap modify-info-wrap" style="padding-top:80px;">
   <!-- 정보수정 입력 영역 -->
   <form class="modify-info">
     <div class="item-form">
       <div class="title">정보수정</div>
       <label for="modify-name">이름</label>
     	
     	<c:if test="${not empty userName}">  
       		<input id="modify-name" placeholder="이름 입력" value="${userName}" style="" maxlength="5" onkeyup="inputCheck()"/>
     	</c:if>
     	<c:if test="${empty userName}">  
       		<input id="modify-name" placeholder="이름 입력" value="" onkeyup="inputCheck()"/>
     	</c:if>
     
     </div>
     <div class="btn-wrap">
       <c:if test="${not empty userName}">  
	       <button class="btn cancel-btn" id="cancel-btn">
	         취소
	       </button>
	       <button class="btn save-btn" id="save-btn">
	         저장
	       </button>
       </c:if>
       <c:if test="${empty userName}">  
	       <button class="btn cancel-btn" id="cancel-btn" disabled>
	         취소
	       </button>
	       <button class="btn save-btn" id="save-btn" disabled>
	         저장
	       </button>
      </c:if>
     </div>
   </form>
 </div>
 





<script>
	
	// input 데이터 없을 시 확인 버튼 비활성화
	const inputCheck = () => {
	  const modifyName = document.getElementById("modify-name").value;
	  
	  if (modifyName) {
	    document.getElementById("save-btn").disabled = false;
	  } else {
	    document.getElementById("save-btn").disabled = true;
	  }
	};
	
	//고객의 이름을 바꿔주는 function
	
	
	
	
	

</script>
 

 