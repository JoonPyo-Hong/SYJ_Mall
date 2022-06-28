/* 
	Author      : Seunghwan Shin 
	Create date : 2022-06-28   
	Description : 관리자 마스터 카카오 아이디 비밀번호 가져오기
	     
	History	: 2021-06-28 Seunghwan Shin	#최초 생성  

	Real DB : exec dbo.kakao_common_admin_master_infos 1
*/
alter proc dbo.kakao_common_admin_master_infos
	@admin_seq int
as	
set nocount on 
set transaction isolation level read uncommitted 
begin

	select
		admin_kakao_id as kakaoId
	,	admin_kakao_pw as kakaoPw
	,	admin_master_key as masterKey
	from dbo.ADMIN_INFO_TABLE with(nolock)
	where admin_seq = @admin_seq

end


