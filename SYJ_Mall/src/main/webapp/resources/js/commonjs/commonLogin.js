
//login common function

//checking log-in state
function common_login_user_checking() {
	
	let login_answer;
	
	$.ajax({
		type: "GET",
		url: "/SYJ_Mall/kakaoUserLoginCheck.action",
		dataType: "json",
		async : false,
		success: function(result) {
			login_answer = result;
			// logon : 1
			// not logon : -1
			
		},
		error: function(a, b, c) {
			console.log(a, b, c);
		}
	});
	
	return login_answer;
}


//open the login-modal
function common_login_modal_open() {
	const scrollLocation = window.scrollY;
	$('#login-product-modal').css('top', scrollLocation + 'px');
	$(document.body).css('overflow', 'hidden');
}


//close the login-modal
function common_login_modal_close() {
	$('#login-product-modal').css('top', '-1400px');
	$(document.body).css('overflow', 'scroll');
}


//open the login-modal2 : review like btn
function common_login_modal_like_open() {
	const scrollLocation = window.scrollY;
	$('#login-product-modal-like').css('top', scrollLocation + 'px');
	$(document.body).css('overflow', 'hidden');
}


//close the login-modal2 : review like btn
function common_login_modal_like_close() {
	$('#login-product-modal-like').css('top', '-1400px');
	$(document.body).css('overflow', 'scroll');
}


//go login page
function common_go_login_page() {
	location.href = "/SYJ_Mall/login.action";	
}