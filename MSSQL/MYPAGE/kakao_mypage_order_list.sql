/*
	Author      : Seunghwan Shin
	Create date : 2022-01-01 
	Description : 회원이 주문한 물품 모든 객체 가져와주기
	    
	History		: 2022-01-01 Seunghwan Shin	#최초 생성
				  
	REAL DB		: exec dbo.kakao_mypage_order_list 2000001
*/
alter proc dbo.kakao_mypage_order_list
	@user_seq	bigint		-- 회원 고유번호
as
set nocount on
set transaction isolation level read uncommitted
begin
	
	select
		kpt.product_nm as prodtName
	,	kp.order_stat as orderState
	,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as prodtImg
	,	convert(char(10),kp.reg_dt,102) as orderDatetime
	from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
	inner join dbo.KAKAO_PRODUCT_PAYMENT kpp with(nolock) on kpt.product_id = kpp.product_id
	inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpi.product_id = kpt.product_id
	inner join dbo.KAKAO_PAYMENT_ORDER kpo with(nolock) on kpo.pd_order_seq = kpp.pd_order_seq
	inner join dbo.KAKAO_PRODUCT_ORDER kp with(nolock) on kpo.pd_order_detail_seq = kp.pd_order_detail_seq
	where kpp.qoouser_seq = @user_seq
	and kpi.rep_img_yn = 'Y'
	and kpi.head_img_yn = 'Y'
	order by orderDatetime desc
end

