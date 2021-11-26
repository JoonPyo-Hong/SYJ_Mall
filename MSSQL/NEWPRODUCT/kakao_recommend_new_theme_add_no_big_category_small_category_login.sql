/* 
	Author      : Seunghwan Shin 
	Create date : 2021-11-27  
	Description : 추천 신규 테마 로그인 상태(더보기 기능) - 대분류 필터는 없는 상태 또한 소분류 필터는 있는 상태
	     
	History	:	2021-11-27 Seunghwan Shin	#최초 생성
				
	
	Real DB : exec dbo.kakao_recommend_new_theme_add_no_big_category_small_category_login 2000001, 2, 1, 1 , 1

*/
CREATE proc dbo.kakao_recommend_new_theme_add_no_big_category_small_category_login
	@qoouser_seq_no bigint			-- 유저 고유번호
,	@theme_no		int				-- 대분류 번호
,	@prodt_catgry	int				-- 소분류 번호
,	@sorted_option  int				-- 정렬옵션
,	@paging			int				-- 페이징 번호
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
			
			declare @buy_date_standard datetime = '2020-10-10'--그냥 기준으로 잡아놓은것
			declare @buy_date_past datetime = dateadd(day,-7,@buy_date_standard)


				--판매량 순
				if(@sorted_option = 1)
				begin
					select
						m.product_id as prodId
					,	m.product_nm as prodNm
					,	m.product_count as prodCnt
					,	format(m.product_price,'#,#') as prodPrice
					,	m.discount_rate as discRate
					,	m.product_img as picUrl
					,	format(m.product_price * (1-(m.discount_rate)/100.0) ,'#,#') as dcPrice
					,	m.cart as cookieBasket
					,	m.category_nm as categoryNm
					,	m.alarmYn as alarmYn
					from
					(
						select
							row_number() over (order by sm.cnt desc) as rn
						,	kpt.product_id 
						,	kpt.product_nm 
						,	kpt.product_count 
						,	kpt.product_price 
						,	kpt.discount_rate 
						,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as product_img
						,	kpc.category_nm
						,	case when kusc.cart_del_yn is null then 'cart'
								 when kusc.cart_del_yn = 'Y' then 'cart'
								 else 'incart' end as cart
						,	case when kuai.del_yn is null then 'alarm'
						         when kuai.del_yn = 'Y' then 'alarm'
						         else 'inalarm' end as alarmYn
						from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
						inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
						inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
						left merge join 
						(
							select 
								product_id
							,	count(*) as cnt
							from dbo.KAKAO_PRODUCT_PAYMENT with(nolock,index="IDX__KAKAO_PRODUCT_PAYMENT__PRODUCT_BUY_DT")
							where product_buy_dt between @buy_date_past and @buy_date_standard 
							group by product_id
						) sm on sm.product_id = kpt.product_id
						left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @qoouser_seq_no and kusc.product_id = kpt.product_id
						left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @qoouser_seq_no and kuai.product_id = kpt.product_id
						where kpi.rep_img_yn = 'Y'
						and kpi.head_img_yn = 'Y'
						and kpc.category_code = @prodt_catgry
						and kpc.main_category_code = @theme_no
					) as m
					where m.rn between 16*@paging-15 and 16*@paging
				end
				----최신제품 순
				else if (@sorted_option = 2)
				begin
					select
						m.product_id as prodId
					,	m.product_nm as prodNm
					,	m.product_count as prodCnt
					,	format(m.product_price,'#,#') as prodPrice
					,	m.discount_rate as discRate
					,	m.product_img as picUrl
					,	format(m.product_price * (1-(m.discount_rate)/100.0) ,'#,#') as dcPrice
					,	m.cart as cookieBasket
					,	m.category_nm as categoryNm
					,	m.alarmYn as alarmYn
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
						,	case when kusc.cart_del_yn is null then 'cart'
								 when kusc.cart_del_yn = 'Y' then 'cart'
								 else 'incart' end as cart
						,	case when kuai.del_yn is null then 'alarm'
						         when kuai.del_yn = 'Y' then 'alarm'
						         else 'inalarm' end as alarmYn
						from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
						inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
						inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
						left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @qoouser_seq_no and kusc.product_id = kpt.product_id
						left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @qoouser_seq_no and kuai.product_id = kpt.product_id
						where kpi.rep_img_yn = 'Y'
						and kpi.head_img_yn = 'Y'
						and kpc.category_code = @prodt_catgry
						and kpc.main_category_code = @theme_no
					) as m
					where m.rn between 16*@paging-15 and 16*@paging
				end
				--낮은 가격순
				else if (@sorted_option = 3)
				begin
					select
						m.product_id as prodId
					,	m.product_nm as prodNm
					,	m.product_count as prodCnt
					,	format(m.product_price,'#,#') as prodPrice
					,	m.discount_rate as discRate
					,	m.product_img as picUrl
					,	format(m.product_price * (1-(m.discount_rate)/100.0) ,'#,#') as dcPrice
					,	m.cart as cookieBasket
					,	m.category_nm as categoryNm
					,	m.alarmYn as alarmYn
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
						,	case when kusc.cart_del_yn is null then 'cart'
								 when kusc.cart_del_yn = 'Y' then 'cart'
								 else 'incart' end as cart
						,	case when kuai.del_yn is null then 'alarm'
						         when kuai.del_yn = 'Y' then 'alarm'
						         else 'inalarm' end as alarmYn
						from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
						inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
						inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
						left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @qoouser_seq_no and kusc.product_id = kpt.product_id
						left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @qoouser_seq_no and kuai.product_id = kpt.product_id
						where kpi.rep_img_yn = 'Y'
						and kpi.head_img_yn = 'Y'
						and kpc.category_code = @prodt_catgry
						and kpc.main_category_code = @theme_no
					) as m
					where m.rn between 16*@paging-15 and 16*@paging
				end
				--높은 가격순
				else if (@sorted_option = 4)
				begin
					select
						m.product_id as prodId
					,	m.product_nm as prodNm
					,	m.product_count as prodCnt
					,	format(m.product_price,'#,#') as prodPrice
					,	m.discount_rate as discRate
					,	m.product_img as picUrl
					,	format(m.product_price * (1-(m.discount_rate)/100.0) ,'#,#') as dcPrice
					,	m.cart as cookieBasket
					,	m.category_nm as categoryNm
					,	m.alarmYn as alarmYn
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
						,	case when kusc.cart_del_yn is null then 'cart'
								 when kusc.cart_del_yn = 'Y' then 'cart'
								 else 'incart' end as cart
						,	case when kuai.del_yn is null then 'alarm'
						         when kuai.del_yn = 'Y' then 'alarm'
						         else 'inalarm' end as alarmYn
						from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
						inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
						inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
						left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @qoouser_seq_no and kusc.product_id = kpt.product_id
						left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @qoouser_seq_no and kuai.product_id = kpt.product_id
						where kpi.rep_img_yn = 'Y'
						and kpi.head_img_yn = 'Y'
						and kpc.category_code = @prodt_catgry
						and kpc.main_category_code = @theme_no
					) as m
					where m.rn between 16*@paging-15 and 16*@paging				
				end										
end

