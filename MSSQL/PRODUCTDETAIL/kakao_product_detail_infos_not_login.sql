/* 
	Author      : Seunghwan Shin 
	Create date : 2022-03-06   
	Description : 물품 상세 페이지 - 상품세부사항 가져오기
	     
	History	: 2022-03-06 Seunghwan Shin	#최초 생성
			  2022-03-07 Seunghwan Shin	#prodPrice 출력 타입 변경, prodStarsRemain 컬럼 추가
			  
			   
	Real DB :	exec dbo.kakao_product_detail_infos_not_login 10
				exec dbo.kakao_product_detail_infos_not_login 20
*/
alter proc dbo.kakao_product_detail_infos_not_login
	@product_id		bigint			-- 제품 고유번호
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	declare @today datetime = getdate()
	,		@prod_stars int
	,		@prod_buy_cnt int
	
	select 
		@prod_buy_cnt = count(*)
	,	@prod_stars = avg(star_score)
	from dbo.KAKAO_PRODUCT_PAYMENT with(nolock) 
	where product_id = @product_id
	and product_buy_dt between dateadd(year,-2,@today) and @today

	select 
		kpt.product_id as prodtId
	,	kpt.product_nm as prodNm
	,	kpt.product_count as prodCnt
	,	format(kpt.product_price,'#,#') as prodPrice
	,	@prod_stars as prodStars
	,	5 - @prod_stars as prodStarsRemain
	,	@prod_buy_cnt as prodBuyCnt
	,	kpt.discount_rate as discRate
	,	kpt.product_detail_info as prodtDetailInfo
	,	format(kpt.product_price * (1-(kpt.discount_rate)/100.0) ,'#,#') as dcPrice
	,	'N' cookieBasket
	,	'N' as alarmYn
	from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
	where kpt.product_id = @product_id


end

