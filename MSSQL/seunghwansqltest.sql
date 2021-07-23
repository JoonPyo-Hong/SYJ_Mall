
DROP TABLE dbo.KAKAO_PRODUCT_TABLE

/* KAKAO_PRODUCT_TABLE - 상품정보 */
CREATE TABLE [dbo].[KAKAO_PRODUCT_TABLE] (
	[char_seq] [BIGINT] NOT NULL,  /* 캐릭터 번호 - char_seq */
	[product_id] [BIGINT] NOT NULL,  /* 상품고유번호 - product_id */
	[product_nm] [NVARCHAR](60) NOT NULL,  /* 상품이름 - product_nm */
	[product_count] [INT] NOT NULL,  /* 상품 수량 - product_count */
	[product_category] [NVARCHAR](100),  /* 카테고리 - product_category */
	[product_detail_info] [NVARCHAR](3000),  /* 세부정보 - product_detail_info */
	[product_price] [MONEY] NOT NULL,  /* 제품가격 - product_price */
	[reg_dt] [DATETIME] NOT NULL,  /* 등록날짜 - reg_dt */
	[del_yn] [CHAR](1) NOT NULL,  /* 삭제유무 - del_yn */
	[ship_comp_seq] [BIGINT] NOT NULL /* 배송사 고유번호 - ship_comp_seq */
)

ALTER TABLE dbo.KAKAO_PRODUCT_TABLE ADD CONSTRAINT PK__KAKAO_PRODUCT_TABLE__CHAR_SEQ__PRODUCT_ID PRIMARY KEY (char_seq,product_id)


SELECT * FROM dbo.KAKAO_PRODUCT_TABLE WITH(NOLOCK)

BEGIN TRAN

insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,N'춘식이와친구들',340,N'리빙',NULL,35000,GETDATE(),'N',1)
insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,N'춘식이와친구들',340,N'리빙',NULL,35000,GETDATE(),'N',1)
insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,N'춘식이와친구들',340,N'리빙',NULL,35000,GETDATE(),'N',1)
insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,N'춘식이와친구들',340,N'리빙',NULL,35000,GETDATE(),'N',1)
insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,N'춘식이와친구들',340,N'리빙',NULL,35000,GETDATE(),'N',1)
insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,N'춘식이와친구들',340,N'리빙',NULL,35000,GETDATE(),'N',1)
insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,N'춘식이와친구들',340,N'리빙',NULL,35000,GETDATE(),'N',1)
insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,N'춘식이와친구들',340,N'리빙',NULL,35000,GETDATE(),'N',1)
insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,N'춘식이와친구들',340,N'리빙',NULL,35000,GETDATE(),'N',1)
insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,N'춘식이와친구들',340,N'리빙',NULL,35000,GETDATE(),'N',1)








SELECT @@TRANCOUNT

ROLLBACK TRAN




(
	9,
	1,
	500,
	N'리빙',
	NULL,
	49000,
	DEFAULT,
	'N'
)