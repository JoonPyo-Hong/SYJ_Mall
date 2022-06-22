
//-------------common use js
//mobile / pc checking
function device_check() {
	// device checking
	let pc_device = "win16|win32|win64|mac|macintel";

	// connected device environment
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



// dot on money
function money_dot(money) {
	return money.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
}

//delete dot on money
function not_money_dot(money) {
	return money.toString().replace(',','');
}


// find address
function search_user_addr(target) {
	
	new daum.Postcode({
		oncomplete: function(data) {
	  
	   	let roadAddr = data.roadAddress; 
		
	   	document.getElementById(target).value = roadAddr;
		
		}
	}).open();
}


//Get product information when checkbox is selected - Brings back information about an object
function getProdtInfos(prodt_seq) {
	
	$.ajax({
        type:"GET",
        url: "/SYJ_Mall/kakaoProductBasketChecking.action" ,
        async: false,
        data : {"selected_prodt_seq" : prodt_seq},
        dataType : "json",
        success : function(result) {
        	
        	//1 : put the product into basket
        	//2 : throw out the product in basket 
        	//else : error
        	answer = result;
        
        	
        },
        error: function(a,b,c) {
			console.log(a,b,c);
			return -1;
		}
    });	
} 


// footer area add
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

function call_footer_kakao(content_id) {
	$(content_id).append(
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






