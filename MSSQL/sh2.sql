


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



select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)



------백업---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


/*
	Author      : Seunghwan Shin
	Create date : 2021-07-13
	Description : 로그인 정보가 회원정보에 있는지 체크
	    
	History		: 2021-07-13 Seunghwan Shin	#최초 생성
				  2021-07-23 Seunghwan Shin #마스터아이피(로컬아이피)는 몇번의 로그인 상관없이 ip벤 예외처리

*/
CREATE proc [dbo].[kakao_first_user_login]
	@qoouser_id varchar(100) -- 유저 id
,	@qoouser_pw varchar(800) -- 유저 pw
,	@user_ip_address varchar(100)-- 접속한 ip주소
,	@result int output -- 결과값 
						/*	 0 : 벤당한 아이피로 접근
							 1 : 로그인 정보가 존재함
							-1 : 로그인 정보가 존재하지 않음 : 즉 아이디 비밀번호 둘중 하나이상이 틀렸다는 말임.
							-100 : 오류발생
						*/
as
set nocount on
set transaction isolation level read uncommitted
begin
	begin try
		-- 밴 당한 아이피인지 확인해준다.
		if exists (select * from dbo.TBLBANNEDIPLIST where banned_ip_address = @user_ip_address) -- 벤당한 아이피의 경우
		begin
			set @result = 0
		end
		--벤 당하지 아닌 아이피인 경우 -> 로그인 정보 확인
		else
		begin
			if exists (select * from dbo.QOO10_USER_REAL  where qoouser_id = @qoouser_id  and qoouser_pw = @qoouser_pw) -- 로그인 정보가 존재하는 경우
			begin
				set @result = 1
			end
			-- 정보가 존재하지 않는데 비정상적으로 계속 접근하는 경우
			else
			begin
				set @result = -1

				declare @try_count int

				begin tran
					--아이피 로그기록 남기기
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

				-- 시도한 횟수 : 15초안에 4번이상 시도하면, 밴을 시킨다.
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

/* KAKAO_PRODUCT_CATEGORY - 상품정보 소분류 */
CREATE TABLE [dbo].[KAKAO_PRODUCT_CATEGORY] (
	[category_code] [BIGINT] IDENTITY(1,1) NOT NULL,  /* 소분류코드 - category_code */
	[main_category_code] [INT] NOT NULL,  /* 분류코드 - main_category_code */
	[category_nm] [NVARCHAR](50) NOT NULL,  /* 분류이름 - category_nm */
	[reg_dt] [DATETIME] NOT NULL,  /* 등록날짜 - reg_dt */
	[chg_dt] [DATETIME] /* 수정 날짜 - chg_dt */
)
GO

alter table dbo.KAKAO_PRODUCT_CATEGORY add constraint PK__KAKAO_PRODUCT_CATEGORY__CATEGORY_CODE__MAIN_CATEGORY_CODE PRIMARY KEY (category_code,main_category_code)


INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (2,N'미니인형',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (2,N'중형인형',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (2,N'대형인형',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (2,N'피규어/브릭',GETDATE(),NULL)


select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY  with(nolock)
select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)

INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (3,N'패브릭',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (3,N'주방용품',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (3,N'컵/텀블러',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (3,N'차량용품',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (3,N'생활소품',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (3,N'미용/욕실용품',GETDATE(),NULL)


select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY  with(nolock)
select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)

begin tran

INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (4,N'가방',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (4,N'파우치/지갑',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (4,N'신발',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (4,N'패션소품',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (4,N'시즌용품',GETDATE(),NULL)

rollback tran

select @@TRANCOUNT

select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY  with(nolock)
select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)

begin tran

INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (5,N'필기구',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (5,N'필통/케이스',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (5,N'노트/메모',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (5,N'스티커',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (5,N'데스크 소품',GETDATE(),NULL)

commit tran


select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY  with(nolock)
select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)

begin tran

INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (6,N'여성',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (6,N'남성',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (6,N'키즈',GETDATE(),NULL)


select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY  with(nolock)
select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock) where main_category_code = 7

begin tran

INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (7,N'소형 전자',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (7,N'PC/노트북 액새서리',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (7,N'휴대폰 케이스',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (7,N'휴대폰 악세서리',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (7,N'무선이어폰 케이스',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (7,N'무선이어폰 액세서리',GETDATE(),NULL)

select @@TRANCOUNT

select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY  with(nolock)
select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock) where main_category_code = 8

INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (8,N'여행',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (8,N'레져',GETDATE(),NULL)

select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY  with(nolock)
select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock) where main_category_code = 9


INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (9,N'스낵',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (9,N'음료',GETDATE(),NULL)


select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY  with(nolock)
select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock) where main_category_code = 10


select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)


begin tran

INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (10,N'초록방학',GETDATE(),NULL,N'resources/images/theme/210611_theme_friends.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (10,N'러블리 어피치',GETDATE(),NULL,N'resources/images/theme/200929_category_lovelyapeach_M.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (10,N'마린 블루',GETDATE(),NULL,N'resources/images/theme/200604_category_marineblue_M.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (10,N'비치펍',GETDATE(),NULL,N'resources/images/theme/200701_category_beachpub_M.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (10,N'얌얌프렌즈',GETDATE(),NULL,N'resources/images/theme/200504_category_yumyum_M.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (10,N'레몬테라스',GETDATE(),NULL,N'resources/images/theme/200427_category_lemonterrace_M.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (10,N'베이비드리밍',GETDATE(),NULL,N'resources/images/theme/200310_category_babydreaming_M.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (10,N'해피위크',GETDATE(),NULL,N'resources/images/theme/200218_category_happweeks_M.jpg')
INSERT INTO dbo.KAKAO_PRODUCT_CATEGORY VALUES (10,N'강다니엘에디션',GETDATE(),NULL,N'resources/images/theme/200206_category_DANIEL_M.jpg')


commit tran


select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)

alter table dbo.KAKAO_PRODUCT_CATEGORY add theme_img nvarchar(100)

 

/* KAKAO_PRODUCT_TABLE - 상품정보 */
CREATE TABLE [dbo].[KAKAO_PRODUCT_TABLE] (
	[product_id] [BIGINT] IDENTITY(1,1) NOT NULL,  /* 상품고유번호 - product_id */
	[category_code] [BIGINT] NOT NULL,  /* 소분류코드 - category_code */
	[product_nm] [NVARCHAR](60) NOT NULL,  /* 상품이름 - product_nm */
	[product_count] [INT] NOT NULL,  /* 상품 수량 - product_count */
	[product_detail_info] [NVARCHAR](3000),  /* 세부정보 - product_detail_info */
	[product_price] [MONEY] NOT NULL,  /* 제품가격 - product_price */
	[discount_rate] [SMALLINT] NOT NULL,  /* 할인율  - discount_rate */
	[recommend_prodt_yn] [CHAR](1) NOT NULL,  /* 추천상품 여부 - recommend_prodt_yn */
	[del_yn] [CHAR](1) NOT NULL /* 삭제유무 - del_yn */
)
GO

alter table dbo.KAKAO_PRODUCT_TABLE add constraint PK__KAKAO_PRODUCT_TABLE__PRODUCT_ID__CATEGORY_CODE PRIMARY KEY (product_id,category_code)



SELECT * FROM dbo.KAKAO_PRODUCT_TABLE with(nolock)


select * from dbo.KAKAO_PRODUCT_MAIN_CATEGORY  with(nolock)
select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)

insert into dbo.KAKAO_PRODUCT_TABLE values (2,N'춘식이 손목보호 쿠션인형',250,NULL,32000,0,'Y','N')

insert into dbo.KAKAO_PRODUCT_TABLE values (24,N'LED 시계_라이언&춘식이',750,NULL,35000,0,'Y','N')


DROP TABLE dbo.KAKAO_PROMOTION

/* KAKAO_PROMOTION - 기획상품 */
CREATE TABLE [dbo].[KAKAO_PROMOTION] (
	[category_code] [BIGINT] IDENTITY(1,1) NOT NULL,  /* 기획코드 - promotion_code */
	[product_id] [BIGINT] NOT NULL,  /* 상품고유번호 - product_id */
	[category_nm] [NVARCHAR](50) NOT NULL,  /* 기획이름 - promotion_nm */
	[new_promotion_img] [NVARCHAR](100),  /* 기획 신규페이지 배너 이미지 - new_promotion_img */
	[category_rep_img] [NVARCHAR](100),  /* 기획 배너 이미지  - promotion_img */
	[product_top_img_title] [NVARCHAR](25),  /* 배너사진 설명 제목 - product_top_img_title */
	[product_top_img_title_detail] [NVARCHAR](25),  /* 배너사진 설명 세부 - product_top_img_title_detail */
	[reg_dt] [DATETIME] NOT NULL,  /* 등록날짜 - reg_dt */
	[chg_dt] [DATETIME] /* 수정 날짜 - chg_dt */
)
GO

alter table dbo.KAKAO_PROMOTION add constraint PK__KAKAO_PROMOTION__CATEGORY_CODE__PRODUCT_ID PRIMARY KEY (category_code,product_id)

SELECT * FROM dbo.KAKAO_PROMOTION WITH(NOLOCK)

INSERT INTO dbo.KAKAO_PROMOTION VALUES (1,N'춘식이 손목보호 쿠션인형',N'resources/images/product/기획전/banner_20210727183214_mobile_kr.jpg',NULL,N'오랜 시간 컴퓨터 작업엔',N'춘식이 손목보호 인형',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PROMOTION VALUES (2,N'LED 시계_라이언&춘식이',N'resources/images/product/기획전/banner_20210722090518_mobile_kr.jpg',NULL,N'탁상용, 별걸이용 모두 되는',N'라이언와 춘식이 LED 시계',GETDATE(),NULL)


