/* 
	Author      : Seunghwan Shin 
	Create date : 2022-01-11
	Description : 고객 로그인 유지 관련 - 고객의 rsa 비밀키를 가져와 준다
		     
	History	: 2022-01-11 Seunghwan Shin	#최초 생성
	
	Real DB : exec dbo.kakao_get_user_login_stay 2000001
			  
*/
alter proc dbo.kakao_get_user_login_stay
	@qoouser_seq	bigint			-- 회원 고유번호
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	
	select 
		qoouser_id_pw_secure_key 
	from dbo.QOO10_USER_REAL with(nolock)
	where qoouser_seq = @qoouser_seq
	
		
end

