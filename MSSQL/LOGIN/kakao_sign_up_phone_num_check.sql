/* 
	Author      : Seunghwan Shin 
	Create date : 2021-07-04   
	Description : 회원가입 - 고객의 휴대폰번호가 중복되는지 체크
	     
	History	: 2021-07-04 Seunghwan Shin	#최초 생성 
*/
CREATE proc dbo.kakao_sign_up_phone_num_check
	@user_phone_num varchar(20) -- 유저가 입력한 폰번호
,	@result int output
as 
set nocount on 
set transaction isolation level read uncommitted 
begin

	if exists (select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_phone_num = @user_phone_num)
	begin
		set @result = -1;
	end
	else
	begin
		set @result = 1;
	end
end

