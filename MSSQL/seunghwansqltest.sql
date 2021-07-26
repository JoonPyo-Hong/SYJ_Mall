
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



SELECT * FROM dbo.KAKAO_PRODUCT_TABLE WITH(NOLOCK)



COMMIT TRAN

ROLLBACK TRAN

select @@TRANCOUNT


DROP TABLE dbo.KAKAO_PRODUCT_MAIN_CATEGORY

/* KAKAO_PRODUCT_MAIN_CATEGORY - ��ǰ���� ��з� */
CREATE TABLE [dbo].[KAKAO_PRODUCT_MAIN_CATEGORY] (
	[category_code] [BIGINT] IDENTITY(1,1) NOT NULL,  /* �з��ڵ� - category_code */
	[category_nm] [NVARCHAR](50) NOT NULL,  /* �з��̸� - category_nm */
	[reg_dt] [DATETIME] NOT NULL,  /* ��ϳ�¥ - reg_dt */
	[category_rep_img_url] [NVARCHAR](100), /* ��з� ��ǥ �̹��� url - category_rep_img_url */
	[rep_img_url]	[NVARCHAR](100) /* ��ǥ �̹��� url - rep_img_url*/
)

ALTER TABLE dbo.KAKAO_PRODUCT_MAIN_CATEGORY ADD CONSTRAINT PK__KAKAO_PRODUCT_MAIN_CATEGORY__CATEGORY_CODE PRIMARY KEY (category_code)

