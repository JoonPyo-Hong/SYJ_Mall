/* 
	Author      : Seunghwan Shin 
	Create date : 2021-12-01  
	Description : 마이페이지 - 최근본 상품
	     
	History	: 2021-12-01	Seunghwan Shin	#최초 생성

	Real DB : exec dbo.kakao_mypages_seen_data '119#118#9'

*/
alter proc dbo.kakao_mypages_seen_data
	@seen_data varchar(3000)	-- 쿠키정보
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
		
	select
		kpt.product_id as prodId
	,	kpt.product_nm as prodNm
	,	kpt.product_price as prodPrice
	,	kpt.discount_rate as discRate
	,	case when kpt.discount_rate = 0 then '0'
			 else format(kpt.product_price * (1-(kpt.discount_rate)/100.0) ,'#,#')
		end as dcPrice
	,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as picUrl
	from string_split(@seen_data,'#') ss
	inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = convert(bigint,ss.value)
	inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpi.product_id = kpt.product_id
	where kpi.rep_img_yn = 'Y'
	and   kpi.head_img_yn = 'Y'		
			
end







