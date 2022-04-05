/* 
	Author      : Seunghwan Shin 
	Create date : 2022-04-05
	Description : QR 코드 요청 검증후 해당 ip 와 유저 정보에 이상이 있는지 없는지 판단 해준다.
		     
	History	: 2022-04-05 Seunghwan Shin	#최초 생성
	
	Real DB : exec dbo.kakao_get_qr_user_login_yn 2000001, '192.221.443.112'
			  
*/ 
alter proc dbo.kakao_get_qr_user_login_yn
	@user_seq bigint		-- 유저 고유변호
,	@try_ip varchar(200)	-- 유저 qr 시도 아이피 번호
as
set nocount on 
set transaction isolation level read uncommitted 

begin
	
	declare @user_id varchar(100)
	,		@result int
	declare @today datetime = getdate() -- 현재시각

	
	-- 밴 당한 아이피인지 확인해준다. => 벤당한 아이피라면 접근 차단
	if exists (select * from dbo.TBLBANNEDIPLIST with(nolock) where banned_ip_address = @try_ip and banned_end_date > @today) -- 벤당한 아이피의 경우 and 아직 벤시간이 지나지 않음
	begin
		return -1
	end
	else if exists (select * from dbo.TBLBANNEDIPLIST with(nolock) where banned_ip_address = @try_ip and banned_end_date <= @today) -- 벤당한 아이피의 경우 and 벤 시간이 지남
	begin
		if exists (select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = @user_seq ) -- 로그인 정보가 존재하는 경우
		begin
			delete dbo.TBLBANNEDIPLIST where banned_ip_address = @try_ip

			if @@ERROR <> 0 return -2

			return 1
		end
		else -- 로그인 정보가 존재하지 않는 경우
		begin
			declare @try_count int -- 벤 카운트
			
			--아이피 로그기록 남기기
			insert into dbo.LOGINTRYIP
			(
				ip_address
			,	try_time
			)
			values
			(
				@try_ip
			,	default
			)

			if @@ERROR <> 0 return -2


			-- 시도한 횟수 : 15초안에 4번이상 시도하면, 벤을 시킨다.
			select @try_count = count(*) from dbo.LOGINTRYIP with(nolock) 
			where ip_address = @try_ip 
			and  DATEDIFF(ss,try_time,@today) <= 15

			-- 4번 이상 시도한 경우 => banned
			if (@try_count >= 4)
			begin
				update dbo.TBLBANNEDIPLIST 
				set 
					banned_count += 1
				,	banned_end_date = dateadd(mi,banned_count*5,@today)										
				where banned_ip_address = @try_ip
				
				if @@ERROR <> 0 return -2

			end
			
			return -1
		end
	end
	--벤 당하지 아닌 아이피인 경우 -> 로그인 정보 확인
	else
	begin
		if exists (select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = @user_seq and qoouser_instance_pw_grant = 'Y' and @today > dateadd(mi,1,qoouser_instance_pw_time)) -- 로그인 정보가 존재하는 경우 and 임시비번 발급받은 경우인데 시간 만료된 경우
		begin
			
			declare @try_count_second int
			
			--아이피 로그기록 남기기
			insert into dbo.LOGINTRYIP
			(
				ip_address
			,	try_time
			)
			values
			(
				@try_ip
			,	default
			)


			-- 시도한 횟수 : 15초안에 4번이상 시도하면, 벤을 시킨다.
			select @try_count_second = count(*) from dbo.LOGINTRYIP with(nolock) 
			where ip_address = @try_ip 
			and  DATEDIFF(ss,try_time,@today) <= 15
			
			
			if (@try_count_second >= 4)
			begin
				if(@try_ip != '0:0:0:0:0:0:0:1')
				begin
					insert into dbo.TBLBANNEDIPLIST values (@try_ip,1,dateadd(mi,5,@today))
					
					if @@ERROR <> 0 return -2
					
				end
			end
			
			return -1
			
		end
		else if exists (select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = @user_seq) -- 그저 로그인 정보가 존재하는 경우
		begin

			return 1
		
		end
		-- 정보가 존재하지 않는데, 비정상적으로 계속 접근하는 경우
		else
		begin
			declare @try_count_seconds int
			
			--아이피 로그기록 남기기
			insert into dbo.LOGINTRYIP
			(
				ip_address
			,	try_time
			)
			values
			(
				@try_ip
			,	default
			)


			-- 시도한 횟수 : 15초안에 4번이상 시도하면, 벤을 시킨다.
			select @try_count_seconds = count(*) from dbo.LOGINTRYIP with(nolock) 
			where ip_address = @try_ip 
			and  DATEDIFF(ss,try_time,@today) <= 15
			
			
			if (@try_count_second >= 4)
			begin
				if(@try_ip != '0:0:0:0:0:0:0:1')
				begin
					insert into dbo.TBLBANNEDIPLIST values (@try_ip,1,dateadd(mi,5,@today))
					
					if @@ERROR <> 0 return -2
					
				end
			end
			
			return -1
			
		end

	end



end	



