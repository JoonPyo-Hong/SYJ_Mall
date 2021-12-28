/* 
	Author      : Seunghwan Shin 
	Create date : 2021-08-28
	Description : 회원의 장바구니에 존재하는 물품리스트를 가져와준다.
	     
	History	: 2021-08-28 Seunghwan Shin	#최초 생성
			  2021-08-29 Seunghwan Shin	#조회쿼리에 cart_del_yn 추가	
	
	Real DB : exec dbo.kakao_cookie_product_user_nohave 2000001 
			  
*/
CREATE proc dbo.kakao_cookie_product_user_nohave
	@qoouser_seq	bigint		-- 회원 고유번호
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	select 
		product_id as productId 
	,	cart_del_yn as delYn
	from dbo.KAKAO_USER_SHOPPING_CART with(nolock)
	where qoouser_seq = @qoouser_seq
		
end


