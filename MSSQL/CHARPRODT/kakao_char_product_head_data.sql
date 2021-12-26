/* 
	Author      : Seunghwan Shin 
	Create date : 2021-10-29
	Description : 캐릭터별 상품 이름,이미지,갯수 쿼리
	     
	History	: 2021-10-29 Seunghwan Shin	#최초 생성
			  2021-11-01 Seunghwan Shin #서브쿼리절 추가 : 캐릭터별 총 상품갯수
	Real DB : exec dbo.kakao_char_product_head_data 1
	
		  
*/
alter proc dbo.kakao_char_product_head_data
	@char_seq	bigint			-- 캐릭터 번호
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	select 
		char_name as charName
	,	char_head_img as charImg 
	,	(select 
			count(*) 
		from dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) 
		inner join dbo.KAKAO_PRODUCT_TABLE kpt with(nolock) on kcp.product_id = kpt.product_id
		where char_seq = @char_seq) as charCount
	from dbo.KAKAO_CHARACTER kc with(nolock)
	where kc.char_seq = @char_seq

		
end



