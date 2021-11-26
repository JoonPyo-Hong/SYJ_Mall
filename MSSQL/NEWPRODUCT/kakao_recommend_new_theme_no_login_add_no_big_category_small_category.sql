/* 
	Author      : Seunghwan Shin 
	Create date : 2021-11-27
	Description : ��õ �ű� �׸� ��α��� ����(������ ���) - ��з� ���ʹ� ���� ���� �Һз� ���ʹ� �ִ� ����
	     
	History	:	2021-11-27 Seunghwan Shin	#���� ����
	
	Real DB : exec dbo.kakao_recommend_new_theme_no_login_add_no_big_category_small_category '119#118#9', '2', '1', '1'

*/
alter proc dbo.kakao_recommend_new_theme_no_login_add_no_big_category_small_category
	@basket_info varchar(3000)	-- ��Ű����
,	@prod_catgry varchar(10)	-- �Һз���ȣ
,	@sorted_option varchar(10)	-- ���Ŀɼ�
,	@paging varchar(10)			-- ����¡ ��ȣ
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
			
			declare @sorted_option_int int = convert(int,@sorted_option)
			,		@paging_int int = convert(int,@paging)
			,		@prod_catgry_int int = convert(int,@prod_catgry)
			,		@buy_date_standard datetime = '2020-10-10'--�׳� �������� ��Ƴ�����
			declare @buy_date_past datetime = dateadd(day,-7,@buy_date_standard)


				--�Ǹŷ� ��
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
					,	m.category_nm as categoryNm
					,	'alarm' as alarmYn
					from
					(
						select
							row_number() over (order by sm.cnt desc) as rn
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
						left merge join 
						(
							select 
								product_id
							,	count(*) as cnt
							from dbo.KAKAO_PRODUCT_PAYMENT with(nolock,index="IDX__KAKAO_PRODUCT_PAYMENT__PRODUCT_BUY_DT")
							where product_buy_dt between @buy_date_past and @buy_date_standard 
							group by product_id
						) sm on sm.product_id = kpt.product_id
						left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) = kpt.product_id
						where kpi.rep_img_yn = 'Y'
						and kpi.head_img_yn = 'Y'
						and kpc.category_code = @prod_catgry_int
					) as m
					where m.rn between 8*@paging_int-7 and 8*@paging_int
				end
				----�ֽ���ǰ ��
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
					,	m.cookieBasket as cookieBasket
					,	m.category_nm as categoryNm
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
						,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as product_img
						,	kpc.category_nm
						,	case when ss.value is null then 'cart'
								 else 'incart' end as cookieBasket
						from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
						inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
						inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
						left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) = kpt.product_id
						where kpi.rep_img_yn = 'Y'
						and kpi.head_img_yn = 'Y'
						and kpc.category_code = @prod_catgry_int
					) as m
					where m.rn between 8*@paging_int-7 and 8*@paging_int
				end
				--���� ���ݼ�
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
					,	m.cookieBasket as cookieBasket
					,	m.category_nm as categoryNm
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
						,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as product_img
						,	kpc.category_nm
						,	case when ss.value is null then 'cart'
								 else 'incart' end as cookieBasket
						from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
						inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
						inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
						left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) = kpt.product_id
						where kpi.rep_img_yn = 'Y'
						and kpi.head_img_yn = 'Y'
						and kpc.category_code = @prod_catgry_int
					) as m
					where m.rn between 8*@paging_int-7 and 8*@paging_int
				end
				--���� ���ݼ�
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
					,	m.cookieBasket as cookieBasket
					,	m.category_nm as categoryNm
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
						,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as product_img
						,	kpc.category_nm
						,	case when ss.value is null then 'cart'
								 else 'incart' end as cookieBasket
						from dbo.KAKAO_PRODUCT_IMG kpi with(nolock)
						inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpi.product_id
						inner join dbo.KAKAO_PRODUCT_CATEGORY kpc with(nolock) on kpt.category_code = kpc.category_code
						left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) = kpt.product_id
						where kpi.rep_img_yn = 'Y'
						and kpi.head_img_yn = 'Y'
						and kpc.category_code = @prod_catgry_int
					) as m
					where m.rn between 8*@paging_int-7 and 8*@paging_int			
				end										
end





