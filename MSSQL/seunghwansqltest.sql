
DROP TABLE dbo.KAKAO_PRODUCT_TABLE

/* KAKAO_PRODUCT_TABLE - ��ǰ���� */
CREATE TABLE [dbo].[KAKAO_PRODUCT_TABLE ] (
	[char_seq] [BIGINT] NOT NULL,  /* ĳ���� ��ȣ - char_seq */
	[product_id] [BIGINT] NOT NULL,  /* ��ǰ������ȣ - product_id */
	[category_code] [BIGINT] NOT NULL,  /* �з��ڵ� - category_code */
	[product_nm] [NVARCHAR](60) NOT NULL,  /* ��ǰ�̸� - product_nm */
	[product_count] [INT] NOT NULL,  /* ��ǰ ���� - product_count */
	[product_category] [NVARCHAR](100),  /* ī�װ� - product_category */
	[product_detail_info] [NVARCHAR](3000),  /* �������� - product_detail_info */
	[product_price] [MONEY] NOT NULL,  /* ��ǰ���� - product_price */
	[reg_dt] [DATETIME] NOT NULL,  /* ��ϳ�¥ - reg_dt */
	[del_yn] [CHAR](1) NOT NULL,  /* �������� - del_yn */
	[discount_rate] [SMALLINT] /* ������  - discount_rate */
)

ALTER TABLE dbo.KAKAO_PRODUCT_TABLE ADD CONSTRAINT PK__KAKAO_PRODUCT_TABLE__CHAR_SEQ__PRODUCT_ID PRIMARY KEY (char_seq,product_id)


SELECT * FROM dbo.KAKAO_PRODUCT_TABLE WITH(NOLOCK)

BEGIN TRAN

insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,1,N'LED �ð�_���̾�&�����',450,N'����',NULL,35000,GETDATE(),'N',NULL)
insert into dbo.KAKAO_PRODUCT_TABLE values (9,1,1,N'LED �ð�_���̾�&�����',450,N'����',NULL,35000,GETDATE(),'N',NULL)

insert into dbo.KAKAO_PRODUCT_TABLE values (9,2,2,N'[�¶��� ����]���� ���� Ź��ǳ��_���̾�&���',550,N'����',NULL,49000,GETDATE(),'N',NULL)
insert into dbo.KAKAO_PRODUCT_TABLE values (1,2,2,N'[�¶��� ����]���� ���� Ź��ǳ��_���̾�&���',550,N'����',NULL,49000,GETDATE(),'N',NULL)

insert into dbo.KAKAO_PRODUCT_TABLE values (9,3,3,N'����̴� ������ ������ ����',2000,N'����',NULL,24000,GETDATE(),'N',NULL)

insert into dbo.KAKAO_PRODUCT_TABLE values (1,3,4,N'���̾�&����� ��� ���� ������',1200,N'�� ��������',NULL,39000,GETDATE(),'N',NULL)
insert into dbo.KAKAO_PRODUCT_TABLE values (9,4,4,N'���̾�&����� ��� ���� ������',1200,N'�� ��������',NULL,39000,GETDATE(),'N',NULL)

insert into dbo.KAKAO_PRODUCT_TABLE values (1,4,5,N'���̾�� ������� ���۳���',550,N'����',NULL,39000,GETDATE(),'N',NULL)
insert into dbo.KAKAO_PRODUCT_TABLE values (9,5,5,N'���̾�� ������� ���۳���',550,N'����',NULL,39000,GETDATE(),'N',NULL)


insert into dbo.KAKAO_PRODUCT_TABLE values (10,1,6,N'�Ҹ��� �̴ϰ�Ƽ�� ���̽�',5800,N'����',NULL,19000,GETDATE(),'N',NULL)


insert into dbo.KAKAO_PRODUCT_TABLE values (1,5,7,N'��Ʋ���̾� �̴Ϻ���Ŀ',120,N'����',NULL,39900,GETDATE(),'N',NULL)



COMMIT TRAN

ROLLBACK TRAN




/* KAKAO_PRODUCT_MAIN_CATEGORY - ��ǰ���� ��з� */
CREATE TABLE [dbo].[KAKAO_PRODUCT_MAIN_CATEGORY] (
	[category_code] [BIGINT] NOT NULL,  /* �з��ڵ� - category_code */
	[category_nm] [NVARCHAR](50) NOT NULL,  /* �з��̸� - category_nm */
	[reg_dt] [DATETIME] NOT NULL,  /* ��ϳ�¥ - reg_dt */
	[category_rep_img_url] [NVARCHAR](100) /* ��з� ��ǥ �̹��� url - category_rep_img_url */
)

ALTER TABLE dbo.KAKAO_PRODUCT_MAIN_CATEGORY ADD CONSTRAINT PK__KAKAO_PRODUCT_MAIN_CATEGORY__CATEGORY_CODE PRIMARY KEY (category_code)

