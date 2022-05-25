/* 
	Author      : Seunghwan Shin 
	Create date : 2022-05-25  
	Description : 리뷰 상세내용 가져오기 - 로그인 한 경우
	     
	History	: 2022-05-25 Seunghwan Shin	#최초생성
			  
	
	Real DB : exec dbo.kakao_product_detail_review_login 9,1,1, '2021-01-01' , 2000001

*/
alter proc dbo.kakao_product_detail_review_login
	@prodt_seq		varchar(20)		-- 상품고유 번호
,	@sort_option	varchar(20)		-- 정렬 옵션
,	@paging			varchar(20)		-- 페이징
,	@current_time 	varchar(40)		-- 기준날
,	@user_seq		varchar(20)		-- 유저 고유 번호
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	
	declare @prodt_seq_new bigint = convert(bigint,@prodt_seq)
	,	@sort_option_new int = convert(int,@sort_option)
	,	@paging_new int = convert(int,@paging)
	,	@current_time_new datetime = convert(datetime,@current_time)
	,	@user_seq_int bigint = convert(bigint,@user_seq)
	
	-- 1. 최신순
	if (@sort_option_new = 1)
	begin
		select
			m.userId as userId
		,	m.starCount as starCount
		,	5 - m.starCount as starCountRemain
		,	m.reviewDate as reviewDate
		,	m.comment as comment
		,	m.likeCount as likeCount
		,	m.likeYn as likeYn
		,	m.pd_order_seq as pdOrderSeq
		,	m.product_id as productId
		from
		(
			select 
				row_number() over (order by kpp.review_reg_dt desc) as rn
			,	qur.qoouser_id as userId
			,	kpp.star_score as starCount
			,	case when kpp.review_chg_dt is null then kpp.review_reg_dt
					 else kpp.review_chg_dt end as reviewDate
			,	kpp.review_content as comment
			,	(
					select count(*) from dbo.KAKAO_PRODUCT_LIKE_USER kplu with(nolock) 
					where kplu.product_id = @prodt_seq_new 
					and kplu.prodt_like_yn = 'Y'
					and kpp.pd_order_seq = kplu.pd_order_seq
 				) as likeCount
			,	case when kplu.prodt_like_yn = 'Y' then 'Y'
					 when kplu.prodt_like_yn = 'N' then 'N'
					 else 'N' end as likeYn
			,	kpp.pd_order_seq
			,	kpp.product_id
			from dbo.QOO10_USER_REAL qur with(nolock)
			inner join dbo.KAKAO_PRODUCT_PAYMENT kpp with(nolock) on qur.qoouser_seq = kpp.qoouser_seq
			left join dbo.KAKAO_PRODUCT_LIKE_USER kplu with(nolock) on kplu.product_id = kpp.product_id and kplu.qoouser_seq = @user_seq_int and kpp.pd_order_seq = kplu.pd_order_seq
			where kpp.product_id = @prodt_seq_new
			and kpp.review_exists_yn = 'Y'
			and kpp.review_reg_dt <= @current_time_new
		) m
		where m.rn between 4*(@paging_new)-3 and (@paging_new)*4
	end
	-- 2. 좋아요순
	else if (@sort_option_new = 2)
	begin
		select
			m.userId as userId
		,	m.starCount as starCount
		,	5 - m.starCount as starCountRemain
		,	m.reviewDate as reviewDate
		,	m.comment as comment
		,	m.likeCount as likeCount
		,	m.likeYn as likeYn
		,	m.pd_order_seq as pdOrderSeq
		,	m.product_id as productId
		from
		(
			select 
				row_number() over (order by (
					select count(*) from dbo.KAKAO_PRODUCT_LIKE_USER kplu with(nolock) 
					where kplu.product_id = @prodt_seq 
					and kplu.prodt_like_yn = 'Y'
					and kpp.pd_order_seq = kplu.pd_order_seq
 				) desc) as rn
			,	qur.qoouser_id as userId
			,	kpp.star_score as starCount
			,	case when kpp.review_chg_dt is null then kpp.review_reg_dt
					 else kpp.review_chg_dt end as reviewDate
			,	kpp.review_content as comment
			,	(
					select count(*) from dbo.KAKAO_PRODUCT_LIKE_USER kplu with(nolock) 
					where kplu.product_id = @prodt_seq 
					and kplu.prodt_like_yn = 'Y'
					and kpp.pd_order_seq = kplu.pd_order_seq
 				) as likeCount
			,	case when kplu.prodt_like_yn = 'Y' then 'Y'
					 when kplu.prodt_like_yn = 'N' then 'N'
					 else 'N' end as likeYn
			,	kpp.pd_order_seq
			,	kpp.product_id
			from dbo.QOO10_USER_REAL qur with(nolock)
			inner join dbo.KAKAO_PRODUCT_PAYMENT kpp with(nolock) on qur.qoouser_seq = kpp.qoouser_seq
			left join dbo.KAKAO_PRODUCT_LIKE_USER kplu with(nolock) on kplu.product_id = kpp.product_id and kplu.qoouser_seq = @user_seq_int and kpp.pd_order_seq = kplu.pd_order_seq
			where kpp.product_id = @prodt_seq
			and kpp.review_exists_yn = 'Y'
			and kpp.review_reg_dt <= @current_time_new
		) m
		where m.rn between 4*(@paging_new)-3 and (@paging_new)*4
	end
			
end



