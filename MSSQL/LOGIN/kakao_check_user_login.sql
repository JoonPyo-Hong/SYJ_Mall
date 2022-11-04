/*
	Author      : Seunghwan Shin
	Create date : 2022-11-04
	Description : user login 정보 확인(1)
	    
	History		: 2021-11-04 Seunghwan Shin	#최초 생성
	
	Real DB		: declare @result int 
				  exec @result = dbo.kakao_check_user_login  'admin' , 123
				  select @result

*/
CREATE proc [dbo].[kakao_check_user_login]
	@user_id varchar(100)			-- 유저 아이디
,	@user_pw char(64)				-- 유저 비밀번호
as
set nocount on
set transaction isolation level read uncommitted
begin

	if exists (select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = @user_id and qoouser_pw = @user_pw)
	begin
		return 1
	end
	else
	begin
		return 0
	end

end



