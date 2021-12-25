/* 
	Author      : Seunghwan Shin 
	Create date : 2021-09-17  
	Description : 물품 검색결과 -> 물품의 정보를 가져와준다.(로그인 하지 않았을 경우) 
	     
	History	: 2021-09-17 Seunghwan Shin	#최초 생성
			  2021-09-19 Seunghwan Shin	#장바구니,알림 정보 속성 추가
			  2021-09-21 Seunghwan Shin	#조인순서 변경
			  2021-09-23 Seunghwan Shin	#필터링 조건 추가
			  2021-09-24 Seunghwan Shin	#merge join 힌트 추가
			  2021-10-21 Seunghwan Shin	#sm join 조건 변경
			  2021-11-07 Seunghwan Shin	#캐릭터별 필터링 옵션 추가
			  2021-12-25 Seunghwan Shin	#인덱싱 테이블 수정
			  
	
	Real DB :	exec dbo.kakao_search_product_result_not_login N'라', null, 1, '118#117#119#31',1 ,1
				exec dbo.kakao_search_product_result_not_login N'라', null, 1, '118#117#119#31',2 ,1
				exec dbo.kakao_search_product_result_not_login N'라', null, 1, '118#117#119#31',3 ,1 
				exec dbo.kakao_search_product_result_not_login N'라', null, 1, '118#117#119#31',4 ,1
				exec dbo.kakao_search_product_result_not_login N'라', 117, 1, '118#117#119#31' ,1

*/ 
alter proc dbo.kakao_search_product_result_not_login
	@input_name nvarchar(100)
,	@prod_seq varchar(10)
,	@paging varchar(10)
,	@basket_info varchar(3000)	-- 쿠키정보
,	@sorted_option varchar(10) -- 1:판매량순, 2:신상품순, 3:낮은가격순, 4:높은 가격순
,	@sorted_option_char varchar(10) -- 캐릭터별 필터링 옵션
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
    
	declare @paging_num int = convert(int,@paging)
	declare @sorted_option_int int = convert(int,@sorted_option)
	declare @sorted_option_char_int int = convert(int,@sorted_option_char)			


	if (@prod_seq is null)
	begin
		if (@sorted_option_char_int = 0)
		begin
		--캐릭터별 필터링 옵션 없는경우
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
					left join dbo.KAKAO_JOB_RANK kjr with(nolock) on kjr.product_id = kpt.product_id
					left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) =  kpt.product_id
					where kpt.product_nm like N'%' + @input_name + N'%'
					and kpi.rep_img_yn = 'Y'
					and kpi.head_img_yn = 'Y'
				) as m
				where m.rn between (@paging_num * 6) - 5 and (@paging_num * 6)
			end
			--최신제품 순
			else if(@sorted_option_int = 2)
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
					left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) =  kpt.product_id
					where kpt.product_nm like N'%' + @input_name + N'%'
					and kpi.rep_img_yn = 'Y'
					and kpi.head_img_yn = 'Y'
				) as m
				where m.rn between (@paging_num * 6) - 5 and (@paging_num * 6)
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
					left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) =  kpt.product_id
					where kpt.product_nm like N'%' + @input_name + N'%'
					and kpi.rep_img_yn = 'Y'
					and kpi.head_img_yn = 'Y'
				) as m
				where m.rn between (@paging_num * 6) - 5 and (@paging_num * 6)
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
					left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) =  kpt.product_id
					where kpt.product_nm like N'%' + @input_name + N'%'
					and kpi.rep_img_yn = 'Y'
					and kpi.head_img_yn = 'Y'
				) as m
				where m.rn between (@paging_num * 6) - 5 and (@paging_num * 6)
			end
		end
		else
		begin
		--캐릭터별 필터링 옵션 있는 경우
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
					inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kpt.product_id = kcp.product_id
					left join dbo.KAKAO_JOB_RANK kjr with(nolock) on kjr.product_id = kpt.product_id
					left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) =  kpt.product_id
					where kpt.product_nm like N'%' + @input_name + N'%'
					and kpi.rep_img_yn = 'Y'
					and kpi.head_img_yn = 'Y'
					and kcp.char_seq = @sorted_option_char_int
				) as m
				where m.rn between (@paging_num * 6) - 5 and (@paging_num * 6)
			end
			--최신제품 순
			else if(@sorted_option_int = 2)
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
					inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kpt.product_id = kcp.product_id
					left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) =  kpt.product_id
					where kpt.product_nm like N'%' + @input_name + N'%'
					and kpi.rep_img_yn = 'Y'
					and kpi.head_img_yn = 'Y'
					and kcp.char_seq = @sorted_option_char_int
				) as m
				where m.rn between (@paging_num * 6) - 5 and (@paging_num * 6)
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
					inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kpt.product_id = kcp.product_id
					left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) =  kpt.product_id
					where kpt.product_nm like N'%' + @input_name + N'%'
					and kpi.rep_img_yn = 'Y'
					and kpi.head_img_yn = 'Y'
					and kcp.char_seq = @sorted_option_char_int
				) as m
				where m.rn between (@paging_num * 6) - 5 and (@paging_num * 6)
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
					inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kpt.product_id = kcp.product_id
					left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) =  kpt.product_id
					where kpt.product_nm like N'%' + @input_name + N'%'
					and kpi.rep_img_yn = 'Y'
					and kpi.head_img_yn = 'Y'
					and kcp.char_seq = @sorted_option_char_int
				) as m
				where m.rn between (@paging_num * 6) - 5 and (@paging_num * 6)
			end		
		end
	end
	else
	begin
		if (@sorted_option_char_int = 0)
		begin
		--캐릭터 필터링 옵션 없는경우
			select
				kpt.product_id as prodId
			,	kpt.product_nm as prodNm
			,	kpt.product_count as prodCnt
			,	format(kpt.product_price,'#,#') as prodPrice
			,	kpt.discount_rate as discRate
			,	kpi.product_img as picUrl
			,	format(kpt.product_price * (1-(kpt.discount_rate)/100.0) ,'#,#') as dcPrice
			,	case when ss.value is null then 'cart'
						 else 'incart' end as cookieBasket
			,	'alarm' as alarmYn
			from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
			inner join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
			left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) =  kpt.product_id
			where kpt.product_id = convert(bigint,@prod_seq)
			and kpi.rep_img_yn = 'Y'
			and kpi.head_img_yn = 'Y'
		end
		else
		begin
		--캐릭터 필터링 옵션 있는경우
			select
				kpt.product_id as prodId
			,	kpt.product_nm as prodNm
			,	kpt.product_count as prodCnt
			,	format(kpt.product_price,'#,#') as prodPrice
			,	kpt.discount_rate as discRate
			,	kpi.product_img as picUrl
			,	format(kpt.product_price * (1-(kpt.discount_rate)/100.0) ,'#,#') as dcPrice
			,	case when ss.value is null then 'cart'
						 else 'incart' end as cookieBasket
			,	'alarm' as alarmYn
			from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
			inner join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
			inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kpt.product_id = kcp.product_id
			left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) =  kpt.product_id
			where kpt.product_id = convert(bigint,@prod_seq)
			and kpi.rep_img_yn = 'Y'
			and kpi.head_img_yn = 'Y'
			and kcp.char_seq = @sorted_option_char_int
		end
	end
end


