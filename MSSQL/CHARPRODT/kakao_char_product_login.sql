/* 
	Author      : Seunghwan Shin 
	Create date : 2021-11-01  
	Description : 물품 검색결과 -> 물품의 정보를 가져와준다.(로그인 하지 않았을 경우) 
	     
	History	:	2021-11-01 Seunghwan Shin	#최초 생성
				2021-11-03 Seunghwan Shin	#페이징 개수 변경
				2021-12-26 Seunghwan Shin	#인덱싱 테이블 수정
			  
	
	Real DB :	exec dbo.kakao_char_product_login 1,1,1,2000001
				

*/ 
alter proc dbo.kakao_char_product_login
	@char_seq	int		-- 캐릭터 번호
,	@sorted_option int	-- 1:판매량순, 2:신상품순, 3:낮은가격순, 4:높은 가격순
,	@paging int			-- 페이징 번호
,	@user_seq bigint	-- 고객 고유번호
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
	
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
				,	kpi.product_img
				,	case when kusc.cart_del_yn is null then 'cart'
						 when kusc.cart_del_yn = 'Y' then 'cart'
						 else 'incart' end as cart
				,	case when kuai.del_yn is null then 'alarm'
						 when kuai.del_yn = 'Y' then 'alarm'
						 else 'inalarm' end as alarmYn
				from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) 
				inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock,forceseek) on kpt.product_id = kpi.product_id
				inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kcp.product_id = kpt.product_id
				left join dbo.KAKAO_JOB_RANK kjr with(nolock) on kjr.product_id = kpt.product_id
				left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @user_seq and kusc.product_id = kpt.product_id
				left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @user_seq and kuai.product_id = kpt.product_id
				where kcp.char_seq = @char_seq
				and kpi.rep_img_yn = 'Y'
				and kpi.head_img_yn = 'Y'
			) as m
			where m.rn between (@paging * 8) - 7 and (@paging * 8)
		end
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
				,	kpi.product_img
				,	case when kusc.cart_del_yn is null then 'cart'
						 when kusc.cart_del_yn = 'Y' then 'cart'
						 else 'incart' end as cart
				,	case when kuai.del_yn is null then 'alarm'
						 when kuai.del_yn = 'Y' then 'alarm'
						 else 'inalarm' end as alarmYn
				from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
				inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock,forceseek) on kpt.product_id = kpi.product_id
				inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kcp.product_id = kpt.product_id
				left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @user_seq and kusc.product_id = kpt.product_id
				left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @user_seq and kuai.product_id = kpt.product_id
				where kcp.char_seq = @char_seq
				and kpi.rep_img_yn = 'Y'
				and kpi.head_img_yn = 'Y'
			) as m
			where m.rn between (@paging * 8) - 7 and (@paging * 8)
		end
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
				,	kpi.product_img
				,	case when kusc.cart_del_yn is null then 'cart'
						 when kusc.cart_del_yn = 'Y' then 'cart'
						 else 'incart' end as cart
				,	case when kuai.del_yn is null then 'alarm'
						 when kuai.del_yn = 'Y' then 'alarm'
						 else 'inalarm' end as alarmYn
				from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
				inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock,forceseek) on kpt.product_id = kpi.product_id
				inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kcp.product_id = kpt.product_id
				left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @user_seq and kusc.product_id = kpt.product_id
				left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @user_seq and kuai.product_id = kpt.product_id
				where kcp.char_seq = @char_seq
				and kpi.rep_img_yn = 'Y'
				and kpi.head_img_yn = 'Y'
			) as m
			where m.rn between (@paging * 8) - 7 and (@paging * 8)
		end
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
				,	kpi.product_img
				,	case when kusc.cart_del_yn is null then 'cart'
						 when kusc.cart_del_yn = 'Y' then 'cart'
						 else 'incart' end as cart
				,	case when kuai.del_yn is null then 'alarm'
						 when kuai.del_yn = 'Y' then 'alarm'
						 else 'inalarm' end as alarmYn
				from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
				inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock,forceseek) on kpt.product_id = kpi.product_id
				inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kcp.product_id = kpt.product_id
				left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @user_seq and kusc.product_id = kpt.product_id
				left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @user_seq and kuai.product_id = kpt.product_id
				where kcp.char_seq = @char_seq
				and kpi.rep_img_yn = 'Y'
				and kpi.head_img_yn = 'Y'
			) as m
			where m.rn between (@paging * 8) - 7 and (@paging * 8)
		end
	

end

