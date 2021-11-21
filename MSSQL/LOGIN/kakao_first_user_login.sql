/*
	Author      : Seunghwan Shin
	Create date : 2021-07-13
	Description : 로그인 정보가 회원정보에 있는지 체크
	    
	History		: 2021-07-13 Seunghwan Shin	#최초 생성
				  2021-07-23 Seunghwan Shin #마스터아이피(로컬아이피)는 몇번의 로그인 상관없이 ip벤 예외처리
				  2021-07-28 Seunghwan Shin #벤당하는 기한 설정
				  2021-10-02 Seunghwan Shin #임시비밀번호 기한설정 -> 임시비밀번호 기한을 넘어가면 로그인 불가

*/
CREATE proc [dbo].[kakao_first_user_login]
	@qoouser_id varchar(100) -- 유저 id
,	@qoouser_pw varchar(800) -- 유저 pw
,	@user_ip_address varchar(100)-- 접속한 ip주소
,	@result int output -- 결과값 
						/*	 0 : 벤당한 아이피로 접근
							 1 : 로그인 정보가 존재함
							-1 : 로그인 정보가 존재하지 않음 : 즉 아이디 비밀번호 둘중 하나이상이 틀렸다는 말임.
							-100 : 오류발생
						*/
as
set nocount on
set transaction isolation level read uncommitted
begin

	declare @getdate datetime = getdate() -- 현재날짜

	begin try
		-- 밴 당한 아이피인지 확인해준다.
		if exists (select * from dbo.TBLBANNEDIPLIST with(nolock) where banned_ip_address = @user_ip_address and banned_end_date > @getdate) -- 벤당한 아이피의 경우 and 아직 벤시간이 지나지 않음
		begin
			set @result = 0
		end
		else if exists (select * from dbo.TBLBANNEDIPLIST with(nolock) where banned_ip_address = @user_ip_address and banned_end_date <= @getdate) -- 벤당한 아이피의 경우 and 벤 시간이 지남
		begin
			if exists (select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = @qoouser_id  and qoouser_pw = @qoouser_pw) -- 로그인 정보가 존재하는 경우 
			begin
				begin tran
					delete dbo.TBLBANNEDIPLIST where banned_ip_address = @user_ip_address
				commit tran

				set @result = 1
			end
			else-- 로그인 정보가 존재하지 않는 경우
			begin
				declare @try_count int

				begin tran
					--아이피 로그기록 남기기
					insert into dbo.LOGINTRYIP
					(
						ip_address
					,	try_time
					)
					values
					(
						@user_ip_address
					,	default
					)
				commit tran

				-- 시도한 횟수 : 15초안에 4번이상 시도하면, 벤을 시킨다.
				select @try_count = count(*) from dbo.LOGINTRYIP with(nolock) 
				where ip_address = @user_ip_address 
				and  DATEDIFF(ss,try_time,getdate()) <= 15

				if (@try_count >= 4)
				begin
					begin tran

						update dbo.TBLBANNEDIPLIST 
						set 
							banned_count += 1
						,	banned_end_date = dateadd(mi,banned_count*5,@getdate)										
						where banned_ip_address = @user_ip_address	
						
					commit tran
				end
			end
		end
		--벤 당하지 아닌 아이피인 경우 -> 로그인 정보 확인
		else
		begin
			if exists (select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = @qoouser_id  and qoouser_pw = @qoouser_pw and qoouser_instance_pw_grant = 'Y' and @getdate > dateadd(mi,1,qoouser_instance_pw_time)) -- 로그인 정보가 존재하는 경우 and 임시비번 발급받은 경우인데 시간 만료된 경우
			begin
				set @result = -1

				declare @try_count_second int
				
				begin tran
					--아이피 로그기록 남기기
					insert into dbo.LOGINTRYIP
					(
						ip_address
					,	try_time
					)
					values
					(
						@user_ip_address
					,	default
					)
				commit tran

				-- 시도한 횟수 : 15초안에 4번이상 시도하면, 밴을 시킨다.
				select @try_count_second = count(*) from dbo.LOGINTRYIP with(nolock) 
				where ip_address = @user_ip_address 
				and  DATEDIFF(ss,try_time,getdate()) <= 15

				if (@try_count_second >= 4)
				begin
					if(@user_ip_address != '0:0:0:0:0:0:0:1')
					begin
						begin tran
							insert into dbo.TBLBANNEDIPLIST values (@user_ip_address,1,dateadd(mi,5,@getdate))
						commit tran
					end
				end
			end
			else if exists (select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = @qoouser_id  and qoouser_pw = @qoouser_pw) -- 그저 로그인 정보가 존재하는 경우
			begin

				set @result = 1
			end
			-- 정보가 존재하지 않는데, 비정상적으로 계속 접근하는 경우
			else
			begin
				set @result = -1

				declare @try_count_seconds int

				begin tran
					--아이피 로그기록 남기기
					insert into dbo.LOGINTRYIP
					(
						ip_address
					,	try_time
					)
					values
					(
						@user_ip_address
					,	default
					)
				commit tran

				-- 시도한 횟수 : 15초안에 4번이상 시도하면, 밴을 시킨다.
				select @try_count_seconds = count(*) from dbo.LOGINTRYIP with(nolock) 
				where ip_address = @user_ip_address 
				and  DATEDIFF(ss,try_time,getdate()) <= 15

			    if (@try_count_second >= 4)
				begin
					if(@user_ip_address != '0:0:0:0:0:0:0:1')
					begin
						begin tran
							insert into dbo.TBLBANNEDIPLIST values (@user_ip_address,1,dateadd(mi,5,@getdate))
						commit tran
					end
				end
				
			end
		end
	end try
	begin catch
		set @result = -100
		rollback tran
	end catch
end

