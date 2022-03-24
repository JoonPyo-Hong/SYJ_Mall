
//Product Basket and Alarm common function


//Product Alarm checking
function prodt_alarm_checking(prodt_seq) {
	
	let answer;
	
	$.ajax({
        type:"GET",
        url: "/SYJ_Mall/kakaoProductBasketChecking.action" ,
        async: false,
        data : {"selected_prodt_seq" : prodt_seq},
        dataType : "json",
        success : function(result) {
        	
        	//1 : put the product into basket
        	//2 : throw out the product in basket 
        	//그이외 : 에러발생
        	answer = result;
        	
        },
        error: function(a,b,c) {
			console.log(a,b,c);
			return -1;
		}
    });	
    
    return answer;
}
