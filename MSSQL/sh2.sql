


select * from dbo.KAKAO_CHARACTER with(nolock)


select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY with(nolock)

/* KAKAO_PRODUCT_MAIN_CATEGORY - ��ǰ���� ��з� */
CREATE TABLE [dbo].[KAKAO_PRODUCT_MAIN_CATEGORY] (
	[main_category_code] [INT] NOT NULL,  /* �з��ڵ� - main_category_code */
	[main_category_nm] [NVARCHAR](50) NOT NULL,  /* �з��̸� - main_category_nm */
	[category_rep_img] [NVARCHAR](100),  /* ��з� ��ǥ �̹��� - category_rep_img */
	[reg_dt] [DATETIME] NOT NULL,  /* ��ϳ�¥ - reg_dt */
	[chg_dt] [DATETIME] /* ���� ��¥ - chg_dt */
)
GO

alter table dbo.KAKAO_PRODUCT_MAIN_CATEGORY add constraint PK__KAKAO_PRODUCT_MAIN_CATEGORY__MAIN_CATEGORY_CODE PRIMARY KEY (main_category_code)


INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (1,N'��ü',N'resources/images/maincategory/img_category_header_all.png',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (2,N'����',N'resources/images/maincategory/category_toy_M_201113.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (3,N'����',N'resources/images/maincategory/category_living_M_201113.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (4,N'��ȭ',N'resources/images/maincategory/category_accessory_M_201113.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (5,N'����',N'resources/images/maincategory/category_stationery_M_201113.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (6,N'�Ƿ�',N'resources/images/maincategory/category_apparel_M_201113.jpg',GETDATE(),NULL)


INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (7,N'������',N'resources/images/maincategory/category_electronic_M_201113.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (8,N'����/����',N'resources/images/maincategory/category_leisure_M_201113.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (9,N'��ǰ',N'resources/images/maincategory/category_food_M_201113.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (10,N'�׸� ��ȹ��',N'resources/images/maincategory/category_specialtheme_M_201113.jpg',GETDATE(),NULL)


select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY with(nolock)




/* KAKAO_CHARACTER - īī��ĳ���� */
CREATE TABLE [dbo].[KAKAO_CHARACTER] (
	[char_seq] [BIGINT] NOT NULL,  /* ĳ���� ��ȣ - char_seq */
	[char_name] [NVARCHAR](20) NOT NULL,  /*  ĳ���� �̸� - char_name */
	[char_img] [NVARCHAR](100) NOT NULL,  /* ĳ���� ��ǥ �̹��� - char_img */
	[char_head_img] [NVARCHAR](100) NOT NULL,  /* ĳ���� ��� �̹��� - char_head_img */
	[reg_dt] [DATETIME] NOT NULL,  /* ��ϳ�¥ - reg_dt */
	[chg_dt] [DATETIME] /* ���� ��¥ - chg_dt */
)
GO


alter table dbo.KAKAO_CHARACTER add constraint PK__KAKAO_CHARACTER__CHAR_SEQ PRIMARY KEY (char_seq)


INSERT INTO dbo.KAKAO_CHARACTER VALUES (1,N'���̾�',N'resources/images/KAKAO_CHARACTER/char_img/li-Ryan.png',N'resources/images/KAKAO_CHARACTER/char_head_img/Category_Ryan_210303.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_CHARACTER VALUES (2,N'����ġ',N'resources/images/KAKAO_CHARACTER/char_img/li-Apeach.png',N'resources/images/KAKAO_CHARACTER/char_head_img/Category_Apeach_210303.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_CHARACTER VALUES (3,N'����',N'resources/images/KAKAO_CHARACTER/char_img/li-Muzi.png',N'resources/images/KAKAO_CHARACTER/char_head_img/Category_Muzi_210303.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_CHARACTER VALUES (4,N'���ε�',N'resources/images/KAKAO_CHARACTER/char_img/li-Frodo.png',N'resources/images/KAKAO_CHARACTER/char_head_img/Category_Frodo_210303.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_CHARACTER VALUES (5,N'�׿�',N'resources/images/KAKAO_CHARACTER/char_img/li-Ryan.png',N'resources/images/KAKAO_CHARACTER/char_head_img/Category_Ryan_210303.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_CHARACTER VALUES (1,N'���̾�',N'resources/images/KAKAO_CHARACTER/char_img/li-Ryan.png',N'resources/images/KAKAO_CHARACTER/char_head_img/Category_Ryan_210303.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_CHARACTER VALUES (1,N'���̾�',N'resources/images/KAKAO_CHARACTER/char_img/li-Ryan.png',N'resources/images/KAKAO_CHARACTER/char_head_img/Category_Ryan_210303.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_CHARACTER VALUES (1,N'���̾�',N'resources/images/KAKAO_CHARACTER/char_img/li-Ryan.png',N'resources/images/KAKAO_CHARACTER/char_head_img/Category_Ryan_210303.jpg',GETDATE(),NULL)








select * from dbo.KAKAO_CHARACTER with(nolock)



/* KAKAO_PRODUCT_CATEGORY - ��ǰ���� �Һз� */
CREATE TABLE [dbo].[KAKAO_PRODUCT_CATEGORY] (
	[category_code] [BIGINT] NOT NULL,  /* �Һз��ڵ� - category_code */
	[main_category_code] [INT] NOT NULL,  /* �з��ڵ� - main_category_code */
	[category_nm] [NVARCHAR](50) NOT NULL,  /* �з��̸� - category_nm */
	[category_rep_img] [NVARCHAR](100),  /* �Һз� �ű� ��� �̹���  - category_new_img */
	[category_detail_img] [NVARCHAR](100),  /* �Һз� �ű� ���� ��ǥ �̹��� - category_detail_img */
	[reg_dt] [DATETIME] NOT NULL,  /* ��ϳ�¥ - reg_dt */
	[chg_dt] [DATETIME] /* ���� ��¥ - chg_dt */
)
GO

alter table dbo.KAKAO_PRODUCT_CATEGORY add constraint PK__KAKAO_PRODUCT_CATEGORY__CATEGORY_CODE__MAIN_CATEGORY_CODE primary key (category_code,main_category_code)



select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)



------���---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


/*
	Author      : Seunghwan Shin
	Create date : 2021-07-13
	Description : �α��� ������ ȸ�������� �ִ��� üũ
	    
	History		: 2021-07-13 Seunghwan Shin	#���� ����
				  2021-07-23 Seunghwan Shin #�����;�����(���þ�����)�� ����� �α��� ������� ip�� ����ó��

*/
CREATE proc [dbo].[kakao_first_user_login]
	@qoouser_id varchar(100) -- ���� id
,	@qoouser_pw varchar(800) -- ���� pw
,	@user_ip_address varchar(100)-- ������ ip�ּ�
,	@result int output -- ����� 
						/*	 0 : ������ �����Ƿ� ����
							 1 : �α��� ������ ������
							-1 : �α��� ������ �������� ���� : �� ���̵� ��й�ȣ ���� �ϳ��̻��� Ʋ�ȴٴ� ����.
							-100 : �����߻�
						*/
as
set nocount on
set transaction isolation level read uncommitted
begin
	begin try
		-- �� ���� ���������� Ȯ�����ش�.
		if exists (select * from dbo.TBLBANNEDIPLIST where banned_ip_address = @user_ip_address) -- ������ �������� ���
		begin
			set @result = 0
		end
		--�� ������ �ƴ� �������� ��� -> �α��� ���� Ȯ��
		else
		begin
			if exists (select * from dbo.QOO10_USER_REAL  where qoouser_id = @qoouser_id  and qoouser_pw = @qoouser_pw) -- �α��� ������ �����ϴ� ���
			begin
				set @result = 1
			end
			-- ������ �������� �ʴµ� ������������ ��� �����ϴ� ���
			else
			begin
				set @result = -1

				declare @try_count int

				begin tran
					--������ �αױ�� �����
					insert into dbo.LOGINTRYIP
					(
						ip_address
					,	try_time
					)
					values
					(
						@user_ip_address
					,	default
					)
				commit tran

				-- �õ��� Ƚ�� : 15�ʾȿ� 4���̻� �õ��ϸ�, ���� ��Ų��.
				select @try_count = count(*) from dbo.LOGINTRYIP with(nolock) 
				where ip_address = @user_ip_address 
				and  DATEDIFF(ss,try_time,getdate()) <= 15

			    if (@try_count >= 4)
				begin
					if(@user_ip_address != '0:0:0:0:0:0:0:1')
					begin
						begin tran
							insert into dbo.TBLBANNEDIPLIST values (@user_ip_address)
						commit tran
					end
				end
				
			end
		end
	end try
	begin catch
		set @result = -100
		rollback tran
	end catch
end



select * from dbo.KAKAO_PRODUCT_CATEGORY  with(nolock)

select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY  with(nolock)


DROP TABLE dbo.KAKAO_PRODUCT_CATEGORY

/* KAKAO_PRODUCT_CATEGORY - ��ǰ���� �Һз� */
CREATE TABLE [dbo].[KAKAO_PRODUCT_CATEGORY] (
	[category_code] [BIGINT] IDENTITY(1,1) NOT NULL,  /* �Һз��ڵ� - category_code */
	[main_category_code] [INT] NOT NULL,  /* �з��ڵ� - main_category_code */
	[category_nm] [NVARCHAR](50) NOT NULL,  /* �з��̸� - category_nm */
	[reg_dt] [DATETIME] NOT NULL,  /* ��ϳ�¥ - reg_dt */
	[chg_dt] [DATETIME] /* ���� ��¥ - chg_dt */
)
GO

alter table dbo.KAKAO_PRODUCT_CATEGORY add constraint PK__KAKAO_PRODUCT_CATEGORY__CATEGORY_CODE__MAIN_CATEGORY_CODE PRIMARY KEY (category_code,main_category_code)


INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (2,N'�̴�����',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (2,N'��������',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (2,N'��������',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (2,N'�ǱԾ�/�긯',GETDATE(),NULL)


select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY  with(nolock)
select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)

INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (3,N'�к긯',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (3,N'�ֹ��ǰ',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (3,N'��/�Һ�',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (3,N'������ǰ',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (3,N'��Ȱ��ǰ',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (3,N'�̿�/��ǿ�ǰ',GETDATE(),NULL)


select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY  with(nolock)
select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)

begin tran

INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (4,N'����',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (4,N'�Ŀ�ġ/����',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (4,N'�Ź�',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (4,N'�мǼ�ǰ',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (4,N'�����ǰ',GETDATE(),NULL)

rollback tran

select @@TRANCOUNT

select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY  with(nolock)
select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)

begin tran

INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (5,N'�ʱⱸ',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (5,N'����/���̽�',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (5,N'��Ʈ/�޸�',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (5,N'��ƼĿ',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (5,N'����ũ ��ǰ',GETDATE(),NULL)

commit tran


select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY  with(nolock)
select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)

begin tran

INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (6,N'����',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (6,N'����',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (6,N'Ű��',GETDATE(),NULL)


select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY  with(nolock)
select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock) where main_category_code = 7

begin tran

INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (7,N'���� ����',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (7,N'PC/��Ʈ�� �׻�����',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (7,N'�޴��� ���̽�',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (7,N'�޴��� �Ǽ�����',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (7,N'�����̾��� ���̽�',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (7,N'�����̾��� �׼�����',GETDATE(),NULL)

select @@TRANCOUNT

select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY  with(nolock)
select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock) where main_category_code = 8

INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (8,N'����',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (8,N'����',GETDATE(),NULL)

select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY  with(nolock)
select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock) where main_category_code = 9


INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (9,N'����',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (9,N'����',GETDATE(),NULL)


select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY  with(nolock)
select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock) where main_category_code = 10


select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)

SELECT @@TRANCOUNT



begin tran

INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (10,N'�ʷϹ���',GETDATE(),NULL,N'resources/images/theme/210611_theme_friends.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (10,N'���� ����ġ',GETDATE(),NULL,N'resources/images/theme/200929_category_lovelyapeach_M.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (10,N'���� ���',GETDATE(),NULL,N'resources/images/theme/200604_category_marineblue_M.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (10,N'��ġ��',GETDATE(),NULL,N'resources/images/theme/200701_category_beachpub_M.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (10,N'���������',GETDATE(),NULL,N'resources/images/theme/200504_category_yumyum_M.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (10,N'�����׶�',GETDATE(),NULL,N'resources/images/theme/200427_category_lemonterrace_M.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (10,N'���̺�帮��',GETDATE(),NULL,N'resources/images/theme/200310_category_babydreaming_M.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (10,N'������ũ',GETDATE(),NULL,N'resources/images/theme/200218_category_happweeks_M.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (10,N'���ٴϿ������',GETDATE(),NULL,N'resources/images/theme/200206_category_DANIEL_M.jpg')


commit tran


select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)

alter table dbo.KAKAO_PRODUCT_CATEGORY add theme_img nvarchar(100)

 

/* KAKAO_PRODUCT_TABLE - ��ǰ���� */
CREATE TABLE [dbo].[KAKAO_PRODUCT_TABLE] (
	[product_id] [BIGINT] IDENTITY(1,1) NOT NULL,  /* ��ǰ������ȣ - product_id */
	[category_code] [BIGINT] NOT NULL,  /* �Һз��ڵ� - category_code */
	[product_nm] [NVARCHAR](60) NOT NULL,  /* ��ǰ�̸� - product_nm */
	[product_count] [INT] NOT NULL,  /* ��ǰ ���� - product_count */
	[product_detail_info] [NVARCHAR](3000),  /* �������� - product_detail_info */
	[product_price] [MONEY] NOT NULL,  /* ��ǰ���� - product_price */
	[discount_rate] [SMALLINT] NOT NULL,  /* ������  - discount_rate */
	[recommend_prodt_yn] [CHAR](1) NOT NULL,  /* ��õ��ǰ ���� - recommend_prodt_yn */
	[del_yn] [CHAR](1) NOT NULL /* �������� - del_yn */
)
GO

alter table dbo.KAKAO_PRODUCT_TABLE add constraint PK__KAKAO_PRODUCT_TABLE__PRODUCT_ID__CATEGORY_CODE PRIMARY KEY (product_id,category_code)



SELECT * FROM dbo.KAKAO_PRODUCT_TABLE with(nolock)


select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY  with(nolock)
select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)

insert into dbo.KAKAO_PRODUCT_TABLE values (2,N'����� �ո�ȣ �������',250,NULL,32000,0,'Y','N')

insert into dbo.KAKAO_PRODUCT_TABLE values (24,N'LED �ð�_���̾�&�����',750,NULL,35000,0,'Y','N')

insert into dbo.KAKAO_PRODUCT_TABLE values (1,N'����̴� ������ ������ ����',1050,NULL,24000,0,'Y','N')

insert into dbo.KAKAO_PRODUCT_TABLE values (27,N'���̾�&����� ��չ��� ������',880,NULL,39000,0,'Y','N')

insert into dbo.KAKAO_PRODUCT_TABLE values (2,N'���̾�� ������� ���۳���',210,NULL,39000,0,'Y','N')

insert into dbo.KAKAO_PRODUCT_TABLE values (9,N'�Ҹ��� �̴ϰ�Ƽ�� ���̽�',2150,NULL,19000,0,'Y','N')

insert into dbo.KAKAO_PRODUCT_TABLE values (6,N'��Ʋ���̾� �̴Ϻ���Ŀ',150,NULL,39900,0,'Y','N')

insert into dbo.KAKAO_PRODUCT_TABLE values (7,N'ȥ�� ������ 2P��Ʈ_���̾�&�����',1500,NULL,25000,0,'Y','N')

insert into dbo.KAKAO_PRODUCT_TABLE values (24,N'�������� ������ ����Ʈ�ڽ�',120,NULL,498000,0,'Y','N')



DROP TABLE dbo.KAKAO_PROMOTION

/* KAKAO_PROMOTION - ��ȹ��ǰ */
CREATE TABLE [dbo].[KAKAO_PROMOTION] (
	[promotion_code] [BIGINT] IDENTITY(1,1) NOT NULL,  /* ��ȹ�ڵ� - promotion_code */
	[promotion_nm] [NVARCHAR](50) NOT NULL,  /* ��ȹ�̸� - promotion_nm */
	[new_promotion_img] [NVARCHAR](100),  /* ��ȹ �ű������� ��� �̹��� - new_promotion_img */
	[promotion_img] [NVARCHAR](100),  /* ��ȹ ��� �̹���  - promotion_img */
	[product_top_img_title] [NVARCHAR](25),  /* ��ʻ��� ���� ���� - product_top_img_title */
	[product_top_img_title_detail] [NVARCHAR](25),  /* ��ʻ��� ���� ���� - product_top_img_title_detail */
	[reg_dt] [DATETIME] NOT NULL,  /* ��ϳ�¥ - reg_dt */
	[chg_dt] [DATETIME] /* ���� ��¥ - chg_dt */
)
GO

alter table dbo.KAKAO_PROMOTION add constraint PK__KAKAO_PROMOTION__PROMOTION_CODE PRIMARY KEY (promotion_code)

SELECT * FROM dbo.KAKAO_PROMOTION WITH(NOLOCK)

INSERT INTO dbo.KAKAO_PROMOTION VALUES (N'����� �ո�ȣ �������',N'resources/images/product/��ȹ��/banner_20210727183214_mobile_kr.jpg',NULL,N'���� �ð� ��ǻ�� �۾���',N'����� �ո�ȣ ����',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PROMOTION VALUES (N'LED �ð�_���̾�&�����',N'resources/images/product/��ȹ��/banner_20210722090518_mobile_kr.jpg',NULL,N'Ź���, �����̿� ��� �Ǵ�',N'���̾�� ����� LED �ð�',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PROMOTION VALUES (N'����̴� ������ ������ ����',N'resources/images/product/��ȹ��/banner_20210714085750_mobile_kr.jpg',NULL,N'���ڰ� �ϳ���',N'����̴� ������ ������',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PROMOTION VALUES (N'���̾�&����� ��չ��� ������',N'resources/images/product/��ȹ��/banner_20210615143750_mobile_kr.jpg',NULL,N'���̾�� Ŭ���ϰ�',N'��� ���� ������',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PROMOTION VALUES (N'���̾�� ������� ���۳���',N'resources/images/product/��ȹ��/banner_20210702183342_mobile_kr.jpg',NULL,N'���ۿ� û�ҵ� ��̰�',N'���̾�� ������� ���۳���',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PROMOTION VALUES (N'�Ҹ��� �̴ϰ�Ƽ�� ���̽�',N'resources/images/product/��ȹ��/banner_20210624183636_mobile_kr.jpg',NULL,N'������ �Ҹ��� ����',N'�Ҹ��� Ƽ�� ���̽�',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PROMOTION VALUES (N'��Ʋ���̾� �̴Ϻ���Ŀ',N'resources/images/product/��ȹ��/banner_20210421153139_mobile_kr.jpg',NULL,N'���̾�� ��ſ� ����ŷ',N'��Ʋ���̾� �̴Ϻ���Ŀ',GETDATE(),NULL)


DROP TABLE dbo.KAKAO_PROM_PROD


/* KAKAO_PROM_PROD - ��ǰ ��ȹ ���Ӱ��� */
CREATE TABLE [dbo].[KAKAO_PROM_PROD] (
	[promotion_code] [BIGINT] NOT NULL,  /* ��ȹ�ڵ� - promotion_code */
	[product_id] [BIGINT] NOT NULL,  /* ��ǰ������ȣ - product_id */
	[reg_dt] [DATETIME] NOT NULL,  /* ��ϳ�¥ - reg_dt */
	[chg_dt] [DATETIME] /* ���� ��¥ - chg_dt */
)
GO

alter table dbo.KAKAO_PROM_PROD add constraint PK__KAKAO_PROM_PROD__PROMOTION_CODE__PRODUCT_ID PRIMARY KEY (promotion_code,product_id)

INSERT INTO dbo.KAKAO_PROM_PROD VALUES (1,1,GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PROM_PROD VALUES (2,2,GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PROM_PROD VALUES (3,3,GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PROM_PROD VALUES (4,4,GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PROM_PROD VALUES (5,5,GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PROM_PROD VALUES (6,6,GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PROM_PROD VALUES (7,7,GETDATE(),NULL)


SELECT @@TRANCOUNT
SELECT * FROM dbo.KAKAO_PROM_PROD WITH(NOLOCK)

/* KAKAO_THEME_PROMOTION - �׸���ȹ�� ��ǰ */
CREATE TABLE [dbo].[KAKAO_THEME_PROMOTION] (
	[theme_pro_code] [BIGINT] IDENTITY(1,1) NOT NULL,  /* �׸���ȹ�ڵ� - theme_pro_code */
	[theme_nm] [NVARCHAR](50) NOT NULL,  /* �׸���ȹ�� �̸� - theme_nm */
	[theme_img] [NVARCHAR](100),  /* �׸���ȹ�� �̹��� - theme_img */
	[reg_dt] [DATETIME] NOT NULL,  /* ��ϳ�¥ - reg_dt */
	[chg_dt] [DATETIME] /* ���� ��¥ - chg_dt */
)
GO

alter table dbo.KAKAO_THEME_PROMOTION add constraint PK__KAKAO_THEME_PROMOTION__THEME_PRO_CODE PRIMARY KEY (theme_pro_code)


INSERT INTO dbo.KAKAO_THEME_PROMOTION VALUES (N'�ʷϹ���',N'resources/images/theme/210611_theme_friends.jpg',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_THEME_PROMOTION VALUES (N'���� ����ġ',N'resources/images/theme/200929_category_lovelyapeach_M.jpg',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_THEME_PROMOTION VALUES (N'���� ���',N'resources/images/theme/200604_category_marineblue_M.jpg',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_THEME_PROMOTION VALUES (N'��ġ��',N'resources/images/theme/200701_category_beachpub_M.jpg',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_THEME_PROMOTION VALUES (N'���������',N'resources/images/theme/200504_category_yumyum_M.jpg',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_THEME_PROMOTION VALUES (N'�����׶�',N'resources/images/theme/200427_category_lemonterrace_M.jpg',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_THEME_PROMOTION VALUES (N'���̺�帮��',N'resources/images/theme/200310_category_babydreaming_M.jpg',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_THEME_PROMOTION VALUES (N'������ũ',N'resources/images/theme/200218_category_happweeks_M.jpg',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_THEME_PROMOTION VALUES (N'���ٴϿ������',N'resources/images/theme/200206_category_DANIEL_M.jpg',GETDATE(),NULL)


select * from dbo.KAKAO_THEME_PROMOTION with(nolock)







/* KAKAO_PROD_THEME - ��ǰ �׸���ȹ�� ���Ӱ��� */
CREATE TABLE [dbo].[KAKAO_PROD_THEME] (
	[product_id] [BIGINT] NOT NULL,  /* ��ǰ������ȣ - product_id */
	[theme_pro_code] [BIGINT] NOT NULL,  /* �׸���ȹ�ڵ� - theme_pro_code */
	[reg_dt] [DATETIME] NOT NULL,  /* ��ϳ�¥ - reg_dt */
	[chg_dt] [DATETIME] /* ���� ��¥ - chg_dt */
)
GO


alter table dbo.KAKAO_PROD_THEME add constraint PK__KAKAO_PROD_THEME__PRODUCT_ID__THEME_PRO_CODE PRIMARY KEY (product_id,theme_pro_code)



drop table dbo.KAKAO_PROMOTION_IMG

/* KAKAO_PROMOTION_IMG - ��ȹ��ǰ ��Ÿ �̹��� */
CREATE TABLE [dbo].[KAKAO_PROMOTION_IMG] (
	[etc_img_code] [BIGINT] NOT NULL,  /* ��Ÿ �̹��� �ڵ� - etc_img_code */
	[promotion_code] [BIGINT] NOT NULL,  /* ��ȹ�ڵ� - promotion_code */
	[etc_img] [NVARCHAR](100) NOT NULL,  /* ��Ÿ �̹���  - etc_img */
	[reg_dt] [DATETIME] NOT NULL,  /* ��ϳ�¥ - reg_dt */
	[chg_dt] [DATETIME] /* ���� ��¥ - chg_dt */
)
GO

alter table dbo.KAKAO_PROMOTION_IMG add constraint PK__KAKAO_PROMOTION_IMG__ETC_IMG_CODE__PROMOTION_CODE PRIMARY KEY (etc_img_code,promotion_code)


/* KAKAO_PRODUCT_IMG - ��ǰ���� �̹��� */
CREATE TABLE [dbo].[KAKAO_PRODUCT_IMG] (
	[img_seq] [BIGINT] identity(1,1) NOT NULL,  /* �̹��� ������ȣ - img_seq */
	[product_id] [BIGINT] NOT NULL,  /* ��ǰ������ȣ - product_id */
	[product_img] [NVARCHAR](100) NOT NULL,  /* ��ǰ �̹��� - product_img */
	[rep_img_yn] [CHAR](1) NOT NULL,  /* ��ǥ�̹��� ���� - rep_img_yn */
	[head_img_yn] [CHAR](1) NOT NULL /* ����̹��� ���� - head_img_yn */
)
GO


SELECT * FROM DBO.KAKAO_PRODUCT_IMG WITH(NOLOCK)


alter table dbo.KAKAO_PRODUCT_IMG add constraint PK__KAKAO_PRODUCT_IMG__IMG_SEQ__PRODUCT_ID PRIMARY KEY (img_seq,product_id)


/* KAKAO_CHAR_PRODUCT - ��ǰ ĳ���� ���Ӱ��� */
CREATE TABLE [dbo].[KAKAO_CHAR_PRODUCT] (
	[char_seq] [BIGINT] NOT NULL,  /* ĳ���� ��ȣ - char_seq */
	[product_id] [BIGINT] NOT NULL,  /* ��ǰ������ȣ - product_id */
	[reg_dt] [DATETIME] NOT NULL,  /* ��ϳ�¥ - reg_dt */
	[chg_dt] [DATETIME] /* ���� ��¥ - chg_dt */
)
GO

alter table dbo.KAKAO_CHAR_PRODUCT add constraint PK__KAKAO_CHAR_PRODUCT__CHAR_SEQ__PRODUCT_ID PRIMARY KEY (char_seq,product_id)


SELECT * FROM dbo.KAKAO_PRODUCT_TABLE with(nolock)

select * from dbo.KAKAO_CHARACTER with(nolock)

select * from dbo.KAKAO_CHAR_PRODUCT with(nolock)

insert into dbo.KAKAO_CHAR_PRODUCT values (1,8,getdate(),null)
insert into dbo.KAKAO_CHAR_PRODUCT values (9,8,getdate(),null)

insert into dbo.KAKAO_CHAR_PRODUCT values (9,9,getdate(),null)


insert dbo.KAKAO_PRODUCT_IMG values (8,N'resources/images/product/20210531112452103_8809721508909_BW_00.jpg','Y','Y')
insert dbo.KAKAO_PRODUCT_IMG values (8,N'resources/images/product/20210531112452113_8809721508909_BW_01.jpg','N','Y')

insert dbo.KAKAO_PRODUCT_IMG values (9,N'resources/images/product/�������� ������ ����Ʈ�ڽ�/20210727155234467_8809814921004_BW_00.jpg','Y','Y')


select * from dbo.KAKAO_PRODUCT_IMG with(nolock)


UPDATE dbo.KAKAO_PRODUCT_IMG SET product_img = N'resources/images/product/ȥ�� ������ 2P��Ʈ_���̾�&�����/20210531112452113_8809721508909_BW_01.jpg' WHERE img_seq = 1
UPDATE dbo.KAKAO_PRODUCT_IMG SET product_img = N'resources/images/product/ȥ�� ������ 2P��Ʈ_���̾�&�����/20210531112452113_8809721508909_BW_01.jpg' WHERE img_seq = 2



/* KAKAO_USER_SHOPPING_CART - �� ��ٱ��� */
CREATE TABLE [dbo].[KAKAO_USER_SHOPPING_CART] (
	[qoouser_seq] [BIGINT] NOT NULL,  /* ȸ�� ���� ��ȣ - qoouser_seq */
	[product_id] [BIGINT] NOT NULL,  /* ��ǰ������ȣ - product_id */
	[product_count] [INT] NOT NULL,  /* ��ǰ ���� - product_count  */
	[cart_reg_dt] [DATETIME],  /* �߰� ��¥ - cart_reg_dt */
	[cart_chg_dt] [DATETIME],  /* ���� ��¥ - cart_chg_dt */
	[cart_del_yn] [CHAR](1) NOT NULL /* ���� ���� - cart_del_yn */
)
GO

alter table dbo.KAKAO_USER_SHOPPING_CART add constraint PK__KAKAO_USER_SHOPPING_CART__QOOUSER_SEQ__PRODUCT_ID PRIMARY KEY (qoouser_seq,product_id)


select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = 'admin'

insert into dbo.KAKAO_USER_SHOPPING_CART values (2000001,9,1,getdate(),null,'N')


select * from dbo.KAKAO_USER_SHOPPING_CART with(nolock)



/* 
	Author      : Seunghwan Shin 
	Create date : 2021-08-01  
	Description : �űԻ�ǰ - ��õ �ű� �׸� �����ֱ�
	     
	History	: 2021-08-01 Seunghwan Shin	#���� ���� 
			 
*/
alter proc dbo.kakao_new_product_banner_images
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	

	
end



select 
	kpt.product_nm
,	kpt.product_id
,	kpi.img_seq
,	kpi.product_img

from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpi.product_id = kpt.product_id
inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kcp.product_id = kpt.product_id 
left join dbo.KAKAO_USER_SHOPPING_CART ksc with(nolock) on ksc.product_id = kpt.product_id
left join dbo.QOO10_USER_REAL q with(nolock) on q.qoouser_seq = ksc.qoouser_seq
where kcp.char_seq = 9 and kpi.rep_img_yn = 'Y'