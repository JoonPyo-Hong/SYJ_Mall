/* 
	Author      : Seunghwan Shin 
	Create date : 2021-06-20   
	Description : 회원가입 : 아이디 검증과정
	     
	History	: 2021-06-20 Seunghwan Shin	#최초 생성  
*/
create proc dbo.kakao_sign_up_email_check
	@email varchar(200) -- 이메일 아이디
,	@result int output
as 
set nocount on 
set transaction isolation level read uncommitted 
begin

	if exists (select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_email = @email)
	begin
		set @result = -1;
	end
	else
	begin
		set @result = 1;
	end
end

