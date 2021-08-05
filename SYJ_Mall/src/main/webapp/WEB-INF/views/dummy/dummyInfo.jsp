<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/mainasset.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
 #inputmain {
            /* border: 1px solid red; */
            width:1900px;
            margin: 0px auto;
            height:90px;
        }
        .container {
            /* border: 1px solid blue; */
            width:1800px;
            height:40px;
            margin: 0px auto;
            display:flex;
            /* 주축방향 정렬 */
            justify-content: center;
            align-items: center;

        }
        .item {
            height: 40px;
            border: 1px solid #AEAEAF;
            /* border: 1px solid cornflowerblue; */
            display:flex;
            border-top: 0px;
            justify-content: center;
            align-items: center;
        }

        .container > .item:nth-child(1) {
            /* background-color: red; */
            width: 150px;
        }
        .container > .item:nth-child(2) {
            /* background-color: red; */
            width: 150px;
        }
        .container > .item:nth-child(3) {
            /* background-color: red; */
            width: 60px;
        }
        .container > .item:nth-child(4) {
            /* background-color: red; */
            width: 60px;
        }
        .container > .item:nth-child(5) {
            /* background-color: red; */
            width: 60px;
        }
        .container > .item:nth-child(6) {
            /* background-color: red; */
            width: 100px;
        }
        .container > .item:nth-child(6) > select{
            
            outline: none;
            margin: 0px auto;
            width: 100px;
        }
        .container > .item:nth-child(7) {
            /* background-color: red; */
            width: 120px;
        }
        .container > .item:nth-child(8) {
            /* background-color: red; */
            width: 120px;
        }
        .container > .item:nth-child(9) {
            /* background-color: red; */
            width: 150px;
        }
        .container > .item:nth-child(10) {
            /* background-color: red; */
            width: 150px;
        }
        .container > .item:nth-child(11) {
            /* background-color: red; */
            width: 150px;
        }
        .container > .item:nth-child(12) {
            /* background-color: red; */
            width: 150px;
        }
        .container > .item:nth-child(13) {
            /* background-color: red; */
            width: 150px;
        }
        
        #btnss {
            /* border:1px solid red; */
            margin: 10px auto;
            width:100px;
            height: 40px;
            padding-top: 5px;
        }
        #finalbtns {
           margin: 10px auto;
            width:100px;
            height: 40px;
            padding-top: 5px; 
        }
        
        input{
            width:50px;
            /* border:0px; */
            height: 30px;
        }
        select {
             height: 30px;
        }

</style>

