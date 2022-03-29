/* 
	Author      : Seunghwan Shin 
	Create date : 2022-03-27  
	Description : 해당 상품 리뷰 전체 개수
	     
	History	: 2022-03-27 Seunghwan Shin	#최초생성
	
	Real DB : exec dbo.kakao_product_detail_review_total_count 9

*/
create proc dbo.kakao_product_detail_review_total_count
	@prodt_seq		bigint		-- 상품고유 번호
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	select count(*) from dbo.KAKAO_PRODUCT_PAYMENT with(nolock)
	where review_exists_yn = 'Y'
			
end
