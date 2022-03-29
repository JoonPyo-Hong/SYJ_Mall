/* 
	Author      : Seunghwan Shin 
	Create date : 2021-03-29   
	Description : 메인카테고리 정보 불러오기
	     
	History	: 2021-03-29 Seunghwan Shin	#최초 생성	
			  
	
	Real DB : exec dbo.kakao_product_detail_main_category_info

*/
alter proc dbo.kakao_product_detail_main_category_info
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	select distinct 
		 	kpc
	.		main_category_code 
	from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
	inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
	inner join dbo.KAKAO_PRODUCT_MAIN_CATEGORY kpmc with(nolock) on kpmc.main_category_code = kpc.main_category_code
	
end


