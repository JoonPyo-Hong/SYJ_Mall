/* 
	Author      : Seunghwan Shin 
	Create date : 2021-11-27
	Description : 추천 신규 테마 비로그인 상태(더보기 기능) - 대분류 필터는 없는 상태 소분류 필터는 있는 상태
	     
	History	:	2021-11-27 Seunghwan Shin	#최초 생성
				2021-12-26 Seunghwan Shin	#인덱싱 테이블 수정
	
	Real DB : exec dbo.kakao_recommend_new_theme_no_login_add_no_big_category_small_category '119#118#9', '2', '1', '1'

*/
alter proc dbo.kakao_recommend_new_theme_no_login_add_no_big_category_small_category
	@basket_info varchar(3000)	-- 쿠키정보
,	@prod_catgry varchar(10)	-- 소분류번호
,	@sorted_option varchar(10)	-- 정렬옵션
,	@paging varchar(10)			-- 페이징 번호
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
			
			declare @sorted_option_int int = convert(int,@sorted_option)
			,		@paging_int int = convert(int,@paging)
			,		@prod_catgry_int int = convert(int,@prod_catgry)


				--판매량 순
				if(@sorted_option_int = 1)
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
					,	m.category_nm as categoryNm
					,	'alarm' as alarmYn
					from
					(
						select
							row_number() over (order by kjr.buy_cnt desc) as rn
						,	kpt.product_id 
						,	kpt.product_nm 
						,	kpt.product_count 
						,	kpt.product_price 
						,	kpt.discount_rate 
						,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as product_img
						,	kpc.category_nm
						,	case when ss.value is null then 'cart'
								 else 'incart' end as cookieBasket
						from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
						inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
						inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
						left join dbo.KAKAO_JOB_RANK kjr with(nolock) on kjr.product_id = kpt.product_id
						left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) = kpt.product_id
						where kpi.rep_img_yn = 'Y'
						and kpi.head_img_yn = 'Y'
						and kpc.category_code = @prod_catgry_int
					) as m
					where m.rn between 8*@paging_int-7 and 8*@paging_int
				end
				----최신제품 순
				else if (@sorted_option_int = 2)
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
					,	m.category_nm as categoryNm
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
						,	kpc.category_nm
						,	case when ss.value is null then 'cart'
								 else 'incart' end as cookieBasket
						from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
						inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
						inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
						left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) = kpt.product_id
						where kpi.rep_img_yn = 'Y'
						and kpi.head_img_yn = 'Y'
						and kpc.category_code = @prod_catgry_int
					) as m
					where m.rn between 8*@paging_int-7 and 8*@paging_int
				end
				--낮은 가격순
				else if (@sorted_option_int = 3)
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
					,	m.category_nm as categoryNm
					,	'alarm' as alarmYn
					from
					(
						select
							row_number() over (order by kpt.product_price) as rn
						,	kpt.product_id 
						,	kpt.product_nm 
						,	kpt.product_count 
						,	kpt.product_price 
						,	kpt.discount_rate 
						,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as product_img
						,	kpc.category_nm
						,	case when ss.value is null then 'cart'
								 else 'incart' end as cookieBasket
						from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
						inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
						inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
						left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) = kpt.product_id
						where kpi.rep_img_yn = 'Y'
						and kpi.head_img_yn = 'Y'
						and kpc.category_code = @prod_catgry_int
					) as m
					where m.rn between 8*@paging_int-7 and 8*@paging_int
				end
				--높은 가격순
				else if (@sorted_option_int = 4)
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
					,	m.category_nm as categoryNm
					,	'alarm' as alarmYn
					from
					(
						select
							row_number() over (order by kpt.product_price desc) as rn
						,	kpt.product_id 
						,	kpt.product_nm 
						,	kpt.product_count 
						,	kpt.product_price 
						,	kpt.discount_rate 
						,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as product_img
						,	kpc.category_nm
						,	case when ss.value is null then 'cart'
								 else 'incart' end as cookieBasket
						from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
						inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
						inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
						left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) = kpt.product_id
						where kpi.rep_img_yn = 'Y'
						and kpi.head_img_yn = 'Y'
						and kpc.category_code = @prod_catgry_int
					) as m
					where m.rn between 8*@paging_int-7 and 8*@paging_int			
				end										
end





