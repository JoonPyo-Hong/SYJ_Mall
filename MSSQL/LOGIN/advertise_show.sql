/* 
	Author      : Seunghwan Shin 
	Create date : 2021-05-19   
	Description : 테스트  
	     
	History	: 2021-05-19 Seunghwan Shin	#최초 생성 
			  2021-05-19 Seunghwan Shin #top(),order by 절 추가
			  2021-09-01 Seunghwan Shin #top() -> 직접 카운트해서 추가
*/ 
CREATE proc dbo.advertise_show
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
    
	declare @top_num int = 1
	select 
		@top_num = count(*)
	from dbo.ADVERTISE_INFO with(nolock)

	select top(@top_num)
		ad_seq as adSeq
	,	ad_name as adName
	,	ad_pic_url as adpPcUrl
	,	ad_url as adUrl
	,	ad_price_monthly as adPriceMonthly
	from dbo.ADVERTISE_INFO with(nolock)
	order by adPriceMonthly
	

end

