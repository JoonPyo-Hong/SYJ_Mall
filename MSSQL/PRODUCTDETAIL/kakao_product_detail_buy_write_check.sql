/* 
	Author      : Seunghwan Shin 
	Create date : 2022-05-28  
	Description : 특정 유저가 해당 상품을 구매했는지 또한 이미 리뷰를 작성했는지 확인해주는 SP
	     
	History	:	2022-05-28	Seunghwan Shin	#최초 생성

	
	Real DB : exec dbo.kakao_product_detail_buy_write_check 2000001,9

*/
CREATE proc dbo.kakao_product_detail_buy_write_check
	@user_seq			bigint
,	@prodt_id			bigint
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
		
	-- 해당 제품을 구입했고 아직 리뷰를 쓰지 않았는지 체크해준다.
	if exists (
		select * 
		from dbo.KAKAO_PRODUCT_PAYMENT with(nolock) 
		where product_id = @prodt_id 
		and qoouser_seq = @user_seq 
		and review_exists_yn = 'N'
	)
	begin
		return 1
	end
	else
	begin
		return -1
	end
		
end

