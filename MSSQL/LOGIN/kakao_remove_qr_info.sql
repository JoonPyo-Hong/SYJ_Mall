/* 
	Author      : Seunghwan Shin 
	Create date : 2022-02-01
	Description : QR 코드 리프레시 된 경우나 만료된 경우 해당 uuid 테이블에서 지워준다.
		     
	History	: 2022-02-01 Seunghwan Shin	#최초 생성
	
	Real DB : exec dbo.kakao_remove_qr_info '123-33-22'
			  
*/ 
alter proc dbo.kakao_remove_qr_info
	@uuid UNIQUEIDENTIFIER	-- uuid
as
set nocount on 
set transaction isolation level read uncommitted 

begin
	
	begin try
		begin tran
				
			delete dbo.KAKAO_QR_QUEUE
			where kakao_qr_guid = @uuid

		commit tran

		return 1

	end try
	begin catch
		rollback tran
		return -1
	end catch

end	
