/* 
	Author      : Seunghwan Shin 
	Create date : 2021-11-25
	Description : 추천 신규 테마 갯수 - 대분류 필터는 있고 소분류 필터는 없는 상태
	     
	History	: 2021-11-25 Seunghwan Shin	#최초 생성
	
	Real DB : exec dbo.kakao_recommend_new_theme_big_categoty_no_small_category_count 1

*/
CREATE proc dbo.kakao_recommend_new_theme_big_categoty_no_small_category_count
	@theme_num int -- 대분류 번호
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
		
	select count(*) from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
	inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
	where kpc.main_category_code = @theme_num
												
end



