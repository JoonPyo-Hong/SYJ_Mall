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


KAKAO_PRODUCT_IMG
KAKAO_CHARACTER 
KAKAO_PRODUCT_CATEGORY 
KAKAO_PRODUCT_TABLE 
resources/images/product/콘\마린 에어팟키링_무지&콘\20200529122143559_8809721501122_BW_00_(2).jpg
select * from KAKAO_PRODUCT_IMG with(nolock)

select * from dbo.KAKAO_PRODUCT_TABLE with(nolock)

select * from dbo.KAKAO_CHAR_PRODUCT with(nolock)

select * from dbo.KAKAO_CHARACTER with(nolock)

resources/images/product/콘/런던에디션 미니키체인_근위병콘/20201019143628854_8809721504192_BW_00.jpg

--resources/images/product/콘\마린 에어팟키링_무지&콘/20200529122138774_8809721501139_BW_01_(2).jpg

콘\마린 에어팟키링_무지&콘\20200529122123619_8809721501139_BW_02.jpg

update dbo.KAKAO_PRODUCT_IMG set product_img = N'resources/images/product/콘/마린 에어팟키링_무지&콘/20200529122123619_8809721501139_BW_02.jpg' where img_seq = 7


update dbo.KAKAO_PRODUCT_IMG set product_img = N'resources/images/product/콘/마린 에어팟키링_무지&콘/20200529122138774_8809721501139_BW_01_(2).jpg' where img_seq = 8

update dbo.KAKAO_PRODUCT_IMG set product_img = N'resources/images/product/콘/마린 에어팟키링_무지&콘/20200529122143559_8809721501122_BW_00_(2).jpg' where img_seq = 9


select * from dbo.KAKAO_CHAR_PRODUCT  with(nolock)

truncate table dbo.KAKAO_CHAR_PRODUCT
