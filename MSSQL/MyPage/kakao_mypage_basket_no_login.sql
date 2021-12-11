/* 
	Author      : Seunghwan Shin 
	Create date : 2021-12-11  
	Description : 마이페이지 -> 장바구니 목록.(로그인 하지 않았을 경우) 
	     
	History	: 2021-12-11 Seunghwan Shin	#최초 생성
			  
	
	Real DB :	exec dbo.kakao_mypage_basket_no_login '118#117#119#31'

*/ 
create proc dbo.kakao_mypage_basket_no_login
	@basket_info varchar(3000)	-- 쿠키정보
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
	
	select
		kpt.product_id as prodId
	,	kpt.product_nm as prodNm
	,	format(kpt.product_price,'#,#') as prodPrice 
	,	format(kpt.product_price * (1-(kpt.discount_rate)/100.0) ,'#,#') as dcPrice
	,	case when kpt.discount_rate = 0 then 'N'
		else 'Y' end as dcYn
	,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as picUrl
	--,kpi.product_img as picUrl
	,	1 as buyCount
	from string_split(@basket_info,'#') ss
	inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on convert(bigint,ss.value) =  kpt.product_id
	inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpt.product_id = kpi.product_id
	where kpi.rep_img_yn = 'Y'
	and kpi.head_img_yn = 'Y'
	and kpt.product_count > 0
	
end


