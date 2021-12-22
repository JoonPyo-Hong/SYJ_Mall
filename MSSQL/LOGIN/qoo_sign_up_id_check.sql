/* 
	Author      : Seunghwan Shin 
	Create date : 2021-05-30   
	Description : 회원가입 : 아이디 검증과정
	     
	History	: 2021-05-30 Seunghwan Shin	#최초 생성  
*/
create proc dbo.qoo_sign_up_id_check
	@qoouser_id varchar(100) -- 아이디 o
,	@result int output
as 
set nocount on 
set transaction isolation level read uncommitted 
begin

	if exists (select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = @qoouser_id)
	begin
		set @result = -1;
	end
	else
	begin
		set @result = 1;
	end
end

