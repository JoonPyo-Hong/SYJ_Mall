/* 
	Author      : Seunghwan Shin 
	Create date : 2021-11-24   
	Description : 추천 신규 테마 대분류 이름
	     
	History	:	2021-11-24 Seunghwan Shin	#최초 생성
				2021-11-27 Seunghwan Shin	#최초 생성

	Real DB : exec dbo.kakao_recommend_new_theme_big_category_name 1

*/
alter proc dbo.kakao_recommend_new_theme_big_category_name
	@theme_num int	-- 테마 번호
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
			
	select
		main_category_code as categoryCode
	,	main_category_nm as bigCatNm
	,	case when main_category_code = @theme_num then 'Y' else 'N' end as selected
	,	category_rep_img as catRepImg
	from dbo.KAKAO_PRODUCT_MAIN_CATEGORY with(nolock)
	
end





