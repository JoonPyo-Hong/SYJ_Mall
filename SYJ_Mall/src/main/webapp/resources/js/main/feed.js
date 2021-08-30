
var l_seq = $(".etc_1").parent().parent().parent().attr('id').replace(
	"content_", "");

var m_seq = parseInt($('#hid_seq').val());
var hid_name = $('#hid_name').val();

var feed_sel = "최신순";
var scroll = 0;


$(document).on("click", "#re_feed_edit_delete span", function() {
 	var temp= $(this).attr('value');
 	if(temp = "U"){
 	 alert();
 	}
});


$(document).on("click", "#re_feed_edit_img", function() {
 var temp= $(this).attr('value');
 if( $(".re_feed_edit_delete_" + temp).css("display") == "none"){
 	$(".re_feed_edit_delete_" + temp).show();
 }else{
 	$(".re_feed_edit_delete_" + temp).hide();
 }
});



function feed_delete(f_seq) {
	$.ajax({
		url: "feed_delete.action",
		type: 'post',
		data: {
			feed_seq: f_seq,
		},
		success: function(data) {
			feed_select();
		},
		error: function() {
			alert("에러");
		}
	});

}


$(document).on("click", "#btn_edit_delete span", function() {
	if ($(this).attr("id") == "C") {
		$(this).parent().hide();
		$(this).parent().prev().hide();
		$(this).parent().prev().prev().show();
		$(this).parent().prev().prev().children("#feed_edit_delete").hide();
			
		$(this).parent().next().show();
		$(this).parent().next().next().show();
		$(this).parent().next().next().next().show();
		
	}else{
		if(confirm("삭제 하시겠습니까?")){
			feed_delete($(this).parent().attr("class"));
		}
		
	}
		
	
});

$(document).on("click","#feed_edit_btn", function(){
	var txt = $(this).prev().val();
	var num = $(this).prev().attr("class");
	if(txt != ""){
	$.ajax({
		url: "feed_edit.action",
		type: 'post',
		data: {
			seq: num,
			feed: txt
		},
		success: function(data) {
		scroll = $(document).scrollTop();
		feed_select();
		},
		error: function() {
			alert("에러");
		}
	});
	
	}
	
});


$(document).on("click", "#feed_edit_delete span", function() {
	//btn_edit_delete
/*	alert($(this).parent().next().attr('id'));*/

		/*	alert($(this).parent().parent().next().next().attr('id'));
			alert($(this).parent().parent().next().attr('id'));*/
	if ($(this).attr("id") == "U") {
		$(this).parent().parent().hide();
		$(this).parent().parent().next().show();
		$(this).parent().parent().next().next().show();

	
		$(this).parent().parent().next().next().next().hide();
		$(this).parent().parent().next().next().next().next().hide();
		$(this).parent().parent().next().next().next().next().next().hide();
		$(this).parent().parent().next().next().next().next().next().hide();

	}else if($(this).attr("id") == "D"){
		
		if(confirm("삭제 하시겠습니까?")){
			feed_delete($(this).parent().attr("class"));
		}
	}
});


$(document).on("click", "#feed_edti_img_div", function() {

	if ($(this).next().css('display') === 'none') {
		$(this).next().show();
		/*				$(this).parent().next().next().next().hide();
						$(this).parent().next().next().next().next().hide();
						$(this).parent().next().next().next().next().next().hide();
						$(this).parent().next().next().next().next().next().next().hide();
						$(this).parent().next().next().next().next().next().next().next().hide();*/
	} else {
		$(this).next().hide();
		
		
	
	}

});


