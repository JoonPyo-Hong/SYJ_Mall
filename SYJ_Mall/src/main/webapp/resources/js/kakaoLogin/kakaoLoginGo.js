



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

	// When User pressed the login button directly
	$(".login-btn").click(function() {
		capcharStart();
		//packetLogin();
	});

	// When attempting to log in by pressing Enter Key
	$("#inputpw").keyup(function(e) {
		if (e.keyCode == 13)
			capcharStart();
	});

	$('#mfooter_check').click(function() {
		location.reload();
	});
	
	//로그인 - 패킷을 중간에 가로채는것을 방지하기 위함
	function packetLogin() {

		let username = document.getElementById("inputid").value;//유저가 작성한 아이디
		let password = document.getElementById("inputpw").value;//유저가 작성한 비밀번호
		
		try {
			let rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
			let rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
			submitEncryptedForm(username, password, rsaPublicKeyModulus,rsaPublicKeyExponent);
			
		} catch (err) {

			alert(err);
		}
	}
	
	//로그인 버튼 클릭시 -> 데이터를 넘겨주는 부분
	function submitEncryptedForm(username, password, rsaPublicKeyModulus,rsaPpublicKeyExponent) {
		let rsa = new RSAKey();

		rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);

		// 사용자ID와 비밀번호를 RSA로 암호화한다.
		let securedUsername = rsa.encrypt(username);
		let securedPassword = rsa.encrypt(password);

		let securedForm = document.getElementById("input_form");//form 데이터
		
		let device_code = device_check();//pc 인지 모바일인지 구분
		$('#deviceCode').val(device_code);
		
		securedForm.securedUsername.value = securedUsername;//여기서 암호화된 아이디번호를 넘겨준다.
		securedForm.securedPassword.value = securedPassword;//여기서 암호화된 비밀번호를 넘겨준다.
		
		ajaxCheck(securedUsername, securedPassword);//ajax 호출
	}
	
	//로그인 유효성 체크
	function ajaxCheck(securedUsername, securedPassword) {
		
		$.ajax({
			type : "POST",
			url : "/SYJ_Mall/userLoginVerificationCheck.action",
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
	
	//상황에 따라 맞는 모달 넣어주기
	function modal_situation(inner_text) {

		$('#modal_context').text(inner_text);

		$("#myModal").modal();

	}
	
	//로그인 상태 유지
	$('.ico-check').click(function(){
		const login_stay_val = $('#loginSave').val();
		$('#loginSave').val(login_stay_val * -1);
	});
	
	//QR 코드 로그인을 누른 경우
	$('.qr-login-btn').click(function(){
		location.href = "/SYJ_Mall/loginQr.action";
	});
	