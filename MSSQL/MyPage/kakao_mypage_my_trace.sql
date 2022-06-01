/* 
	Author      : Seunghwan Shin 
	Create date : 2022-06-01   
	Description : 마이페이지 - 나의 기록
	     
	History	: 2021-06-01 Seunghwan Shin	#최초 생성
	
	Real DB : 

*/
create proc dbo.kakao_mypage_my_trace
	@user_seq varchar(10)		-- 회원 번호
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	--union all 형태로 써주자
	--1. 제품 알림신청
	--2. 게시물 댓글달기(답글도 포함)
	--3. 상품에 대한 리뷰 쓰기
	--4. 리뷰에 대한 좋아요 하기
	
	--1) 이미지url
	--2) 어떤활동인지 -> front 단에서 해주는게 나아보임
	--3) 언제 -> 방금, ~분전 ,1일전 ,특정일
	
	--replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as product_img
	--1. 제품 알림신청 -> 고유번호 : 1
	select
		1 as uniqueNumber
	,	kpt.product_nm as title
	,	kpt.product_id  as titleDetail
	,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as imgUrl
	,	case when kusc.cart_chg_dt is null then kusc.cart_reg_dt
			 else kusc.cart_chg_dt end as regDate
	from dbo.QOO10_USER_REAL qur with(nolock)
	inner join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = qur.qoouser_seq
	inner join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kusc.product_id
	inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpi.product_id = kpt.product_id
	where qur.qoouser_seq = @user_seq
	and kpi.rep_img_yn = 'Y'
	and kpi.head_img_yn = 'Y'
	and kusc.cart_del_yn = 'N'
	
	union all


	--2. 게시물 댓글달기
	select
		2 as uniqueNumber
	,	fd.feed as title
	,	fd.seq  as titleDetail
	,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as imgUrl
	,	kpp.product_buy_dt
	from dbo.QOO10_USER_REAL qur with(nolock)
	inner join dbo.FEED fd with(nolock) on qur.qoouser_seq = fd.seq
	inner join dbo.MAIN_LIST ml with(nolock) on fd.list_seq = ml.seq
	inner join dbo.MAIN_IMG mi with(nolock) on mi.list_seq = ml.seq
	where qur.qoouser_seq = @user_seq
	and kpi.rep_img_yn = 'Y'
	and kpi.head_img_yn = 'Y'
	and isnull(kpp.cancel_dt,'N') = 'N'

	union all

	--3. 리뷰쓰기
	select
		3 as uniqueNumber
	,	kpt.product_nm as title
	,	kpt.product_id as titleDetail
	,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as imgUrl
	,	kpp.review_reg_dt as regDate
	from dbo.KAKAO_PRODUCT_PAYMENT kpp with(nolock)
	inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpp.product_id = kpi.product_id
	inner join dbo.KAKAO_PRODUCT_TABLE  kpt with(nolock) on kpt.product_id = kpp.product_id
	where kpp.review_exists_yn = 'Y'
	and kpp.qoouser_seq = 2000001
	and kpi.rep_img_yn = 'Y'
	and kpi.head_img_yn = 'Y' 


	--4. 리뷰에 좋아요 하기
	select
		4 as uniqueNumber
	,	kpt.product_nm as title
	,	kpt.product_id as titleDetail
	,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as imgUrl
	,	kplu.reg_dt as regDate
	,	kplu.pd_order_seq
	from dbo.KAKAO_PRODUCT_LIKE_USER kplu with(nolock)
	inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kplu.product_id = kpi.product_id
	inner join dbo.KAKAO_PRODUCT_TABLE  kpt with(nolock) on kpt.product_id = kplu.product_id
	where kplu.qoouser_seq = 2000001
	and kpi.rep_img_yn = 'Y'
	and kpi.head_img_yn = 'Y' 
							
end

