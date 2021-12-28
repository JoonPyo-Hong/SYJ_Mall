/* 
	Author      : Seunghwan Shin 
	Create date : 2021-08-29
	Description : 쿠키에 들어있는 상품 회원의 db로 업데이트
	     
	History	: 2021-08-29 Seunghwan Shin	#최초 생성
	
	Real DB : 
			  
*/
CREATE proc dbo.kakao_cookie_product_to_db_delete
	@qoouser_seq	bigint			-- 회원 고유번호
,	@basket_list	varchar(1000)	-- 쿠키에 존재하는 물품 : 회원이 이미 가지고 있는 물품은 제외
,	@result			int output		-- 결과값 1: 성공 , -1 : 실패
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	begin try
	
		begin tran

			update kus
			set kus.cart_chg_dt = getdate()
			,	kus.cart_del_yn = 'N'
			from string_split(@basket_list,'#') ss
			inner join dbo.KAKAO_USER_SHOPPING_CART kus on kus.product_id = convert(bigint,ss.value)
			where qoouser_seq = @qoouser_seq		


			set @result = 1	
		commit tran
	
	end try
	begin catch
		rollback tran
		set @result = -1
	end catch
		
end

