/* 
	Author      : Seunghwan Shin 
	Create date : 2021-06-23   
	Description : 에러요인 입력
	     
	History	: 2021-06-23 Seunghwan Shin	#최초 생성  
			  2021-06-24 Seunghwan Shin	#error_time 추가

*/
CREATE proc dbo.kakao_error_log
	@user_ip_address varchar(200) -- 유저 아이피
,	@err_msg nvarchar(max)
as 
set nocount on 
set transaction isolation level read uncommitted 
begin

	insert into dbo.KAKAO_ERR_LOG_TBL 
	(
		user_ip_address
	,	err_msg
	,	error_time
	)
	values 
	(
		@user_ip_address
	,	@err_msg
	,	getdate()
	);

end

