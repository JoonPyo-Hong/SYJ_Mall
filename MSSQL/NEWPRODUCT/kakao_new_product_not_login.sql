/* 
	Author      : Seunghwan Shin 
	Create date : 2021-10-13   
	Description : 새로나온 친구들 상품 목록 - 비로그인 시
	     
	History	: 2021-10-13 Seunghwan Shin	#최초 생성	
	
	Real DB : exec dbo.kakao_new_product_not_login '13#12#30',1

*/
CREATE proc dbo.kakao_new_product_not_login
	@basket_info varchar(3000)	-- 쿠키정보
,	@paging varchar(10) --페이징 정보
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
		
			declare @paging_int int = convert(int,@paging)

			select
				m.product_id as prodId
			,	m.product_nm as prodNm
			,	m.product_count as prodCnt
			,	format(m.product_price,'#,#') as prodPrice
			,	m.discount_rate as discRate
			,	m.product_img as picUrl
			,	format(m.product_price * (1-(m.discount_rate)/100.0) ,'#,#') as dcPrice
			,	m.cookieBasket as cookieBasket
			,	'alarm' as alarmYn
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
				,	case when ss.value is null then 'cart'
						 else 'incart' end as cookieBasket
				from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
				inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
				left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) = kpt.product_id
				where kpi.rep_img_yn = 'Y'
				and kpi.head_img_yn = 'Y'

			) as m
			where m.rn between 8*@paging_int-7 and 8*@paging_int
end


