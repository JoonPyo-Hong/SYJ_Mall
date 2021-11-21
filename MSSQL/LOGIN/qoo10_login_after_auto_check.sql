/*
	Author      : Seunghwan Shin
	Create date : 2021-06-10
	Description : 자동로그인방지 인증 후 회원의 로그인정보 기록
	    
	History		: 2021-06-10 Seunghwan Shin	#최초 생성

*/
CREATE proc [dbo].[qoo10_login_after_auto_check]
	@user_ip_address varchar(100)-- 접속한 ip주소
,	@user_seq int-- 유저고유번호
as
set nocount on
set transaction isolation level read uncommitted
begin
	

	--마지막 로그인에 대한 시간, 마지막 접속 아이피 주소 남기기
	update dbo.QOO10_USER_REAL set 
			qoouser_lastlogin_datetime = getdate()
		,	qoouser_lastlogin_ipaddress = @user_ip_address
	where qoouser_seq = @user_seq 

	if @@ERROR <> 0
	begin
		rollback tran
	end
					
end