</head>
<body>
	
	<form id = "inputmain" action="/SYJ_Mall/dummyInfoGo.action" method="post">
        <div class="container" id="title">
            <div class="item">소분류</div>
            <div class="item">상품이름</div>
            <div class="item">상품수량</div>
            <div class="item">제품가격</div>
            <div class="item">할인률</div>
            <div class="item">추천상품여부</div>
            <div class="item">연관캐릭터1</div>
            <div class="item">연관캐릭터2</div>
            <div class="item">대표이미지</div>
            <div class="item">헤드이미지1</div>
            <div class="item">헤드이미지2</div>
            <div class="item">헤드이미지3</div>
            <div class="item">헤드이미지4</div>
        </div>
        
    </form>
    
    <div id="btnss">
        <button id = "btns">ADD+</button>
    </div>


    <div id="finalbtns">
        <button id = "checkbtns" style="background-color : red; color : white;">등록(CAUTION)</button>
    </div>
    
    
    
    
    
    
    <script>
         
        var num = 1;

         $(document).on('click','#btns',function(){
            const inputmainHeight = parseInt($("#inputmain").css('height').replace('px','')) + 42;
            $("#inputmain").css('height',inputmainHeight);
            num++;
            const container_id = "cont" + num;

            $('#inputmain').append(

               '<div class="container" id="' +container_id +'">'
        +'    <div class="item">'
        +'        <select name="product_category" id="product_category" style="width:140px;">'
        +'            <option value="1">미니인형</option>'
        +'            <option value="2">중형인형</option>'
        +'            <option value="3">대형인형</option>'
        +'            <option value="4">피규어/브릭</option>'
        +'            <option value="5">패브릭</option>'
        +'            <option value="6">주방용품</option>'
        +'            <option value="7">컵/텀블러</option>'
        +'            <option value="8">차량용품</option>'
        +'            <option value="9">생활소품</option>'
        +'            <option value="10">미용/욕실용품</option>'
        +'            <option value="11">가방</option>'
        +'            <option value="12">파우치/지갑</option>'
        +'            <option value="13">신발</option>'
        +'            <option value="14">패션소품</option>'
        +'            <option value="15">시즌용품</option>'
        +'            <option value="16">필기구</option>'
        +'            <option value="17">필통/케이스</option>'
        +'            <option value="18">노트/메모</option>'
        +'            <option value="19">스티커</option>'
        +'            <option value="20">데스크 소품</option>'
        +'            <option value="21">여성</option>'
        +'            <option value="22">남성</option>'
        +'            <option value="23">키즈</option>'
        +'            <option value="24">소형 전자</option>'
        +'            <option value="25">PC/노트북 액새서리</option>'
        +'            <option value="26">휴대폰 케이스</option>'
        +'            <option value="27">휴대폰 악세서리</option>'
        +'            <option value="28">무선이어폰 케이스</option>'
        +'            <option value="29">무선이어폰 액세서리</option>'
        +'            <option value="30">여행</option>'
        +'            <option value="31">레져</option>'
        +'            <option value="32">스낵</option>'
        +'            <option value="33">음료</option>'
        +'        </select>'
        +'    </div>'
        +'    <div class="item">'
        +'        <input type="text" style="width:140px;" name="product_nm" id="product_nm" value="none">'
        +'    </div>'
        +'    <div class="item">'
        +'        <input type="text" name="product_count" id="product_count">'
        +'    </div>'
        +'    <div class="item">'
        +'        <input type="text" name="product_price" id="product_price">'
        +'    </div>'
        +'    <div class="item">'
        +'        <input type="text" value="0" name="product_discount" id="product_discount">'
        +'    </div>'
        +'    <div class="item">'
        +'        <select name="rep_yn" id="rep_yn">'
        +'            <option value="Y">Y</option>'
        +'            <option value="N">N</option>'
        +'        </select>'
        +'    </div>'
        +'    <div class="item">'
        +'        <select name="prodt_char_1" id="prodt_char_1" style="width:110px;">'
        +'            <option value="1">라이언</option>'
        +'            <option value="2">어피치</option>'
        +'            <option value="3">무지</option>'
        +'            <option value="4">프로도</option>'
        +'            <option value="5">네오</option>'
        +'            <option value="6">튜브</option>'
        +'            <option value="7">제이지</option>'
        +'            <option value="8">콘</option>'
        +'            <option value="9">춘식</option>'
        +'            <option value="10">죠르디</option>'
        +'            <option value="11">스카피</option>'
        +'            <option value="12">앙몬드</option>'
        +'            <option value="13">팬다주니어</option>'
        +'            <option value="14">케로베로니</option>'
        +'            <option value="15">꿈돌이</option>'
        +'        </select>'
        +'    </div>'
        +'    <div class="item">'
        +'        <select name="prodt_char_2" id="prodt_char_2" style="width:110px;">'
        +'            <option value="0">미선택</option>'
        +'            <option value="1">라이언</option>'
        +'            <option value="2">어피치</option>'
        +'            <option value="3">무지</option>'
        +'            <option value="4">프로도</option>'
        +'            <option value="5">네오</option>'
        +'            <option value="6">튜브</option>'
        +'            <option value="7">제이지</option>'
        +'            <option value="8">콘</option>'
        +'            <option value="9">춘식</option>'
        +'            <option value="10">죠르디</option>'
        +'            <option value="11">스카피</option>'
        +'            <option value="12">앙몬드</option>'
        +'            <option value="13">팬다주니어</option>'
        +'            <option value="14">케로베로니</option>'
        +'            <option value="15">꿈돌이</option>'
        +'        </select>'
        +'    </div>'
        +'    <div class="item">'
        +'        <input type="text" style="width:140px;" name="rep_img" id="rep_img" value="none">'
        +'    </div>'
        +'    <div class="item">'
        +'        <input type="text" style="width:140px;" name="head_img1" id="head_img1" value="none">'
        +'    </div>'
        +'    <div class="item">'
        +'        <input type="text" style="width:140px;" name="head_img2" id="head_img2" value="none">'
        +'    </div>'
        +'    <div class="item">'
        +'        <input type="text" style="width:140px;" name="head_img3" id="head_img3" value="none">'
        +'    </div>'
        +'    <div class="item">'
        +'        <input type="text" style="width:140px;" name="head_img4" id="head_img4" value="none">'
        +'    </div>'
        +'</div>'

            )

         });
		
         $("#finalbtns").click(function(){
        	 $("#inputmain").submit();
         });
         
         

    </script>
	
	
</body>
</html>