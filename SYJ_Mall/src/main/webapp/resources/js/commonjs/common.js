
//-------------공통사용 js

//모바일 pc 체크
function device_check() {
	// 디바이스 종류 설정
	var pc_device = "win16|win32|win64|mac|macintel";

	// 접속한 디바이스 환경
	var this_device = navigator.platform;

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