/* 
	Author      : Seunghwan Shin 
	Create date : 2021-11-13   
	Description : 추천 신규 테마 로그인 상태(더보기 기능)
	     
	History	: 2021-11-13 Seunghwan Shin	#최초 생성
			  2021-12-25 Seunghwan Shin	#인덱싱 테이블 수정
	
	Real DB : exec dbo.kakao_recommend_new_theme_login_add '119#118#9', 2, '1','0'

*/
alter proc dbo.kakao_recommend_new_theme_login_add
	@user_seq varchar(10)	-- 쿠키정보
,	@theme_num varchar(25)		-- 테마정보
,	@sorted_option varchar(10)	-- 정렬옵션
,	@char_seq varchar(10)		-- 캐릭터분류
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
			
			declare	@user_seq_int bigint = convert(bigint,@user_seq) 
			,		@sorted_option_int int = convert(int,@sorted_option)
			,		@char_seq_int int = convert(int,@char_seq)


			if (@char_seq_int = 0)
			begin
			--캐릭터별 필터링 옵션 없는 경우
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
					,	m.cart as cookieBasket
					,	m.category_nm as categoryNm
					,	m.alarmYn as alarmYn
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
						,	case when kusc.cart_del_yn is null then 'cart'
								 when kusc.cart_del_yn = 'Y' then 'cart'
								else 'incart' end as cart
						,	case when kuai.del_yn is null then 'alarm'
								 when kuai.del_yn = 'Y' then 'alarm'
								 else 'inalarm' end as alarmYn
						from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
						inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
						inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
						left join dbo.KAKAO_JOB_RANK kjr with(nolock) on kjr.product_id = kpt.product_id
						left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @user_seq_int and kusc.product_id = kpt.product_id
						left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @user_seq_int and kuai.product_id = kpt.product_id
						where kpc.category_code = convert(int,@theme_num)
						and kpi.rep_img_yn = 'Y'
						and kpi.head_img_yn = 'Y'
					) as m
					order by m.rn
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
						left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @user_seq_int and kusc.product_id = kpt.product_id
						left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @user_seq_int and kuai.product_id = kpt.product_id
						where kpc.category_code = convert(int,@theme_num)
						and kpi.rep_img_yn = 'Y'
						and kpi.head_img_yn = 'Y'
					) as m
					order by m.rn
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
						left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @user_seq_int and kusc.product_id = kpt.product_id
						left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @user_seq_int and kuai.product_id = kpt.product_id
						where kpc.category_code = convert(int,@theme_num)
						and kpi.rep_img_yn = 'Y'
						and kpi.head_img_yn = 'Y'
					) as m
					order by m.rn
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
						left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @user_seq_int and kusc.product_id = kpt.product_id
						left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @user_seq_int and kuai.product_id = kpt.product_id
						where kpc.category_code = convert(int,@theme_num)
						and kpi.rep_img_yn = 'Y'
						and kpi.head_img_yn = 'Y'
					) as m
					order by m.rn					
				end
			end
			else
			begin
			--캐릭터별 필터링 옵션 있는 경우
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
					,	m.cart as cookieBasket
					,	m.category_nm as categoryNm
					,	m.alarmYn as alarmYn
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
						,	case when kusc.cart_del_yn is null then 'cart'
								 when kusc.cart_del_yn = 'Y' then 'cart'
								else 'incart' end as cart
						,	case when kuai.del_yn is null then 'alarm'
								 when kuai.del_yn = 'Y' then 'alarm'
								 else 'inalarm' end as alarmYn
						from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
						inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
						inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
						inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kpt.product_id = kcp.product_id
						left join dbo.KAKAO_JOB_RANK kjr with(nolock) on kjr.product_id = kpt.product_id
						left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @user_seq_int and kusc.product_id = kpt.product_id
						left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @user_seq_int and kuai.product_id = kpt.product_id
						where kpc.category_code = convert(int,@theme_num)
						and kpi.rep_img_yn = 'Y'
						and kpi.head_img_yn = 'Y'
						and kcp.char_seq = @char_seq_int
					) as m
					order by m.rn
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
						inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kpt.product_id = kcp.product_id
						left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @user_seq_int and kusc.product_id = kpt.product_id
						left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @user_seq_int and kuai.product_id = kpt.product_id
						where kpc.category_code = convert(int,@theme_num)
						and kpi.rep_img_yn = 'Y'
						and kpi.head_img_yn = 'Y'
						and kcp.char_seq = @char_seq_int
					) as m
					order by m.rn
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
						inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kpt.product_id = kcp.product_id
						left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @user_seq_int and kusc.product_id = kpt.product_id
						left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @user_seq_int and kuai.product_id = kpt.product_id
						where kpc.category_code = convert(int,@theme_num)
						and kpi.rep_img_yn = 'Y'
						and kpi.head_img_yn = 'Y'
						and kcp.char_seq = @char_seq_int
					) as m
					order by m.rn
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
						inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kpt.product_id = kcp.product_id
						left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @user_seq_int and kusc.product_id = kpt.product_id
						left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @user_seq_int and kuai.product_id = kpt.product_id
						where kpc.category_code = convert(int,@theme_num)
						and kpi.rep_img_yn = 'Y'
						and kpi.head_img_yn = 'Y'
						and kcp.char_seq = @char_seq_int
					) as m
					order by m.rn					
				end				
			end							
end


