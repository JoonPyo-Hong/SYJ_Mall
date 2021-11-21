/*
	Author      : Seunghwan Shin
	Create date : 2021-03-16 
	Description : ip 검증개체
	    
	History		: 2021-03-16 Seunghwan Shin	#최초 생성
				  2021-03-31 Seunghwan Shin	#마지막 회원접속시간,접속ip 추가
				  2021-04-03 Seunghwan Shin #자동로그인 방지 추가
				  2021-05-16 Seunghwan Shin #전반적으로 모두 수정
				  2021-05-26 Seunghwan Shin #비정상 로그인 로직 수정
				  2021-06-08 Seunghwan Shin #유저객체를 넘겨주기 위한 로직 수정
				  2021-07-06 Seunghwan Shin #임시비밀번호를 발급받은 유저를 바로 비밀번호 변경 페이지로 넘겨주기
				  2021-07-07 Seunghwan Shin #필터조건 id 에서 유저 고유번호로 변경
				  2021-07-13 Seunghwan Shin #프론트 로그인 처리로 아이피를 검증해서 벤하는 로직 제거

*/
CREATE proc [dbo].[qoo10_total_login]
	@user_ip_address varchar(100)-- 접속한 ip주소
,	@qoouser_id varchar(100) -- 유저 id
,	@qoouser_pw varchar(800) -- 유저 pw
,	@login_code int output /*
							이미 로그인은 성공한 상태로 시작하는것.
							0 : 로그인 성공, 
							1 : 로그인은 성공했으나 비밀번호를 변경해야 하는 상태,
							2 : 로그인은 성공했으나 아이피주소가 지난번과 달라 자동로그인 검증과정을 거쳐야 함

							*/ 
,	@user_seq int = -1 output -- 유저고유번호
as
set nocount on
set transaction isolation level read uncommitted
begin
	begin try
		declare @last_ip_address	varchar(100) -- 마지막으로 접속한 아이피 주소
		,		@qoouser_seq		bigint		 -- 유저의 고유번호

		select @qoouser_seq = qoouser_seq from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = @qoouser_id  and qoouser_pw = @qoouser_pw
		select @last_ip_address = qoouser_lastlogin_ipaddress from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = @qoouser_seq
				
		--임시비밀번호를 발급받은 상태라면
		if (isnull((select qoouser_instance_pw_grant from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = @qoouser_seq),'N') = 'Y')
		begin
			set @login_code = 1 --로그인 성공 : 비밀번호를 바꿔야하는 상태

			--유저 고유번호 할당
			select @user_seq = @qoouser_seq
		end
		--임시비밀번호를 발급받지 않은 상태라면
		else
		begin
			if(@last_ip_address = @user_ip_address)-- 마지막으로 접속한 ip와 현재 접속시도 하고 있는 ip가 같은경우
			begin
				set @login_code = 0 --로그인 성공	

				--유저 고유번호 할당
				select @user_seq = @qoouser_seq
						
				begin tran
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
						@qoouser_seq
					,	@qoouser_id
					,	default
					,	@user_ip_address
					)

					--마지막 로그인에 대한 시간, 마지막 접속 아이피 주소 남기기
					update dbo.QOO10_USER_REAL set 
						qoouser_lastlogin_datetime = getdate()
					,	qoouser_lastlogin_ipaddress = @user_ip_address
					where qoouser_seq = @qoouser_seq 

				commit tran
			end
			else-- 마지막으로 접속한 ip와 현재 접속시도 하고 있는 ip가 같지 않은경우
			begin
					set @login_code = 2
					
					--유저 고유번호 할당
					select @user_seq = @qoouser_seq

			end
		end
	end try
	begin catch
		rollback tran
	end catch
end

