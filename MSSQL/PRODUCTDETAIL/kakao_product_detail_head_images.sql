/* 
	Author      : Seunghwan Shin 
	Create date : 2022-03-06   
	Description : 물품 상세 페이지 - 헤드 이미지 불러오기
	     
	History	: 2022-03-06 Seunghwan Shin	#최초 생성
			  
			   
	
	Real DB :	exec dbo.kakao_product_detail_head_images 10
				exec dbo.kakao_product_detail_head_images 20
*/
alter proc dbo.kakao_product_detail_head_images
	@product_id			bigint			-- 제품 고유번호
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	select 
		product_img
	from dbo.KAKAO_PRODUCT_IMG with(nolock) 
	where product_id = @product_id
	and head_img_yn = 'Y'

end


