/* 
	Author      : Seunghwan Shin 
	Create date : 2021-11-27  
	Description : 추천 신규 테마 로그인 상태(더보기 기능) - 대분류 필터는 없는 상태 또한 소분류 필터는 있는 상태
	     
	History	:	2021-11-27 Seunghwan Shin	#최초 생성
				2021-12-26 Seunghwan Shin	#인덱싱 테이블 수정
				2021-07-09 Seunghwan Shin	#쿼리성능 개선을 위해 페이징 알고리즘 수정
				
	
	Real DB : exec dbo.kakao_recommend_new_theme_add_no_big_category_small_category_login 2000001, 2, 1, 1 , 1

*/
CREATE proc dbo.kakao_recommend_new_theme_add_no_big_category_small_category_login
	@qoouser_seq_no bigint			-- 유저 고유번호
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
						kpts.product_id as prodId
					,	kpts.product_nm as prodNm
					,	kpts.product_count as prodCnt
					,	format(kpts.product_price,'#,#') as prodPrice
					,	kpts.discount_rate as discRate
					,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as picUrl
					,	format(kpts.product_price * (1-(kpts.discount_rate)/100.0) ,'#,#') as dcPrice
					,	case when kusc.cart_del_yn is null then 'cart'
								when kusc.cart_del_yn = 'Y' then 'cart'
								else 'incart' end as cookieBasket
					,	kjrs.category_nm as categoryNm
					,	case when kuai.del_yn is null then 'alarm'
						        when kuai.del_yn = 'Y' then 'alarm'
						        else 'inalarm' end as alarmYn
					from dbo.KAKAO_PRODUCT_TABLE kpts with(nolock)
					inner join (
						select 
							kpt.product_id
						,	kpc.category_nm
						from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
						inner join dbo.KAKAO_JOB_RANK kjr with(nolock) on kjr.product_id = kpt.product_id
						inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpc.category_code = kpt.category_code
						where kpc.category_code = @prodt_catgry
						order by kjr.buy_cnt desc
						offset (@paging-1) * 16 rows
						fetch next 16 rows only
					) kjrs on kjrs.product_id = kpts.product_id
					inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpts.product_id = kpi.product_id
					left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @qoouser_seq_no and kusc.product_id = kpts.product_id
					left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @qoouser_seq_no and kuai.product_id = kpts.product_id
					where kpi.rep_img_yn = 'Y'
					and kpi.head_img_yn = 'Y'

				end
				----최신제품 순
				else if (@sorted_option = 2)
				begin
					select
						kpts.product_id as prodId
					,	kpts.product_nm as prodNm
					,	kpts.product_count as prodCnt
					,	format(kpts.product_price,'#,#') as prodPrice
					,	kpts.discount_rate as discRate
					,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as picUrl
					,	format(kpts.product_price * (1-(kpts.discount_rate)/100.0) ,'#,#') as dcPrice
					,	case when kusc.cart_del_yn is null then 'cart'
								when kusc.cart_del_yn = 'Y' then 'cart'
								else 'incart' end as cookieBasket
					,	kjrs.category_nm as categoryNm
					,	case when kuai.del_yn is null then 'alarm'
						        when kuai.del_yn = 'Y' then 'alarm'
						        else 'inalarm' end as alarmYn
					from dbo.KAKAO_PRODUCT_TABLE kpts with(nolock)
					inner join (
						select 
							kpt.product_id
						,	kpc.category_nm
						from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
						inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpc.category_code = kpt.category_code
						where kpc.category_code = @prodt_catgry
						order by kpt.reg_dt desc
						offset (@paging-1) * 16 rows
						fetch next 16 rows only
					) kjrs on kjrs.product_id = kpts.product_id
					inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpts.product_id = kpi.product_id
					left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @qoouser_seq_no and kusc.product_id = kpts.product_id
					left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @qoouser_seq_no and kuai.product_id = kpts.product_id
					where kpi.rep_img_yn = 'Y'
					and kpi.head_img_yn = 'Y'

				end
				--낮은 가격순
				else if (@sorted_option = 3)
				begin
					select
						kpts.product_id as prodId
					,	kpts.product_nm as prodNm
					,	kpts.product_count as prodCnt
					,	format(kpts.product_price,'#,#') as prodPrice
					,	kpts.discount_rate as discRate
					,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as picUrl
					,	format(kpts.product_price * (1-(kpts.discount_rate)/100.0) ,'#,#') as dcPrice
					,	case when kusc.cart_del_yn is null then 'cart'
								when kusc.cart_del_yn = 'Y' then 'cart'
								else 'incart' end as cookieBasket
					,	kjrs.category_nm as categoryNm
					,	case when kuai.del_yn is null then 'alarm'
						        when kuai.del_yn = 'Y' then 'alarm'
						        else 'inalarm' end as alarmYn
					from dbo.KAKAO_PRODUCT_TABLE kpts with(nolock)
					inner join (
						select 
							kpt.product_id
						,	kpc.category_nm
						from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
						inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpc.category_code = kpt.category_code
						where kpc.category_code = @prodt_catgry
						order by kpt.product_price
						offset (@paging-1) * 16 rows
						fetch next 16 rows only
					) kjrs on kjrs.product_id = kpts.product_id
					inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpts.product_id = kpi.product_id
					left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @qoouser_seq_no and kusc.product_id = kpts.product_id
					left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @qoouser_seq_no and kuai.product_id = kpts.product_id
					where kpi.rep_img_yn = 'Y'
					and kpi.head_img_yn = 'Y'
				end
				--높은 가격순
				else if (@sorted_option = 4)
				begin
					select
						kpts.product_id as prodId
					,	kpts.product_nm as prodNm
					,	kpts.product_count as prodCnt
					,	format(kpts.product_price,'#,#') as prodPrice
					,	kpts.discount_rate as discRate
					,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as picUrl
					,	format(kpts.product_price * (1-(kpts.discount_rate)/100.0) ,'#,#') as dcPrice
					,	case when kusc.cart_del_yn is null then 'cart'
								when kusc.cart_del_yn = 'Y' then 'cart'
								else 'incart' end as cookieBasket
					,	kjrs.category_nm as categoryNm
					,	case when kuai.del_yn is null then 'alarm'
						        when kuai.del_yn = 'Y' then 'alarm'
						        else 'inalarm' end as alarmYn
					from dbo.KAKAO_PRODUCT_TABLE kpts with(nolock)
					inner join (
						select 
							kpt.product_id
						,	kpc.category_nm
						from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
						inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpc.category_code = kpt.category_code
						where kpc.category_code = @prodt_catgry
						order by kpt.product_price desc
						offset (@paging-1) * 16 rows
						fetch next 16 rows only
					) kjrs on kjrs.product_id = kpts.product_id
					inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpts.product_id = kpi.product_id
					left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @qoouser_seq_no and kusc.product_id = kpts.product_id
					left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @qoouser_seq_no and kuai.product_id = kpts.product_id
					where kpi.rep_img_yn = 'Y'
					and kpi.head_img_yn = 'Y'		
				end										
end


