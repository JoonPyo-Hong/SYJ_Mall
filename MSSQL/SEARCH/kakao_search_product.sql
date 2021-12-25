/* 
	Author      : Seunghwan Shin 
	Create date : 2021-09-05  
	Description : 검색결과  
	     
	History	: 2021-09-05 Seunghwan Shin	#최초 생성
			  2021-09-08 Seunghwan Shin	#searchName 행 생성
	
	Real DB : exec dbo.kakao_search_product N'춘식'
*/ 
CREATE proc dbo.kakao_search_product
	@input_word nvarchar(100)
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
    
	select
		product_id as productSeq
	,	@input_word as inputName
	,	replace(product_nm,@input_word,'<span style="color : red;">' + @input_word + '</span>') as searchName
	from dbo.KAKAO_PRODUCT_TABLE with(nolock)
	where product_nm like N'%'+ @input_word  + N'%'
	

end

