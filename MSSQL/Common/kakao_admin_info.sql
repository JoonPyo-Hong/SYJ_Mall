/* 
	Author      : Seunghwan Shin 
	Create date : 2021-11-03   
	Description : 관리자 이메일 반환
	     
	History	: 2021-11-03 Seunghwan Shin	#최초 생성  
			  2022-07-11 Seunghwan Shin	#어드민 제외 추가

	Real DB : exec dbo.kakao_admin_info
*/
alter proc dbo.kakao_admin_info
as
set nocount on 
set transaction isolation level read uncommitted 
begin

	select
		admin_email as adminEmail
	from dbo.ADMIN_INFO_TABLE with(nolock)
	where admin_seq <> 3
end





