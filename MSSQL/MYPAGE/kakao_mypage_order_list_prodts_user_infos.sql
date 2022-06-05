/*
	Author      : Seunghwan Shin
	Create date : 2022-06-05 
	Description : 주문번호에 대응되는 고객 기본정보 조회ㅏ
	    
	History		: 2022-06-05 Seunghwan Shin	#최초 생성
				  
	REAL DB		: exec dbo.kakao_mypage_order_list_prodts_user_infos 2000001, 'K0000000001'
*/
alter proc dbo.kakao_mypage_order_list_prodts_user_infos
	@qoouser_seq			bigint		-- 고객 고유번호
,	@pd_oreder_detail_seq 	varchar(30)	-- 주문 번호	
as
set nocount on
set transaction isolation level read uncommitted
begin
	
	select
		top 1
		qur.qoouser_name as userName
	,	qur.qoouser_phone_num as userPhoneNum
	,	qur.qoouser_email as userEmail
	,	kppo.destination_info as userAddr
	from dbo.KAKAO_PRODUCT_ORDER  kppo with(nolock)
	inner join dbo.KAKAO_PAYMENT_ORDER kpo with(nolock) on kppo.pd_order_detail_seq = kpo.pd_order_detail_seq
	inner join dbo.KAKAO_PRODUCT_PAYMENT kpp with(nolock) on kpo.pd_order_seq = kpp.pd_order_seq
	inner join dbo.QOO10_USER_REAL qur with(nolock) on qur.qoouser_seq = kpp.qoouser_seq
	where kpp.qoouser_seq = @qoouser_seq
	and	kpo.pd_order_detail_seq = @pd_oreder_detail_seq
	order by qur.qoouser_seq 

end

