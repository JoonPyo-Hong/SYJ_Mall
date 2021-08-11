
		$(document).on(
				"click",
				".etc_2",
				function(e) {
					/* 	var m_seq = parseInt($('#hid_seq').val());
						if (m_seq != 0) { */

					var seq = $(e.target).parent().parent().parent().attr('id')
							.replace("content_", "");
					location.href = "/SYJ_Mall/feed.action?seq=" + seq;
					/* 	}else{
							openModal("modal1");
						} */

				});
		$(document).on("click", ".etc_4", function(e) {
			openModal("modal2");

		});

		$('#modal_login').click(function() {
			let f = document.createElement('form');

			let obj;
			obj = document.createElement('input');
			obj.setAttribute('type', 'hidden');
			obj.setAttribute('name', 'site');
			obj.setAttribute('value', "main.action");

			f.appendChild(obj);
			f.setAttribute('method', 'post');
			f.setAttribute('action', '/SYJ_Mall/login.action');
			document.body.appendChild(f);
			f.submit();

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
		$(document)
				.on(
						"click",
						".etc_1",
						function(e) {

							var l_seq = $(e.target).parent().parent().parent()
									.attr('id').replace("content_", "");
							var m_seq = parseInt($('#hid_seq').val());
							var type = "";
							if (m_seq != 0) {
								if ($(e.target).css("background-position") == "-96px 0px") {
									$(e.target).css('background-position',
											'0px 0');
									type = "D";

								} else {
									$(e.target).css('background-position',
											'-96px 0');
									type = "I";

								}
								$.ajax({
									url : "heart_update.action",
									type : 'post',
									data : {
										list_seq : l_seq,
										member_seq : m_seq,
										gubn : type
									},
									success : function(data) {
										heart(l_seq);
									},
									error : function() {
										alert("에러");
									}
								});
							} else {
								openModal("modal1");
							}
						});

		function heart_select(a, b) {
			$.ajax({
				url : "heart_select.action",
				type : 'post',
				data : {
					list_seq : a,
					session_seq : b
				},
				success : function(data) {

					if (data != 0) {
						$("#content_" + a + " .etc_1").css(
								'background-position', '-96px 0');
					}

				},
				error : function() {
					alert("에러");
				}
			});
		}

		var count = 0;
		window.onload = function() {
			list();
		}

		window
				.addEventListener(
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
		function heart(seq) {
			$.ajax({
				url : "heart.action",
				type : 'post',
				data : {
					num : seq,
				},
				success : function(data) {

					$("#content_" + seq + " .txt_1 span")
							.text(" " + data + "개");

				},
				error : function() {
					alert("에러");
				}
			});
		}

		function img(list_seq) {

			$
					.ajax({
						url : "img.action",
						type : 'post',
						data : {
							seq : list_seq,
						},
						success : function(data) {
							for (var i = 0; i < data.length; i++) {
								$("#swiper" + list_seq + " .swiper-wrapper")
										.append(
												"<div class='swiper-slide'><img src='resources/images/main/" + data[i] + "'></img></div>");

							}
							new Swiper('#swiper' + list_seq, {
								allowTouchMove : false,
								watchOverflow : true,
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
						error : function() {
							alert("에러");
						}
					});
		}
		function main_feed(list_seq) {
			var result = new Array();
			$.ajax({
				url : "main_feed.action",
				type : 'post',
				async : false,
				data : {
					seq : list_seq,
				},
				success : function(data) {

					result.push(data.reg_id);
					result.push(data.feed);

				},
				error : function() {
					alert("에러");
				}
			});

			return result;

		}
		
		function main_feed_count(list_seq) {
		var count = 0;
			$.ajax({
				url : "main_feed_count.action",
				type : 'post',
				async : false,
				data : {
					seq : list_seq,
				},
				success : function(data) {
					count = data;
				},
				error : function() {
					alert("에러");
				}
			});

		return count;

		}

		function list() {
			count = count + 2;
			$
					.ajax({
						url : "list.action",
						type : 'post',
						data : {
							num : count,
						},
						success : function(data) {

							$(data)
									.each(
											function() {

												var txt = "";
												var gubn = ""
												if (this.gubn) {
													txt = " · ";
													gubn = this.gubn;
												}
												var result = main_feed(this.seq);
												var spn1 = result[0];
												var spn2 = result[1];
												if (typeof spn1 == "undefined") {
													spn1 = "";
													spn2 = "";
												}else{
												
													spn2 = spn2.replace('<br/>', ' ');
												
												}
										
												var count = main_feed_count(this.seq);
												
												$(".scroll")
														.append(
																"<div class ='content' id = 'content_"+this.seq +"'>"
																		+ "<div class='top'>"
																		+ "<img class='img_top' src='resources/images/main/" + this.reg_id + ".png'></img>"
																		+ "<div class='txt_top'>"
																		+ "<p>"
																		+ this.reg_id
																		+ "</p>"
																		+ "<div>"
																		+ "<span>"
																		+ gubn
																		+ "</span><span>"
																		+ txt
																		+ this.reg_dt
																		+ "</span>"
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
																		+ "<div class='part'>"
																		+ "<div class='etc'>"
																		+ "<span class='etc_1'></span>"
																		+ "<img class='etc_2' src='resources/images/main/reply-black.png'></img>"
																		+ "<span class='etc_3'>"
																		+ "</span>"
																		+ "<img class='etc_4' src='resources/images/main/share-black.png'></img>"
																		+ "</div>"
																		+ "<div class='txt_1'>좋아요"
																		+ "<span></span>"
																		+ "</div>"
																		+ "<div class='txt_2'>"
																		+ this.title
																		+ "</div>"
																		+ "<div class='txt_3'>"
																		+ this.contents
																		+ "</div>"
																		+ "<div class='txt_4'>"
																		+ "댓글 "+count+"개"
																		+ "</div>"
																		+ "<div class='txt_5'>"
																		+ "<span>"
																		+ spn1
																		+ "</span>"
																		+ spn2
																		+ "</div>"
																		+ "<div class='comment'>"
																		+ "<textarea placeholder='댓글을 달아주세요.' disabled></textarea>"
																		+ "</div>"
																		+ "</div>"
																		+ "</div>"
																		+ "</div>");
												heart_select(this.seq,
														parseInt($('#hid_seq')
																.val()));
												img(this.seq);
												heart(this.seq);
											}

									);
						},
						error : function() {
							alert("에러");
						}
					});

		}
	