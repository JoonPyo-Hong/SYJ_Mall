/* 
	Author      : Seunghwan Shin 
	Create date : 2021-10-21   
	Description : 인기페이지 상품 총 갯수 -> 페이징 처리 위함
	     
	History	: 2021-10-21 Seunghwan Shin	#최초 생성
			  2022-01-02 Seunghwan Shin	#KAKAO_JOB_RANK_POPULAR 테이블 카운팅으로 변경
			  
	Real DB : exec dbo.kakao_popular_product_count
*/
alter proc dbo.kakao_popular_product_count
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	

	select 
		count(*) as cnt
	from dbo.KAKAO_JOB_RANK_POPULAR with(nolock)
	

end


