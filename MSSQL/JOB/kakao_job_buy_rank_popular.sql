/* 
	Author      : Seunghwan Shin 
	Create date : 2022-01-02   
	Description : 인기페이지 판매량 정리 sp
	     
	History	: 2022-01-02 Seunghwan Shin	#최초 생성
			  
		
	Real DB : 
*/
CREATE proc dbo.kakao_job_buy_rank_popular
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	declare @start_dt	datetime 			
	,		@end_dt		datetime = getdate()

	set @start_dt = dateadd(yy,-2,@end_dt)
	
	begin try
		begin tran
			
			truncate table dbo.KAKAO_JOB_RANK_POPULAR

			insert into dbo.KAKAO_JOB_RANK_POPULAR
			(
				product_id
			,	buy_cnt
			)
			select
				kpt.product_id as productId
			,	count(*) as cnt
			from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
			inner join dbo.KAKAO_PRODUCT_PAYMENT kpp with(nolock) on kpt.product_id = kpp.product_id
			where kpp.product_buy_dt between @start_dt and @end_dt
			and kpp.star_score = 5
			and kpt.del_yn = 'N'
			and kpt.product_count > 0
			group by kpt.product_id


		commit tran
	end try
	begin catch
		rollback tran
	end catch

	
	

end



