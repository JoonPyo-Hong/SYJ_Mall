/* 
	Author      : Seunghwan Shin 
	Create date : 2021-03-25
	Description : 상품 알람정보 관련(공통 SP)
	     
	History	: 2021-03-25 Seunghwan Shin	#최초 생성
			  
	Real DB : exec dbo.kakao_common_product_alaram 2000001,13
			  
			  
*/
create proc dbo.kakao_common_product_alaram
	@qoouser_seq	bigint		-- 회원 고유번호
,	@product_id		bigint		-- 상품번호
as
set nocount on 
set transaction isolation level read uncommitted 
begin


	if not exists (select * from dbo.KAKAO_USER_ALRAM_INFO with(nolock) where qoouser_seq = @qoouser_seq and product_id = @product_id)--알림정보에 상품이 없는경우 : 새로 추가
	begin

		insert into dbo.KAKAO_USER_ALRAM_INFO
		(
			qoouser_seq
		,	product_id
		,	reg_dt
		,	chg_dt
		,	del_yn
		)
		values
		(
			@qoouser_seq
		,	@product_id
		,	getdate()
		,	null
		,	'N'
		)

		if @@ERROR <> 0 return -1
		else return 1
	end
	else if exists (select * from dbo.KAKAO_USER_ALRAM_INFO with(nolock) where qoouser_seq = @qoouser_seq and product_id = @product_id and del_yn = 'Y')--알림정보에 상품이 있는데 내가 알림끄기 설정한 경우 : 다시 켜기로 바꿔준다.
	begin


		update dbo.KAKAO_USER_ALRAM_INFO
		set del_yn = 'N'
		,	chg_dt = getdate()
		where qoouser_seq = @qoouser_seq 
		and product_id = @product_id

		if @@ERROR <> 0 return -1
		else return 1

	end
	else if exists (select * from dbo.KAKAO_USER_ALRAM_INFO with(nolock) where qoouser_seq = @qoouser_seq and product_id = @product_id and del_yn = 'N')--알림정보에 상품이 있는데 내가 알림켜기 설정한 경우 : 끄기로 바꿔준다.
	begin
			

		update dbo.KAKAO_USER_ALRAM_INFO
		set del_yn = 'Y'
		,	chg_dt = getdate()
		where qoouser_seq = @qoouser_seq 
		and product_id = @product_id

			
		if @@ERROR <> 0 return -1
		else return 2
	end
	

end

