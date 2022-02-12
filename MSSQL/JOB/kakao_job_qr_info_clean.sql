﻿/* 
	Author      : Seunghwan Shin 
	Create date : 2022-02-05  
	Description : QR 테이블 관련 필요없는 uuid 관련 청소하는 프로시저
	     
	History	: 2022-02-05 Seunghwan Shin	#최초 생성
			  
	Real DB :	실행금지

*/ 
CREATE proc dbo.kakao_job_qr_info_clean
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
	
	declare @now datetime = getdate()
	
	delete dbo.KAKAO_QR_QUEUE
	where request_dt < dateadd(minute,-5,@now)
	
end


commit 92f4dbd4510b24805979dd23d971bc2b4dba0c2e
