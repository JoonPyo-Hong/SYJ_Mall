/* 
	Author      : Seunghwan Shin 
	Create date : 2022-07-01   
	Description : 구입할 유저의 기프트 카드 잔액 가져와주기
	     
	History	: 2022-07-01 Seunghwan Shin	#최초 생성
			  2022-07-11 Seunghwan Shin	#화폐단위는 로직에서 찍어주는것으로 변경	


			  	   
	Real DB :	exec dbo.kakao_product_pay_user_gift_card_balance 2000001
				
*/
CREATE proc dbo.kakao_product_pay_user_gift_card_balance
	@user_seq bigint
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	declare @today datetime = getdate()
	
	select 
		sum(gift_card_balance)
	from dbo.KAKAO_GIFT_CARD_PUBLISH with(nolock)
	where gift_card_owner = @user_seq
	and gift_card_expiration_date > @today

end

