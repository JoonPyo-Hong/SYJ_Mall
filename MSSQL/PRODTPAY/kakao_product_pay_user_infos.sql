﻿/* 
	Author      : Seunghwan Shin 
	Create date : 2022-06-15   
	Description : 구입할 유저의 기본정보 가져와주기
	     
	History	: 2022-06-15 Seunghwan Shin	#최초 생성

			  	   
	Real DB :	exec dbo.kakao_product_pay_user_infos 2000001
				
*/
alter proc dbo.kakao_product_pay_user_infos
	@user_seq bigint
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	select
		qoouser_name as userName
	,	qoouser_phone_num as userPhoneNum
	,	qoouser_address as userFirstAddr
	,	qoouser_address_detail as userSecondAddr
	from dbo.QOO10_USER_REAL with(nolock)
	where qoouser_seq = @user_seq
	

end
