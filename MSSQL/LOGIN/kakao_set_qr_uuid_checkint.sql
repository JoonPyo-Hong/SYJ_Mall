/* 
	Author      : Seunghwan Shin 
	Create date : 2022-01-31
	Description : QR 코드 사용을 위해 QR url 생성후 테이블 정보랑 비교해주기
		     
	History	: 2022-01-31 Seunghwan Shin	#최초 생성
			  2022-02-01 Seunghwan Shin	#시간경과 관련 로직 변경	
	
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
	
	--1. uuid 가 존재하는 경우
	if exists (select * from dbo.KAKAO_QR_QUEUE where kakao_qr_guid = @uuid)
	begin
		-- 시간초과하지 않은 경우
		if exists (select * from dbo.KAKAO_QR_QUEUE where kakao_qr_guid = @uuid and request_dt >= dateadd(minute,-5,@now))
		begin
			
			declare @row_count int

			update kqq 
			set pass_yn = 'Y'
			,	pass_user_seq = @user_seq
			from dbo.KAKAO_QR_QUEUE kqq
			where kqq.kakao_qr_guid = @uuid

			set @row_count = @@ROWCOUNT

			if (@@ERROR = 0)  
			begin
				if (@row_count = 1) return 1--정상
				else return -1
			end
		end
		else
		begin
			
			declare @row_count_d int

			delete dbo.KAKAO_QR_QUEUE
			where kakao_qr_guid = @uuid

			set @row_count_d = @@ROWCOUNT

			if (@@ERROR = 0)  
			begin
				if (@row_count_d = 1) return 2--정상
				else return -2
			end

		end
	end
	--uuid 가 존재하지 않는 경우
	else 
	begin
		return -3--오류
	end

end	
