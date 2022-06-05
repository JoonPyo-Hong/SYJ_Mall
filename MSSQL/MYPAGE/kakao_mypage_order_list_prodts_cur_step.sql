/*
	Author      : Seunghwan Shin
	Create date : 2022-06-05 
	Description : 회원이 주문한 물품들에 대응되는 주문번호에 현재 처리 상태 조회
	    
	History		: 2022-06-05 Seunghwan Shin	#최초 생성
				  
	REAL DB		: exec dbo.kakao_mypage_order_list_prodts_cur_step 'K0000000001'
*/
CREATE proc dbo.kakao_mypage_order_list_prodts_cur_step
	@pd_oreder_detail_seq 	varchar(30)	-- 주문 번호
as
set nocount on
set transaction isolation level read uncommitted
begin
	
	
	select
		order_stat
	from dbo.KAKAO_PRODUCT_ORDER with(nolock)
	where pd_order_detail_seq = @pd_oreder_detail_seq

end






