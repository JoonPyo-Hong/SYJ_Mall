/*
	Author      : Seunghwan Shin
	Create date : 2022-11-04
	Description : ip 벤 확인
	    
	History		: 2021-11-04 Seunghwan Shin	#최초 생성
	
	Real DB		: declare @result int 
				  exec @result = dbo.kakao_get_login_ban_ip_yn '192.168.0.1','2022-10-29 22:12:45.523'
				  select @result

*/
alter proc [dbo].[kakao_get_login_ban_ip_yn]
	@user_ip_address varchar(100)	-- 접속한 ip주소
,	@cur_date datetime				-- 접속시도한 날짜 시간
as
set nocount on
set transaction isolation level read uncommitted
begin

	if exists (select * from dbo.TBLBANNEDIPLIST with(nolock) where banned_ip_address = @user_ip_address and banned_end_date >= @cur_date)
	begin
		return 1
	end
	else
	begin
		return 0
	end

end


