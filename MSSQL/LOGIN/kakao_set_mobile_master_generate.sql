/* 
	Author      : Seunghwan Shin 
	Create date : 2022-01-25
	Description : QR 코드 사용을 위해 모바일 기기 등록
		     
	History	: 2022-01-25 Seunghwan Shin	#최초 생성
			  2022-01-26 Seunghwan Shin	#KAKAO_USER_MASTER_DEVICE_SEQ 테이블에 정보입력으로 로직 변경
	
	Real DB : exec dbo.kakao_set_mobile_master_generate 2000001, '122.131.554.66'
			  
*/ 
alter proc dbo.kakao_set_mobile_master_generate
	@qoouser_seq	bigint			-- 회원 고유번호
,	@ip_address		varchar(200)	-- 아이피 주소
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	

	if not exists (select * from dbo.KAKAO_USER_MASTER_DEVICE_SEQ with(nolock) where device_ip_address = @ip_address and qoouser_seq = @qoouser_seq)
	begin
		begin try
			begin tran
				
				insert into dbo.KAKAO_USER_MASTER_DEVICE_SEQ
				(
					device_ip_address
				,	qoouser_seq
				)
				values
				(
					@ip_address
				,	@qoouser_seq
				)

			commit tran
		end try
		begin catch
			rollback tran
			return -1
		end catch
	end	

	return 1
end	
