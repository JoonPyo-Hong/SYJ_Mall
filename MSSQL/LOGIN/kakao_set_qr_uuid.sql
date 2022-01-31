/* 
	Author      : Seunghwan Shin 
	Create date : 2022-01-31
	Description : QR 코드 사용을 위해 QR url 생성후 테이블 정보에 넣어두기
		     
	History	: 2022-01-31 Seunghwan Shin	#최초 생성
	
	Real DB : exec dbo.kakao_set_qr_uuid 2000001, '122.131.554.66'
			  
*/ 
CREATE proc dbo.kakao_set_qr_uuid
	@uuid UNIQUEIDENTIFIER
as
set nocount on 
set transaction isolation level read uncommitted 

begin
	
	begin try
		begin tran
				
			insert into dbo.KAKAO_QR_QUEUE 
			(
				kakao_qr_guid
			,	request_dt
			,	pass_yn
			,	pass_user_seq
			)
			values
			(
				@uuid
			,	getdate()
			,	'N'
			,	null
			)

		commit tran
	end try
	begin catch
		rollback tran
		return -1
	end catch

	return 1
end	




