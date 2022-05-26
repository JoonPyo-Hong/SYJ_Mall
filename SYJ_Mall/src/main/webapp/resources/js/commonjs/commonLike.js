
//like button 


//Check if the user has liked the review and Processing progress for the like button
function review_like_checking(input_info) {
	
	let answer;
	
	$.ajax({
        type:"GET",
        url: "/SYJ_Mall/kakaoReviewLikeChecking.action" ,
        async: false,
        data : {"inputInfo" : input_info},
        dataType : "json",
        success : function(result) {
        	
        	//console.log(result);
        	//1 : like
        	//2 : not like
        	//else : error
        	answer = result;
        	
        },
        error: function(a,b,c) {
			console.log(a,b,c);
			return -1;
		}
    });	
    
    return answer;
}