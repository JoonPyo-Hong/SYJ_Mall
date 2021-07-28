


select * from dbo.KAKAO_CHARACTER with(nolock)


select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY with(nolock)

/* KAKAO_PRODUCT_MAIN_CATEGORY - 상품정보 대분류 */
CREATE TABLE [dbo].[KAKAO_PRODUCT_MAIN_CATEGORY] (
	[main_category_code] [INT] NOT NULL,  /* 분류코드 - main_category_code */
	[main_category_nm] [NVARCHAR](50) NOT NULL,  /* 분류이름 - main_category_nm */
	[category_rep_img] [NVARCHAR](100),  /* 대분류 대표 이미지 - category_rep_img */
	[reg_dt] [DATETIME] NOT NULL,  /* 등록날짜 - reg_dt */
	[chg_dt] [DATETIME] /* 수정 날짜 - chg_dt */
)
GO

alter table dbo.KAKAO_PRODUCT_MAIN_CATEGORY add constraint PK__KAKAO_PRODUCT_MAIN_CATEGORY__MAIN_CATEGORY_CODE PRIMARY KEY (main_category_code)


INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (1,N'전체',N'resources/images/maincategory/img_category_header_all.png',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (2,N'토이',N'resources/images/maincategory/category_toy_M_201113.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (3,N'리빙',N'resources/images/maincategory/category_living_M_201113.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (4,N'잡화',N'resources/images/maincategory/category_accessory_M_201113.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (5,N'문구',N'resources/images/maincategory/category_stationery_M_201113.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (6,N'의류',N'resources/images/maincategory/category_apparel_M_201113.jpg',GETDATE(),NULL)


INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (7,N'디지털',N'resources/images/maincategory/category_electronic_M_201113.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (8,N'여행/레져',N'resources/images/maincategory/category_leisure_M_201113.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (9,N'식품',N'resources/images/maincategory/category_food_M_201113.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PRODUCT_MAIN_CATEGORY VALUES (10,N'테마 기획전',N'resources/images/maincategory/category_specialtheme_M_201113.jpg',GETDATE(),NULL)


select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY with(nolock)




/* KAKAO_CHARACTER - 카카오캐릭터 */
CREATE TABLE [dbo].[KAKAO_CHARACTER] (
	[char_seq] [BIGINT] NOT NULL,  /* 캐릭터 번호 - char_seq */
	[char_name] [NVARCHAR](20) NOT NULL,  /*  캐릭터 이름 - char_name */
	[char_img] [NVARCHAR](100) NOT NULL,  /* 캐릭터 대표 이미지 - char_img */
	[char_head_img] [NVARCHAR](100) NOT NULL,  /* 캐릭터 헤드 이미지 - char_head_img */
	[reg_dt] [DATETIME] NOT NULL,  /* 등록날짜 - reg_dt */
	[chg_dt] [DATETIME] /* 수정 날짜 - chg_dt */
)
GO


alter table dbo.KAKAO_CHARACTER add constraint PK__KAKAO_CHARACTER__CHAR_SEQ PRIMARY KEY (char_seq)


INSERT INTO dbo.KAKAO_CHARACTER VALUES (1,N'라이언',N'resources/images/KAKAO_CHARACTER/char_img/li-Ryan.png',N'resources/images/KAKAO_CHARACTER/char_head_img/Category_Ryan_210303.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_CHARACTER VALUES (2,N'어피치',N'resources/images/KAKAO_CHARACTER/char_img/li-Apeach.png',N'resources/images/KAKAO_CHARACTER/char_head_img/Category_Apeach_210303.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_CHARACTER VALUES (3,N'무지',N'resources/images/KAKAO_CHARACTER/char_img/li-Muzi.png',N'resources/images/KAKAO_CHARACTER/char_head_img/Category_Muzi_210303.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_CHARACTER VALUES (4,N'프로도',N'resources/images/KAKAO_CHARACTER/char_img/li-Frodo.png',N'resources/images/KAKAO_CHARACTER/char_head_img/Category_Frodo_210303.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_CHARACTER VALUES (5,N'네오',N'resources/images/KAKAO_CHARACTER/char_img/li-Ryan.png',N'resources/images/KAKAO_CHARACTER/char_head_img/Category_Ryan_210303.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_CHARACTER VALUES (1,N'라이언',N'resources/images/KAKAO_CHARACTER/char_img/li-Ryan.png',N'resources/images/KAKAO_CHARACTER/char_head_img/Category_Ryan_210303.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_CHARACTER VALUES (1,N'라이언',N'resources/images/KAKAO_CHARACTER/char_img/li-Ryan.png',N'resources/images/KAKAO_CHARACTER/char_head_img/Category_Ryan_210303.jpg',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_CHARACTER VALUES (1,N'라이언',N'resources/images/KAKAO_CHARACTER/char_img/li-Ryan.png',N'resources/images/KAKAO_CHARACTER/char_head_img/Category_Ryan_210303.jpg',GETDATE(),NULL)








select * from dbo.KAKAO_CHARACTER with(nolock)



/* KAKAO_PRODUCT_CATEGORY - 상품정보 소분류 */
CREATE TABLE [dbo].[KAKAO_PRODUCT_CATEGORY] (
	[category_code] [BIGINT] NOT NULL,  /* 소분류코드 - category_code */
	[main_category_code] [INT] NOT NULL,  /* 분류코드 - main_category_code */
	[category_nm] [NVARCHAR](50) NOT NULL,  /* 분류이름 - category_nm */
	[category_rep_img] [NVARCHAR](100),  /* 소분류 신규 배너 이미지  - category_new_img */
	[category_detail_img] [NVARCHAR](100),  /* 소분류 신규 세부 대표 이미지 - category_detail_img */
	[reg_dt] [DATETIME] NOT NULL,  /* 등록날짜 - reg_dt */
	[chg_dt] [DATETIME] /* 수정 날짜 - chg_dt */
)
GO

alter table dbo.KAKAO_PRODUCT_CATEGORY add constraint PK__KAKAO_PRODUCT_CATEGORY__CATEGORY_CODE__MAIN_CATEGORY_CODE primary key (category_code,main_category_code)