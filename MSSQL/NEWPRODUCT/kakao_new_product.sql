/* 
	Author      : Seunghwan Shin 
	Create date : 2021-10-15   
	Description : 새로나온 친구들 상품 목록 - 로그인 시
	     
	History	: 2021-10-15 Seunghwan Shin	#최초 생성	
			  2022-07-07 Seunghwan Shin	#쿼리 성능개선을 위해 페이징 알고리즘 변경	
	
	Real DB : exec dbo.kakao_new_product 2000001,1

*/
alter proc dbo.kakao_new_product
	@user_seq bigint--유저 번호
,	@paging int --페이징 정보
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
		
			select 
				kpt.product_id as prodId
			,	kpt.product_nm as prodNm
			,	kpt.product_count as prodCnt
			,	format(kpt.product_price,'#,#') as prodPrice
			,	kpt.discount_rate as discRate
			,	kpi.product_img as picUrl
			,	format(kpt.product_price * (1-(kpt.discount_rate)/100.0) ,'#,#') as dcPrice
			,	case when kusc.product_id is null then 'cart'
						else 'incart' end as cookieBasket
			,	case when kuai.product_id is null then 'alarm'
						else 'inalarm' end as alamYn
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
			left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kpt.product_id = kusc.product_id and kusc.qoouser_seq = @user_seq and kusc.cart_del_yn = 'N'
			left join dbo.KAKAO_USER_ALRAM_INFO kuai with(nolock) on kuai.product_id = kpt.product_id and kuai.qoouser_seq = @user_seq and kuai.del_yn = 'N'
			where kpi.rep_img_yn = 'Y'
			and kpi.head_img_yn = 'Y'

end