$(document)
	.on(
		"click",
		".feed_heart2",
		function() {
			if (m_seq == 0) {
				openModal("modal1");
				return;
			}
			var feed_heart_val = $(this).attr('value');
			var feed_like = "";
			var type;
			if ($(this).children('.feed_img').children('img')
				.attr("src") == 'resources/images/main/like-grey.png') {
				$(this)
					.children('.feed_img')
					.children('img')
					.attr("src",
						'resources/images/main/like-pink.png');
				$(this).children('.feed_like2').attr("style",
					'color:red');
				type = "I";
				if ($(this).children('.feed_like2').text() == " 좋아요 ") {

					feed_like = " 좋아요 1개 ";
				} else {
					//문자 앞뒤 공백 제거후 가운데 공백으로 나눔
					var feed_like_text = $(this).children(
						'.feed_like2').text().trim().split(
							' ');

					feed_like = " 좋아요 "
						+ (parseInt(feed_like_text[1]
							.replace('개', '')) + 1)
						+ " 개 ";
				}
			} else {
				$(this)
					.children('.feed_img')
					.children('img')
					.attr("src",
						'resources/images/main/like-grey.png');
				type = "D";
				$(this).children('.feed_like2').attr("style",
					'color:rgb(154, 154, 158)');
				//.removeClass("feed_like_selected");
				//.removeAttr('class');
				//.attr("class", '');
				if ($(this).children('.feed_like2').text() == " 좋아요 ") {

					feed_like = " 좋아요 1개 ";
				} else {
					//문자 앞뒤 공백 제거후 가운데 공백으로 나눔
					var feed_like_text = $(this).children(
						'.feed_like2').text().trim().split(
							' ');
					if (parseInt(feed_like_text[1].replace('개',
						'')) == 1) {
						feed_like = " 좋아요 "
					} else {

						feed_like = " 좋아요 "
							+ (parseInt(feed_like_text[1]
								.replace('개', '')) - 1)
							+ " 개 ";
					}
				}
			}

			$(this).children('.feed_like2').text(feed_like);
			re_feed_heart_update(feed_heart_val, type);



		});
function re_feed_heart_update(f_seq, type) {

	$.ajax({
		url: "re_feed_heart_update.action",
		type: 'post',
		data: {
			feed_seq: f_seq,
			member_seq: m_seq,
			gubn: type
		},
		success: function(data) {

		},
		error: function() {
			alert("에러");
		}
	});

}

heart_select(l_seq, m_seq);
heart(l_seq);
feed_select();

$(document).on(
	"click",
	".feed_img_class2",
	function() {
		/* alert($(this).parent().parent().attr('class')); */

		var r_seq = $(this).prev().attr('class');
		var txt = $(this).prev().val();

		if ($(this).parent().parent(".re_feed_update").css(
			"display") == "none") {
			$(this).parent().parent(".re_feed_update").show();

		} else {

			if (m_seq == 0) {
				openModal("modal1");
				return;
			}

			$.ajax({
				url: "re_feed_insert.action",
				type: 'post',
				data: {
					re_feed_seq: r_seq,
					member_seq: m_seq,
					text: txt,
					name: hid_name
				},
				success: function(data) {
					re_feed(r_seq);
				},
				error: function() {
					alert("에러");
				}
			});

			$(this).parent().parent(".re_feed_update").hide();
			$(this).prev().val('');
		}

	});

$(document).on("click", ".delete_search", function() {
	/* var test = $(this).parent().parent().parent().closest("div").attr('class'); */

	/* $(".re_feed_update *").remove(); */
	/* var myDiv = document.getElementsByClassName("re_feed_update"); */
	/* 		alert(myDiv);
			var parent = myDiv.parentNode; // 부모 객체 알아내기 
			parent.removeChild(myDiv); // 부모로부터 myDiv 객체 떼어내기 */

	$(this).parent().parent().parent().hide();
	$(this).parent().next().val("");

});

