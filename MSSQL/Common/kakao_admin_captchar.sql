/* 
	Author      : Seunghwan Shin 
	Create date : 2022-01-04   
	Description : 관리자 captchar 공개키,비밀키 정보 가져오기
	     
	History	: 2022-01-04 Seunghwan Shin	#최초 생성  
*/
alter proc dbo.kakao_admin_captchar
	@admin_seq	int	-- admin 번호
as
set nocount on 
set transaction isolation level read uncommitted 
begin

	select
		captchar_secure_key as secureKey
	from dbo.ADMIN_INFO_TABLE with(nolock)
	where admin_seq = @admin_seq

end



