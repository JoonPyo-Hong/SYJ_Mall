/* 
	Author      : Seunghwan Shin 
	Create date : 2021-11-01  
	Description : 물품 검색결과 -> 물품의 정보를 가져와준다.(로그인 하지 않았을 경우) 
	     
	History	:	2021-11-01 Seunghwan Shin	#최초 생성
				2021-11-03 Seunghwan Shin	#페이징 개수 변경
				2021-12-26 Seunghwan Shin	#인덱싱 테이블 수정
				2022-07-06 Seunghwan Shin	#성능을 위해 페이징 알고리즘 변경
			  
	
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
			left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @user_seq and kusc.product_id = kpt.product_id
			left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @user_seq and kuai.product_id = kpt.product_id
			where  kpi.rep_img_yn = 'Y'
			and kpi.head_img_yn = 'Y'

		end
		else if (@sorted_option = 2)
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
			left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @user_seq and kusc.product_id = kjrs.product_id
			left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @user_seq and kuai.product_id = kjrs.product_id
			where  kpi.rep_img_yn = 'Y'
			and kpi.head_img_yn = 'Y'
		end
		else if (@sorted_option = 3)
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
			left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @user_seq and kusc.product_id = kjrs.product_id
			left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @user_seq and kuai.product_id = kjrs.product_id
			where  kpi.rep_img_yn = 'Y'
			and kpi.head_img_yn = 'Y'
		end
		else if (@sorted_option = 4)
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
			left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @user_seq and kusc.product_id = kjrs.product_id
			left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.qoouser_seq = @user_seq and kuai.product_id = kjrs.product_id
			where  kpi.rep_img_yn = 'Y'
			and kpi.head_img_yn = 'Y'
		end
	

end

