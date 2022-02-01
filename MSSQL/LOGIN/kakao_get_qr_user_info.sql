/* 
	Author      : Seunghwan Shin 
	Create date : 2022-02-01
	Description : QR 코드 요청 검증후 이상 없는경우 유저정보를 반환
		     
	History	: 2022-02-01 Seunghwan Shin	#최초 생성
	
	Real DB : exec dbo.kakao_get_qr_user_info '123-33-22', 2000001
			  
*/ 
create proc dbo.kakao_get_qr_user_info
	@uuid UNIQUEIDENTIFIER	-- uuid
,	@user_seq bigint		-- 유저 고유변호
as
set nocount on 
set transaction isolation level read uncommitted 

begin
	
	declare @user_id varchar(100)
	,		@user_ip varchar(200)

	select 
		@user_id = qoouser_id
	from dbo.QOO10_USER_REAL with(nolock) 
	where qoouser_seq = @user_seq

	select 
		@user_ip = request_ip_address
	from dbo.KAKAO_QR_QUEUE with(nolock)
	where kakao_qr_guid = @uuid

	select
		@user_id as userId
	,	@user_ip as userIp

end	