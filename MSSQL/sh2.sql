


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