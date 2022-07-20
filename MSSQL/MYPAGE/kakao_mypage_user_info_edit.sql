/* 
	Author      : Seunghwan Shin 
	Create date : 2022-07-20
	Description : 고객의 이름 변경해주는 sp
	     
	History	:	2021-07-20	Seunghwan Shin	#최초 생성

	Real DB : exec dbo.kakao_mypage_user_info_edit 

*/
CREATE proc dbo.kakao_mypage_user_info_edit
	@user_seq	bigint
,	@user_name	nvarchar(30)
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	update dbo.QOO10_USER_REAL
	set qoouser_name = @user_name
	where qoouser_seq = @user_seq

	if @@error <> 0 
		return -1
	
	return 0
end

