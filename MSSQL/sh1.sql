/* 
	Author      : Seunghwan Shin 
	Create date : 2021-08-05  
	Description : 더미생성기
	     
	History	: 2021-08-05 Seunghwan Shin	#최초 생성 
			  2021-08-06 Seunghwan Shin	#중복캐릭터 not null조건 -> <> 0 으로 변경
			  2021-08-07 Seunghwan Shin #'resources/images/product/' 추가
			 
*/
alter proc dbo.kakao_dummy_generator
	@category_code bigint--소분류 코드
,	@product_nm nvarchar(60)--상품 이름
,	@product_count int -- 상품갯수
,	@product_price money -- 상품가격
,	@discount_rate smallint--할인율
,	@recommend_prodt_yn char(1) -- 추천상품 여부
,	@char_seq_first bigint -- 연관 캐릭터번호1
,	@char_seq_second bigint = null -- 연관 캐릭터번호2
,	@rep_img nvarchar(100) --대표이미지
,	@head_img nvarchar(1000)--헤드이미지 묶음 #으로 구분할것
,	@result int output
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
	begin try
		begin tran		
			
			insert into dbo.KAKAO_PRODUCT_TABLE
			(
				category_code
			,	product_nm
			,	product_count
			,	product_detail_info
			,	product_price
			,	discount_rate
			,	recommend_prodt_yn
			,	del_yn
			)
			values
			(
				@category_code
			,	@product_nm
			,	@product_count
			,	null
			,	@product_price
			,	@discount_rate
			,	@recommend_prodt_yn
			,	'N'
			)

			--현재 들어간 상품의 상품코드를 반환해서 사용해준다.
			declare @product_id bigint
			set @product_id = IDENT_CURRENT('dbo.KAKAO_PRODUCT_TABLE')
			
			insert into dbo.KAKAO_CHAR_PRODUCT
			(
				char_seq
			,	product_id
			,	reg_dt
			,	chg_dt
			)
			values
			(
				@char_seq_first
			,	@product_id
			,	getdate()
			,	null
			)

			--캐릭터가 중복되는 경우!
			if (@char_seq_second <> 0)
			begin
				insert into dbo.KAKAO_CHAR_PRODUCT
				(
					char_seq
				,	product_id
				,	reg_dt
				,	chg_dt
				)
				values
				(
					@char_seq_second
				,	@product_id
				,	getdate()
				,	null
				)	
			end

			--대표이미지 삽입
			insert into dbo.KAKAO_PRODUCT_IMG
			(
				product_id
			,	product_img
			,	rep_img_yn
			,	head_img_yn
			)
			values
			(
				@product_id
			,	N'resources/images/product/' + @rep_img
			,	'Y'
			,	'Y'
			)

			--헤드 이미지 삽입
			insert into dbo.KAKAO_PRODUCT_IMG
			(
				product_id
			,	product_img
			,	rep_img_yn
			,	head_img_yn
			)
			select
				@product_id
			,	N'resources/images/product/' + convert(nvarchar(100),ss.value)
			,	'N'
			,	'Y'
			from string_split(@head_img,'#') as ss

			set @result = 1

		commit tran
	end try
	begin catch
		set @result = -1
		rollback tran
	end catch
	
	
end


select * from dbo.KAKAO_PRODUCT_IMG with(nolock)


declare @product_id bigint
set @product_id = IDENT_CURRENT('dbo.KAKAO_PRODUCT_TABLE')
select @product_id


select * from dbo.KAKAO_CHARACTER

KAKAO_PRODUCT_IMG
KAKAO_CHARACTER 
KAKAO_PRODUCT_CATEGORY 
KAKAO_PRODUCT_TABLE 
resources/images/product/콘\마린 에어팟키링_무지&콘\20200529122143559_8809721501122_BW_00_(2).jpg
select * from KAKAO_PRODUCT_IMG with(nolock)

select * from dbo.KAKAO_PRODUCT_TABLE with(nolock)

begin tran

