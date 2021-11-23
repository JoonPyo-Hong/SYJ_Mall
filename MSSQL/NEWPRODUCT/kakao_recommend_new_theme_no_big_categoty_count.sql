/* 
	Author      : Seunghwan Shin 
	Create date : 2021-11-23
	Description : 추천 신규 테마 비로그인 상태(더보기 기능)
	     
	History	: 2021-11-23 Seunghwan Shin	#최초 생성

	
	Real DB : exec dbo.kakao_recommend_new_theme_no_big_categoty_count

*/
CREATE proc dbo.kakao_recommend_new_theme_no_big_categoty_count
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	select count(*) from dbo.KAKAO_PRODUCT_TABLE with(nolock)
	

end