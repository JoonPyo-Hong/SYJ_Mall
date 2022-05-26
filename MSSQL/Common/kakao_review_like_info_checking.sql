/* 
	Author      : Seunghwan Shin 
	Create date : 2022-05-26  
	Description : 리뷰에 대한 좋아요 관련 처리
	     
	History	: 2022-05-26 Seunghwan Shin	#최초 생성
			  
	Real DB :	declare @result int
				exec @result = dbo.kakao_review_like_info_checking 2000001, 264148, 9
				select @result
			 
*/
alter proc dbo.kakao_review_like_info_checking
	@user_seq		bigint		-- 회원 고유번호
,	@pd_order_seq	bigint		-- 주문번호
,	@product_id		bigint		-- 상품번호
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	declare @check char(1)
	
	select  
		@check = prodt_like_yn
	from dbo.KAKAO_PRODUCT_LIKE_USER with(nolock)
	where qoouser_seq = @user_seq
	and product_id	 = @product_id	
	and pd_order_seq = @pd_order_seq

	-- 0. 처음으로 좋아요를 누를 경우 -> 좋아요 처리 해준다. 
	if (@check is null)
	begin
		insert into dbo.KAKAO_PRODUCT_LIKE_USER
		(
			product_id
		,	pd_order_seq
		,	qoouser_seq
		,	prodt_like_yn
		,	reg_dt
		,	chg_dt
		)
		values
		(
			@product_id	
		,	@pd_order_seq
		,	@user_seq
		,	'Y'
		,	getdate()
		,	null
		)
		
		if @@ERROR <> 0 return -1
		else return 1
	end
	-- 1. 기존에 좋아요를 눌러놨을 경우 -> 좋아요를 풀어준다.
	else if (@check = 'Y')
	begin
		update dbo.KAKAO_PRODUCT_LIKE_USER
		set prodt_like_yn = 'N'
		,	chg_dt = getdate()
		where qoouser_seq = @user_seq
		and product_id	 = @product_id	
		and pd_order_seq = @pd_order_seq
		
		if @@ERROR <> 0 return -1
		else return 2
	end
	-- 2. 기존에 좋아요를 풀어줬을 경우 -> 다시 좋아요 처리를 해준다
	else if (@check = 'N') 
	begin
		update dbo.KAKAO_PRODUCT_LIKE_USER
		set prodt_like_yn = 'Y'
		,	chg_dt = getdate()
		where qoouser_seq = @user_seq
		and product_id	 = @product_id	
		and pd_order_seq = @pd_order_seq
		
		if @@ERROR <> 0 return -1
		else return 1
	end
	-- 3. 오류가 발생한 경우
	else
	begin
		return -1
	end
		
end