update dbo.KAKAO_PRODUCT_TABLE 
set category_code = 14
,	product_nm = N'프렌즈뱃지_스마트 콘'
,	product_count = 3000
,	product_price = 12000
,	recommend_prodt_yn = 'N'
where product_id = 7

update

commit tran
select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)


select * from dbo.KAKAO_CHAR_PRODUCT with(nolock)

begin tran

update dbo.KAKAO_CHAR_PRODUCT set char_seq = 8 where char_seq = 1 and product_id = 7

commit tran

select @@TRANCOUNT


select * from dbo.KAKAO_CHARACTER with(nolock)

resources/images/product/콘/런던에디션 미니키체인_근위병콘/20201019143628854_8809721504192_BW_00.jpg

--resources/images/product/콘\마린 에어팟키링_무지&콘/20200529122138774_8809721501139_BW_01_(2).jpg

콘\마린 에어팟키링_무지&콘\20200529122123619_8809721501139_BW_02.jpg

update dbo.KAKAO_PRODUCT_IMG set product_img = N'resources/images/product/콘/마린 에어팟키링_무지&콘/20200529122123619_8809721501139_BW_02.jpg' where img_seq = 7


update dbo.KAKAO_PRODUCT_IMG set product_img = N'resources/images/product/콘/마린 에어팟키링_무지&콘/20200529122138774_8809721501139_BW_01_(2).jpg' where img_seq = 8

update dbo.KAKAO_PRODUCT_IMG set product_img = N'resources/images/product/콘/마린 에어팟키링_무지&콘/20200529122143559_8809721501122_BW_00_(2).jpg' where img_seq = 9


select * from dbo.KAKAO_CHAR_PRODUCT with(nolock)



select * from dbo.KAKAO_PRODUCT_TABLE with(nolock)

begin tran

update dbo.KAKAO_PRODUCT_TABLE
set product_nm = replace(product_nm,N'none',N'')

delete dbo.KAKAO_PRODUCT_TABLE where product_id between 52 and 56



commit tran


select count(*) from dbo.KAKAO_PRODUCT_TABLE with(nolock)





declare @result int
exec dbo.kakao_buy_dummy_generator 105,405887,1,13,'2021-01-01',@result output
select @result



/* 
	Author      : Seunghwan Shin 
	Create date : 2021-08-14  
	Description : 구매 관련더미생성기
	     
	History	: 2021-08-14 Seunghwan Shin	#최초 생성 

			 
*/
alter proc dbo.kakao_buy_dummy_generator
	@product_id bigint			-- 제품 아이디
,	@qoouser_seq bigint			-- 회원 번호
,	@star_score int				-- 별점
,	@product_buy_count int		-- 상품 구매 개수
,	@product_buy_dt varchar(25)	-- 상품 구매 일자
,	@result int output			-- 결과값 1: 성공, -1 : 실패
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	begin try
		begin tran
		insert into dbo.KAKAO_PRODUCT_PAYMENT
		(
			product_id
		,	qoouser_seq
		,	star_score
		,	review_content
		,	review_reg_dt
		,	review_chg_dt
		,	review_del_dt
		,	product_buy_count
		,	product_buy_dt
		,	cancel_dt	
		)
		values
		(
			@product_id
		,	@qoouser_seq
		,	@star_score
		,	null
		,	null
		,	null
		,	null
		,	@product_buy_count
		,	@product_buy_dt
		,	null
		)
		commit tran

		set @result = 1

	end try
	begin catch
		set @result = -1
		rollback tran
	end catch

end


select * from dbo.KAKAO_PRODUCT_PAYMENT with(nolock)

truncate table dbo.KAKAO_PRODUCT_PAYMENT


select * from dbo.BUYTBL_INFO  with(nolock)

drop table dbo.ELECTRONIC_PRODUCTS


drop table dbo.KAKAO_PRODUCT_PAYMENT

