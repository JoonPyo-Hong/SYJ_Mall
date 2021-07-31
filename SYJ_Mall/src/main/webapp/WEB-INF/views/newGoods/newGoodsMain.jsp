<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/mainasset.jsp" %>
<style>
body {
            
            margin: 0px auto;
            
        }

</style>
	
	<!-- 신규 -->
	<div class="swiper-container" id="newTopImg">
		<div class="swiper-wrapper">
			
			<c:forEach var="dto" items="${dtoList}">
				<div class="swiper-slide" id="${dto.product_code}">
					<img src= "${dto.promotion_img}" alt=""> 
					<div class = "imginnertoptextfirst">
						${dto.banner_img_title}
					</div>
					<div class = "imginnertoptextsecond">
						${dto.banner_img_detail}
					</div> 
				</div>
			</c:forEach>	
		</div>
	</div>
	
	<div id = "topPage" class="swiper-pagination"></div>	
	
	<div class="splitline"></div>

	<!-- 추천신규 테마 -->
	<div id = "recommendTheme">
		<div id ="recommendThemetitle">추천 신규 테마</div>
		<div id ="recommendThemesubtitle">춘식</div>

		<div class = "themeProduct">
			<div class="themeProductPic">
				<img src="img/20210712141042807_8809814920540_8809814920540_AW_00.jpg" alt="">
			</div>
			<div class="themeProductPicName">
				<div class="productName">춘식이 버즈 라이브/프로 케이스</div>
				<div class="productAlram"><button class="icofont-alarm"></button></div>
			</div>
			<div class="productPrice">29,500 원</div>
		</div>
		<div class = "themeProduct">
			<div class="themeProductPic">
				<img src="img/20210712141042807_8809814920540_8809814920540_AW_00.jpg" alt="">
			</div>
			<div class="themeProductPicName">
				<div class="productName">춘식이 버즈 라이브/프로 케이스</div>
				<div class="productBasket"><button class="icofont-bag"></button></div>
			</div>
			<div class="afterPrice">30% 20,000 원</div>
			<div class="beforePrice">30,000 원</div>
		</div>
		<div class = "themeProduct">
			<div class="themeProductPic"></div>
			<div class="themeProductPicName"></div>
		</div>
		<div class = "themeProduct">
			<div class="themeProductPic"></div>
			<div class="themeProductPicName"></div>
		</div>
		<div class = "themeProduct">
			<div class="themeProductPic"></div>
			<div class="themeProductPicName"></div>
		</div>
		<div class = "themeProduct">
			<div class="themeProductPic"></div>
			<div class="themeProductPicName"></div>
		</div>
		<div class = "themeProduct">
			<div class="themeProductPic"></div>
			<div class="themeProductPicName"></div>
		</div>
		<div class = "themeProduct">
			<div class="themeProductPic"></div>
			<div class="themeProductPicName"></div>
		</div>
	</div>

	<div id="addView">
		<button>더 보기+</button>
	</div>

	<div class="splitline"></div>

	<!-- 새로나온 친구들 -->
	<div id = "newPresentFriend">
		<div id ="recommendThemetitle">오늘 업데이트 했어요</div>
		<div id ="recommendThemesubtitle">새로나온 친구들</div>

		<div class = "themeProduct">
			<div class="themeProductPic">
				<img src="img/20210712141042807_8809814920540_8809814920540_AW_00.jpg" alt="">
			</div>
			<div class="themeProductPicName">
				<div class="productName">춘식이 버즈 라이브/프로 케이스</div>
				<div class="productAlram"><button class="icofont-alarm"></button></div>
			</div>
			<div class="productPrice">29,500 원</div>
		</div>
		<div class = "themeProduct">
			<div class="themeProductPic">
				<img src="img/20210712141042807_8809814920540_8809814920540_AW_00.jpg" alt="">
			</div>
			<div class="themeProductPicName">
				<div class="productName">춘식이 버즈 라이브/프로 케이스</div>
				<div class="productBasket"><button class="icofont-bag"></button></div>
			</div>
			<div class="afterPrice">30% 20,000 원</div>
			<div class="beforePrice">30,000 원</div>
		</div>
		<div class = "themeProduct">
			<div class="themeProductPic"></div>
			<div class="themeProductPicName"></div>
		</div>
		<div class = "themeProduct">
			<div class="themeProductPic"></div>
			<div class="themeProductPicName"></div>
		</div>
		<div class = "themeProduct">
			<div class="themeProductPic"></div>
			<div class="themeProductPicName"></div>
		</div>
		<div class = "themeProduct">
			<div class="themeProductPic"></div>
			<div class="themeProductPicName"></div>
		</div>
		<div class = "themeProduct">
			<div class="themeProductPic"></div>
			<div class="themeProductPicName"></div>
		</div>
		<div class = "themeProduct">
			<div class="themeProductPic"></div>
			<div class="themeProductPicName"></div>
		</div>
	</div>



	<div id="upPage">↑</div>

  <script>
    
	//동적으로 생성된태그 해결법
  	$(document).on("click",".themeProduct",function(){
	 	alert("asd"); 
  	});
	
  	$(document).on("click",".productBasket",function(e){
  		alert("goods");
  		e.stopPropagation();
  		
  	});
	
	//productAlram
	$(document).on("click",".productAlram",function(e){
  		alert("goods");
  		e.stopPropagation();
  		
  	});
	
  
