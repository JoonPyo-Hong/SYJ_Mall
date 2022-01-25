
//-------------공통사용 js

//모바일 pc 체크
function device_check() {
	// 디바이스 종류 설정
	let pc_device = "win16|win32|win64|mac|macintel";

	// 접속한 디바이스 환경
	let this_device = navigator.platform;

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



// 화폐 점 찍어주기
function money_dot(money) {
	
	return money.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
}


function call_footer() {
	$('#inner-content').append(
			'<div id="kakao-footer">'
			+'<div id="inner-footer">'
			+'<div class="info-service">'
			+'		<ul>'
			+'			<li>제휴문의</li>'
			+'			<span class="footer-divider"></span>'
			+'			<li>고객문의</li>'
			+'			<span class="footer-divider"></span>'
			+'			<li>이용약관</li>'
			+'			<span class="footer-divider"></span>'
			+'			<li>개인정보처리방침</li>'
			+'			<span class="footer-divider"></span>'
			+'			<li>지식재산권보호센터</li>'
			+'		</ul>'
			+'	</div>'
			+'	<div class="logo">'
			+'		<div class="toggler">'
			+'			<span class="toggler-logo"></span> <span class="toggler-icon"></span>'
			+'		</div>'
			+'		<div class="best-family"></div>'
			+'	</div>'
			+'</div>'
			+'</div>'
	);	
}