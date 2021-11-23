/* 
	Author      : Seunghwan Shin 
	Create date : 2021-11-23
	Description : 추천 신규 테마 - 더보기 대분류 없고 소분류만 존재하는 상품의 갯수
	     
	History	: 2021-11-23 Seunghwan Shin	#최초 생성

	
	Real DB : exec dbo.kakao_recommend_new_theme_no_big_categoty_small_category_count 2

*/
alter proc dbo.kakao_recommend_new_theme_no_big_categoty_small_category_count
	@prodt_category int  -- 상품 카테고리
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	select count(*) from dbo.KAKAO_PRODUCT_TABLE with(nolock)
	where category_code = @prodt_category
	
end




