/* 
	Author      : Seunghwan Shin 
	Create date : 2022-06-06  
	Description : 리뷰에 좋아요 하거나 좋아요 풀때 좋아요 개수 가져오기
	     
	History	:	2022-06-06	Seunghwan Shin	#최초 생성

	
	Real DB : exec dbo.kakao_product_detail_review_like_cnt 9,264148

*/
alter proc dbo.kakao_product_detail_review_like_cnt
	@product_id			varchar(25)
,	@pd_order_seq		bigint
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
		
	select
		count(*)
	from dbo.KAKAO_PRODUCT_LIKE_USER  with(nolock)
	where pd_order_seq = @pd_order_seq
	and product_id = @product_id
	and prodt_like_yn = 'Y'
	

end