function re_feed(seq) {

	$
		.ajax({
			url: "re_feed_select.action",
			type: 'post',
			data: {
				feed_seq: seq
			},
			success: function(data) {
				if (data != "") {
					$("#feed_content_" + seq).empty();
					$
						.each(
							data,
							function(index, value) {
								var feed_heart_count = re_feed_heart(value.seq);
								if (feed_heart_count == 'NaN') {
									feed_heart_count = 0;
								}

								var feed_heart_txt = "";
								var feed_heart_img = "";
								var feed_heart_red = "";

								if (feed_heart_count == 0) {
									feed_heart_txt = "";
									feed_heart_img = "grey";
									feed_heart_red = "> 좋아요 ";
								} else {
									feed_heart_txt = " "
										+ feed_heart_count
										+ "개";
									feed_heart_img = "pink";
									feed_heart_red = " style='color:red;'> 좋아요";
								}

								var re_feed_diplay = '';

								if (value.member_seq == m_seq) {
									re_feed_diplay = "";
								} else {
									re_feed_diplay = "style = 'display: none;'";

								}
									

								$("#feed_content_" + seq)
									.append(
										"<div class='feed_content feed_content2'>"
										+ "<div id = 'feed_id'>" + value.reg_id  + "</div>"
										
										+ "<div class='comment comment_re' id='comment_re_"+value.seq +"' >"
										+ "<textarea id='feed_txt' class='" + value.seq + "' wrap='hard' placeholder='"+ "ㅇ" +"'></textarea>"
										+ "<img  src='resources/images/main/reply-off.png' id='' >"
										+ "</div>"
										+ "<div class='btn_edit_delete' class= '"+value.seq+"'><span id='D'>삭제</span><span id='C'>취소</span></div>"
										
										+ "<div class='feed_content_div2' id = 'feed_content_div2_"+value.seq+"' ><span> "
										+ value.re_feed
										+ "</span>" + "</div>"
										+ "<div><span id = 're_feed_edit_img'" + "value ='" + value.seq + "'" + re_feed_diplay + "><img class='img_re' id = 'img_re_" +value.seq+"' src='resources/images/main/edit-regular-grey.png'>"
										+ "<div id='re_feed_edit_delete' class='re_feed_edit_delete_"+value.seq+"' value = '"+value.seq+"'><span value='U' id='U'>수정</span><span value='D' id='D'>삭제</span></div>"
										+"</span></div>"
										+ "<div class= 'feed_content_div3'><span>"
										+ value.reg_dt
										+ " </span>"
										+ "<span class='feed_heart2' value='" + value.seq + "'>"
										+ "<span class='feed_img'><img src='resources/images/main/like-" + feed_heart_img + ".png'></span>"
										+ "<span class='feed_like2'"
										+ feed_heart_red
										+ feed_heart_txt
										+ "</span>"
										+ "</span>"
										+ "</div>"
										+ "</div>");
							});

				}

			},
			error: function() {
				alert("에러");
			}
		});

}
$(document).on("click", ".btn_re_feed", function() {

	if ($(this).siblings(".re_feed_update").css("display") == "none") {
		$(this).siblings(".re_feed_update").show();
	} else {
		$(this).siblings(".re_feed_update").hide();
	}

});

$(document)
	.on(
		"click",
		".feed_heart",
		function() {
			if (m_seq == 0) {
				openModal("modal1");
				return;
			}
			var feed_heart_val = $(this).attr('value');
			var feed_like = "";
			var type;
			if ($(this).children('.feed_img').children('img')
				.attr("src") == 'resources/images/main/like-grey.png') {
				$(this)
					.children('.feed_img')
					.children('img')
					.attr("src",
						'resources/images/main/like-pink.png');
				$(this).children('.feed_like').attr("style",
					'color:red');
				type = "I";
				if ($(this).children('.feed_like').text() == " 좋아요 ") {

					feed_like = " 좋아요 1개 ";
				} else {
					//문자 앞뒤 공백 제거후 가운데 공백으로 나눔
					var feed_like_text = $(this).children(
						'.feed_like').text().trim().split(' ');

					feed_like = " 좋아요 "
						+ (parseInt(feed_like_text[1]
							.replace('개', '')) + 1)
						+ " 개 ";
				}
			} else {
				$(this)
					.children('.feed_img')
					.children('img')
					.attr("src",
						'resources/images/main/like-grey.png');
				type = "D";
				$(this).children('.feed_like').attr("style",
					'color:rgb(154, 154, 158)');
				//.removeClass("feed_like_selected");
				//.removeAttr('class');
				//.attr("class", '');
				if ($(this).children('.feed_like').text() == " 좋아요 ") {

					feed_like = " 좋아요 1개 ";
				} else {
					//문자 앞뒤 공백 제거후 가운데 공백으로 나눔
					var feed_like_text = $(this).children(
						'.feed_like').text().trim().split(
							' ');
					if (parseInt(feed_like_text[1].replace('개',
						'')) == 1) {
						feed_like = " 좋아요 "
					} else {

						feed_like = " 좋아요 "
							+ (parseInt(feed_like_text[1]
								.replace('개', '')) - 1)
							+ " 개 ";
					}
				}
			}

			/* scroll = $(document).scrollTop(); */
			/* feed_select(); */

			$(this).children('.feed_like').text(feed_like);
			feed_heart_update(feed_heart_val, type);
		});

