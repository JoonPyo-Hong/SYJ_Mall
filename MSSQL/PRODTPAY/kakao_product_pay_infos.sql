/* 
	Author      : Seunghwan Shin 
	Create date : 2022-06-14   
	Description : 구입할 상품에 대한 기본적인 정보가져오기
	     
	History	: 2022-06-14 Seunghwan Shin	#최초 생성
			  
			   
	Real DB :	exec dbo.kakao_product_pay_infos '3#14#54'
				
*/
alter proc dbo.kakao_product_pay_infos
	@prodt_list varchar(4000)
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	select 
		kpt.product_id as prodtSeq
	,	kpt.product_nm as prodtName
	,	kpt.product_price as prodtPrice
	,	kpt.product_count as possibleProdtCnt
	,	1 as prodtBuyCnt
	,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as productImg
	from string_split(@prodt_list,'#') ss
	inner loop join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on convert(bigint,ss.value) = kpt.product_id
	inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpt.product_id = kpi.product_id
	where kpi.rep_img_yn = 'Y'
	and kpi.head_img_yn = 'Y'


END
