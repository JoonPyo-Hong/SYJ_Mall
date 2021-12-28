/* 
	Author      : Seunghwan Shin 
	Create date : 2021-07-07   
	Description : 고객의 임시비밀번호를 고객이 지정한 비밀번호로 변경
	     
	History	: 2021-07-07 Seunghwan Shin	#최초 생성 
			  2021-08-02 Seunghwan Shin #로그인처리완료 제거
*/
CREATE proc dbo.kakao_user_pw_redefined_return
	@user_seq bigint -- 유저의 고유번호
,	@user_pw varchar(800) --유저가 지정한 비밀번호	
,	@result int output
as 
set nocount on 
set transaction isolation level read uncommitted 
begin

	begin try
		
		begin tran
			update dbo.QOO10_USER_REAL 
			set qoouser_pw = @user_pw
			,	qoouser_instance_pw_grant = 'N'
			where qoouser_seq = @user_seq

			set @result = 1;
		commit tran

	end try
	begin catch
		
		set @result = -1;
		rollback tran

	end catch
end