function feed_heart_update(f_seq, type) {

	$.ajax({
		url: "feed_heart_update.action",
		type: 'post',
		data: {
			feed_seq: f_seq,
			member_seq: m_seq,
			gubn: type
		},
		success: function(data) {

		},
		error: function() {
			alert("에러");
		}
	});

}
function feed_heart(seq) {
	var result = 0;
	$.ajax({
		url: "feed_heart.action",
		type: 'post',
		async: false,
		data: {
			feed_seq: seq,
		},
		success: function(data) {

			result = data;

		},
		error: function() {
			alert("에러");
		}
	});
	return result;
}
function re_feed_heart(seq) {
	var result = 0;
	$.ajax({
		url: "re_feed_heart.action",
		type: 'post',
		async: false,
		data: {
			feed_seq: seq,
		},
		success: function(data) {
			if (data == "NaN") {
				result = 0;
			}

			result = data;

		},
		error: function() {
			alert("에러");
		}
	});
	return result;
}

$('#wrap').click(
	function() {
		$(".feed_spn_2 img").attr("src",
			"resources/images/main/arrow-small-down.png");
		$('#sel_feed').hide();

	});

$('.etc_2').click(
	function() {

		$('html, body').animate({ scrollTop: 777 }, 400);



	});
$('.feed_click').click(
	function() {
		event.stopPropagation();
		if ($('#sel_feed').css('display') === 'none') {
			$(".feed_spn_2 img").attr("src",
				"resources/images/main/arrow-small-up.png");

			$('#sel_feed').show();
		} else {
			$(".feed_spn_2 img").attr("src",
				"resources/images/main/arrow-small-down.png");
			$('#sel_feed').hide();
		}
	});
$('.btn_feed').click(function(e) {
	$(".feed_spn_1").text(e.target.value);
	feed_sel = e.target.value;
	$(".btn_selected").removeClass("btn_selected");

	scroll = $(document).scrollTop();
	$(e.target).attr('class', 'btn_feed btn_selected');

	feed_select();

});
var state = true;
function feed_select() {
	$("#feed_content_div").empty();
	$
		.ajax({
			url: "feed_select.action",
			type: 'post',
			data: {
				list_seq: l_seq,
				sel: feed_sel
			},
			success: function(data) {

				$
					.each(
						data,
						function(index, value) {
							var feed_heart_count = feed_heart(value.seq);
							var feed_heart_txt = "";
							var feed_heart_img = "";
							var feed_heart_red = "";

							if (feed_heart_count == 0) {
								feed_heart_txt = "";
								feed_heart_img = "grey";
								feed_heart_red = "> 좋아요";
							} else {
								feed_heart_txt = " "
									+ feed_heart_count
									+ "개";
								feed_heart_img = "pink";
								feed_heart_red = " style='color:red;'> 좋아요";
							}
							if (state == true) {
								$("#txt_span1").text(value.reg_id);
								$("#txt_span2").text((value.feed).replace("<br/>", " "));
							}

							var feed_diplay = "";
							
							if (value.member_seq == m_seq) {
								feed_diplay = "";
							} else {
								feed_diplay = "style = 'display:none'";
							}
						
							var ph = value.feed;
							ph = ph.replace('<br/>',' ');

							state = false;
							$("#feed_content_div")
								.append(
									"<div class='feed_content' >"
									+ "<span id = 'feed_edit_img'" + " value ='" + value.seq + "'" + feed_diplay + ">"
									+ "<div id ='feed_edti_img_div'><img src='resources/images/main/edit-regular-grey.png'></div>"
									+ "<div id = 'feed_edit_delete' class= '"+value.seq+"' ><span value='U' id='U'>수정</span><span value='D' id='D'>삭제</span></div>"
									+"<input type ='hidden' id= '"+ value.feed +"' >"

									+ "</span>"

									+ "<div class='comment' id='commet_id' >"

									+ "<textarea id='feed_txt' class='" + value.seq + "' wrap='hard' placeholder='"+ ph +"'></textarea>"
									+ "<img  src='resources/images/main/reply-off.png' id='feed_edit_btn' >"
									+ "</div>"
									+ "<div id='btn_edit_delete' class= '"+value.seq+"'><span id='D'>삭제</span><span id='C'>취소</span></div>"


									+ "<div class='feed_id'>"
									+ value.reg_id
									+ "</div>"
									+ "<div class='feed_content_div2'><span>"
									+ value.feed
									+ "</span></div>"
									+ "<div><span>"
									+ value.reg_dt
									+ "</span> <span class='feed_heart' value='" + value.seq + "'><span class='feed_img'><img src='resources/images/main/like-" +
									feed_heart_img + ".png'></span>"
									+ "<span class='feed_like'"
									+ feed_heart_red
									+ feed_heart_txt
									+ " </span></span><span><span class='btn_re_feed'>답글달기</span>"
									+ "<div class='re_feed_update'style='display:none;'> "
									+ "<div class='comment comment2' >"
									+ "<span class='spn_re_img'>"
									+ "<img src='resources/images/main/delete-search.png'class='delete_search'>"
									+ "</span>"
									+ "<textarea id='feed_txt' class='" + value.seq + "' wrap='hard' placeholder='답글을 달아주세요.'></textarea>"
									+ "<img  src='resources/images/main/reply-off.png' id='feed_img' class ='feed_img_class feed_img_class2' >"
									+ "</div>"
									+ "</div>"
									+ "</span></div><span id ='feed_content_" + value.seq + "'></span></div>");

							re_feed(value.seq);

						});
				if (scroll != 0) {
					$(window).scrollTop(scroll);
				}

			},
			error: function() {
				alert("에러");
			}
		});

}

