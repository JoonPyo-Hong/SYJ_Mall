/* 
	Author      : Seunghwan Shin 
	Create date : 2021-10-08   
	Description : 추천 신규 테마 로그인 상태
	     
	History	: 2021-10-08 Seunghwan Shin	#최초 생성
			  2021-11-15 Seunghwan Shin	#많이 팔린 순으로 상품 정렬
			  2021-12-25 Seunghwan Shin	#인덱싱 테이블 수정
	
	Real DB : exec dbo.kakao_recommend_new_theme_login 2000001, 2

*/
alter proc dbo.kakao_recommend_new_theme_login
	@user_info bigint		--유저 고유번호
,	@theme_num int			--테마번호
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
			
			declare	@buy_date_standard datetime = '2020-10-10'--그냥 기준으로 잡아놓은것
			declare @buy_date_past datetime = dateadd(day,-7,@buy_date_standard)

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
			,	m.alamYn as alarmYn
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
				,	case when kusc.product_id is null then 'cart'
						 else 'incart' end as cookieBasket
				,	case when kuai.product_id is null then 'alarm'
						 else 'inalarm' end as alamYn
				from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
				inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
				inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
				left join dbo.KAKAO_JOB_RANK kjr with(nolock) on kjr.product_id = kpt.product_id
				left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock,forceseek) on kpt.product_id = kusc.product_id and kusc.qoouser_seq = @user_info and kusc.cart_del_yn = 'N'
				left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.product_id = kpt.product_id and kuai.qoouser_seq = @user_info and kuai.del_yn = 'N'
				where kpc.category_code = @theme_num
				and kpi.rep_img_yn = 'Y'
				and kpi.head_img_yn = 'Y'

			) as m
			where m.rn between 1 and 4
end


