/* 
	Author      : Seunghwan Shin 
	Create date : 2021-12-12  
	Description : 마이페이지 -> 장바구니 목록.(로그인 한 경우) 
	    
	History	: 2021-12-12 Seunghwan Shin	#최초 생성
			  
	
	Real DB :	exec dbo.kakao_mypage_basket_login 2000001

*/ 
alter proc dbo.kakao_mypage_basket_login
	@qoouser_seq bigint	
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
	,	kusc.product_count as buyCount
	from dbo.QOO10_USER_REAL qur with(nolock)
	inner join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on qur.qoouser_seq = kusc.qoouser_seq
	inner join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kusc.product_id
	inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpt.product_id = kpi.product_id
	where qur.qoouser_seq = @qoouser_seq
	and kpi.rep_img_yn = 'Y'
	and kpi.head_img_yn = 'Y'
	and kpt.product_count > 0
	order by kusc.cart_reg_dt desc
	
	
end


