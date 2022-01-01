/*
	Author      : Seunghwan Shin
	Create date : 2022-01-01 
	Description : 회원이 주문한 물품 어떤 날짜가 있는지 가져와주기
	    
	History		: 2022-01-01 Seunghwan Shin	#최초 생성
				  
	REAL DB		: exec dbo.kakao_mypage_order_list_date 2000001
*/
alter proc dbo.kakao_mypage_order_list_date
	@user_seq	bigint		-- 회원 고유번호
as
set nocount on
set transaction isolation level read uncommitted
begin
	
	select
		concat(year(kp.reg_dt),'.',month(kp.reg_dt),'.',day(kp.reg_dt)) as order_date
	from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
	inner join dbo.KAKAO_PRODUCT_PAYMENT kpp with(nolock) on kpt.product_id = kpp.product_id
	inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpi.product_id = kpt.product_id
	inner join dbo.KAKAO_PAYMENT_ORDER kpo with(nolock) on kpo.pd_order_seq = kpp.pd_order_seq
	inner join dbo.KAKAO_PRODUCT_ORDER kp with(nolock) on kpo.pd_order_detail_seq = kp.pd_order_detail_seq
	where kpp.qoouser_seq = @user_seq
	and kpi.rep_img_yn = 'Y'
	and kpi.head_img_yn = 'Y'
	group by year(kp.reg_dt),month(kp.reg_dt), day(kp.reg_dt)
	order by order_date desc

end
