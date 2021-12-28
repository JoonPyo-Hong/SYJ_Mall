/* 
	Author      : Seunghwan Shin 
	Create date : 2021-07-03   
	Description : 회원의 비밀번호를 임시비밀번호로 변경해주는 로직
	     
	History	: 2021-07-03 Seunghwan Shin	#최초 생성
			  2021-10-01 Seunghwan Shin	#임시비밀번호 발급 시간	
*/
CREATE proc dbo.kakao_user_modify_pw
	@qoouser_id varchar(100)
,	@qoouser_email varchar(200)--유저 이메일 주소
,	@qoouser_phone_num varchar(20) -- 유저 핸드폰번호
,	@qoouser_pw varchar(800) -- 임시비밀번호
,	@result int output
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	declare @user_seq bigint;
	
	select 
		@user_seq = qoouser_seq 
	from dbo.QOO10_USER_REAL with(nolock)
	where qoouser_id = @qoouser_id
	and qoouser_email = @qoouser_email
	and qoouser_phone_num = @qoouser_phone_num


	begin try
		begin tran
			
			update dbo.QOO10_USER_REAL 
			set qoouser_pw = @qoouser_pw
			,	qoouser_instance_pw_grant = 'Y'
			,	qoouser_instance_pw_time = getdate()
			where qoouser_seq = @user_seq

			set @result = 1;

		commit tran
	end try
	begin catch
		set @result = -1;
		rollback tran
	end catch
end

