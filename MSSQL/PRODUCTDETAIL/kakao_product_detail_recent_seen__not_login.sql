/* 
	Author      : Seunghwan Shin 
	Create date : 2022-05-08   
	Description : 잠깐만 이 상품은 어때요 탭 - 비로그인 시
	     
	History	: 2022-05-08 Seunghwan Shin	#최초 생성
	
	Real DB : exec dbo.kakao_product_detail_recent_seen__not_login '13#12#30'

*/
CREATE proc dbo.kakao_product_detail_recent_seen__not_login
	@basket_info		varchar(3000)		-- 쿠키정보
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
				inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
				inner join dbo.KAKAO_PRODUCT_MAIN_CATEGORY kpmc with(nolock) on kpmc.main_category_code = kpc.main_category_code
				left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) = kpt.product_id
				where kpi.rep_img_yn = 'Y'
				and kpi.head_img_yn = 'Y'

			) as m
			where m.rn between 1 and 4
end


