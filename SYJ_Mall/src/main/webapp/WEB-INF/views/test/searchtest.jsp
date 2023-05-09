<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/newMainAsset.jsp"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
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
				
				<form id="search_enter" onsubmit="return false;">
					<input class="search-input" type="text" name="inputName" autocomplete="off"/>
				</form>
				
				<button class="search-close">취소</button>
			</div>
			<div class="search-bottom" style="overflow: scroll; height: 300px;">
				<div class="search-result" style="border: 1px solid red; overflow: scroll; height: 400px;">
					<!-- 여기서 검색엔진을 통해 품목을 불러와준다. -->
					<ul id="search-content-prod">
						<!-- 검색결과 리스트. -->
						<li class="search-content-context">test1</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	
	<script>
	
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
	
	
	function search_keyword_ajax(keyword)
	{
		$.ajax({
			type : "POST",
			url : "/SYJ_Mall/sqlServerTime.action",
			data : {
				"search_keyword": keyword
			},
			dataType : "json",
			success : function(result) {
				//기존에 존재하는 li 태그 모두 지워줌
				//$('.search-content-context').remove();
				
				//여기서 품목 불러오는 처리 수행해야함
				let prod_len = result.length;
				
				if (prod_len != 0 ) {
					for (let i = 0; i < prod_len; i++) {
						
						console.log('testing');
						//키워드가 들어가는 품목 보여주기
						$('#search-content-prod').append(
								'<li class="search-content-context">' + result[i] +'</li>'
						)
					}
				}
			},
			error : function(a, b, c) {
				console.log(a, b, c);
			}
		});
	}
	
	
	$('.search-input').on('keypress', function(e) {
	  
		if (e.which === 13) {
	    	
			const search_data = $('.search-input').val();
			
			search_keyword_ajax(search_data);
	    	
	  	}
		
	});

	
	</script>

</body>