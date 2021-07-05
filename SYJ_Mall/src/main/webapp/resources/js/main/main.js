
	var count = 0;
	window.onload = function() {
		list();
	}

	window.addEventListener(
					"scroll",
					function() {
						const SCROLLED_HEIGHT = window.scrollY;
						const WINDOW_HEIGHT = window.innerHeight;
						const DOC_TOTAL_HEIGHT = document.body.offsetHeight;

						const IS_BOTTOM = WINDOW_HEIGHT + SCROLLED_HEIGHT === DOC_TOTAL_HEIGHT;

						if (IS_BOTTOM) {
							console.log("스크롤바 이벤트");
							list();
						}
					});
	function img(list_seq){
		
        $.ajax({
            url: "img.action",
            type : 'post', 
            data : { 
            	seq : list_seq,
            },       	
            success: function(data){           
               for(var i = 0; i<data.length; i++){
            	   $("#swiper" + list_seq + " div").append("<div class='swiper-slide'><img src='resources/images/main/" + data[i] + "'></img></div>");
            	 
				   
				}
				new Swiper('#swiper' + list_seq, {
					pagination : { // 페이징 설정
						el : '.swiper-pagination',
						clickable : false, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
					},
					navigation : { // 네비게이션 설정
						nextEl : '.swiper-button-next', // 다음 버튼 클래스명
						prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
					},
				});
            },
            error: function(){
                alert("에러");
            }
        });
	}
	
	function list() {
		count = count + 2;
		$.ajax({
			url : "list.action",
			type : 'post',
			data : {
				num : count,
			},
			success : function(data) {
				$(".scroll").empty();
				$(data).each(function() {
					
					var txt = "";
					var gubn = ""
					if(this.gubn){
						txt = " · ";
						gubn = this.gubn;
					}
					$(".scroll").append(
					"<div class ='content'>"
					+ "<div class='top'>" 
					+ "<img class='img_top' src='resources/images/main/" + this.reg_id + ".png'></img>"
					+ "<div class='txt_top'>"
					+ "<p>" + this.reg_id + "</p>"
					+ "<div>"
					+ "<span>" + gubn + "</span><span>" + txt + this.reg_dt + "</span>"
					+ "</div>"
					+ "</div>"
					+ "</div>"
					+ "<div class='swiper-container' id='swiper"+ this.seq +"'>"
					+ "<div class='swiper-wrapper'>"
					+ "</div>"
					+ "<div class='swiper-button-next'></div>"
					+ "<div class='swiper-button-prev'></div>"
					+ "<div class='swiper-pagination'></div>"
					+ "</div>"
					+ "<div class='etc'>"
					+ "<span class='etc_1'></span>"
					+ "<img class='etc_2' src='resources/images/main/reply-black.png'></img>"
					+ "<span class='etc_3'>" 
					+ "<span class='etc_selected'></span>"
					+ "<span class='etc_unselected'></span>"
					+ "</span>"
					+ "<img class='etc_4' src='resources/images/main/share-black.png'></img>"
					+ "</div>"
					+ "<div class='txt_1'>좋아요"
					+ "<span>213개</span>"
					+ "</div>"
					+ "<div class='txt_2'>" + this.title + "</div>"
					+ "<div class='txt_3'>" + this.contents + "</div>"
					+ "<div class='txt_4'>" + "댓글 252개" + "</div>"
					+ "<div class='txt_5'>" + "<span>" + "홍*표" + "</span>" + "내용 입니다." + "</div>"
					+ "<div class='comment'>" + "<textarea placeholder='댓글을 달아주세요.' disabled></textarea>" + "</div>"
					+ "</div>"
					+ "</div>"
					);
					
					img(this.seq);
				}

				);
			},
			error : function() {
				alert("에러");
			}
		});

	}