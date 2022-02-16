/* 
	Author      : Seunghwan Shin 
	Create date : 2022-01-31

	Description : QR 코드로 인증패스한 이후 해당 유저의 유저번호 리턴
	     
	History	: 2022-01-31 Seunghwan Shin	#최초 생성
			  2022-02-02 Seunghwan Shin	#QR 로그인 허용하지 않았을 경우에 테이블 데이터 변경 처리
	
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

	--로그인 허용여부를 아직 정하지 못한 경우
	if exists (select * from dbo.KAKAO_QR_QUEUE with(nolock) where kakao_qr_guid = @uuid)
	begin
		--여기서 로그인허용이 정해지면 @user_seq 에 -1이 아닌 숫자가 들어가게 될것이다.
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

	end
	-- 로그인을 허용하지 않은 경우
	else
	begin
		set @user_seq = -2
	end

	return @user_seq
end




select * from dbo.KAKAO_QR_QUEUE with(nolock)