/* KAKAO_PRODUCT_PAYMENT - 상품 구매 내역 */
CREATE TABLE [dbo].[KAKAO_PRODUCT_PAYMENT] (
	[pd_order_seq] [BIGINT] identity(1,1) NOT NULL,  /* 주문번호 - pd_order_seq */
	[product_id] [BIGINT] NOT NULL,  /* 상품고유번호 - product_id */
	[qoouser_seq] [BIGINT] NOT NULL,  /* 회원 고유 번호 - qoouser_seq */
	[star_score] [INT],  /* 별점 - start_score */
	[review_content] [NVARCHAR](300),  /* 후기 내용 - review_content */
	[review_reg_dt] [DATETIME],  /* 후기 작성날짜 - review_reg_dt */
	[review_chg_dt] [DATETIME],  /* 후기 수정날짜 - review_chg_dt */
	[review_del_dt] [DATETIME],  /* 후기 삭제날짜 - review_del_dt */
	[product_buy_count] [INT] NOT NULL,  /* 구매수량 - product_buy_count */
	[product_buy_dt] [DATETIME] NOT NULL,  /* 구매 일자 - product_buy_dt */
	[cancel_dt] [DATETIME] /* 구매 취소 일자 - cancel_dt */
)
GO

alter table dbo.KAKAO_PRODUCT_PAYMENT add constraint PK__KAKAO_PRODUCT_PAYMENT__PD_ORDER_SEQ PRIMARY KEY (pd_order_seq)


select count(*) from dbo.KAKAO_PRODUCT_PAYMENT with(nolock)


 kakao_popular_product_list


 /* 
	Author      : Seunghwan Shin 
	Create date : 2021-08-13   
	Description : 인기페이지 상품 바둑판처럼 배열하는 로직
	     
	History	: 2021-08-13 Seunghwan Shin	#최초 생성 : 아직 구매 로직이 없어서 이미지 뜨는지만 테스트
			  2021-08-13 Seunghwan Shin	#가져올 상품 갯수 변경
			  2021-08-14 Seunghwan Shin	#구매정보에 기반한 데이터 추가
*/
alter proc dbo.kakao_popular_product_list
	@start_dt	varchar(25) -- 시작일짜
,	@end_dt		varchar(25)--  끝 일자
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	

	select
		top(18)
		pd.productId
	,	replace(kpi.product_img,N' ',N'%20') as productImg
	from 
	(select
		kpt.product_id as productId
	,	count(*) as cnt
	from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
	inner join dbo.KAKAO_PRODUCT_PAYMENT kpp with(nolock) on kpt.product_id = kpp.product_id
	where kpp.product_buy_dt between @start_dt and @end_dt
	and kpt.del_yn = 'N'
	group by kpt.product_id
	) as pd
	inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock,forceseek) on kpi.product_id = pd.productId
	where kpi.rep_img_yn = 'Y' and kpi.head_img_yn = 'Y'
	order by pd.cnt desc

end




select * from dbo.KAKAO_PRODUCT_IMG with(nolock)

select * from dbo.KAKAO_PRODUCT_PAYMENT with(nolock)



/* 
	Author      : Seunghwan Shin 
	Create date : 2021-08-13   
	Description : 인기페이지 상품 바둑판처럼 배열하는 로직
	     
	History	: 2021-08-13 Seunghwan Shin	#최초 생성 : 아직 구매 로직이 없어서 이미지 뜨는지만 테스트
			  2021-08-13 Seunghwan Shin	#가져올 상품 갯수 변경
			  2021-08-14 Seunghwan Shin	#구매정보에 기반한 데이터 추가
			  2021-08-19 Seunghwan Shin	#rownumber 추가
*/
alter proc dbo.kakao_popular_product_list
	@start_dt	varchar(25) -- 시작일짜
