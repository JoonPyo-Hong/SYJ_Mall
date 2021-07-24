
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
CREATE TABLE [dbo].[KAKAO_PRODUCT_MAIN_CATEGORY] (
	[category_code] [BIGINT] NOT NULL,  /* 분류코드 - category_code */
	[category_nm] [NVARCHAR](50) NOT NULL,  /* 분류이름 - category_nm */
	[reg_dt] [DATETIME] NOT NULL,  /* 등록날짜 - reg_dt */
	[category_rep_img_url] [NVARCHAR](100) /* 대분류 대표 이미지 url - category_rep_img_url */
)

ALTER TABLE dbo.KAKAO_PRODUCT_MAIN_CATEGORY ADD CONSTRAINT PK__KAKAO_PRODUCT_MAIN_CATEGORY__CATEGORY_CODE PRIMARY KEY (category_code)

BEGIN TRAN

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (1,N'LED 시계_라이언&춘식이',GETDATE(),N'resources/images/product/20210724_LED 시계_라이언&춘식이.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (2,N'[온라인 전용]높이 조절 탁상선풍기_라이언&춘식',GETDATE(),N'resources/images/product/20210724_[온라인 전용]높이 조절 탁상선풍기_라이언&춘식.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (3,N'춘식이는 수박을 좋아해 인형',GETDATE(),N'resources/images/product/20210724_춘식이는 수박을 좋아해 인형.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (4,N'라이언&춘식이 살균 무선 충전기',GETDATE(),N'resources/images/product/20210724_라이언&춘식이 살균 무선 충전기.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (5,N'라이언과 춘식이의 집콕놀이',GETDATE(),N'resources/images/product/20210724_라이언과 춘식이의 집콕놀이.jpg')

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (6,N'죠르디 미니각티슈 케이스',GETDATE(),N'resources/images/product/20210724_죠르디 미니각티슈 케이스.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (7,N'리틀라이언 미니베이커',GETDATE(),N'resources/images/product/20210724_리틀라이언 미니베이커.jpg')

SELECT * FROM dbo.KAKAO_PRODUCT_MAIN_CATEGORY WITH(NOLOCK)

DROP TABLE dbo.KAKAO_NEW_PRODUCT


/* KAKAO_NEW_PRODUCT - 신규상품 */
CREATE TABLE [dbo].[KAKAO_NEW_PRODUCT] (
	[new_prodt_seq] [BIGINT] IDENTITY(1,1) NOT NULL,  /* 신규상품 코드 - new_prodt_seq */
	[dp_start_dt] [DATETIME] NOT NULL,  /* DP 시작 날짜 - dp_start_dt */
	[dp_end_dt] [DATETIME] NOT NULL,  /* DP 마지막 날짜 - dp_end_dt */
	[recommend_prodt_yn] [CHAR](1) NOT NULL,  /* 추천상품 여부 - recommend_prodt_yn */
	[product_top_img_title] [NVARCHAR](25),  /* 배너사진 설명 제목 - product_top_img_title */
	[product_top_img_title_detail] [NVARCHAR](25),  /* 배너사진 설명 세부 - product_top_img_title_detail */
	[category_code] [BIGINT] NOT NULL /* 분류코드 - category_code */
)
GO


ALTER TABLE dbo.KAKAO_NEW_PRODUCT ADD CONSTRAINT PK__KAKAO_NEW_PRODUCT__NEW_PRODT_SEQ PRIMARY KEY (new_prodt_seq)


begin tran

INSERT INTO dbo.KAKAO_NEW_PRODUCT VALUES (getdate(),'2022-01-01','N',N'탁상용, 벽걸이용 모두되는',N'라이언와 춘식이 LED 시계',1)
INSERT INTO dbo.KAKAO_NEW_PRODUCT VALUES (getdate(),'2022-01-01','N',N'책상 위를 시원하게',N'온라인 전용 탁상용 선풍기',2)
INSERT INTO dbo.KAKAO_NEW_PRODUCT VALUES (getdate(),'2022-01-01','N',N'수박과 하나된',N'춘식이는 수박을 좋아해',3)


INSERT INTO dbo.KAKAO_NEW_PRODUCT VALUES (getdate(),'2022-01-01','N',N'라이언과 클린하게',N'살균 무선 충전기',4)
INSERT INTO dbo.KAKAO_NEW_PRODUCT VALUES (getdate(),'2022-01-01','N',N'집콕엔 청소도 즐겁게',N'라이언과 춘식이의 집콕놀이',5)

INSERT INTO dbo.KAKAO_NEW_PRODUCT VALUES (getdate(),'2022-01-01','N',N'나만의 죠르디 정원',N'죠르디 티슈 케이스',6)
INSERT INTO dbo.KAKAO_NEW_PRODUCT VALUES (getdate(),'2022-01-01','N',N'라이언과 즐거운 베이킹',N'리틀라이언 미니베이커',7)



select * from dbo.KAKAO_NEW_PRODUCT with(nolock)



commit tran


COMMIT TRAN


ROLLBACK TRAN



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