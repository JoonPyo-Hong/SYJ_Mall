/* 
	Author      : Seunghwan Shin 
	Create date : 2022-05-08   
	Description : 최근 본 상품 요기있네 - 비로그인 시
	     
	History	: 2022-05-08 Seunghwan Shin	#최초 생성
			  2022-05-09 Seunghwan Shin	#비효율적인 실행계획으로 인해 로직 변경	
	
	Real DB : exec dbo.kakao_product_detail_recent_seen_not_login '13#12#30', '13#101#22'

*/
alter proc dbo.kakao_product_detail_recent_seen_not_login
	@recent_seen_info	varchar(3000)		-- 쿠키정보(최근 본 정보)
,	@basket_info		varchar(3000)		-- 장바구니 정보	
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
			,	case when ss.value is null then 'cart'
				else 'incart' end as cookieBasket
			,	'alarm' as alarmYn
			from
			(
				select
					kpt.product_id 
				,	kpt.product_nm 
				,	kpt.product_count 
				,	kpt.product_price 
				,	kpt.discount_rate 
				,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as product_img
				from string_split(@recent_seen_info,'#') rst
				inner loop join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on convert(bigint,rst.value) = kpi.product_id
				inner join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
				inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
				inner join dbo.KAKAO_PRODUCT_MAIN_CATEGORY kpmc with(nolock) on kpmc.main_category_code = kpc.main_category_code
				where kpi.rep_img_yn = 'Y'
				and kpi.head_img_yn = 'Y'
			) as m 
			left join string_split(@basket_info,'#') ss on m.product_id = convert(bigint,ss.value)
end


