
DROP TABLE dbo.KAKAO_PRODUCT_TABLE

/* KAKAO_PRODUCT_TABLE - ��ǰ���� */
CREATE TABLE [dbo].[KAKAO_PRODUCT_TABLE] (
	[char_seq] [BIGINT] NOT NULL,  /* ĳ���� ��ȣ - char_seq */
	[product_id] [BIGINT] NOT NULL,  /* ��ǰ������ȣ - product_id */
	[product_nm] [NVARCHAR](60) NOT NULL,  /* ��ǰ�̸� - product_nm */
	[product_count] [INT] NOT NULL,  /* ��ǰ ���� - product_count */
	[product_category] [NVARCHAR](100),  /* ī�װ� - product_category */
	[product_detail_info] [NVARCHAR](3000),  /* �������� - product_detail_info */
	[product_price] [MONEY] NOT NULL,  /* ��ǰ���� - product_price */
	[reg_dt] [DATETIME] NOT NULL,  /* ��ϳ�¥ - reg_dt */
	[del_yn] [CHAR](1) NOT NULL,  /* �������� - del_yn */
	[ship_comp_seq] [BIGINT] NOT NULL /* ��ۻ� ������ȣ - ship_comp_seq */
)

ALTER TABLE dbo.KAKAO_PRODUCT_TABLE ADD CONSTRAINT PK__KAKAO_PRODUCT_TABLE__CHAR_SEQ__PRODUCT_ID PRIMARY KEY (char_seq,product_id)


SELECT * FROM dbo.KAKAO_PRODUCT_TABLE WITH(NOLOCK)

BEGIN TRAN

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