/* 
	Author      : Seunghwan Shin 
	Create date : 2021-10-13   
	Description : 새로나온 친구들 상품 목록 - 비로그인 시
	     
	History	: 2021-10-13 Seunghwan Shin	#최초 생성	
			  2022-07-07 Seunghwan Shin	#쿼리 성능개선을 위해 페이징 알고리즘 변경	
	
	Real DB : exec dbo.kakao_new_product_not_login '13#12#30',1

*/
alter proc dbo.kakao_new_product_not_login
	@basket_info varchar(3000)	-- 쿠키정보
,	@paging varchar(10) --페이징 정보
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
		
			declare @paging_int int = convert(int,@paging)

			select
				kpt.product_id as prodId
			,	kpt.product_nm as prodNm
			,	kpt.product_count as prodCnt
			,	format(kpt.product_price,'#,#') as prodPrice
			,	kpt.discount_rate as discRate
			,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'')  as picUrl
			,	format(kpt.product_price * (1-(kpt.discount_rate)/100.0) ,'#,#') as dcPrice
			,	case when ss.value is null then 'cart'
						else 'incart' end as cookieBasket
			,	'alarm' as alarmYn
			from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
			inner join (
				select 
					product_id
				from dbo.KAKAO_PRODUCT_TABLE with(nolock)
				order by reg_dt desc
				offset (@paging-1) * 8 rows
				fetch next 8 rows only
			) kpts on kpts.product_id = kpt.product_id
			inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpt.product_id = kpi.product_id
			left join string_split(@basket_info,'#') ss on convert(bigint,ss.value) = kpt.product_id
			where kpi.rep_img_yn = 'Y'
			and kpi.head_img_yn = 'Y'
end


