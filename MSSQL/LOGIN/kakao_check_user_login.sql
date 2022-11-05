/*
	Author      : Seunghwan Shin
	Create date : 2022-11-04
	Description : user login 정보 확인(1)
	    
	History		: 2021-11-04 Seunghwan Shin	#최초 생성
				  2021-11-05 Seunghwan Shin #return 값변경 => user_seq 로 변경
	
	Real DB		: declare @result int 
				  exec @result = dbo.kakao_check_user_login  'admin' , '24b0015e0d850b1c796d7586d21072b5f8ebdc180805edc074cdf034b245478b'
				  select @result

*/
alter proc [dbo].[kakao_check_user_login]
	@user_id varchar(100)			-- 유저 아이디
,	@user_pw char(64)				-- 유저 비밀번호
as
set nocount on
set transaction isolation level read uncommitted
begin
	
	declare @user_seq bigint = -1

	select @user_seq = qoouser_seq from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = @user_id and qoouser_pw = @user_pw

	return @user_seq
	
end

