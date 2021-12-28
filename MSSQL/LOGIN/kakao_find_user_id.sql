/* 
	Author      : Seunghwan Shin 
	Create date : 2021-06-29   
	Description : 회원 아이디 찾기
	     
	History	: 2021-06-29 Seunghwan Shin	#최초 생성  
*/
CREATE proc dbo.kakao_find_user_id
	@qoouser_email varchar(200)--유저 이메일 주소
,	@qoouser_phone_num varchar(20) -- 유저 핸드폰번호
,	@qoouser_id varchar(100) = null output -- 유저 아이디
as 
set nocount on 
set transaction isolation level read uncommitted 
begin

	
	if exists (select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_email = @qoouser_email and qoouser_phone_num = @qoouser_phone_num)
	begin
		
		select
			@qoouser_id = qoouser_id
		from dbo.QOO10_USER_REAL with(nolock)
		where qoouser_email = @qoouser_email 
		and qoouser_phone_num = @qoouser_phone_num

	end
	


end

