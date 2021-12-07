/* 
	Author      : Seunghwan Shin 
	Create date : 2021-12-06   
	Description : 마이페이지 - 나의 기록
	     
	History	: 2021-12-06 Seunghwan Shin	#최초 생성
	
	Real DB : 

*/
CREATE proc dbo.kakao_mypage_my_trace
	@user_seq varchar(10)		-- 회원 번호
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	--union all 형태로 써주자
	--1. 제품 알림신청
	--2. 댓글달기
	--3. 좋아요 달기
	--4. 답글달기
	--5. 상품구매목록
	
	--1) 이미지url
	--2) 어떤활동인지 -> front 단에서 해주는게 나아보임
	--3) 언제 -> 방금, ~분전 ,1일전 ,특정일
	

	--1. 제품 알림신청 -> 고유번호 : 1
	select
		1 as uniqueNumber
	,	kpt.product_nm as title
	,	kpt.product_id  as titleDetail
	,	kpi.product_img as imgUrl
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

	--2. 상품구매목록
	select
		2 as uniqueNumber
	,	kpt.product_nm as title
	,	kpt.product_id  as titleDetail
	,	kpi.product_img as imgUrl
	,	kpp.product_buy_dt
	from dbo.QOO10_USER_REAL qur with(nolock)
	inner join dbo.KAKAO_PRODUCT_PAYMENT kpp with(nolock) on kpp.qoouser_seq = qur.qoouser_seq
	inner join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpp.product_id
	inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpi.product_id = kpt.product_id
	where qur.qoouser_seq = @user_seq
	and kpi.rep_img_yn = 'Y'
	and kpi.head_img_yn = 'Y'
	and isnull(kpp.cancel_dt,'N') = 'N'

	union all

	--3. 댓글달기
	select
		3 as uniqueNumber
	,	fd.feed as title
	,	fd.seq  as titleDetail
	,	kpi.product_img as imgUrl
	,	kpp.product_buy_dt
	from dbo.QOO10_USER_REAL qur with(nolock)
	inner join dbo.FEED fd with(nolock) on qur.qoouser_seq = fd.seq
	inner join dbo.MAIN_LIST ml with(nolock) on fd.list_seq = ml.seq
	inner join dbo.MAIN_IMG mi with(nolock) on mi.list_seq = ml.seq
	where qur.qoouser_seq = @user_seq
	and kpi.rep_img_yn = 'Y'
	and kpi.head_img_yn = 'Y'
	and isnull(kpp.cancel_dt,'N') = 'N'
							
end

select * from dbo.MAIN_IMG with(nolock)

	select
		1 as uniqueNumber
	,	kpt.product_nm as title
	,	kpt.product_id  as titleDetail
	,	kpi.product_img as imgUrl
	,	case when kusc.cart_chg_dt is null then kusc.cart_reg_dt
			 else kusc.cart_chg_dt end as regDate
	from dbo.QOO10_USER_REAL qur with(nolock)
	inner join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = qur.qoouser_seq
	inner join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kusc.product_id
	inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpi.product_id = kpt.product_id
	where qur.qoouser_seq = 2000001
	and kpi.rep_img_yn = 'Y'
	and kpi.head_img_yn = 'Y'
	and kusc.cart_del_yn = 'N'
	
	select
		2 as uniqueNumber
	,	kpt.product_nm as title
	,	kpt.product_id  as titleDetail
	,	kpi.product_img as imgUrl
	,	kpp.product_buy_dt as regDate
	from dbo.QOO10_USER_REAL qur with(nolock)
	inner join dbo.KAKAO_PRODUCT_PAYMENT kpp with(nolock) on kpp.qoouser_seq = qur.qoouser_seq
	inner join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kpt.product_id = kpp.product_id
	inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpi.product_id = kpt.product_id
	where qur.qoouser_seq = 2000001
	and kpi.rep_img_yn = 'Y'
	and kpi.head_img_yn = 'Y'
	and kpp.cancel_dt is not null
	--and isnull(convert(varchar,kpp.cancel_dt),'N') = 'N'


select * from dbo.KAKAO_PRODUCT_PAYMENT with(nolock)

select * from dbo.FEED with(nolock)


select * from dbo.MAIN_LIST with(nolock)