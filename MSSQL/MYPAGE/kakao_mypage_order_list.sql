/*
	Author      : Seunghwan Shin
	Create date : 2022-01-01 
	Description : 회원이 주문한 물품 모든 객체 가져와주기
	    
	History		: 2022-01-01 Seunghwan Shin	#최초 생성
				  2022-06-02 Seunghwan Shin	#주문 상태 한글로 변경, 제품 코드 추가
				  
	REAL DB		: exec dbo.kakao_mypage_order_list 2000001
*/
alter proc dbo.kakao_mypage_order_list
	@user_seq	bigint		-- 회원 고유번호
as
set nocount on
set transaction isolation level read uncommitted
begin
	
	declare @today datetime = getdate()
	declare @start_date datetime = dateadd(year,-2,@today)

	select
		kpt.product_nm as prodtName
	,	case when kp.order_stat = 'S0' then N'주문접수'
			 when kp.order_stat = 'S1' then N'배송준비중'
			 when kp.order_stat = 'S2' then N'배송중'
			 when kp.order_stat = 'S3' then N'배송완료'
			 when kp.order_stat = 'S4' then N'구매확정'
		end as orderState
	,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as prodtImg
	,	convert(char(10),kp.reg_dt,102) as orderDatetime
	,	kpt.product_id as prodtSeq
	from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
	inner join dbo.KAKAO_PRODUCT_PAYMENT kpp with(nolock) on kpt.product_id = kpp.product_id
	inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpi.product_id = kpt.product_id
	inner join dbo.KAKAO_PAYMENT_ORDER kpo with(nolock) on kpo.pd_order_seq = kpp.pd_order_seq
	inner join dbo.KAKAO_PRODUCT_ORDER kp with(nolock) on kpo.pd_order_detail_seq = kp.pd_order_detail_seq
	where kpp.qoouser_seq = @user_seq
	and kpi.rep_img_yn = 'Y'
	and kpi.head_img_yn = 'Y'
	and kp.reg_dt between @start_date and @today
	order by orderDatetime desc
end

