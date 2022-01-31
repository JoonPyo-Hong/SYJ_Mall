/* 
	Author      : Seunghwan Shin 
	Create date : 2022-01-31
	Description : QR 코드 사용을 위해 QR url 생성후 테이블 정보랑 비교해주기
		     
	History	: 2022-01-31 Seunghwan Shin	#최초 생성
	
	Real DB : exec dbo.kakao_set_qr_uuid_checkint 
			  
*/ 
alter proc dbo.kakao_set_qr_uuid_checkint
	@uuid UNIQUEIDENTIFIER	-- uuid
,	@user_seq bigint		-- 유저 고유변호
as
set nocount on 
set transaction isolation level read uncommitted 

begin
	
	declare @now datetime = getdate()
	declare @row_count int
	
	update kqq 
	set pass_yn = 'Y'
	,	pass_user_seq = @user_seq
	from dbo.KAKAO_QR_QUEUE kqq
	where kqq.kakao_qr_guid = @uuid
	and kqq.request_dt >= dateadd(minute,-5,@now)

	set @row_count = @@ROWCOUNT

	if (@@ERROR = 0)  
	begin
		if (@row_count = 1) 
		begin
			return @user_seq
		end
	end
	else 
	begin
		return -1
	end
	

end	



