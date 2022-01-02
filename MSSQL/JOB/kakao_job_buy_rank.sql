/* 
	Author      : Seunghwan Shin 
	Create date : 2021-12-25  
	Description : 기간별 팔린물품 인덱싱
	     
	History	: 2021-12-25 Seunghwan Shin	#최초 생성
			  
	
	Real DB :	실행금지

*/ 
CREATE proc dbo.kakao_job_buy_rank
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
	declare @buy_date_past datetime = '2020-10-10'--그냥 기준으로 잡아놓은것
	declare @buy_date_present datetime = getdate()
	
	begin try
		
		begin tran
			truncate table dbo.KAKAO_JOB_RANK

			insert into dbo.KAKAO_JOB_RANK
			(
				product_id
			,	buy_cnt
			)
			select 
				product_id
			,	count(*) as cnt
			from dbo.KAKAO_PRODUCT_PAYMENT with(nolock,index="IDX__KAKAO_PRODUCT_PAYMENT__PRODUCT_BUY_DT")
			where product_buy_dt between @buy_date_past and @buy_date_present 
			group by product_id

		commit tran


	end try
	begin catch
		rollback tran
	end catch

end









