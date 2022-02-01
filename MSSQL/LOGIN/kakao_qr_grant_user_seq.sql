/* 
	Author      : Seunghwan Shin 
	Create date : 2022-01-31

	Description : QR 코드로 인증패스한 이후 해당 유저의 유저번호 리턴
	     
	History	: 2022-01-31 Seunghwan Shin	#최초 생성
	
	Real DB :	declare @result int
				exec dbo.kakao_qr_grant_user_seq ''
				select @result
	
	
*/
alter proc dbo.kakao_qr_grant_user_seq
	@uuid UNIQUEIDENTIFIER
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	declare @user_seq bigint = -1

	select
		@user_seq = pass_user_seq
	from dbo.KAKAO_QR_QUEUE with(nolock)
	where kakao_qr_guid = @uuid
	and pass_yn = 'Y'
	
	--유저가 qr 코드 로그인을 끝낸경우 해당 테이블에 정보를 지워준다
	if (@user_seq <> -1)
	begin
		delete dbo.KAKAO_QR_QUEUE
		where kakao_qr_guid = @uuid
	end

	return @user_seq
end





