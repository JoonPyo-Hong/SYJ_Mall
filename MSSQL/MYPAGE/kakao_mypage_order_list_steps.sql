/*
	Author      : Seunghwan Shin
	Create date : 2022-06-04 
	Description : 회원이 주문한 물품 자세한 사항 정보 가져와주기
	    
	History		: 2022-06-04 Seunghwan Shin	#최초 생성
				  
	REAL DB		: exec dbo.kakao_mypage_order_list_prodts 2000001 ,'K0000000001'
*/
alter proc dbo.kakao_mypage_order_list_steps
	@user_seq				bigint		-- 회원 고유번호
,	@pd_oreder_detail_seq 	varchar(30)	-- 주문 번호
as
set nocount on
set transaction isolation level read uncommitted
begin
	
	
	select 
		order_stat
	from dbo.KAKAO_PAYMENT_ORDER kpo with(nolock)
	inner join dbo.KAKAO_PRODUCT_PAYMENT kpp with(nolock) on kpo.pd_order_seq = kpp.pd_order_seq 
	inner join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpp.product_id
	where kpo.pd_order_detail_seq = @pd_oreder_detail_seq
	and kpp.qoouser_seq = @user_seq


end


