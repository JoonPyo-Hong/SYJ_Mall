/* 
	Author      : Seunghwan Shin 
	Create date : 2021-03-27   
	Description : 잠깐만 이 상품은 어때요 탭 - 로그인 시
	     
	History	: 2021-03-27 Seunghwan Shin	#최초 생성	

	
	Real DB : exec dbo.kakao_product_detail_plus_prodt_login 2000001,11 ,1 , 3
			  exec dbo.kakao_product_detail_plus_prodt_login 2000001,11 ,2 , 3
			  exec dbo.kakao_product_detail_plus_prodt_login 2000001,11 ,3 , 3
			  exec dbo.kakao_product_detail_plus_prodt_login 2000001,11 ,4 , 3

*/
create proc dbo.kakao_product_detail_plus_prodt_login
	@user_seq		bigint		-- 유저고유번호
,	@prodt_seq		bigint		-- 상품 번호
,	@list_sort_type int			-- 순서조건
,	@main_category_code	int		-- 메인 카테고리 조건
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
			
			
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
					,	case when kusc.product_id is null then 'cart'
							 else 'incart' end as cookieBasket
					,	case when kuai.product_id is null then 'alarm'
							 else 'inalarm' end as alarmYn
					from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
					inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
					inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
					inner join dbo.KAKAO_PRODUCT_MAIN_CATEGORY kpmc with(nolock) on kpmc.main_category_code = kpc.main_category_code
					left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.product_id = kpt.product_id and kusc.qoouser_seq = @user_seq
					left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kpt.product_id = kuai.product_id and kuai.qoouser_seq = @user_seq
					where  kpi.rep_img_yn = 'Y'
					and kpi.head_img_yn = 'Y'
					and kpmc.main_category_code = @main_category_code
					and kpt.product_id <> @prodt_seq

				) as m
				where m.rn between 1 and 4
			end
			if (@list_sort_type = 2)
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
				,	m.alarmYn as alarmYn
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
					,	case when kusc.product_id is null then 'cart'
							 else 'incart' end as cookieBasket
					,	case when kuai.product_id is null then 'alarm'
							 else 'inalarm' end as alarmYn
					from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
					inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
					inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
					inner join dbo.KAKAO_PRODUCT_MAIN_CATEGORY kpmc with(nolock) on kpmc.main_category_code = kpc.main_category_code
					left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.product_id = kpt.product_id and kusc.qoouser_seq = @user_seq
					left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kpt.product_id = kuai.product_id and kuai.qoouser_seq = @user_seq
					where  kpi.rep_img_yn = 'Y'
					and kpi.head_img_yn = 'Y'
					and kpmc.main_category_code = @main_category_code
					and kpt.product_id <> @prodt_seq

				) as m
				where m.rn between 1 and 4
			end
			if (@list_sort_type = 3)
			begin
				-- 상품 개수 많은 순
				select
					m.product_id as prodId
				,	m.product_nm as prodNm
				,	m.product_count as prodCnt
				,	format(m.product_price,'#,#') as prodPrice
				,	m.discount_rate as discRate
				,	m.product_img as picUrl
				,	format(m.product_price * (1-(m.discount_rate)/100.0) ,'#,#') as dcPrice
				,	m.cookieBasket as cookieBasket
				,	m.alarmYn as alarmYn
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
					,	case when kusc.product_id is null then 'cart'
							 else 'incart' end as cookieBasket
					,	case when kuai.product_id is null then 'alarm'
							 else 'inalarm' end as alarmYn
					from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
					inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
					inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
					inner join dbo.KAKAO_PRODUCT_MAIN_CATEGORY kpmc with(nolock) on kpmc.main_category_code = kpc.main_category_code
					left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.product_id = kpt.product_id and kusc.qoouser_seq = @user_seq
					left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kpt.product_id = kuai.product_id and kuai.qoouser_seq = @user_seq
					where  kpi.rep_img_yn = 'Y'
					and kpi.head_img_yn = 'Y'
					and kpmc.main_category_code = @main_category_code
					and kpt.product_id <> @prodt_seq

				) as m
				where m.rn between 1 and 4
			end
			if (@list_sort_type = 4)
			begin
				-- 할인률 높은 순
				select
					m.product_id as prodId
				,	m.product_nm as prodNm
				,	m.product_count as prodCnt
				,	format(m.product_price,'#,#') as prodPrice
				,	m.discount_rate as discRate
				,	m.product_img as picUrl
				,	format(m.product_price * (1-(m.discount_rate)/100.0) ,'#,#') as dcPrice
				,	m.cookieBasket as cookieBasket
				,	m.alarmYn as alarmYn
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
					,	case when kusc.product_id is null then 'cart'
							 else 'incart' end as cookieBasket
					,	case when kuai.product_id is null then 'alarm'
							 else 'inalarm' end as alarmYn
					from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
					inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
					inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
					inner join dbo.KAKAO_PRODUCT_MAIN_CATEGORY kpmc with(nolock) on kpmc.main_category_code = kpc.main_category_code
					left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.product_id = kpt.product_id and kusc.qoouser_seq = @user_seq
					left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kpt.product_id = kuai.product_id and kuai.qoouser_seq = @user_seq
					where  kpi.rep_img_yn = 'Y'
					and kpi.head_img_yn = 'Y'
					and kpmc.main_category_code = @main_category_code
					and kpt.product_id <> @prodt_seq

				) as m
				where m.rn between 1 and 4
			end

			
end


