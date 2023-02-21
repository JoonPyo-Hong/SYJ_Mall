



//Device check -> It distinguishes whether it is a current mobile platform or a PC platform.
function device_check() {
	
	// Set Device Type
	const pc_device = "win16|win32|win64|mac|macintel";

	// Connected Device Environment
	const this_device = navigator.platform;

	if (this_device) {

		if (pc_device.indexOf(navigator.platform.toLowerCase()) < 0) {
			//console.log('MOBILE');
			return 1;
		} else {
			//console.log('PC');
			return -1;
		}
	}
}
	$(document).on("click",".login-btn",function(){
		console.log("test");
		capcharStart();
		//packetLogin();
	});
	
	// When User pressed the login button directly

	// When attempting to log in by pressing Enter Key
	$("#inputpw").keyup(function(e) {
		if (e.keyCode == 13)
			capcharStart();
	});

	$('#mfooter_check').click(function() {
		location.reload();
	});
	
	// Login - To prevent packets from being intercepted
	function packetLogin() {

		let username = document.getElementById("inputid").value;
		let password = document.getElementById("inputpw").value;
		
		try {
			let rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
			let rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
			submitEncryptedForm(username, password, rsaPublicKeyModulus,rsaPublicKeyExponent);
			
		} catch (err) {

			alert(err);
		}
	}
	
	// When you click the login button -> Hand over data
	function submitEncryptedForm(username, password, rsaPublicKeyModulus,rsaPpublicKeyExponent) {
		
		let rsa = new RSAKey();

		rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);

		// Encrypt user IDs and passwords with RSA.
		let securedUsername = rsa.encrypt(username);
		let securedPassword = rsa.encrypt(password);

		let securedForm = document.getElementById("input_form");
		
		const device_code = device_check();// Differentiate between PC and mobile
		$('#deviceCode').val(device_code);
		
		securedForm.securedUsername.value = securedUsername;
		securedForm.securedPassword.value = securedPassword;
		
		loginAjaxCheck(securedUsername, securedPassword);
	}
	
	// Check Login Validation
	function loginAjaxCheck(securedUsername, securedPassword) {
		
		$.ajax({
			type : "POST",
			url : "/SYJ_Mall/kakaoLoginCheck.action",
			data : {
				"securedUsername" : securedUsername,
				"securedPassword" : securedPassword
			},
			dataType : "json",
			success : function(result) {

				if (result == 1) {
					$("#input_form").submit();
				} else if (result == -1){
					modal_situation("가입되지 않은 아이디이거나, 잘못된 비밀번호 입니다.");
				} else if (result == 0){
					modal_situation("로그인 접속 요청 횟수 초과입니다.");
				} else {
					modal_situation("비 정상적인 접근입니다.");
				}

			},
			error : function(a, b, c) {
				alert('error');
			}
		});
	}

	// Captcha authentication function
	function capcharStart() {
		$.ajax({
			url : '/SYJ_Mall/kakaoLoginCapcha.action',
			type : 'post',
			data : {
				recaptcha : $("#g-recaptcha-response").val()
			},
			success : function(data) {
				switch (data) {
				case 1:
					packetLogin();
					break;

				case -1:
					modal_situation('자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.');
					break;

				default:
					alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
					break;
				}
			}
		});
	}
	
	// Add modals according to the situation.
	function modal_situation(inner_text) {

		$('#modal_context').text(inner_text);

		$("#myModal").modal();

	}
	
	// Stay logged in
	$('.ico-check').click(function(){
		const login_stay_val = $('#loginSave').val();
		$('#loginSave').val(login_stay_val * -1);
	});
	
	// If you pressed the QR code
	$('.qr-login-btn').click(function(){
		location.href = "/SYJ_Mall/loginQr.action";
	});
	