/* 
	Author      : Seunghwan Shin 
	Create date : 2021-10-15   
	Description : 새로나온 친구들 상품 목록 - 로그인 시
	     
	History	: 2021-10-15 Seunghwan Shin	#최초 생성	
	
	Real DB : exec dbo.kakao_new_product 2000001,1

*/
CREATE proc dbo.kakao_new_product
	@user_seq bigint--유저 번호
,	@paging int --페이징 정보
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
		

			select
				m.product_id as prodId
			,	m.product_nm as prodNm
			,	m.product_count as prodCnt
			,	format(m.product_price,'#,#') as prodPrice
			,	m.discount_rate as discRate
			,	m.product_img as picUrl
			,	format(m.product_price * (1-(m.discount_rate)/100.0) ,'#,#') as dcPrice
			,	m.cookieBasket as cookieBasket
			,	m.alamYn as alarmYn
			from
			(
				select
					row_number() over (order by kpt.reg_dt desc) as rn
				,	kpt.product_id 
				,	kpt.product_nm 
				,	kpt.product_count 
				,	kpt.product_price 
				,	kpt.discount_rate 
				,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as product_img
				,	case when kusc.product_id is null then 'cart'
						 else 'incart' end as cookieBasket
				,	case when kuai.product_id is null then 'alarm'
						 else 'inalarm' end as alamYn
				from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
				inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
				left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock,forceseek) on kpt.product_id = kusc.product_id and kusc.qoouser_seq = @user_seq and kusc.cart_del_yn = 'N'
				left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.product_id = kpt.product_id and kuai.qoouser_seq = @user_seq and kuai.del_yn = 'N'
				where kpi.rep_img_yn = 'Y'
				and kpi.head_img_yn = 'Y'

			) as m
			where m.rn between 8*@paging-7 and 8*@paging
end


