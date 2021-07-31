


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


DROP TABLE dbo.KAKAO_PROMOTION

/* KAKAO_PROMOTION - ��ȹ��ǰ */
CREATE TABLE [dbo].[KAKAO_PROMOTION] (
	[category_code] [BIGINT] IDENTITY(1,1) NOT NULL,  /* ��ȹ�ڵ� - promotion_code */
	[product_id] [BIGINT] NOT NULL,  /* ��ǰ������ȣ - product_id */
	[category_nm] [NVARCHAR](50) NOT NULL,  /* ��ȹ�̸� - promotion_nm */
	[new_promotion_img] [NVARCHAR](100),  /* ��ȹ �ű������� ��� �̹��� - new_promotion_img */
	[category_rep_img] [NVARCHAR](100),  /* ��ȹ ��� �̹���  - promotion_img */
	[product_top_img_title] [NVARCHAR](25),  /* ��ʻ��� ���� ���� - product_top_img_title */
	[product_top_img_title_detail] [NVARCHAR](25),  /* ��ʻ��� ���� ���� - product_top_img_title_detail */
	[reg_dt] [DATETIME] NOT NULL,  /* ��ϳ�¥ - reg_dt */
	[chg_dt] [DATETIME] /* ���� ��¥ - chg_dt */
)
GO

alter table dbo.KAKAO_PROMOTION add constraint PK__KAKAO_PROMOTION__CATEGORY_CODE__PRODUCT_ID PRIMARY KEY (category_code,product_id)

SELECT * FROM dbo.KAKAO_PROMOTION WITH(NOLOCK)

INSERT INTO dbo.KAKAO_PROMOTION VALUES (1,N'����� �ո�ȣ �������',N'resources/images/product/��ȹ��/banner_20210727183214_mobile_kr.jpg',NULL,N'���� �ð� ��ǻ�� �۾���',N'����� �ո�ȣ ����',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PROMOTION VALUES (2,N'LED �ð�_���̾�&�����',N'resources/images/product/��ȹ��/banner_20210722090518_mobile_kr.jpg',NULL,N'Ź���, �����̿� ��� �Ǵ�',N'���̾�� ����� LED �ð�',GETDATE(),NULL)


