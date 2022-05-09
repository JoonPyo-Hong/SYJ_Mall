/* 
	Author      : Seunghwan Shin 
	Create date : 2022-03-25  
	Description : 상품 장바구니 관련 로직(공통)
	     
	History	: 2022-03-25 Seunghwan Shin	#최초 생성
			  
	Real DB : 
			-- 주의 : 조건 바꿔서 실행x
			declare @result int
			exec @result = dbo.kakao_common_product_basket 2000008,1
			select @result   
*/
alter proc dbo.kakao_common_product_basket
	@qoouser_seq	bigint		-- 회원 고유번호
,	@product_id		bigint		-- 상품번호
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	

		-- 회원이 선택한 품목이 장바구니 내역에 없는경우
		if not exists (select * from dbo.KAKAO_USER_SHOPPING_CART with(nolock) where qoouser_seq = @qoouser_seq and product_id = @product_id)
		begin
			
			insert into dbo.KAKAO_USER_SHOPPING_CART
			(
				qoouser_seq
			,	product_id
			,	product_count
			,	cart_reg_dt
			,	cart_chg_dt
			,	cart_del_yn
			)
			values
			(
				@qoouser_seq
			,	@product_id
			,	1
			,	getdate()
			,	null
			,	'N'
			)

			if @@ERROR <> 0 return -1

			return 1
		end
		--회원이 선택한 품목이 지난번에 장바구니에 집어넣었다가 장바구니에서 삭제한 경우
		else if exists (select * from dbo.KAKAO_USER_SHOPPING_CART with(nolock) where qoouser_seq = @qoouser_seq and product_id = @product_id and cart_del_yn = 'Y')
		begin
			
			update dbo.KAKAO_USER_SHOPPING_CART
			set cart_del_yn = 'N'
			,	cart_chg_dt = getdate()
			where qoouser_seq = @qoouser_seq and product_id = @product_id

			if @@ERROR <> 0 return -1

			return 1
		end
		-- 회원이 선택한 품목이 장바구니 내역에 있경우 -> 삭제
		else if exists (select * from dbo.KAKAO_USER_SHOPPING_CART with(nolock) where qoouser_seq = @qoouser_seq and product_id = @product_id and cart_del_yn = 'N' )
		begin

			update dbo.KAKAO_USER_SHOPPING_CART
			set cart_del_yn = 'Y'
			,	cart_chg_dt = getdate()
			where qoouser_seq = @qoouser_seq and product_id = @product_id

			if @@ERROR <> 0 return -1
			
			return 2;
		end
end




