/* 
	Author      : Seunghwan Shin 
	Create date : 2022-07-09
	Description : 테마별 물품 보기 - 대분류는 존재하지만 소분류는 존재하지 않는 경우의 상품개수
	     
	History	: 2022-07-09 Seunghwan Shin	#최초 생성

	
	Real DB : exec dbo.kakao_recommend_new_theme_exists_big_categoty_count 5

*/
CREATE proc dbo.kakao_recommend_new_theme_exists_big_categoty_count
	@theme_num int
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	select count(*) from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
	inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
	where kpc.main_category_code = @theme_num

end



