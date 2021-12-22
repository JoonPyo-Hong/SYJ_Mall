/* 
	Author      : Seunghwan Shin 
	Create date : 2021-05-22   
	Description : 회원가입
	     
	History	: 2021-05-22 Seunghwan Shin	#최초 생성  
*/
CREATE proc dbo.qoo_sign_up
	@qoouser_id varchar(100) -- 아이디
,	@qoouser_pw varchar(800) -- 비밀번호
,	@qoouser_birthday datetime -- 생년월일
,	@qoouser_email varchar(200) -- 이메일
,	@qoouser_gender  char(1) -- 성별
,	@qoouser_nation char(2) -- 국적
,	@qoouser_ipaddress varchar(200) -- 아이피주소
,	@qoouser_phone_num varchar(20) -- 전화번호
,	@qoouser_receive_email char(1) -- 이메일 알람
,	@qoouser_receive_sms char(1) -- sms 알람
,	@qoouser_name nvarchar(30) -- 이름
,	@check int output
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
  
begin try
	
		begin tran
			insert into dbo.QOO10_USER_REAL 
			(
				qoouser_id
			,	qoouser_pw
			,	qoouser_birthday
			,	qoouser_email
			,	qoouser_gender
			,	qoouser_nation
			,	qoouser_ipaddress
			,	qoouser_hascoin
			,	qoouser_phone_num
			,	qoouser_grade
			,	qoouser_receive_email
			,	qoouser_receive_sms
			,	qoouser_denide
			,	qoouser_register_datetime
			,	qoouser_lastlogin_datetime
			,	qoouser_lastlogin_ipaddress
			,	qoouser_name
			)
			values
			(
				@qoouser_id
			,	@qoouser_pw
			,	@qoouser_birthday
			,	@qoouser_email
			,	@qoouser_gender
			,	@qoouser_nation
			,	@qoouser_ipaddress
			,	0
			,	@qoouser_phone_num
			,	1
			,	@qoouser_receive_email
			,	@qoouser_receive_sms
			,	'N'
			,	getdate()
			,	null
			,	@qoouser_ipaddress
			,	@qoouser_name
			)
		commit tran
		set @check = 1

	end try
	begin catch
		set @check = -1
		rollback tran
	end catch

end

