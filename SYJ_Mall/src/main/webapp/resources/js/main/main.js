



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
										alert("??????");
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
					alert("??????");
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
								console.log("???????????? ?????????");
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
							.text(" " + data + "???");

				},
				error : function() {
					alert("??????");
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
								pagination : { // ????????? ??????
									el : '.swiper-pagination',
									clickable : false, // ???????????? ???????????? ?????? ???????????? ??????, ????????? ????????? ?????? ?????? ??????
								},
								navigation : { // ??????????????? ??????
									nextEl : '.swiper-button-next', // ?????? ?????? ????????????
									prevEl : '.swiper-button-prev', // ?????? ?????? ????????????
								},
							});

						},
						error : function() {
							alert("??????");
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
					alert("??????");
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
					alert("??????");
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
													txt = " ?? ";
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
																		+ "<div class='txt_1'>?????????"
																		+ "<span></span>"
																		+ "</div>"
																		+ "<div class='txt_2'>"
																		+ this.title
																		+ "</div>"
																		+ "<div class='txt_3'>"
																		+ this.contents
																		+ "</div>"
																		+ "<div class='txt_4'>"
																		+ "?????? "+count+"???"
																		+ "</div>"
																		+ "<div class='txt_5'>"
																		+ "<span>"
																		+ spn1
																		+ "</span>"
																		+ spn2
																		+ "</div>"
																		+ "<div class='comment'>"
																		+ "<textarea placeholder='????????? ???????????????.' disabled></textarea>"
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
							alert("??????");
						}
					});

		}
	