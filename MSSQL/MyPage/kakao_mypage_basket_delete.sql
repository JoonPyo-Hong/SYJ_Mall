/*
	Author      : Seunghwan Shin
	Create date : 2021-12-19 
	Description : ȸ���� ��ٱ��Ͽ� ������ ��ǰ ������ �������ִ� ����
	    
	History		: 2021-12-19 Seunghwan Shin	#���� ����
	
	REAL DB		: exec dbo.kakao_mypage_basket_delete '2000001','36,108,109'

*/
create proc dbo.kakao_mypage_basket_delete
	@qoouser_seq	varchar(10)				-- ȸ�� ������ȣ
,	@product_ids	varchar(100)		-- ��ǰ��ȣ��
as
set nocount on
set transaction isolation level read uncommitted
begin
	begin try
		
		begin tran
			
			update kusc
			set kusc.cart_del_yn = 'Y'
			,	kusc.cart_chg_dt = getdate()
			from string_split(@product_ids,'#') ss
			inner loop join dbo.KAKAO_USER_SHOPPING_CART kusc 
				on kusc.product_id = convert(bigint,ss.value)
			where kusc.qoouser_seq = convert(bigint,@qoouser_seq)
			
		commit tran
		
		return 1

	end try
	begin catch
		rollback tran
		return -1
	end catch
end

