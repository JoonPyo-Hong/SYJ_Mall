$(document).ready(function () {
  // 왼쪽 사이드바 캐릭터 메뉴
  $("li.character-accordion-button").on("click", function () {
    $(".character-menu").css("display", "inline-block");
    $(".character-accordion-button .drop-down").css(
      "transform",
      "rotate(180deg)"
    );
  });

  // 왼쪽 사이드바 카테고리 메뉴
  $("li.category-accordion-button").on("click", function () {
    $(".category-menu").css("display", "inline-block");
    $(".category-accordion-button .drop-down").css(
      "transform",
      "rotate(180deg)"
    );
  });
});
