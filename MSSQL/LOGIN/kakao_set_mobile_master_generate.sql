/* 
	Author      : Seunghwan Shin 
	Create date : 2022-01-25
	Description : QR 코드 사용을 위해 모바일 기기 등록
		     
	History	: 2022-01-25 Seunghwan Shin	#최초 생성
	
	Real DB : exec dbo.kakao_set_mobile_master_generate 2000001
			  
*/ 
alter proc dbo.kakao_set_mobile_master_generate
	@qoouser_seq	bigint			-- 회원 고유번호
,	@ip_address		varchar(200)	-- 아이피 주소
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	declare @master_code varchar(200)

	select @master_code = qoouser_qr_device_ip from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = @qoouser_seq

	if (@master_code is null)
	begin
		begin try
			begin tran
				update dbo.QOO10_USER_REAL
				set qoouser_qr_device_ip = @ip_address
				where qoouser_seq = @qoouser_seq
			commit tran
		end try
		begin catch
			rollback tran
			return -1
		end catch
	end

	return 1
		
end