,	@end_dt		varchar(25) --  끝 일자
,	@paging		int -- 페이지 넘버
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	

	select
		pdc.rn
	,	pdc.productId
	,	pdc.productImg
	from
	(
		select
			row_number() over (order by pd.cnt desc) as rn
		,	pd.productId as productId
		,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as productImg
		,	pd.cnt
		from 
		(	select
				kpt.product_id as productId
			,	count(*) as cnt
			from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
			inner join dbo.KAKAO_PRODUCT_PAYMENT kpp with(nolock) on kpt.product_id = kpp.product_id
			where kpp.product_buy_dt between @start_dt and @end_dt
			and kpt.del_yn = 'N'
			group by kpt.product_id
		) as pd
		inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock,forceseek) on kpi.product_id = pd.productId
		where kpi.rep_img_yn = 'Y' and kpi.head_img_yn = 'Y'
	) as pdc
	where rn between (@paging * 18) - 17 and (@paging * 18)
end




exec dbo.kakao_popular_product_list '2017-01-01','2019-12-31',2





select
	pdc.rn
,	pdc.productId
,	pdc.productImg
from
(
	select
		row_number() over (order by pd.cnt desc) as rn
	,	pd.productId as productId
	,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as productImg
	,	pd.cnt
	from 
	(	select
			kpt.product_id as productId
		,	count(*) as cnt
		from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
		inner join dbo.KAKAO_PRODUCT_PAYMENT kpp with(nolock) on kpt.product_id = kpp.product_id
		where 1 = 1
		--where kpp.product_buy_dt between @start_dt and @end_dt
		and kpt.del_yn = 'N'
		group by kpt.product_id
	) as pd
	inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock,forceseek) on kpi.product_id = pd.productId
	where kpi.rep_img_yn = 'Y' and kpi.head_img_yn = 'Y'
) as pdc
where rn between 1 and 18


--order by pd.cnt desc







/* 
	Author      : Seunghwan Shin 
	Create date : 2021-08-29
	Description : 쿠키에 들어있는 상품 회원의 db로 업데이트
	     
	History	: 2021-08-29 Seunghwan Shin	#최초 생성
	Real DB : 
			  
*/
alter proc dbo.kakao_cookie_product_to_db_delete
	@qoouser_seq	bigint			-- 회원 고유번호
,	@basket_list	varchar(1000)	-- 쿠키에 존재하는 물품 : 회원이 이미 가지고 있는 물품은 제외
,	@result			int output -- 결과값 1: 성공 , -1 : 실패
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


select * from dbo.KAKAO_USER_SHOPPING_CART with(nolock)


declare @result int
exec dbo.kakao_cookie_product_to_db_delete 2000008,'1#2',@result output
select @result



select * from dbo.QOO10_USER_REAL  with(nolock) where qoouser_seq = 2000001


select * from dbo.TBLBANNEDIPLIST with(nolock)



/* 
	Author      : Seunghwan Shin 
	Create date : 2021-08-28
	Description : 쿠키에 들어있는 상품 회원의 db로 업데이트
	     
	History	: 2021-08-28 Seunghwan Shin	#최초 생성
	Real DB : exec dbo.kakao_cookie_product_to_db_notdelete
			  
*/
alter proc dbo.kakao_cookie_product_to_db_notdelete
	@qoouser_seq	bigint			-- 회원 고유번호
,	@basket_list	varchar(1000)	-- 쿠키에 존재하는 물품 : 회원이 이미 가지고 있는 물품은 제외(한번도 지운적 없는 물품 인서트 시키기)
,	@result			int output -- 결과값 1: 성공 , -1 : 실패
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


/* 
	Author      : Seunghwan Shin 
	Create date : 2021-08-28
	Description : 회원의 장바구니에 존재하는 물품리스트를 가져와준다.
	     
	History	: 2021-08-28 Seunghwan Shin	#최초 생성
			  2021-08-29 Seunghwan Shin	#조회쿼리에 cart_del_yn 추가	
	Real DB : exec dbo.kakao_cookie_product_user_nohave 2000001 
			  
*/
alter proc dbo.kakao_cookie_product_user_nohave
	@qoouser_seq	bigint		-- 회원 고유번호
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	select 
		product_id as productId 
	,	cart_del_yn as delYn
	from dbo.KAKAO_USER_SHOPPING_CART with(nolock)
	where qoouser_seq = @qoouser_seq
		
end


select * from dbo.KAKAO_USER_SHOPPING_CART with(nolock)