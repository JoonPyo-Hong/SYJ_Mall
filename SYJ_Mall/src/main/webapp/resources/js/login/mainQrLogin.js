//mainQRLogin




/************************* QR Code Socket process *************************/
let wss;//socket Object

function openSocket(server_port,request_ip) {
		if(wss !== undefined && wss.readyState !== WebSocket.CLOSED ){
            alert("WebSocket is already opened.");
            return;
           	}
		 
		//Generate Websocekt
		wss = new WebSocket("ws://byeanma.kro.kr:"+server_port+"/SYJ_Mall/qrecho.action");
		
		wss.onopen = function(event){			
			if(event.data === undefined){
            	return;
            }
        };
        
        wss.onmessage = function(event){
            let gubun = event.data.split(",");
            
            let first = gubun[0];
            let second = gubun[1];
            
            //Generate Qrcode and making Qr image
			if (first == 'gen') {
				let qruuid = second;
	            let qrhttps = 'http://byeanma.kro.kr:'+server_port+'/SYJ_Mall/loginQrPrevCheck.action?qrhttps='+ qruuid + '&tryip=' + request_ip;
	            qrcode.makeCode(qrhttps);//qr code image making
			}   
			else if (first == 'qruuid'){
				//login pass
				QRLogin(second);
			} else if (first == 'stop') {
				closeSocket();
				location.href  = '/SYJ_Mall/qrLoginBannedMonitor.action';
			} else {
				closeSocket();
				location.href = "/SYJ_Mall/totalError.action";
			}
        };
        
        wss.onclose = function(event){
        	//closeSocket();
        }	
}

//close the Qrsocket
function closeSocket(){
	wss.close();
}

//refresh the Qrsocket
function refreshQr() {
	location.reload();
}


//Post the Qrcode Backend logic
function QRLogin(qruuid) {
	
	$('#throwUuid').val(qruuid);
	$('#last_checking_form').submit();
	
}


