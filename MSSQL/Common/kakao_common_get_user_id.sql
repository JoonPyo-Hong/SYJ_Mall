/* 
	Author      : Seunghwan Shin 
	Create date : 2022-04-05
	Description : 회원 번호에 상응하는 회원 아이디 정보 가져오기
		     
	History	: 2022-04-05 Seunghwan Shin	#최초 생성
	
	Real DB : exec dbo.kakao_common_get_user_id 2000001
			  
*/ 
alter proc dbo.kakao_common_get_user_id
	@user_seq bigint		-- 유저 고유변호
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	select 
		qoouser_id as userId
	from dbo.QOO10_USER_REAL with(nolock)
	where qoouser_seq = @user_seq

end	



