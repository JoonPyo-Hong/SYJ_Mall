/* 
	Author      : Seunghwan Shin 
	Create date : 2022-02-01
	Description : QR 코드 사용을 위해 QR url 생성후 테이블 정보에 QR 요청 정보가 있는지 확인해주기
		     
	History	: 2022-02-01 Seunghwan Shin	#최초 생성
	
	Real DB : exec dbo.kakao_set_qr_uuid_prev_checking '123-33-22', 2000001
			  
*/ 
alter proc dbo.kakao_set_qr_uuid_prev_checking
	@uuid UNIQUEIDENTIFIER	-- uuid
,	@user_seq bigint		-- 유저 고유변호
as
set nocount on 
set transaction isolation level read uncommitted 

begin
	
	--uuid 에 대한 qr 요청 정보가 존재하는 경우
	if exists (select * from dbo.KAKAO_QR_QUEUE with(nolock) where kakao_qr_guid = @uuid)
	begin
		if exists (select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = @user_seq) return 1
		else return -2
	end
	else
	begin
		return -3
	end

end	