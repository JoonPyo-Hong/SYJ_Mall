/*
	Author      : Seunghwan Shin
	Create date : 2022-06-05 
	Description : 주문번호에 대응되는 결제정보 조회
	    
	History		: 2022-06-05 Seunghwan Shin	#최초 생성
				  
	REAL DB		: exec dbo.kakao_mypage_order_list_prodts_payment_info 'K0000000001'
*/
alter proc dbo.kakao_mypage_order_list_prodts_payment_info
	@pd_oreder_detail_seq 	varchar(30)	-- 주문 번호	
as
set nocount on
set transaction isolation level read uncommitted
begin
	
	select
		(select min(pd_pay_reg_dt) from dbo.KAKAO_PAYMENT_TABLE with(nolock) where pd_order_detail_seq = @pd_oreder_detail_seq) as payDatetime
	,	isnull(format((select sum(pd_pay_amount) from dbo.KAKAO_PAYMENT_TABLE with(nolock) where pd_order_detail_seq = @pd_oreder_detail_seq) - kpo.shipment_pay,'#,#'),0) as payMoney
	,	isnull((select format(pd_pay_amount,'#,#') from dbo.KAKAO_PAYMENT_TABLE with(nolock) where pd_order_detail_seq = @pd_oreder_detail_seq and pd_pay_method = 'P1'),0)	 as payPoint
	,	format(kpo.shipment_pay,'#,#') as payShippment
	,	isnull((select format(pd_pay_amount,'#,#') from dbo.KAKAO_PAYMENT_TABLE with(nolock) where pd_order_detail_seq = @pd_oreder_detail_seq and pd_pay_method = 'P2'),0) as payGiftCard
	,	isnull(format((select pd_pay_amount from dbo.KAKAO_PAYMENT_TABLE with(nolock) where pd_order_detail_seq = @pd_oreder_detail_seq and pd_pay_method = 'P0'),'#,#'),0) as totalPayMomey
	from dbo.KAKAO_PRODUCT_ORDER kpo with(nolock)
	where kpo.pd_order_detail_seq = @pd_oreder_detail_seq


end


