/* 
	Author      : Seunghwan Shin 
	Create date : 2021-11-01  
	Description : 물품 검색결과 -> 물품의 정보를 가져와준다.(로그인 하지 않았을 경우) 
	     
	History	:	2021-11-01 Seunghwan Shin	#최초 생성
				2021-11-03 Seunghwan Shin	#페이징 개수 변경
				2021-12-26 Seunghwan Shin	#인덱싱 테이블 수정
			  
	
	Real DB :	exec dbo.kakao_search_product_result_not_login N'라', null, 1, '118#117#119#31',1
				exec dbo.kakao_search_product_result_not_login N'라', null, 1, '118#117#119#31',2
				exec dbo.kakao_search_product_result_not_login N'라', null, 1, '118#117#119#31',3
				exec dbo.kakao_search_product_result_not_login N'라', null, 1, '118#117#119#31',4
				exec dbo.kakao_search_product_result_not_login N'라', 117, 1, '118#117#119#31'

*/ 
alter proc dbo.kakao_char_product_nologin
	@char_seq	varchar(10) -- 캐릭터 번호
,	@sorted_option varchar(10) -- 1:판매량순, 2:신상품순, 3:낮은가격순, 4:높은 가격순
,	@paging varchar(10)
,	@basket_info varchar(3000)	-- 쿠키정보
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
    
	declare @char_seq_int int = convert(int,@char_seq)
	,		@paging_num int = convert(int,@paging)
	,		@sorted_option_int int = convert(int,@sorted_option)

	
	if(@sorted_option_int = 1)
	begin
		--판매량 순
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
					row_number() over (order by kjr.buy_cnt desc) as rn
				,	kpt.product_id 
				,	kpt.product_nm 
				,	kpt.product_count 
				,	kpt.product_price 
				,	kpt.discount_rate 
				,	kpi.product_img 
				,	case when ss.value is null then 'cart'
						 else 'incart' end as cookieBasket
				from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
				inner join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
				inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kcp.product_id = kpt.product_id
				left join dbo.KAKAO_JOB_RANK kjr with(nolock) on kjr.product_id = kpt.product_id
				left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) =  kpt.product_id
				where kcp.char_seq = @char_seq_int
				and kpi.rep_img_yn = 'Y'
				and kpi.head_img_yn = 'Y'
			) as m
			where m.rn between (@paging_num * 8) - 7 and (@paging_num * 8)

	end
	else if(@sorted_option_int = 2)
	begin
	--최신제품 순
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
				,	kpi.product_img 
				,	case when ss.value is null then 'cart'
						 else 'incart' end as cookieBasket
				from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
				inner join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
				inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kcp.product_id = kpt.product_id
				left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) =  kpt.product_id
				where kcp.char_seq = @char_seq_int
				and kpi.rep_img_yn = 'Y'
				and kpi.head_img_yn = 'Y'
			) as m
			where m.rn between (@paging_num * 8) - 7 and (@paging_num * 8)
	end
	else if(@sorted_option_int = 3)
	begin
	--낮은 가격순		
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
					row_number() over (order by kpt.product_price) as rn
				,	kpt.product_id 
				,	kpt.product_nm 
				,	kpt.product_count 
				,	kpt.product_price 
				,	kpt.discount_rate 
				,	kpi.product_img 
				,	case when ss.value is null then 'cart'
						 else 'incart' end as cookieBasket
				from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
				inner join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
				inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kcp.product_id = kpt.product_id
				left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) =  kpt.product_id
				where kcp.char_seq = @char_seq_int
				and kpi.rep_img_yn = 'Y'
				and kpi.head_img_yn = 'Y'
			) as m
			where m.rn between (@paging_num * 8) - 7 and (@paging_num * 8)
	end
	else if(@sorted_option_int = 4)
	begin
	--높은 가격순	
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
					row_number() over (order by kpt.product_price desc) as rn
				,	kpt.product_id 
				,	kpt.product_nm 
				,	kpt.product_count 
				,	kpt.product_price 
				,	kpt.discount_rate 
				,	kpi.product_img 
				,	case when ss.value is null then 'cart'
						 else 'incart' end as cookieBasket
				from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
				inner join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
				inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kcp.product_id = kpt.product_id
				left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) =  kpt.product_id
				where kcp.char_seq = @char_seq_int
				and kpi.rep_img_yn = 'Y'
				and kpi.head_img_yn = 'Y'
			) as m
			where m.rn between (@paging_num * 8) - 7 and (@paging_num * 8)

	end

end


