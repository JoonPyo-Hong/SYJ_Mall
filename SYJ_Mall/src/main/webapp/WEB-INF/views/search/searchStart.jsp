<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>카카오 프렌즈샵</title>
<link rel = "stylesheet" href = "resources/css/mainLayout/mainTilesLayout.css">
<link rel = "stylesheet" href = "resources/css/mainLayout/searchLayout.css">
<link rel = "stylesheet" href = "resources/css/mainLayout/orderlist.css">
</head>
<body>
	<!-- 검색 돋보기 아이콘 클릭 시 전체 검색 창-->
	<div id="search-wrap" style="overflow: scroll;">
		<div id="inner-search">
			<div class="search-form">
				<form action="searchresult.action" method="GET" id="search_enter">
					<input class="search-input" type="text" name="inputName"
						autocomplete="off" />
				</form>
				<button class="search-close">취소</button>
			</div>
			<div class="search-bottom">
				<div class="search-result">
					<!-- 여기서 검색엔진을 통해 품목을 불러와준다. -->
					<ul id="search-content-prod">
						<!-- 상품이름 리스트 -->
					</ul>
				</div>
				<div class="character-wrap">
					<ul>
						<li class="character-li" id="1"><a href="#" class="ryan"></a>
							<p>라이언</p></li>
						<li class="character-li" id="2"><a href="#" class="apeach"></a>
							<p>어피치</p></li>
						<li class="character-li" id="3"><a href="#" class="muzi"></a>
							<p>무지</p></li>
						<li class="character-li" id="4"><a href="#" class="frodo"></a>
							<p>프로도</p></li>
						<li class="character-li" id="5"><a href="#" class="neo"></a>
							<p>네오</p></li>
						<li class="character-li" id="6"><a href="#" class="tube"></a>
							<p>튜브</p></li>
						<li class="character-li" id="7"><a href="#" class="jayz"></a>
							<p>제이지</p></li>
						<li class="character-li" id="8"><a href="#" class="con"></a>
							<p>콘</p></li>
						<li class="character-li" id="9"><a href="#" class="choonsic"></a>
							<p>춘식</p></li>
						<li class="character-li" id="10"><a href="#" class="jordy"></a>
							<p>죠르디</p></li>
						<li class="character-li" id="11"><a href="#" class="scappy"></a>
							<p>스카피</p></li>
						<li class="character-li" id="12"><a href="#" class="angmond"></a>
							<p>앙몬드</p></li>
						<li class="character-li" id="13"><a href="#" class="pendajr"></a>
							<p>팬다주니어</p></li>
						<li class="character-li" id="14"><a href="#" class="kereberony"></a>
							<p>케로&베로니</p></li>
						<li class="character-li" id="15"><a href="#" class="kumdori"></a>
							<p>꿈돌이</p></li>
					</ul>
				</div>
				<hr>
				<div class="category-wrap">
					<div class="title">카테고리</div>
					<ul>
						<li class="category-li"><a href="#">전체</a></li>
						<li class="category-li"><a href="#">토이</a></li>
						<li class="category-li"><a href="#">리빙</a></li>
						<li class="category-li"><a href="#">잡화</a></li>
						<li class="category-li"><a href="#">문구</a></li>
						<li class="category-li"><a href="#">의류</a></li>
						<li class="category-li"><a href="#">디지털</a></li>
						<li class="category-li"><a href="#">여행/레져</a></li>
						<li class="category-li"><a href="#">식품</a></li>
						<li class="category-li"><a href="#">테마 기획전</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<script>

	//검색창 쓸때 이벤트
	$('.search-input').keyup(function(e){
		
		//검색글자 길이
		const SEARCHLEN = $('.search-input').val().length;
		const SEARCHVAL = $('.search-input').val();
		
		//검색글자가 있으면 .search-bottom 을 숨김
		if (SEARCHLEN == 0) {
			searchVisible(0);
		} else {
			searchVisible(1);
			
			//검색엔진 불러오기
			$.ajax({
				type : "GET",
				url : "/SYJ_Mall/searchword.action",
				data : "inputWord=" + SEARCHVAL,
				dataType : "json",
				success : function(result) {
					//기존에 존재하는 li 태그 모두 지워줌
					$('.search-content-context').remove();
					
					//여기서 품목 불러오는 처리 수행해야함
					let prodLen = result.length;
					
					if (prodLen != 0 ) {
						for (let i = 0; i < prodLen; i++) {
							//키워드가 들어가는 품목 보여주기
							$('#search-content-prod').append(
									'<li class="search-content-context"><a href="/SYJ_Mall/searchresult.action?inputName=' + result[i].inputName+'&productSeq='+result[i].productSeq +'">'
									+ result[i].searchName + '</a></li>'
							)
						}
					}
				},
				error : function(a, b, c) {
					console.log(a, b, c);
				}
			});
		}
	});
	
	
	//캐릭터 눌러줬을 경우에
	$('.character-li').click(function(){
		
		const charSeq = $(this).attr('id');
		
		location.href = "/SYJ_Mall/charAtProdtStart.action?charSeq=" + charSeq;
		
	});
	
	
	//엔터키 눌러준 경우에
	$('.search-input').keydown(function(e) {
		if (e.keyCode == 13) $('.search-input').submit();
	});
	
	//취소버튼
	$('.search-close').click(function() {
		location.href = "${lastPage}";
	});

	//검색결과에 따라 내용 숨길지 정해주는 함수
	function searchVisible(searchFlag) {
		if (searchFlag == 0) {
			$('.character-wrap').css('display', 'flex');
			$('.category-wrap').css('visibility', 'visible');
			$('.search-result').css('display', 'none');
		} else {
			$('.character-wrap').css('display', 'none');
			$('.category-wrap').css('visibility', 'hidden');
			$('.search-result').css('display', 'flex');
		}
	}
	
	</script>

</body>
</html>