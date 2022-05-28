/* 
	Author      : Seunghwan Shin 
	Create date : 2022-05-27  
	Description : 상품 리뷰쓰기
	     
	History	:	2022-05-27	Seunghwan Shin	#최초 생성

	
	Real DB : exec dbo.kakao_product_detail_review_write 2000001,9,N'test',4

*/
alter proc dbo.kakao_product_detail_review_write
	@user_seq			varchar(25)
,	@prodt_id			varchar(25)
,	@review_content		nvarchar(250)
,	@star_score			varchar(25)
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
		
	
	declare @user_seq_int	bigint = convert(bigint,@user_seq)
	,		@prodt_id_int	bigint = convert(bigint,@prodt_id)
	,		@star_score_int	int =  convert(bigint,@star_score)

	declare @user_buy_check	int
	
	-- 1-1) 해당 제품을 구입한 이력이 있는지 체크
	if exists (select * from dbo.KAKAO_PRODUCT_PAYMENT with(nolock) where product_id = @prodt_id and qoouser_seq = @user_seq)
	begin
		--2-1) 해당 유저가 해당 제품을 사서 리뷰를 쓴적이 없는지 체크
		select top 1 @user_buy_check =  pd_order_seq
		from dbo.KAKAO_PRODUCT_PAYMENT with(nolock)
		where product_id = @prodt_id_int
		and qoouser_seq = @user_seq_int
		and review_exists_yn = 'N'
		order by product_buy_dt desc
		
		-- 2-2) 구매한 제품에 대해서 글을 쓴 경우 
		if (@user_buy_check is null)
		begin
			return -3
		end
		-- 2-3) 구매한 제품에 대해서 글을 쓰지 않은 경우 -> 글을 써준다.
		else
		begin
			update dbo.KAKAO_PRODUCT_PAYMENT
			set star_score = @star_score_int
			,	review_content = @review_content
			,	review_reg_dt = getdate()
			,	review_exists_yn = 'Y'
			where qoouser_seq = @user_seq_int
			and product_id = @prodt_id_int
			and pd_order_seq = @user_buy_check

			if @@ERROR <> 0 return -1

			return 1
		end

	end
	-- 1-2)구입한 적이 없는 경우
	else
	begin
		return -2
	end
		
end