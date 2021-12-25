/* 
	Author      : Seunghwan Shin 
	Create date : 2021-09-09  
	Description : 물품 검색결과 -> 물품의 정보를 가져와준다. 
	     
	History	: 2021-09-09 Seunghwan Shin	#최초 생성
			  2021-09-10 Seunghwan Shin	#join 절 추가
			  2021-09-12 Seunghwan Shin	#paging 기능 추가
			  2021-09-14 Seunghwan Shin	#화폐 따옴표 단위 추가
			  2021-09-19 Seunghwan Shin #알람정보 추가
			  2021-09-21 Seunghwan Shin #장바구니정보, 알림정보 누락되어 수정, forceseek 힌트 추가
			  2021-09-24 Seunghwan Shin #필터링 조건 추가, merge join 힌트 추가
			  2021-10-21 Seunghwan Shin	#sm join 조건 변경
			  2021-12-25 Seunghwan Shin	#인덱싱 테이블 수정
	
	Real DB : exec dbo.kakao_search_product_result 2000001, N'라이언', null, 1
			  exec dbo.kakao_search_product_result 2000001, N'라이언', 48, 1	

*/ 
alter proc dbo.kakao_search_product_result
	@qoouser_seq varchar(10)
,	@input_name nvarchar(100)
,	@prod_seq varchar(10)
,	@paging varchar(10)
,	@sorted_option varchar(10) -- 1:판매량순, 2:신상품순, 3:낮은가격순, 4:높은 가격순
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
    
	declare @paging_num int = convert(int,@paging)
	declare @qoouser_seq_no int = convert(bigint,@qoouser_seq)
	declare @sorted_option_int int = convert(int,@sorted_option)

	if (@prod_seq is null)
	begin
		--판매량순
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
				left join dbo.KAKAO_JOB_RANK kjr with(nolock) on kjr.product_id = kpt.product_id
				left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @qoouser_seq_no and kusc.product_id = kpt.product_id
				left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @qoouser_seq_no and kuai.product_id = kpt.product_id
				where kpt.product_nm like N'%' + @input_name + N'%'
				and kpi.rep_img_yn = 'Y'
				and kpi.head_img_yn = 'Y'
			) as m
			where m.rn between (@paging_num * 6) - 5 and (@paging_num * 6)
		end
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
				left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @qoouser_seq_no and kusc.product_id = kpt.product_id
				left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @qoouser_seq_no and kuai.product_id = kpt.product_id
				where kpt.product_nm like N'%' + @input_name + N'%'
				and kpi.rep_img_yn = 'Y'
				and kpi.head_img_yn = 'Y'
			) as m
			where m.rn between (@paging_num * 6) - 5 and (@paging_num * 6)
		end
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
				left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @qoouser_seq_no and kusc.product_id = kpt.product_id
				left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @qoouser_seq_no and kuai.product_id = kpt.product_id
				where kpt.product_nm like N'%' + @input_name + N'%'
				and kpi.rep_img_yn = 'Y'
				and kpi.head_img_yn = 'Y'
			) as m
			where m.rn between (@paging_num * 6) - 5 and (@paging_num * 6)
		end
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
				left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @qoouser_seq_no and kusc.product_id = kpt.product_id
				left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @qoouser_seq_no and kuai.product_id = kpt.product_id
				where kpt.product_nm like N'%' + @input_name + N'%'
				and kpi.rep_img_yn = 'Y'
				and kpi.head_img_yn = 'Y'
			) as m
			where m.rn between (@paging_num * 6) - 5 and (@paging_num * 6)
		end
	end
	else
	begin
		select
			kpt.product_id as prodId
		,	kpt.product_nm as prodNm
		,	kpt.product_count as prodCnt
		,	format(kpt.product_price,'#,#') as prodPrice
		,	kpt.discount_rate as discRate
		,	kpi.product_img as picUrl
		,	format(kpt.product_price * (1-(kpt.discount_rate)/100.0) ,'#,#') as dcPrice
		,	case when kusc.cart_del_yn is null then 'cart'
					 when kusc.cart_del_yn = 'Y' then 'cart'
					 else 'incart' end as cookieBasket
			,	case when kuai.del_yn is null then 'alarm'
					 when kuai.del_yn = 'Y' then 'alarm'
					 else 'inalarm' end as alarmYn
		from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
		inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpt.product_id = kpi.product_id
		left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @qoouser_seq_no and kusc.product_id = kpt.product_id
		left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @qoouser_seq_no and kuai.product_id = kpt.product_id
		where kpt.product_id = convert(bigint,@prod_seq)
		and kpi.rep_img_yn = 'Y'
		and kpi.head_img_yn = 'Y'
	end
end

