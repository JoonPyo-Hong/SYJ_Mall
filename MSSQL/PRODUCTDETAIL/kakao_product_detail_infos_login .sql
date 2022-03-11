/* 
	Author      : Seunghwan Shin 
	Create date : 2022-03-11   
	Description : 물품 상세 페이지 - 상품세부사항 가져오기(로그인 한 경우)
	     
	History	: 2022-03-10 Seunghwan Shin	#최초 생성
			  
			   
	Real DB :	exec dbo.kakao_product_detail_infos_login 2000001, 11
				exec dbo.kakao_product_detail_infos_login 2000001, 12
*/
alter proc dbo.kakao_product_detail_infos_login
	@user_seq		bigint			-- 회원 고유 번호
,	@product_id		bigint			-- 제품 고유번호
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
	,	case when kusc.cart_del_yn is null then 'N'
			 when kusc.cart_del_yn = 'Y' then 'N'
			 else 'Y' end as cookieBasket
	,	case when kuai.del_yn is null then 'N'
		     when kuai.del_yn = 'Y' then 'N'
		     else 'Y' end as alarmYn
	from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
	left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @user_seq and kusc.product_id = kpt.product_id
	left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @user_seq and kuai.product_id = kpt.product_id
	where kpt.product_id = @product_id


END
