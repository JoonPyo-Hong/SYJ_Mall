/*
	Author      : Seunghwan Shin
	Create date : 2021-06-08
	Description : 유저 정보 반환
	    
	History		: 2021-06-08 Seunghwan Shin #유저객체를 넘겨주기 위한 로직 수정

*/
create proc [dbo].[qoo10_user_info]
	@qoouser_seq int
as
set nocount on
set transaction isolation level read uncommitted
begin
	
	select
		qoouser_seq as userSeq
	,	qoouser_id as userId
	,	qoouser_gender as userGender
	,	qoouser_nation as userNation
	,	qoouser_hascoin as userHasCoin
	,	qoouser_grade as userGrade
	,	qoouser_name as userName
	from dbo.QOO10_USER_REAL with(nolock)
	where qoouser_seq = @qoouser_seq


end

