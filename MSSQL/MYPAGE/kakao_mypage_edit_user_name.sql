/*
	Author      : Seunghwan Shin
	Create date : 2022-07-23 
	Description : 고객의 이름 변경해주기
	    
	History		: 2021-07-23 Seunghwan Shin	#최초 생성
				  
	Real DB		: exec dbo.kakao_mypage_edit_user_name 2000001, N'신승화니'	
*/
alter proc dbo.kakao_mypage_edit_user_name
	@qoouser_seq	varchar(10)			-- 회원 고유번호
,	@modify_name	nvarchar(15)		-- 회원의 새로운 이름
as
set nocount on
set transaction isolation level read uncommitted
begin
	
	update dbo.QOO10_USER_REAL 
	set qoouser_name = @modify_name
	where qoouser_seq = @qoouser_seq

	if @@error <> 0
		return -1

	return 1
end