/*   	$(".themeProductPic").click(function(){
  		alert('asd');
  	}); */
  
  	//클릭했을때 상품 설명 페이지로 이동해 줄것이다.
  	$(".swiper-slide").click(function(){
		alert($(this));//정상적으로 작동함  
  	});
  
  
	$(".icofont-alarm").click(function(){
		const id = $(this).attr('id');
		// console.log($(this).attr('id'));
		alarmSwitch(id);
	});

	//알람의 색을 바꿔주는 역할
	function alarmSwitch(id) {
		$('#' + id).css('color','#FF447F');
	}


    var mySwiper = new Swiper('.swiper-container',{
	
       loop:false,
       watchOverflow : true,
       
        //자동 스크롤링
       	autoplay: {
            delay : 3000
        }, 

       //페이징
       pagination: {
            //페이지 기능
            el: '.swiper-pagination',
            //클릭 가능여부
            clickable:true,
            type:'fraction'
			
       }, 
       
       navigation : {
           //다음페이지 설정
           nextEl:'.sipwer-button-next',

           //이전페이지 설정
           prevEl:'.swiper-button-prev'
       },
    });
	
    
    
	  
      //스크롤 바닥 감지 - 모바일용
	   window.onscroll = function(e) {
	      
	      
		 //추가되는 임시 콘텐츠
	   		if ($(document).scrollTop() >= 500) {
        		$("#upPage").css("visibility","visible");
      		} else {
         		$("#upPage").css("visibility","hidden");
      		}
	      
	    	//window height + window scrollY 값이 document height보다 클 경우, -> 무한스크롤 : ios 버전
		    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
		    	  
		    	  
		   		const bodyHeight = parseInt($('body').css('height').replace('px',''));//바디의 높이를 구해준다.
		        $('body').css('height',bodyHeight + 840);//총 바디의 길이를 늘려준다.

		    	  //실행할 로직 (콘텐츠 추가)
		        for (var i = 0; i < 6; i++) {
            		$('#newPresentFriend').append(

               '<div class = "themeProduct" id="' +i+ '">'
                  + '<div class="themeProductPic">'
                  + '<img src="img/20210712141042807_8809814920540_8809814920540_AW_00.jpg" alt="">'
                  + '</div>'
                  + '<div class="themeProductPicName">'
                  + '<div class="productName">춘식이 버즈 라이브/프로 케이스</div>'
                  + '<div class="productBasket"><button class="icofont-bag"></button></div>'
                  + '</div>'
                  + '<div class="afterPrice">30% 20,000 원</div>'
                  + '<div class="beforePrice">30,000 원</div>'
                 + '</div>');
         		}
		     }
	      
	  	}; 
	  
	 
	  //모바일 pc 체크
	  function device_check() {
		    // 디바이스 종류 설정
		    var pc_device = "win16|win32|win64|mac|macintel";
		 
		    // 접속한 디바이스 환경
		    var this_device = navigator.platform;
		 
		    if ( this_device ) {
		 
		        if ( pc_device.indexOf(navigator.platform.toLowerCase()) < 0 ) {
		            //console.log('MOBILE');
		            return 1;
		        } else {
		            //console.log('PC');
		            return -1;
		        }
		    }
		}

	  
	  
	//위로가기 눌렀을 경우에 -> 최상단으로 올라감
	$("#upPage").click(function(){
		$("html,body").animate({
                scrollTop: 0
            }, 500);	
	});
        


</script>	
	
	
