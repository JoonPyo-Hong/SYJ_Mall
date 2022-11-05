/*
	Author      : Seunghwan Shin
	Create date : 2022-11-05 
	Description : 로그인 정합성 sp - 로그인에 문제가 없는지 판단
	    
	History		: 2022-11-05 Seunghwan Shin	#최초 생성

	Real DB		:	declare @result int
					exec @result = dbo.kakao_user_login_checking '0.0.0.0', '2022-11-05 13:22:22.122', 2000001
					select @result

*/
alter proc [dbo].[kakao_user_login_checking]
	@user_ip_address varchar(100)	-- 접속한 ip주소
,	@cur_date datetime				-- 접속시도한 날짜 시간
,	@user_seq bigint				-- user seq
as
set nocount on
set transaction isolation level read uncommitted
begin
	
	declare @last_ip_address varchar(100) -- 마지막으로 접속한 아이피 주소
	select @last_ip_address = qoouser_lastlogin_ipaddress from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = @user_seq


	-- 1. 임시비밀번호를 발급받은 상태 -> 비밀번호를 바꿔야 한다.
	if (isnull((select qoouser_instance_pw_grant from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = @user_seq),'N') = 'Y')
	begin
		return 1
	end
	-- 2. 지난번 접속 아이피와 다른 경우 -> 자동로그인 방지 정책 따라야한다.
	else if (isnull((select qoouser_lastlogin_ipaddress from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = @user_seq),'N') <> @last_ip_address)
	begin
		return 2
	end
	-- 3. 문제가 없는 경우
	else
	begin
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
			return -1
		end

		return 3
	end

	-- 4. 문제가 발생한 경우
	return -1


end

