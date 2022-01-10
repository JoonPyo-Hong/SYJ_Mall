/* 
	Author      : Seunghwan Shin 
	Create date : 2022-01-10
	Description : 고객 로그인 유지 관련
	     
	History	: 2022-01-10 Seunghwan Shin	#최초 생성
	Real DB : 
			  
*/
alter proc dbo.kakao_user_login_stay_insert
	@qoouser_seq	bigint			-- 회원 고유번호
,	@privateKey		varchar(2000)	-- 로그인 관련 암호키
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	begin try
		begin tran

			update qur
			set qoouser_id_pw_secure_key = @privateKey
			from dbo.QOO10_USER_REAL qur
			where qur.qoouser_seq = @qoouser_seq
		commit tran

		return 1
	
	end try
	begin catch
		rollback tran
		return -1
	end catch
		
end




