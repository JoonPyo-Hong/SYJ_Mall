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
   <div class="modify-info">
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
   </div>
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
	
	
	$('#save-btn').click(function(){
		const user_input_name = $('#modify-name').val(); 
		
		user_name_modify(user_input_name);
	});
	
	
	//고객의 이름을 바꿔주는 function
	function user_name_modify(user_input_name) {
		
		let front_check = check_user_name(user_input_name);
		
		console.log("front_check : " + front_check); 
		
		if (front_check == true) {
			$.ajax({
				type : "POST",
				url : "/SYJ_Mall/myInfoEditedUserName.action",
				data : {
					"modifyName" : user_input_name,
				},
				dataType : "json",
				success : function(result) {
					
					if (result == 1) {
						//성공 -> 성공페이지로 보내준다.
						location.href="/SYJ_Mall/passUserEdit.action?innerText=회원의 이름변경이";
					} else if (result == 2) {
						user_input_error_response_open('이름을 확인해주세요!','한글과 영문 대 소문자를 사용하세요.<br>(특수기호,공백 사용 불가)');
					} else if (result == 3) {
						user_input_error_response_open('이름을 확인해주세요!','너무 긴 이름입니다.');
					} else {
						location.href="/SYJ_Mall/raiseErrorResult.action";
					}
				},
				error : function(a, b, c) {
					alert('error');
				}
			});
		}
	}

	
	//유저의 이름을 체크
	function check_user_name(user_name) {
		
		let nonchar = /[^가-힣a-zA-Z]/gi;//이름에 해당되는 정규식
		let number = /[0-9]/gi;//숫자 제외해줄것
		
		if (user_name != "" && number.test(user_name)) {
		    user_input_error_response_open('이름을 확인해주세요!','이름에 숫자는 사용할 수 없습니다.');
		    return false;
		}
		if (user_name != "" && nonchar.test(user_name)) {
		    user_input_error_response_open('이름을 확인해주세요!','한글과 영문 대 소문자를 사용하세요.<br>(특수기호,공백 사용 불가)');
		    return false;
		}
		if(user_name.length > 10) {
		    user_input_error_response_open('이름을 확인해주세요!','너무 긴 이름입니다.');
		    return false;
		}
		
		return true;
	}

	
	
	

</script>
 

 