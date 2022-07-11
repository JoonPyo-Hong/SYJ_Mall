/* 
	Author      : Seunghwan Shin 
	Create date : 2022-07-11   
	Description : 구입할 유저의 카카오 포인트 잔액 가져와주기
	     
	History	: 2022-07-11 Seunghwan Shin	#최초생성	


			  	   
	Real DB :	exec dbo.kakao_product_pay_user_kakao_point_balance 2000001
				
*/
CREATE proc dbo.kakao_product_pay_user_kakao_point_balance
	@user_seq bigint
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	select 
		qoouser_hascoin
	from dbo.QOO10_USER_REAL with(nolock)
	where qoouser_seq = @user_seq

end

