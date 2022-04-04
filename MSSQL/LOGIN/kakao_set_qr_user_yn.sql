/* 
	Author      : Seunghwan Shin 
	Create date : 2022-04-04
	Description : QR 코드 사용을 위해 고객의 유무 판단
		     
	History	: 2022-04-04 Seunghwan Shin	#최초 생성
	
	Real DB : exec dbo.kakao_set_qr_uuid_prev_checking '123-33-22', 2000001
			  
*/ 
CREATE proc dbo.kakao_set_qr_user_yn
	@user_seq bigint		-- 유저 고유변호
as
set nocount on 
set transaction isolation level read uncommitted 

begin
	
	if exists (select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_seq = @user_seq)
	begin
		return 1
	end
	else
	begin
		return -1
	end

end	








