/* 
	Author      : Seunghwan Shin 
	Create date : 2021-10-10  
	Description : 신규 최상단 배너 물품 기존물품 + 기획상품
	     
	History	: 2021-10-10 Seunghwan Shin	#최초 생성

	
	Real DB : exec  dbo.kakao_recommend_top_banner_list
*/ 
CREATE proc dbo.kakao_recommend_top_banner_list
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
    
	select
		kpp.product_id as prodId
	,	kp.product_top_img_title as prodSubject
	,	kp.product_top_img_title_detail as prodDetail
	,	replace(replace(replace(kp.new_promotion_img,N' ',N'%20'),N'(',N'%20'),N')',N'')as prodPicUrl
	from dbo.KAKAO_PROMOTION kp with(nolock)
	inner join dbo.KAKAO_PROM_PROD kpp with(nolock) on kpp.promotion_code = kp.promotion_code
	
end

