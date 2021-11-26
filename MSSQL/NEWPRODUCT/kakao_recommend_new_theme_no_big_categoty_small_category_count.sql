/* 
	Author      : Seunghwan Shin 
	Create date : 2021-11-23
	Description : 추천 신규 테마 - 더보기 대분류 없고 소분류만 존재하는 상품의 갯수
	     
	History	:	2021-11-23 Seunghwan Shin	#최초 생성
				2021-11-26 Seunghwan Shin	#KAKAO_PRODUCT_CATEGORY 조인테이블 추가
				2021-11-27 Seunghwan Shin	#분기처리 추가

	
	Real DB : exec dbo.kakao_recommend_new_theme_no_big_categoty_small_category_count 2, 2

*/
CREATE proc dbo.kakao_recommend_new_theme_no_big_categoty_small_category_count
	@prodt_category int  -- 상품 카테고리 소분류
,	@theme			int	 -- 상품 카테고리 대분류
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	if (@theme = 1)
	begin
		select count(*) from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
		inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpc.category_code = kpt.category_code
		where kpc.category_code = @prodt_category
	end
	else
	begin
		select count(*) from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
		inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpc.category_code = kpt.category_code
		where kpc.category_code = @prodt_category
		and	  kpc.main_category_code = @theme
	end
	
	
end


