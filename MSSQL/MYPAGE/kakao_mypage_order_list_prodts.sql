/*
	Author      : Seunghwan Shin
	Create date : 2022-06-03 
	Description : 회원이 주문한 물품 자세한 사항 정보 가져와주기
	    
	History		: 2022-06-03 Seunghwan Shin	#최초 생성
				  2022-06-05 Seunghwan Shin	#화폐표시 변환
				  
	REAL DB		: exec dbo.kakao_mypage_order_list_prodts 2000001 ,'K0000000001'
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
	,	format(convert(numeric(10,2),kpt.product_price * (1-(kpt.discount_rate / 100.0))),'#,#') as prodtPrice
	,	kpp.product_buy_count as prodtBuyCount
	,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as prodtImg
	from dbo.KAKAO_PAYMENT_ORDER kpo with(nolock)
	inner join dbo.KAKAO_PRODUCT_PAYMENT kpp with(nolock) on kpo.pd_order_seq = kpp.pd_order_seq 
	inner join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpp.product_id
	inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpt.product_id = kpi.product_id
	where kpo.pd_order_detail_seq = @pd_oreder_detail_seq
	and kpp.qoouser_seq = @user_seq
	and kpi.rep_img_yn = 'Y'
	and kpi.head_img_yn = 'Y'

end





