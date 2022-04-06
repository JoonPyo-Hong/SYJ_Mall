/*
	Author      : Seunghwan Shin
	Create date : 2022-04-06 
	Description : QR 로그인으로 들어올 경우 해당 회원 고유번호에 대해 로그를 남기거나 권한을 설정
	    
	History		: 2022-04-06 Seunghwan Shin	#최초 생성
	
	Real DB		:	declare @result int
					exec result = dbo.kakao_user_qr_login 2000001, '192.158.115.11'
					select @result
*/
alter proc [dbo].[kakao_user_qr_login]
	@user_seq bigint				-- 유저고유번호
,	@user_ip_address varchar(200)	-- 접속한 ip주소
as
set nocount on
set transaction isolation level read uncommitted
begin
	
	declare @last_ip_address	varchar(200) -- 마지막으로 접속한 아이피 주소
	,		@user_id			varchar(100) -- 유저의 아이디
	select
		@user_id = qoouser_id
	,	@last_ip_address = qoouser_lastlogin_ipaddress 
	from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = @user_seq

	if (isnull((select qoouser_instance_pw_grant from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = @user_seq),'N') = 'Y')
	begin
		return 1 --로그인 성공 : 비밀번호를 바꿔야하는 상태
	end
	--임시비밀번호를 발급받지 않은 상태라면
	else
	begin
		if(@last_ip_address = @user_ip_address)-- 마지막으로 접속한 ip와 현재 접속시도 하고 있는 ip가 같은경우
		begin
			-- 로그인 성공시간 기록 남기기
			insert into dbo.QOO10USERLOG
			(
				log_user_seq
			,	log_user_id
			,	log_dt
			,	ip_address
			)
			values
			(
				@user_seq
			,	@user_id
			,	default
			,	@user_ip_address
			)

			if @@ERROR <> 0 return -1

			--마지막 로그인에 대한 시간, 마지막 접속 아이피 주소 남기기
			update dbo.QOO10_USER_REAL 
			set	qoouser_lastlogin_datetime = getdate()
			,	qoouser_lastlogin_ipaddress = @user_ip_address
			where qoouser_seq = @user_seq 

			if @@ERROR <> 0 return -1

			return 0 -- 로그인 성공
		end
		-- 마지막으로 접속한 ip와 현재 접속시도 하고 있는 ip가 같지 않은경우
		else
		begin
			return 2
		end
	end

end



