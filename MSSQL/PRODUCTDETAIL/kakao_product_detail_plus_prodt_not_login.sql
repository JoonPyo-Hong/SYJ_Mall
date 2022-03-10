/* 
	Author      : Seunghwan Shin 
	Create date : 2021-03-10   
	Description : 잠깐만 이 상품은 어때요 탭 - 비로그인 시
	     
	History	: 2021-03-10 Seunghwan Shin	#최초 생성	
	
	Real DB : exec dbo.kakao_product_detail_plus_prodt_not_login '13#12#30',11 ,1
			  exec dbo.kakao_product_detail_plus_prodt_not_login '13#12#30',11 ,2
			  exec dbo.kakao_product_detail_plus_prodt_not_login '13#12#30',11 ,3
			  exec dbo.kakao_product_detail_plus_prodt_not_login '13#12#30',11 ,4

*/
alter proc dbo.kakao_product_detail_plus_prodt_not_login
	@basket_info	varchar(3000)		-- 쿠키정보
,	@prodt_seq		varchar(20)			-- 상품 번호
,	@list_sort_type varchar(20)			-- 순서조건
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
			
			declare @main_category_code int
			set @prodt_seq = convert(bigint,@prodt_seq)
			set @list_sort_type = convert(int,@list_sort_type)

			select @main_category_code = kpc.main_category_code 
			from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
			inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code

			if (@list_sort_type = 1)
			begin
				-- 날짜순
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
					and kpmc.main_category_code = @main_category_code

				) as m
				where m.rn between 1 and 4
			end
			else if (@list_sort_type = 2)
			begin
				-- 가격 낮은 순
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
						row_number() over (order by kpt.product_price asc) as rn
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
					and kpmc.main_category_code = @main_category_code

				) as m
				where m.rn between 1 and 4
			end
			else if (@list_sort_type = 3)
			begin
				--상품 개수 많은 순
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
						row_number() over (order by kpt.product_count desc) as rn
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
					and kpmc.main_category_code = @main_category_code

				) as m
				where m.rn between 1 and 4
			end
			else if (@list_sort_type = 4)
			begin
				--할인률 높은 순
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
						row_number() over (order by kpt.discount_rate desc) as rn
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
					and kpmc.main_category_code = @main_category_code

				) as m
				where m.rn between 1 and 4
			end
end


