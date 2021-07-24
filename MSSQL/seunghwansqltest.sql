
DROP TABLE dbo.KAKAO_PRODUCT_TABLE

/* KAKAO_PRODUCT_TABLE - 상품정보 */
CREATE TABLE [dbo].[KAKAO_PRODUCT_TABLE ] (
	[char_seq] [BIGINT] NOT NULL,  /* 캐릭터 번호 - char_seq */
	[product_id] [BIGINT] NOT NULL,  /* 상품고유번호 - product_id */
	[category_code] [BIGINT] NOT NULL,  /* 분류코드 - category_code */
	[product_nm] [NVARCHAR](60) NOT NULL,  /* 상품이름 - product_nm */
	[product_count] [INT] NOT NULL,  /* 상품 수량 - product_count */
	[product_category] [NVARCHAR](100),  /* 카테고리 - product_category */
	[product_detail_info] [NVARCHAR](3000),  /* 세부정보 - product_detail_info */
	[product_price] [MONEY] NOT NULL,  /* 제품가격 - product_price */
	[reg_dt] [DATETIME] NOT NULL,  /* 등록날짜 - reg_dt */
	[del_yn] [CHAR](1) NOT NULL,  /* 삭제유무 - del_yn */
	[discount_rate] [SMALLINT] /* 할인율  - discount_rate */
)

ALTER TABLE dbo.KAKAO_PRODUCT_TABLE ADD CONSTRAINT PK__KAKAO_PRODUCT_TABLE__CHAR_SEQ__PRODUCT_ID PRIMARY KEY (char_seq,product_id)


SELECT * FROM dbo.KAKAO_PRODUCT_TABLE WITH(NOLOCK)

BEGIN TRAN

insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,1,N'LED 시계_라이언&춘식이',450,N'리빙',NULL,35000,GETDATE(),'N',NULL)
insert into dbo.KAKAO_PRODUCT_TABLE values (9,1,1,N'LED 시계_라이언&춘식이',450,N'리빙',NULL,35000,GETDATE(),'N',NULL)

insert into dbo.KAKAO_PRODUCT_TABLE values (9,2,2,N'[온라인 전용]높이 조절 탁상선풍기_라이언&춘식',550,N'리빙',NULL,49000,GETDATE(),'N',NULL)
insert into dbo.KAKAO_PRODUCT_TABLE values (1,2,2,N'[온라인 전용]높이 조절 탁상선풍기_라이언&춘식',550,N'리빙',NULL,49000,GETDATE(),'N',NULL)

insert into dbo.KAKAO_PRODUCT_TABLE values (9,3,3,N'춘식이는 수박을 좋아해 인형',2000,N'토이',NULL,24000,GETDATE(),'N',NULL)

insert into dbo.KAKAO_PRODUCT_TABLE values (1,3,4,N'라이언&춘식이 살균 무선 충전기',1200,N'폰 엑세서리',NULL,39000,GETDATE(),'N',NULL)
insert into dbo.KAKAO_PRODUCT_TABLE values (9,4,4,N'라이언&춘식이 살균 무선 충전기',1200,N'폰 엑세서리',NULL,39000,GETDATE(),'N',NULL)

insert into dbo.KAKAO_PRODUCT_TABLE values (1,4,5,N'라이언과 춘식이의 집콕놀이',550,N'토이',NULL,39000,GETDATE(),'N',NULL)
insert into dbo.KAKAO_PRODUCT_TABLE values (9,5,5,N'라이언과 춘식이의 집콕놀이',550,N'토이',NULL,39000,GETDATE(),'N',NULL)


insert into dbo.KAKAO_PRODUCT_TABLE values (10,1,6,N'죠르디 미니각티슈 케이스',5800,N'리빙',NULL,19000,GETDATE(),'N',NULL)


insert into dbo.KAKAO_PRODUCT_TABLE values (1,5,7,N'리틀라이언 미니베이커',120,N'리빙',NULL,39900,GETDATE(),'N',NULL)



COMMIT TRAN

ROLLBACK TRAN


/* KAKAO_PRODUCT_MAIN_CATEGORY - 상품정보 대분류 */
CREATE TABLE [dbo].[KAKAO_PRODUCT_MAIN_CATEGORY ] (
	[category_code] [BIGINT] NOT NULL,  /* 분류코드 - category_code */
	[category_nm] [NVARCHAR](50) NOT NULL,  /* 분류이름 - category_nm */
	[reg_dt] [DATETIME] NOT NULL,  /* 등록날짜 - reg_dt */
	[category_rep_img_url] [NVARCHAR](100) /* 대분류 대표 이미지 url - category_rep_img_url */
)






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