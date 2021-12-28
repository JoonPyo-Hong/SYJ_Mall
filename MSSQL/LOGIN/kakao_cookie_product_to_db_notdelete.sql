/* 
	Author      : Seunghwan Shin 
	Create date : 2021-08-28
	Description : 쿠키에 들어있는 상품 회원의 db로 업데이트
	     
	History	: 2021-08-28 Seunghwan Shin	#최초 생성
	
	Real DB :	declare @result int
				exec dbo.kakao_cookie_product_to_db_notdelete 2000009, '13#22#44', @result output
				select @result
	
	
*/
alter proc dbo.kakao_cookie_product_to_db_notdelete
	@qoouser_seq	bigint			-- 회원 고유번호
,	@basket_list	varchar(1000)	-- 쿠키에 존재하는 물품 : 회원이 이미 가지고 있는 물품은 제외(한번도 지운적 없는 물품 인서트 시키기)
,	@result			int output		-- 결과값 1: 성공 , -1 : 실패
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	begin try
	
		begin tran

			insert into dbo.KAKAO_USER_SHOPPING_CART
			(
				qoouser_seq
			,	product_id
			,	product_count
			,	cart_reg_dt
			,	cart_chg_dt
			,	cart_del_yn
			)
			select
				@qoouser_seq
			,	convert(bigint,ss.value)
			,	1
			,	getdate()
			,	null
			,	'N'
			from string_split(@basket_list,'#') ss


			set @result = 1	
		commit tran
	
	end try
	begin catch
		rollback tran
		set @result = -1
	end catch
		
end


