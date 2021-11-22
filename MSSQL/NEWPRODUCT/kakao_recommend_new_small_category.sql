/* 
	Author      : Seunghwan Shin 
	Create date : 2021-11-18  
	Description : 테마 소분류 항목들 가져오기
	     
	History	: 2021-11-18 Seunghwan Shin	#최초 생성
			  2021-11-22 Seunghwan Shin	#테마 번호가 1인경우 로직 수정
	
	Real DB : exec dbo.kakao_recommend_new_small_category 2

*/
alter proc dbo.kakao_recommend_new_small_category
	@theme_num int	-- 테마번호
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
		
		if(@theme_num = '1')
		begin
			select
				category_code as categoryNum
			, 	category_nm as categoryNm
			from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)
		end
		else
		begin
			select
				category_code as categoryNum
			, 	category_nm as categoryNm
			from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)
			where main_category_code = @theme_num
		end									
end







