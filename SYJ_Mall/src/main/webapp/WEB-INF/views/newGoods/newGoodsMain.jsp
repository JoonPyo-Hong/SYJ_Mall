<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
body {
            
            margin: 0px auto;
            
        }

</style>
	
	<!-- 신규 -->
	<div class="swiper-container" id="newTopImg">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img src="img/banner_20210531110734_mobile_kr.jpg" alt="">
				<div class = "imginnertoptextfirst">
					선풍기 춘식이!
				</div>
				<div class = "imginnertoptextsecond">
					춘식이는 선풍기를 좋아해
				</div>
			</div>
			<div class="swiper-slide"><img src="img/banner_20210615143750_mobile_kr.jpg" alt=""></div>
			<div class="swiper-slide"><img src="img/banner_20210714085750_mobile_kr.jpg" alt=""></div>
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
				<div class="productAlram"></div>
			</div>
			<div class="productPrice">29,500 원</div>
		</div>
		<div class = "themeProduct">
			<div class="themeProductPic">
				<img src="img/20210712141042807_8809814920540_8809814920540_AW_00.jpg" alt="">
			</div>
			<div class="themeProductPicName">
				<div class="productName">춘식이 버즈 라이브/프로 케이스</div>
				<div class="productBasket"></div>
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

	var bodyLen = 2185;
	//스크롤움직일때 이벤트
	$(document).scroll(function () {

		console.log("document : " + $(document).scrollTop());
		console.log("window : " +$(window).scrollTop());
		console.log("windowHeight : " + $(window).height());
		
		//윌로 올라가기 표시
		if ($(document).scrollTop() >= 500) {
			$("#upPage").css("visibility","visible");
		} else {
			$("#upPage").css("visibility","hidden");
		}
		
		
		//스크롤이 밑바닥에 닿았을 경우
		if($(window).scrollTop() + $(window).height() == $(document).height()) {
			alert('?');
			
			const bodyHeight = parseInt($('body').css('height').replace('px',''));//바디의 높이를 구해준다.
			$('body').css('height',bodyHeight + 840);//총 바디의 길이를 늘려준다.
			
			
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
		        	+ '</div>'

					);
			}
			
			
		}
		

    });

	//위로가기 눌렀을 경우에 -> 최상단으로 올라감
	$("#upPage").click(function(){
		$("html,body").animate({
                scrollTop: 0
            }, 500);	
	});
        


</script>	
	
	
