/* 
	Author      : Seunghwan Shin 
	Create date : 2021-10-05   
	Description : 추천 신규 테마 비로그인 상태
	     
	History	: 2021-10-05 Seunghwan Shin	#최초 생성
			  2021-10-07 Seunghwan Shin	#조인순서 변경
			  2021-10-15 Seunghwan Shin	#alarmYn 컬럼 변경
			  2021-11-15 Seunghwan Shin	#많이 팔린 순으로 상품 정렬
			  2021-12-26 Seunghwan Shin	#인덱싱 테이블 수정
	
	Real DB : exec dbo.kakao_recommend_new_theme_no_login '119#118#9', 2

*/
alter proc dbo.kakao_recommend_new_theme_no_login
	@basket_info varchar(3000)	-- 쿠키정보
,	@theme_num varchar(25)
as 
set nocount on 
set transaction isolation level read uncommitted 
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
			,	m.category_nm as categoryNm
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
				,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as product_img
				,	kpc.category_nm
				,	case when ss.value is null then 'cart'
						 else 'incart' end as cookieBasket
				from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
				inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
				inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
				left join dbo.KAKAO_JOB_RANK kjr with(nolock) on kjr.product_id = kpt.product_id
				left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) = kpt.product_id
				where kpc.category_code = convert(int,@theme_num)
				and kpi.rep_img_yn = 'Y'
				and kpi.head_img_yn = 'Y'

			) as m
			where m.rn between 1 and 4
end

