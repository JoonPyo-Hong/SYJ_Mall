
var imgs;
var img_count;
var img_position = 1;

imgs = $(".media div");
img_count = imgs.children().length;

//버튼을 클릭했을 때 함수 실행
	$('#left').click(function () {
	  back();
	});
	$('#right').click(function () {
	  next();
	});
	
	function back() {
	  if(1<img_position){
	    imgs.animate({
	      left:'+=600px'
	    });
	    img_position--;
	  }
	}
	function next() {
	  if(img_count>img_position){
	    imgs.animate({
	      left:'-=600px'
	    });
	    img_position++;
	  }
	}
		
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
            	   $("#media_" + list_seq + " div").append("<img class='media_img' src='resources/images/main/" + data[i] + "'></img>");
            	   $("#media_" + list_seq + " div").width("'"+data.length * 600 + "px'");
            	   
               }
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
					+ "<div class='media' id='media_"+ this.seq +"'>"
					+ "<div>"
					+ "<span>"
					+ "<img class='left' src='resources/images/main/arrow-medium-circle-right-white.png'></img>"
					+ "<img class='right' src='resources/images/main/arrow-medium-circle-right-white.png'></img>"
					+ "</span>"
					+ "</div>"
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
					/* alert(this.seq); */
					img(this.seq);
				}

				);
			},
			error : function() {
				alert("에러");
			}
		});

	}