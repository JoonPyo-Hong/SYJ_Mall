/* 
	Author      : Seunghwan Shin 
	Create date : 2021-11-01  
	Description : 물품 검색결과 -> 물품의 정보를 가져와준다.(로그인 하지 않았을 경우) 
	     
	History	:	2021-11-01 Seunghwan Shin	#최초 생성
				2021-11-03 Seunghwan Shin	#페이징 개수 변경
				2021-12-26 Seunghwan Shin	#인덱싱 테이블 수정
				2022-07-07 Seunghwan Shin	#쿼리 성능개선을 위해 페이징 알고리즘 변경 
			  
	
	Real DB :	exec dbo.kakao_char_product_nologin 1,1,1,'13#14#15'
				exec dbo.kakao_char_product_nologin 1,2,1,'13#14#15'
				exec dbo.kakao_char_product_nologin 1,3,1,'13#14#15'
				exec dbo.kakao_char_product_nologin 1,4,1,'13#14#15'

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
			from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
			inner join (
				select
					kjr.product_id
				from dbo.KAKAO_JOB_RANK kjr with(nolock)
				inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock)  on kcp.product_id = kjr.product_id
				where kcp.char_seq = @char_seq
				order by kjr.buy_cnt desc
				offset (@paging-1) * 8 rows
				fetch next 8 rows only
			) kjrs on kjrs.product_id = kpt.product_id
			inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpt.product_id = kpi.product_id
			left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) =  kpt.product_id
			where  kpi.rep_img_yn = 'Y'
			and kpi.head_img_yn = 'Y'

	end
	else if(@sorted_option_int = 2)
	begin
		--최신제품 순
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
			from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
			inner join (
				select kpts.product_id
				from dbo.KAKAO_PRODUCT_TABLE kpts with(nolock)
				inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kcp.product_id = kpts.product_id
				where kcp.char_seq = @char_seq
				order by kpts.reg_dt desc
				offset (@paging-1) * 8 rows
				fetch next 8 rows only
			) kjrs on kjrs.product_id = kpt.product_id 
			inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kjrs.product_id = kpi.product_id
			left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) =  kpt.product_id
			where  kpi.rep_img_yn = 'Y'
			and kpi.head_img_yn = 'Y'
	end
	else if(@sorted_option_int = 3)
	begin
		--낮은 가격순		
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
			from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
			inner join (
				select kpts.product_id
				from dbo.KAKAO_PRODUCT_TABLE kpts with(nolock)
				inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kcp.product_id = kpts.product_id
				where kcp.char_seq = @char_seq
				order by kpts.product_price
				offset (@paging-1) * 8 rows
				fetch next 8 rows only
			) kjrs on kjrs.product_id = kpt.product_id 
			inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kjrs.product_id = kpi.product_id
			left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) =  kpt.product_id
			where  kpi.rep_img_yn = 'Y'
			and kpi.head_img_yn = 'Y'
	end
	else if(@sorted_option_int = 4)
	begin
	--높은 가격순	
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
			from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
			inner join (
				select kpts.product_id
				from dbo.KAKAO_PRODUCT_TABLE kpts with(nolock)
				inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kcp.product_id = kpts.product_id
				where kcp.char_seq = @char_seq
				order by kpts.product_price desc
				offset (@paging-1) * 8 rows
				fetch next 8 rows only
			) kjrs on kjrs.product_id = kpt.product_id 
			inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kjrs.product_id = kpi.product_id
			left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) =  kpt.product_id
			where  kpi.rep_img_yn = 'Y'
			and kpi.head_img_yn = 'Y'

	end

end