BEGIN TRAN

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (1,N'LED �ð�_���̾�&�����',GETDATE(),N'resources/images/product/20210724_LED �ð�_���̾�&�����.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (2,N'[�¶��� ����]���� ���� Ź��ǳ��_���̾�&���',GETDATE(),N'resources/images/product/20210724_[�¶��� ����]���� ���� Ź��ǳ��_���̾�&���.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (3,N'����̴� ������ ������ ����',GETDATE(),N'resources/images/product/20210724_����̴� ������ ������ ����.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (4,N'���̾�&����� ��� ���� ������',GETDATE(),N'resources/images/product/20210724_���̾�&����� ��� ���� ������.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (5,N'���̾�� ������� ���۳���',GETDATE(),N'resources/images/product/20210724_���̾�� ������� ���۳���.jpg')

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (6,N'�Ҹ��� �̴ϰ�Ƽ�� ���̽�',GETDATE(),N'resources/images/product/20210724_�Ҹ��� �̴ϰ�Ƽ�� ���̽�.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (7,N'��Ʋ���̾� �̴Ϻ���Ŀ',GETDATE(),N'resources/images/product/20210724_��Ʋ���̾� �̴Ϻ���Ŀ.jpg')

SELECT * FROM dbo.KAKAO_PRODUCT_MAIN_CATEGORY WITH(NOLOCK)

DROP TABLE dbo.KAKAO_NEW_PRODUCT


/* KAKAO_NEW_PRODUCT - �űԻ�ǰ */
CREATE TABLE [dbo].[KAKAO_NEW_PRODUCT] (
	[new_prodt_seq] [BIGINT] IDENTITY(1,1) NOT NULL,  /* �űԻ�ǰ �ڵ� - new_prodt_seq */
	[dp_start_dt] [DATETIME] NOT NULL,  /* DP ���� ��¥ - dp_start_dt */
	[dp_end_dt] [DATETIME] NOT NULL,  /* DP ������ ��¥ - dp_end_dt */
	[recommend_prodt_yn] [CHAR](1) NOT NULL,  /* ��õ��ǰ ���� - recommend_prodt_yn */
	[product_top_img_title] [NVARCHAR](25),  /* ��ʻ��� ���� ���� - product_top_img_title */
	[product_top_img_title_detail] [NVARCHAR](25),  /* ��ʻ��� ���� ���� - product_top_img_title_detail */
	[category_code] [BIGINT] NOT NULL /* �з��ڵ� - category_code */
)
GO


ALTER TABLE dbo.KAKAO_NEW_PRODUCT ADD CONSTRAINT PK__KAKAO_NEW_PRODUCT__NEW_PRODT_SEQ PRIMARY KEY (new_prodt_seq)


begin tran

INSERT INTO dbo.KAKAO_NEW_PRODUCT VALUES (getdate(),'2022-01-01','N',N'Ź���, �����̿� ��εǴ�',N'���̾�� ����� LED �ð�',1)
INSERT INTO dbo.KAKAO_NEW_PRODUCT VALUES (getdate(),'2022-01-01','N',N'å�� ���� �ÿ��ϰ�',N'�¶��� ���� Ź��� ��ǳ��',2)
INSERT INTO dbo.KAKAO_NEW_PRODUCT VALUES (getdate(),'2022-01-01','N',N'���ڰ� �ϳ���',N'����̴� ������ ������',3)


INSERT INTO dbo.KAKAO_NEW_PRODUCT VALUES (getdate(),'2022-01-01','N',N'���̾�� Ŭ���ϰ�',N'��� ���� ������',4)
INSERT INTO dbo.KAKAO_NEW_PRODUCT VALUES (getdate(),'2022-01-01','N',N'���ۿ� û�ҵ� ��̰�',N'���̾�� ������� ���۳���',5)

INSERT INTO dbo.KAKAO_NEW_PRODUCT VALUES (getdate(),'2022-01-01','N',N'������ �Ҹ��� ����',N'�Ҹ��� Ƽ�� ���̽�',6)
INSERT INTO dbo.KAKAO_NEW_PRODUCT VALUES (getdate(),'2022-01-01','N',N'���̾�� ��ſ� ����ŷ',N'��Ʋ���̾� �̴Ϻ���Ŀ',7)



select * from dbo.KAKAO_NEW_PRODUCT with(nolock)



commit tran


COMMIT TRAN


ROLLBACK TRAN



insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,N'����̿�ģ����',340,N'����',NULL,35000,GETDATE(),'N',1)





insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,N'����̿�ģ����',340,N'����',NULL,35000,GETDATE(),'N',1)
insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,N'����̿�ģ����',340,N'����',NULL,35000,GETDATE(),'N',1)
insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,N'����̿�ģ����',340,N'����',NULL,35000,GETDATE(),'N',1)
insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,N'����̿�ģ����',340,N'����',NULL,35000,GETDATE(),'N',1)
insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,N'����̿�ģ����',340,N'����',NULL,35000,GETDATE(),'N',1)
insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,N'����̿�ģ����',340,N'����',NULL,35000,GETDATE(),'N',1)
insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,N'����̿�ģ����',340,N'����',NULL,35000,GETDATE(),'N',1)
insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,N'����̿�ģ����',340,N'����',NULL,35000,GETDATE(),'N',1)
insert into dbo.KAKAO_PRODUCT_TABLE values (1,1,N'����̿�ģ����',340,N'����',NULL,35000,GETDATE(),'N',1)








SELECT @@TRANCOUNT

ROLLBACK TRAN




(
	9,
	1,
	500,
	N'����',
	NULL,
	49000,
	DEFAULT,
	'N'
)