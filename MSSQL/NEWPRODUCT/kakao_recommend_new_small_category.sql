/* 
	Author      : Seunghwan Shin 
	Create date : 2021-11-18  
	Description : 테마 소분류 항목들 가져오기
	     
	History	: 2021-11-18 Seunghwan Shin	#최초 생성
			  2021-11-22 Seunghwan Shin	#테마 번호가 1인경우 로직 수정
			  2021-11-25 Seunghwan Shin	#union all 추가
			  2021-11-28 Seunghwan Shin #categoryNm 의 길이 컬럼 추가
	
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
				0 as categoryNum
			,	N'전체' as categoryNm
			,	2 as categoryNmLen
			union all

			select
				category_code as categoryNum
			, 	category_nm as categoryNm
			,	len(category_nm) as categoryNmLen
			from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)
		end
		else
		begin

			select
				0 as categoryNum
			,	N'전체' as categoryNm
			,	2 as categoryNmLen

			union all

			select
				category_code as categoryNum
			, 	category_nm as categoryNm
			,	len(category_nm) as categoryNmLen
			from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)
			where main_category_code = @theme_num
		end									
end


