/* 
	Author      : Seunghwan Shin 
	Create date : 2021-10-21   
	Description : 인기페이지 상품 총 갯수 -> 페이징 처리 위함
	     
	History	: 2021-10-21 Seunghwan Shin	#최초 생성
			  
			   
	
	Real DB : exec dbo.kakao_popular_product_count
*/
CREATE proc dbo.kakao_popular_product_count
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	declare @start_dt	datetime 			
	,		@end_dt		datetime = getdate()

	set @start_dt = dateadd(yy,-1,@end_dt)

	select 
		count(*) as cnt
	from(
		select
			count(*) as cnt
		from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
		inner join dbo.KAKAO_PRODUCT_PAYMENT kpp with(nolock) on kpt.product_id = kpp.product_id
		where kpp.product_buy_dt between @start_dt and @end_dt
		and kpp.star_score = 5
		and kpt.del_yn = 'N'
		and kpt.product_count > 0
		group by kpt.product_id) as m 
	

end

