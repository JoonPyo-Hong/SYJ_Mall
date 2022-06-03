/*
	Author      : Seunghwan Shin
	Create date : 2022-06-03 
	Description : 회원이 주문한 물품 자세한 사항 정보 가져와주기
	    
	History		: 2022-06-03 Seunghwan Shin	#최초 생성
				  
	REAL DB		: exec dbo.kakao_mypage_order_list_detail 2000001 ,'K0000000001'
*/
alter proc dbo.kakao_mypage_order_list_prodts
	@user_seq				bigint		-- 회원 고유번호
,	@pd_oreder_detail_seq 	varchar(30)	-- 주문 번호
as
set nocount on
set transaction isolation level read uncommitted
begin
	
	
	select 
		kpt.product_id as prodtSeq
	,	kpt.product_nm as prodtName
	,	kpt.product_price * (1-(kpt.discount_rate / 100.0)) as prodtPrice
	,	kpp.product_buy_count as prodtBuyCount
	from dbo.KAKAO_PAYMENT_ORDER kpo with(nolock)
	inner join dbo.KAKAO_PRODUCT_PAYMENT kpp with(nolock) on kpo.pd_order_seq = kpp.pd_order_seq 
	inner join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpp.product_id
	where kpo.pd_order_detail_seq = @pd_oreder_detail_seq
	and kpp.qoouser_seq = @user_seq


end


select 
	kp.pd_order_detail_seq as orderDetailSeq
,	kp.order_stat as orderStep
,	
from dbo.KAKAO_PRODUCT_ORDER kp with(nolock)
inner join dbo.KAKAO_PAYMENT_ORDER kpo with(nolock) on kpo.pd_order_detail_seq = kp.pd_order_detail_seq
inner join dbo.KAKAO_PRODUCT_PAYMENT kpp with(nolock) on kpp.pd_order_seq = kpo.pd_order_seq
inner join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpp.product_id
inner join dbo.QOO10_USER_REAL qur with(nolock) on qur.qoouser_seq = kpp.qoouser_seq
where qur.qoouser_seq = 2000001
and kp.pd_order_detail_seq = 'K0000000001'


select 
	kpt.product_id as prodtSeq
,	kpt.product_nm as prodtName
,	kpt.product_price * (1-(kpt.discount_rate / 100.0)) as prodtPrice
,	kpp.product_buy_count as prodtBuyCount
from dbo.KAKAO_PAYMENT_ORDER kpo with(nolock)
inner join dbo.KAKAO_PRODUCT_PAYMENT kpp with(nolock) on kpo.pd_order_seq = kpp.pd_order_seq 
inner join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpp.product_id
where kpo.pd_order_detail_seq = 'K0000000001'
and kpp.qoouser_seq = 2000001


select * from dbo.KAKAO_PRODUCT_TABLE with(nolock)


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




select * from dbo.KAKAO_PRODUCT_ORDER with(nolock)



	
sp_help KAKAO_PAYMENT_ORDER