BEGIN TRAN

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (N'LED �ð�_���̾�&�����',GETDATE(),N'resources/images/product/20210724_LED �ð�_���̾�&�����.jpg',N'resources/images/product/20210724_LED �ð�_���̾�&�����_1.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (N'[�¶��� ����]���� ���� Ź��ǳ��_���̾�&���',GETDATE(),N'resources/images/product/20210724_[�¶��� ����]���� ���� Ź��ǳ��_���̾�&���.jpg',NULL)
INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (N'����̴� ������ ������ ����',GETDATE(),N'resources/images/product/20210724_����̴� ������ ������ ����.jpg',N'resources/images/product/20210724_����̴� ������ ������ ����_1.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (N'���̾�&����� ��� ���� ������',GETDATE(),N'resources/images/product/20210724_���̾�&����� ��� ���� ������.jpg',NULL)
INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (N'���̾�� ������� ���۳���',GETDATE(),N'resources/images/product/20210724_���̾�� ������� ���۳���.jpg',N'resources/images/product/20210724_���̾�� ������� ���۳���_1.jpg')

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (N'�Ҹ��� �̴ϰ�Ƽ�� ���̽�',GETDATE(),N'resources/images/product/20210724_�Ҹ��� �̴ϰ�Ƽ�� ���̽�.jpg',NULL)
INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (N'��Ʋ���̾� �̴Ϻ���Ŀ',GETDATE(),N'resources/images/product/20210724_��Ʋ���̾� �̴Ϻ���Ŀ.jpg',NULL)

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


select * from dbo.KAKAO_NEW_PRODUCT with(nolock)

begin tran

update dbo.KAKAO_NEW_PRODUCT set recommend_prodt_yn = 'Y' where new_prodt_seq in (1,3,5)


commit tran


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

select @@TRANCOUNT


/* 
	Author      : Seunghwan Shin 
	Create date : 2021-07-25  
	Description : �űԻ�ǰ - ��� �̹��� �����ֱ�
	     
	History	: 2021-07-25 Seunghwan Shin	#���� ����  
*/
create proc dbo.kakao_new_product_banner_images
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	select 
		np.product_top_img_title as banner_img--��ʻ��� ����
	,	np.product_top_img_title_detail as banner_img_detail-- ��ʻ��� ���� ����
	,	pmc.category_rep_img_url as category_img-- ��з� ��ǥ �̹���
	,	pmc.category_code as category_code--�з��ڵ�
	from dbo.KAKAO_NEW_PRODUCT np with(nolock)
	inner join dbo.KAKAO_PRODUCT_MAIN_CATEGORY pmc with(nolock) on np.category_code = pmc.category_code
	
end



DROP TABLE KAKAO_PRODUCT_IMG





/* KAKAO_PRODUCT_IMG - ��ǰ���� �̹��� */
CREATE TABLE [dbo].[KAKAO_PRODUCT_IMG] (
	[img_seq] [BIGINT] IDENTITY(1,1) NOT NULL,  /* �̹��� ������ȣ - img_seq */
	[product_id] [BIGINT] NOT NULL,  /* ��ǰ������ȣ - product_id */
	[char_seq] [BIGINT] NOT NULL,  /* ĳ���� ��ȣ - char_seq */
	[product_img_url] [NVARCHAR](100) NOT NULL /* �̹��� url - product_img_url */
)
GO

alter table dbo.KAKAO_PRODUCT_IMG add constraint PK__KAKAO_PRODUCT_IMG__IMG_SEQ PRIMARY KEY (img_seq,product_id,char_seq)

BEGIN TRAN

INSERT INTO dbo.KAKAO_PRODUCT_IMG VALUES (1,1,N'resources/images/product/20210724_LED �ð�_���̾�&�����_1.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_IMG VALUES (1,9,N'resources/images/product/20210724_LED �ð�_���̾�&�����_1.jpg')

INSERT INTO dbo.KAKAO_PRODUCT_IMG VALUES (3,9,N'resources/images/product/20210724_����̴� ������ ������ ����_1.jpg')

INSERT INTO dbo.KAKAO_PRODUCT_IMG VALUES (4,1,N'resources/images/product/20210724_���̾�� ������� ���۳���_1.jpg')

INSERT INTO dbo.KAKAO_PRODUCT_IMG VALUES (5,9,N'resources/images/product/20210724_���̾�� ������� ���۳���_1.jpg')


SELECT * FROM dbo.KAKAO_PRODUCT_IMG WITH(NOLOCK)


SELECT * FROM dbo.KAKAO_PRODUCT_TABLE WITH(NOLOCK)

insert into dbo.KAKAO_PRODUCT_TABLE values (9,6,)


--resources/images/product/20210724_LED �ð�_���̾�&�����.jpg

SELECT * FROM dbo.KAKAO_PRODUCT_MAIN_CATEGORY WITH(NOLOCK)

begin tran

insert into dbo.KAKAO_PRODUCT_MAIN_CATEGORY values (N'����Ĩ��Ʈ����',getdate(),N'resources/images/product/20210726_����Ĩ��Ʈ����.jpg')

insert into dbo.KAKAO_PRODUCT_MAIN_CATEGORY values (N'����Ĩ��ũ��Ʈ',getdate(),N'resources/images/product/20210726_����Ĩ��ũ��Ʈ.jpg')

insert into dbo.KAKAO_PRODUCT_MAIN_CATEGORY values (N'����̹�����̺��������̽�',getdate(),N'resources/images/product/20210726_����̹�����̺��������̽�.jpg')

insert into dbo.KAKAO_PRODUCT_MAIN_CATEGORY values (N'���̾�������ǱԾ�������ȣ��',getdate(),N'resources/images/product/20210726_���̾�������ǱԾ�������ȣ��.jpg')

insert into dbo.KAKAO_PRODUCT_MAIN_CATEGORY values (N'���̾������Ѽ����',getdate(),N'resources/images/product/20210726_���̾������Ѽ����.jpg')


SELECT * FROM dbo.KAKAO_PRODUCT_MAIN_CATEGORY WITH(NOLOCK)





select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY with(nolock)

insert into dbo.KAKAO_PRODUCT_MAIN_CATEGORY values (N'����Ĩ��Ʈ����',getdate(),null,N'resources/images/product/20210726_����Ĩ��Ʈ����.jpg')

insert into dbo.KAKAO_PRODUCT_MAIN_CATEGORY values (N'����Ĩ��ũ��Ʈ',getdate(),null,N'resources/images/product/20210726_����Ĩ��ũ��Ʈ.jpg')

insert into dbo.KAKAO_PRODUCT_MAIN_CATEGORY values (N'����̹�����̺��������̽�',getdate(),null,N'resources/images/product/20210726_����̹�����̺��������̽�.jpg')

insert into dbo.KAKAO_PRODUCT_MAIN_CATEGORY values (N'���̾�������ǱԾ�������ȣ��',getdate(),null,N'resources/images/product/20210726_���̾�������ǱԾ�������ȣ��.jpg')

insert into dbo.KAKAO_PRODUCT_MAIN_CATEGORY values (N'���̾������Ѽ����',getdate(),null,N'resources/images/product/20210726_���̾������Ѽ����.jpg')


KAO_NEW_PRODUCT WITH(NOLOCK)


select * from dbo.KAKAO_NEW_PRODUCT with(nolock)

INSERT INTO dbo.KAKAO_NEW_PRODUCT VALUES (getdate(),'2022-01-01','Y',NULL,NULL,8)

INSERT INTO dbo.KAKAO_NEW_PRODUCT VALUES (getdate(),'2022-01-01','Y',NULL,NULL,9)

INSERT INTO dbo.KAKAO_NEW_PRODUCT VALUES (getdate(),'2022-01-01','Y',NULL,NULL,10)

INSERT INTO dbo.KAKAO_NEW_PRODUCT VALUES (getdate(),'2022-01-01','Y',NULL,NULL,11)

INSERT INTO dbo.KAKAO_NEW_PRODUCT VALUES (getdate(),'2022-01-01','Y',NULL,NULL,12)









/* KAKAO_PRODUCT_MAIN_CATEGORY - ��ǰ���� ��з� */
CREATE TABLE [dbo].[KAKAO_PRODUCT_MAIN_CATEGORY] (
	[category_code] [BIGINT] IDENTITY(1,1) NOT NULL,  /* �з��ڵ� - category_code */
	[category_nm] [NVARCHAR](50) NOT NULL,  /* �з��̸� - category_nm */
	[reg_dt] [DATETIME] NOT NULL,  /* ��ϳ�¥ - reg_dt */
	[category_rep_img_url] [NVARCHAR](100), /* ��з� ��ǥ �̹��� url - category_rep_img_url */
	[rep_img_url]	[NVARCHAR](100) /* ��ǥ �̹��� url - rep_img_url*/
)

ALTER TABLE dbo.KAKAO_PRODUCT_MAIN_CATEGORY ADD CONSTRAINT PK__KAKAO_PRODUCT_MAIN_CATEGORY__CATEGORY_CODE PRIMARY KEY (category_code)

BEGIN TRAN

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (N'LED �ð�_���̾�&�����',GETDATE(),N'resources/images/product/20210724_LED �ð�_���̾�&�����.jpg',N'resources/images/product/20210724_LED �ð�_���̾�&�����_1.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (N'[�¶��� ����]���� ���� Ź��ǳ��_���̾�&���',GETDATE(),N'resources/images/product/20210724_[�¶��� ����]���� ���� Ź��ǳ��_���̾�&���.jpg',NULL)
INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (N'����̴� ������ ������ ����',GETDATE(),N'resources/images/product/20210724_����̴� ������ ������ ����.jpg',N'resources/images/product/20210724_����̴� ������ ������ ����_1.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (N'���̾�&����� ��� ���� ������',GETDATE(),N'resources/images/product/20210724_���̾�&����� ��� ���� ������.jpg',NULL)
INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (N'���̾�� ������� ���۳���',GETDATE(),N'resources/images/product/20210724_���̾�� ������� ���۳���.jpg',N'resources/images/product/20210724_���̾�� ������� ���۳���_1.jpg')

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (N'�Ҹ��� �̴ϰ�Ƽ�� ���̽�',GETDATE(),N'resources/images/product/20210724_�Ҹ��� �̴ϰ�Ƽ�� ���̽�.jpg',NULL)
INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (N'��Ʋ���̾� �̴Ϻ���Ŀ',GETDATE(),N'resources/images/product/20210724_��Ʋ���̾� �̴Ϻ���Ŀ.jpg',NULL)


insert into dbo.KAKAO_PRODUCT_MAIN_CATEGORY values (N'����Ĩ��Ʈ����',getdate(),null,N'resources/images/product/20210726_����Ĩ��Ʈ����.jpg')

insert into dbo.KAKAO_PRODUCT_MAIN_CATEGORY values (N'����Ĩ��ũ��Ʈ',getdate(),null,N'resources/images/product/20210726_����Ĩ��ũ��Ʈ.jpg')

insert into dbo.KAKAO_PRODUCT_MAIN_CATEGORY values (N'����̹�����̺��������̽�',getdate(),null,N'resources/images/product/20210726_����̹�����̺��������̽�.jpg')

insert into dbo.KAKAO_PRODUCT_MAIN_CATEGORY values (N'���̾�������ǱԾ�������ȣ��',getdate(),null,N'resources/images/product/20210726_���̾�������ǱԾ�������ȣ��.jpg')

insert into dbo.KAKAO_PRODUCT_MAIN_CATEGORY values (N'���̾������Ѽ����',getdate(),null,N'resources/images/product/20210726_���̾������Ѽ����.jpg')


select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY with(nolock)




select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY with(nolock)

select * from dbo.KAKAO_NEW_PRODUCT with(nolock)


select * from dbo.KAKAO_PRODUCT_TABLE with(nolock)



insert into dbo.KAKAO_PRODUCT_TABLE values (16,1,8,N'īī�������� ����Ĩ_���������ũ��Ʈ',550,N'��ǰ',NULL,19800,GETDATE(),'N',NULL)

insert into dbo.KAKAO_PRODUCT_TABLE values (16,1,8,N'īī�������� ����Ĩ_���������ũ��Ʈ',550,N'��ǰ',NULL,19800,GETDATE(),'N',NULL)