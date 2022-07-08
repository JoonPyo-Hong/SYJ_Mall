/* 
	Author      : Seunghwan Shin 
	Create date : 2021-11-26  
	Description : 추천 신규 테마 로그인 상태(더보기 기능) - 대분류 필터는 없는 상태 또한 소분류 필터도 없는 상태
	     
	History	:	2021-11-26 Seunghwan Shin	#최초 생성
				2021-12-26 Seunghwan Shin	#인덱싱 테이블 수정
				2022-07-08 Seunghwan Shin	#쿼리 성능 개선을 위해 페이징 알고리즘 변경
	
	Real DB : exec dbo.kakao_recommend_new_theme_add_no_big_category_no_small_category 2000001, '1', '1'

*/
alter proc dbo.kakao_recommend_new_theme_add_no_big_category_no_small_category
	@qoouser_seq_no bigint			-- 유저 고유번호
,	@sorted_option varchar(10)	-- 정렬옵션
,	@paging varchar(10)			-- 페이징 번호
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
							kpt.product_id as prodId
						,	kpt.product_nm as prodNm
						,	kpt.product_count as prodCnt
						,	format(kpt.product_price,'#,#') as prodPrice
						,	kpt.discount_rate as discRate
						,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as picUrl
						,	format(kpt.product_price * (1-(kpt.discount_rate)/100.0) ,'#,#') as dcPrice
						,	case when kusc.cart_del_yn is null then 'cart'
									when kusc.cart_del_yn = 'Y' then 'cart'
									else 'incart' end as cookieBasket
						,	kpc.category_nm as categoryNm
						,	case when kuai.del_yn is null then 'alarm'
									when kuai.del_yn = 'Y' then 'alarm'
									else 'inalarm' end as alarmYn
					from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
					inner join(
						select 
							product_id
						from dbo.KAKAO_JOB_RANK with(nolock)
						order by buy_cnt desc
						offset (@paging-1) * 16 rows
						fetch next 16 rows only
					) kjrs on kjrs.product_id = kpt.product_id
					inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
					inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpt.product_id = kpi.product_id
					left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @qoouser_seq_no and kusc.product_id = kpt.product_id
					left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @qoouser_seq_no and kuai.product_id = kpt.product_id
					where kpi.rep_img_yn = 'Y'
					and kpi.head_img_yn = 'Y'
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
					) as m
					where m.rn between 16*@paging-15 and 16*@paging				
				end										
end


