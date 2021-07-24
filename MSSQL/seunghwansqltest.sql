
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
CREATE TABLE [dbo].[KAKAO_PRODUCT_MAIN_CATEGORY ] (
	[category_code] [BIGINT] NOT NULL,  /* �з��ڵ� - category_code */
	[category_nm] [NVARCHAR](50) NOT NULL,  /* �з��̸� - category_nm */
	[reg_dt] [DATETIME] NOT NULL,  /* ��ϳ�¥ - reg_dt */
	[category_rep_img_url] [NVARCHAR](100) /* ��з� ��ǥ �̹��� url - category_rep_img_url */
)






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