$('#feed_txt').click(function() {
	if (m_seq == 0) {
		openModal("modal1");
		return;
	}

});
$('.feed_img2').click(function() {
	
	if (m_seq == 0) {
		openModal("modal1");
		return;
	}
	if ($('#feed_txt').val() == "") {
		return;
	}
	$('#feed_txt').val("");
	feed_insert();
	
});
function feed_insert() {
	var feed_txt = $('#feed_txt').val().replace(/(?:\r\n|\r|\n)/g,
		'<br/>');

	$.ajax({
		url: "feed_insert.action",
		type: 'post',
		data: {
			list_seq: l_seq,
			member_seq: m_seq,
			feed: feed_txt,
			name: hid_name
		},
		success: function(data) {

			feed_select();

		},
		error: function() {
			alert("에러");
		}
	});

}
$(document).on("click", ".etc_4", function(e) {
	openModal("modal2");

});

function openModal(modalname) {
	document.get
	$("#modal").fadeIn(300);
	$("." + modalname).fadeIn(300);
	document.body.classList.add('s_no-scroll');
}

$("#modal, #close").on('click', function() {
	$("#modal").fadeOut(300);
	$(".modal-con").fadeOut(300);
	document.body.classList.remove('s_no-scroll');

});

$('#modal_login').click(function() {
	let f = document.createElement('form');

	let obj;
	obj = document.createElement('input');
	obj.setAttribute('type', 'hidden');
	obj.setAttribute('name', 'site');
	obj.setAttribute('value', "feed.action?seq=" + l_seq);

	f.appendChild(obj);
	f.setAttribute('method', 'post');
	f.setAttribute('action', '/SYJ_Mall/login.action');
	document.body.appendChild(f);
	f.submit();

});

$(document).on("click", ".etc_1", function(e) {

	var type = "";
	if (m_seq != 0) {
		if ($(e.target).css("background-position") == "-96px 0px") {
			$(e.target).css('background-position', '0px 0');
			type = "D";

		} else {
			$(e.target).css('background-position', '-96px 0');
			type = "I";

		}
		$.ajax({
			url: "heart_update.action",
			type: 'post',
			data: {
				list_seq: l_seq,
				member_seq: m_seq,
				gubn: type
			},
			success: function(data) {
				heart(l_seq);
			},
			error: function() {
				alert("에러");
			}
		});
	} else {
		openModal("modal1");
	}
});
function heart_select(a, b) {
	$.ajax({
		url: "heart_select.action",
		type: 'post',
		data: {
			list_seq: a,
			session_seq: b
		},
		success: function(data) {

			if (data != 0) {
				$("#content_" + a + " .etc_1").css(
					'background-position', '-96px 0');
			}

		},
		error: function() {
			alert("에러");
		}
	});
}
function heart(seq) {
	$.ajax({
		url: "heart.action",
		type: 'post',
		data: {
			num: seq,
		},
		success: function(data) {

			$("#content_" + seq + " .txt_1 span")
				.text(" " + data + "개");

		},
		error: function() {
			alert("에러");
		}
	});
}
new Swiper('#swiper1', {
	allowTouchMove: false,
	watchOverflow: true,
	pagination: { // 페이징 설정
		el: '.swiper-pagination',
		clickable: false, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation: { // 네비게이션 설정
		nextEl: '.swiper-button-next', // 다음 버튼 클래스명
		prevEl: '.swiper-button-prev', // 이번 버튼 클래스명
	},
});
