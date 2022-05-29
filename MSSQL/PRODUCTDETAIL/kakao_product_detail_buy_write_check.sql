/* 
	Author      : Seunghwan Shin 
	Create date : 2022-05-28  
	Description : 특정 유저가 해당 상품을 구매했는지 또한 이미 리뷰를 작성했는지 확인해주는 SP
	     
	History	:	2022-05-28	Seunghwan Shin	#최초 생성
				2022-05-29	Seunghwan Shin	#상세확인 로직으로 변경

	
	Real DB : exec dbo.kakao_product_detail_buy_write_check 2000001,9

*/
alter proc dbo.kakao_product_detail_buy_write_check
	@user_seq			bigint
,	@prodt_id			bigint
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
		

	declare @user_buy_check	int
	
	-- 1-1) 해당 제품을 구입한 이력이 있는지 체크
	if exists (select * from dbo.KAKAO_PRODUCT_PAYMENT with(nolock) where product_id = @prodt_id and qoouser_seq = @user_seq)
	begin
		--2-1) 해당 유저가 해당 제품을 사서 리뷰를 쓴적이 없는지 체크
		select top 1 @user_buy_check =  pd_order_seq
		from dbo.KAKAO_PRODUCT_PAYMENT with(nolock)
		where product_id = @prodt_id
		and qoouser_seq = @user_seq
		and review_exists_yn = 'N'
		order by product_buy_dt desc
		
		-- 2-2) 구매한 제품에 대해서 이미 글을 쓴 경우 
		if (@user_buy_check is null)
		begin
			return -3
		end
		-- 2-3) 구매한 제품에 대해서 글을 쓰지 않은 경우 -> 글을 쓸 권리를 준다.
		else
		begin
			return 1
		end

	end
	-- 1-2)구입한 적이 없는 경우
	else
	begin
		return -2
	end
		
end

