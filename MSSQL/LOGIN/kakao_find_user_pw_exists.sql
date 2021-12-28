/* 
	Author      : Seunghwan Shin 
	Create date : 2021-07-03   
	Description : 회원의 비밀번호를 찾기전 회원이 입력한 정보와 일치하는 아이디가 있는지 찾아주는 작업
	     
	History	: 2021-07-03 Seunghwan Shin	#최초 생성  
*/
create proc dbo.kakao_find_user_pw_exists
	@qoouser_id varchar(100)
,	@qoouser_email varchar(200)--유저 이메일 주소
,	@qoouser_phone_num varchar(20) -- 유저 핸드폰번호
,	@result int output
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
	

	if exists (select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = @qoouser_id and qoouser_email = @qoouser_email and qoouser_phone_num = @qoouser_phone_num)
	begin
		set @result = 1;
	end
	else
	begin
		set @result = -1;
	end
	
end


