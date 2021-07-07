//
$("input, textarea").each(function(index, item) {
	$(this).attr("autocomplete", "off");
});



//메뉴 활성화
let begin = location.href.indexOf("codestudy/");
let end = location.href.indexOf("/", begin + 11);
let selectedMenu = location.href.substring(begin + 10, end);

$(".list-group > li").removeClass("active");
$(".list-group > li").each(function(index, item) {
	if ($(item).data("name") == selectedMenu) {
		$(item).addClass("active");
	}
});



//전역 바로 가기
$(window).keydown(function() {
	if (event.keyCode == 11) {
		
	}
});