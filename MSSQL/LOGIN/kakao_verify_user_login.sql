/*
	Author      : Seunghwan Shin
	Create date : 2022-11-04
	Description : user login 정보 확인
	    
	History		: 2021-11-04 Seunghwan Shin	#최초 생성
	
	Real DB		: declare @result int 
				  exec @result = dbo.kakao_verify_user_login '192.168.0.1','2022-10-29 22:12:45.523', 'admin' , 123
				  select @result

*/
alter proc [dbo].[kakao_verify_user_login]
	@user_ip_address varchar(100)	-- 접속한 ip주소
,	@cur_date datetime				-- 접속시도한 날짜 시간
,	@user_id varchar(100)			-- 유저 아이디
,	@user_pw char(64)				-- 유저 비밀번호
as
set nocount on
set transaction isolation level read uncommitted
begin
	
	declare @user_seq bigint

	if exists (select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = @user_id and qoouser_pw = @user_pw)
	begin
		
		select @user_seq = qoouser_seq from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = @user_id and qoouser_pw = @user_pw

		-- 로그인 기록
		update dbo.QOO10_USER_REAL
		set qoouser_lastlogin_datetime = @cur_date
		,	qoouser_lastlogin_ipaddress = @user_ip_address
		where qoouser_seq = @user_seq
		
		if @@error <> 0
		begin
			return -1
		end


		-- 로그인 시도 테이블 리셋
		update dbo.TBLBANNEDIPLIST 
		set banned_count = 0
		where banned_ip_address = @user_ip_address
		
		if @@error <> 0
		begin
			return -2
		end


		return @user_seq

	end
	else
	begin
		return 0
	end

end


