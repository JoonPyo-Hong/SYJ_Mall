


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

select * from dbo.KAKAO_PRODUCT_CATEGORY


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


select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)

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

SELECT @@TRANCOUNT



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

select * from dbo.KAKAO_PRODUCT_CATEGORY with(nolock)

select @@trancount

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

insert into dbo.KAKAO_PRODUCT_TABLE values (1,N'춘식이는 수박을 좋아해 인형',1050,NULL,24000,0,'Y','N')

insert into dbo.KAKAO_PRODUCT_TABLE values (27,N'라이언&춘식이 살균무선 충전기',880,NULL,39000,0,'Y','N')

insert into dbo.KAKAO_PRODUCT_TABLE values (2,N'라이언과 춘식이의 집콕놀이',210,NULL,39000,0,'Y','N')

insert into dbo.KAKAO_PRODUCT_TABLE values (9,N'죠르디 미니각티슈 케이스',2150,NULL,19000,0,'Y','N')

insert into dbo.KAKAO_PRODUCT_TABLE values (6,N'리틀라이언 미니베이커',150,NULL,39900,0,'Y','N')

insert into dbo.KAKAO_PRODUCT_TABLE values (7,N'혼술 맥주잔 2P세트_라이언&춘식이',1500,NULL,25000,0,'Y','N')

insert into dbo.KAKAO_PRODUCT_TABLE values (24,N'샘바이펜 벽걸이 라이트박스',120,NULL,498000,0,'Y','N')



DROP TABLE dbo.KAKAO_PROMOTION

/* KAKAO_PROMOTION - 기획상품 */
CREATE TABLE [dbo].[KAKAO_PROMOTION] (
	[promotion_code] [BIGINT] IDENTITY(1,1) NOT NULL,  /* 기획코드 - promotion_code */
	[promotion_nm] [NVARCHAR](50) NOT NULL,  /* 기획이름 - promotion_nm */
	[new_promotion_img] [NVARCHAR](100),  /* 기획 신규페이지 배너 이미지 - new_promotion_img */
	[promotion_img] [NVARCHAR](100),  /* 기획 배너 이미지  - promotion_img */
	[product_top_img_title] [NVARCHAR](25),  /* 배너사진 설명 제목 - product_top_img_title */
	[product_top_img_title_detail] [NVARCHAR](25),  /* 배너사진 설명 세부 - product_top_img_title_detail */
	[reg_dt] [DATETIME] NOT NULL,  /* 등록날짜 - reg_dt */
	[chg_dt] [DATETIME] /* 수정 날짜 - chg_dt */
)
GO

alter table dbo.KAKAO_PROMOTION add constraint PK__KAKAO_PROMOTION__PROMOTION_CODE PRIMARY KEY (promotion_code)

SELECT * FROM dbo.KAKAO_PROMOTION WITH(NOLOCK)

INSERT INTO dbo.KAKAO_PROMOTION VALUES (N'춘식이 손목보호 쿠션인형',N'resources/images/product/기획전/banner_20210727183214_mobile_kr.jpg',NULL,N'오랜 시간 컴퓨터 작업엔',N'춘식이 손목보호 인형',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PROMOTION VALUES (N'LED 시계_라이언&춘식이',N'resources/images/product/기획전/banner_20210722090518_mobile_kr.jpg',NULL,N'탁상용, 별걸이용 모두 되는',N'라이언와 춘식이 LED 시계',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PROMOTION VALUES (N'춘식이는 수박을 좋아해 인형',N'resources/images/product/기획전/banner_20210714085750_mobile_kr.jpg',NULL,N'수박과 하나된',N'춘식이는 수박을 좋아해',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PROMOTION VALUES (N'라이언&춘식이 살균무선 충전기',N'resources/images/product/기획전/banner_20210615143750_mobile_kr.jpg',NULL,N'라이언과 클린하게',N'살균 무선 충전기',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PROMOTION VALUES (N'라이언과 춘식이의 집콕놀이',N'resources/images/product/기획전/banner_20210702183342_mobile_kr.jpg',NULL,N'집콕엔 청소도 즐겁게',N'라이언과 춘식이의 집콕놀이',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PROMOTION VALUES (N'죠르디 미니각티슈 케이스',N'resources/images/product/기획전/banner_20210624183636_mobile_kr.jpg',NULL,N'나만의 죠르디 정원',N'죠르디 티슈 케이스',GETDATE(),NULL)

INSERT INTO dbo.KAKAO_PROMOTION VALUES (N'리틀라이언 미니베이커',N'resources/images/product/기획전/banner_20210421153139_mobile_kr.jpg',NULL,N'라이언과 즐거운 베이킹',N'리틀라이언 미니베이커',GETDATE(),NULL)


DROP TABLE dbo.KAKAO_PROM_PROD


/* KAKAO_PROM_PROD - 상품 기획 종속관계 */
CREATE TABLE [dbo].[KAKAO_PROM_PROD] (
	[promotion_code] [BIGINT] NOT NULL,  /* 기획코드 - promotion_code */
	[product_id] [BIGINT] NOT NULL,  /* 상품고유번호 - product_id */
	[reg_dt] [DATETIME] NOT NULL,  /* 등록날짜 - reg_dt */
	[chg_dt] [DATETIME] /* 수정 날짜 - chg_dt */
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

/* KAKAO_THEME_PROMOTION - 테마기획전 상품 */
CREATE TABLE [dbo].[KAKAO_THEME_PROMOTION] (
	[theme_pro_code] [BIGINT] IDENTITY(1,1) NOT NULL,  /* 테마기획코드 - theme_pro_code */
	[theme_nm] [NVARCHAR](50) NOT NULL,  /* 테마기획전 이름 - theme_nm */
	[theme_img] [NVARCHAR](100),  /* 테마기획전 이미지 - theme_img */
	[reg_dt] [DATETIME] NOT NULL,  /* 등록날짜 - reg_dt */
	[chg_dt] [DATETIME] /* 수정 날짜 - chg_dt */
)
GO

alter table dbo.KAKAO_THEME_PROMOTION add constraint PK__KAKAO_THEME_PROMOTION__THEME_PRO_CODE PRIMARY KEY (theme_pro_code)


INSERT INTO dbo.KAKAO_THEME_PROMOTION VALUES (N'초록방학',N'resources/images/theme/210611_theme_friends.jpg',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_THEME_PROMOTION VALUES (N'러블리 어피치',N'resources/images/theme/200929_category_lovelyapeach_M.jpg',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_THEME_PROMOTION VALUES (N'마린 블루',N'resources/images/theme/200604_category_marineblue_M.jpg',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_THEME_PROMOTION VALUES (N'비치펍',N'resources/images/theme/200701_category_beachpub_M.jpg',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_THEME_PROMOTION VALUES (N'얌얌프렌즈',N'resources/images/theme/200504_category_yumyum_M.jpg',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_THEME_PROMOTION VALUES (N'레몬테라스',N'resources/images/theme/200427_category_lemonterrace_M.jpg',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_THEME_PROMOTION VALUES (N'베이비드리밍',N'resources/images/theme/200310_category_babydreaming_M.jpg',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_THEME_PROMOTION VALUES (N'해피위크',N'resources/images/theme/200218_category_happweeks_M.jpg',GETDATE(),NULL)
INSERT INTO dbo.KAKAO_THEME_PROMOTION VALUES (N'강다니엘에디션',N'resources/images/theme/200206_category_DANIEL_M.jpg',GETDATE(),NULL)


select * from dbo.KAKAO_THEME_PROMOTION with(nolock)







/* KAKAO_PROD_THEME - 상품 테마기획전 종속관계 */
CREATE TABLE [dbo].[KAKAO_PROD_THEME] (
	[product_id] [BIGINT] NOT NULL,  /* 상품고유번호 - product_id */
	[theme_pro_code] [BIGINT] NOT NULL,  /* 테마기획코드 - theme_pro_code */
	[reg_dt] [DATETIME] NOT NULL,  /* 등록날짜 - reg_dt */
	[chg_dt] [DATETIME] /* 수정 날짜 - chg_dt */
)
GO


alter table dbo.KAKAO_PROD_THEME add constraint PK__KAKAO_PROD_THEME__PRODUCT_ID__THEME_PRO_CODE PRIMARY KEY (product_id,theme_pro_code)



drop table dbo.KAKAO_PROMOTION_IMG

/* KAKAO_PROMOTION_IMG - 기획상품 기타 이미지 */
CREATE TABLE [dbo].[KAKAO_PROMOTION_IMG] (
	[etc_img_code] [BIGINT] NOT NULL,  /* 기타 이미지 코드 - etc_img_code */
	[promotion_code] [BIGINT] NOT NULL,  /* 기획코드 - promotion_code */
	[etc_img] [NVARCHAR](100) NOT NULL,  /* 기타 이미지  - etc_img */
	[reg_dt] [DATETIME] NOT NULL,  /* 등록날짜 - reg_dt */
	[chg_dt] [DATETIME] /* 수정 날짜 - chg_dt */
)
GO

alter table dbo.KAKAO_PROMOTION_IMG add constraint PK__KAKAO_PROMOTION_IMG__ETC_IMG_CODE__PROMOTION_CODE PRIMARY KEY (etc_img_code,promotion_code)


/* KAKAO_PRODUCT_IMG - 상품관련 이미지 */
CREATE TABLE [dbo].[KAKAO_PRODUCT_IMG] (
	[img_seq] [BIGINT] identity(1,1) NOT NULL,  /* 이미지 고유번호 - img_seq */
	[product_id] [BIGINT] NOT NULL,  /* 상품고유번호 - product_id */
	[product_img] [NVARCHAR](100) NOT NULL,  /* 상품 이미지 - product_img */
	[rep_img_yn] [CHAR](1) NOT NULL,  /* 대표이미지 여부 - rep_img_yn */
	[head_img_yn] [CHAR](1) NOT NULL /* 헤드이미지 여부 - head_img_yn */
)
GO


SELECT * FROM DBO.KAKAO_PRODUCT_IMG WITH(NOLOCK)


alter table dbo.KAKAO_PRODUCT_IMG add constraint PK__KAKAO_PRODUCT_IMG__IMG_SEQ__PRODUCT_ID PRIMARY KEY (img_seq,product_id)


/* KAKAO_CHAR_PRODUCT - 상품 캐릭터 종속관계 */
CREATE TABLE [dbo].[KAKAO_CHAR_PRODUCT] (
	[char_seq] [BIGINT] NOT NULL,  /* 캐릭터 번호 - char_seq */
	[product_id] [BIGINT] NOT NULL,  /* 상품고유번호 - product_id */
	[reg_dt] [DATETIME] NOT NULL,  /* 등록날짜 - reg_dt */
	[chg_dt] [DATETIME] /* 수정 날짜 - chg_dt */
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

insert dbo.KAKAO_PRODUCT_IMG values (9,N'resources/images/product/샘바이펜 벽걸이 라이트박스/20210727155234467_8809814921004_BW_00.jpg','Y','Y')


select * from dbo.KAKAO_PRODUCT_IMG with(nolock)


UPDATE dbo.KAKAO_PRODUCT_IMG SET product_img = N'resources/images/product/혼술 맥주잔 2P세트_라이언&춘식이/20210531112452113_8809721508909_BW_01.jpg' WHERE img_seq = 1
UPDATE dbo.KAKAO_PRODUCT_IMG SET product_img = N'resources/images/product/혼술 맥주잔 2P세트_라이언&춘식이/20210531112452113_8809721508909_BW_01.jpg' WHERE img_seq = 2


select * from dbo.KAKAO_PRODUCT_IMG with(nolock)


/* KAKAO_USER_SHOPPING_CART - 고객 장바구니 */
CREATE TABLE [dbo].[KAKAO_USER_SHOPPING_CART] (
	[qoouser_seq] [BIGINT] NOT NULL,  /* 회원 고유 번호 - qoouser_seq */
	[product_id] [BIGINT] NOT NULL,  /* 상품고유번호 - product_id */
	[product_count] [INT] NOT NULL,  /* 상품 수량 - product_count  */
	[cart_reg_dt] [DATETIME],  /* 추가 날짜 - cart_reg_dt */
	[cart_chg_dt] [DATETIME],  /* 수정 날짜 - cart_chg_dt */
	[cart_del_yn] [CHAR](1) NOT NULL /* 삭제 유무 - cart_del_yn */
)
GO

alter table dbo.KAKAO_USER_SHOPPING_CART add constraint PK__KAKAO_USER_SHOPPING_CART__QOOUSER_SEQ__PRODUCT_ID PRIMARY KEY (qoouser_seq,product_id)


select * from dbo.QOO10_USER_REAL with(nolock) where qoouser_id = 'admin'

insert into dbo.KAKAO_USER_SHOPPING_CART values (2000001,9,1,getdate(),null,'N')


select * from dbo.KAKAO_USER_SHOPPING_CART with(nolock)



/* 
	Author      : Seunghwan Shin 
	Create date : 2021-08-01  
	Description : 신규상품 - 추천 신규 테마 보여주기
	     
	History	: 2021-08-01 Seunghwan Shin	#최초 생성 
			 
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




Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* 
	Author      : Seunghwan Shin 
	Create date : 2021-07-07   
	Description : 고객의 임시비밀번호를 고객이 지정한 비밀번호로 변경
	     
	History	: 2021-07-07 Seunghwan Shin	#최초 생성 
*/
CREATE proc dbo.kakao_user_pw_redefined_return
	@user_seq bigint -- 유저의 고유번호
,	@user_pw varchar(800) --유저가 지정한 비밀번호	
,	@user_id varchar(100) --유저의 아이디
,	@user_ip_address varchar(200) --유저의 아이피 주소
,	@result int output
as 
set nocount on 
set transaction isolation level read uncommitted 
begin

	begin try
		
		begin tran
			update dbo.QOO10_USER_REAL 
			set qoouser_pw = @user_pw
			,	qoouser_instance_pw_grant = 'N'
			where qoouser_seq = @user_seq

									
			-- 로그인 성공시간 기록 남기기
			insert into dbo.QOO10USERLOG
			(
				log_user_seq
			,	log_user_id
			,	log_dt
			,	ip_address
			)
			values
			(
				@user_seq
			,	@user_id
			,	default
			,	@user_ip_address
			)

			--마지막 로그인에 대한 시간, 마지막 접속 아이피 주소 남기기
			update dbo.QOO10_USER_REAL set 
				qoouser_lastlogin_datetime = getdate()
			,	qoouser_lastlogin_ipaddress = @user_ip_address
			where qoouser_seq = @user_seq 


			set @result = 1;
		commit tran

	end try
	begin catch
		set @result = -1;
		rollback tran

	end catch
end


완료 시간: 2021-08-02T23:36:28.6398285+09:00



/* 
	Author      : Seunghwan Shin 
	Create date : 2021-08-01  
	Description : 신규상품 - 추천 신규 테마 보여주기
	     
	History	: 2021-08-01 Seunghwan Shin	#최초 생성 
			 
*/
alter proc dbo.kakao_new_product_recommend_theme_images
	@char_seq bigint
,	@qoouser_seq bigint
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	if (@qoouser_seq is null)
	begin
		--로그인 안한경우
		select 
			kpt.product_nm as productName
		,	kpt.product_price as productPrice
		,	kpt.product_id as productId 
		,	kpi.product_img as productImg
		from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
		inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpi.product_id = kpt.product_id
		inner join dbo.KAKAO_CHAR_PRODUCT kcp with(nolock) on kcp.product_id = kpt.product_id 
		left join dbo.KAKAO_USER_SHOPPING_CART ksc with(nolock) on ksc.product_id = kpt.product_id
		left join dbo.QOO10_USER_REAL q with(nolock) on q.qoouser_seq = ksc.qoouser_seq
		where kcp.char_seq = @char_seq and kpi.rep_img_yn = 'Y'	
	end
	
end





select
			*
			from string_split('likkj2l3i4j/12kajsdhf/wergsdlfgkjshdflgk/sdfgsdfg#12341234/12352345623/23452345/23452345#sklajdfhalskdfj/asdkfjhalsdkjfh/aksjdfhljajksdf','#') as ss



select * from dbo.KAKAO_PROMOTION with(nolock)


resources/images/product/콘/런던에디션 미니키체인_근위병콘/20201019143628927_8809721504192_BW_02.jpg





/* 
	Author      : Seunghwan Shin 
	Create date : 2021-08-13   
	Description : 인기페이지 상품 바둑판처럼 배열하는 로직
	     
	History	: 2021-08-13 Seunghwan Shin	#최초 생성 : 아직 구매 로직이 없어서 이미지 뜨는지만 테스트
			  2021-08-13 Seunghwan Shin	#가져올 상품 갯수 변경
*/
alter proc dbo.kakao_popular_product_list
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	

	select
		top(2)
		kpi.product_id as productId
	,	replace(kpi.product_img,N' ',N'%20') as productImg
	from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
	inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock) on kpt.product_id = kpi.product_id
	where rep_img_yn = 'Y' and head_img_yn = 'Y'
	order by kpi.product_id


end




select * from dbo.KAKAO_PRODUCT_TABLE with(nolock)

select * from dbo.KAKAO_PRODUCT_IMG with(nolock)

begin tran

update dbo.KAKAO_PRODUCT_IMG set product_img = N'resources/images/product/콘/마린 에어팟키링_무지&콘/20200529122123619_8809721501139_BW_02.jpg' where img_seq = 1



commit tran


select * from dbo.re_feed_heart with(nolock)

ALTER TABLE dbo.re_feed_heart ALTER column member_seq bigint not null


alter table dbo.re_feed_heart add constraint PK__RE_FEED_HEART__FEED_SEQ__MEMBER_SEQ PRIMARY KEY (feed_seq,member_seq)



CREATE TABLE [dbo].[re_feed](
   [seq] [bigint] IDENTITY(0,1) NOT NULL, -- 순번
   [member_seq] [bigint] NULL,   -- 회원 번호
   [feed_seq] [bigint] NULL, -- 댓글 번호
   [re_feed] [nvarchar](500) NULL, -- 대댓글 내용
   [reg_id] [nvarchar](50) NULL,   -- 작성자
   [reg_dt] [datetime] NULL, -- 작성일
PRIMARY KEY CLUSTERED 
(
   [seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


select * from dbo.FEED with(nolock)

alter table dbo.FEED add constraint PK__FEED__SEQ__MEMBER_SEQ PRIMARY KEY (seq,member_seq)

alter table dbo.FEED drop constraint PK__feed__DDDFBCBEAED61C73


RE_FEED

alter table dbo.FEED alter column member_seq bigint not null

RE_FEED_HEART 


select * from dbo.main_img with(nolock)

alter table dbo.main_img add constraint PK__MAIN_IMG__LIST_SEQ__IMG_NM PRIMARY KEY (list_seq,img_nm)

alter table dbo.main_img alter column list_seq bigint not null

alter table dbo.main_img alter column img_nm nvarchar(200) not null


SELECT * FROM dbo.main_heart WITH(NOLOCK)

alter table dbo.main_heart add constraint PK__MAIN_HEART__LIST_SEQ__MEMBER_SEQ PRIMARY KEY (list_seq,member_seq)

alter table dbo.main_heart alter column list_seq bigint not null
alter table dbo.main_heart alter column member_seq bigint not null


commit tran

BEGIN TRAN

DELETE dbo.main_heart WHERE list_seq = 3 and member_seq is null


SELECT * FROM dbo.feed_heart with(nolock)

alter table dbo.feed_heart ALTER COLUMN feed_seq BIGINT NOT NULL


alter table dbo.feed_heart ALTER COLUMN member_seq BIGINT NOT NULL


alter table dbo.feed_heart add constraint PK__FEED_HEART__FEED_SEQ__MEMBER_SEQ PRIMARY KEY (feed_seq,member_seq)


SELECT * FROM dbo.RE_FEED WITH(NOLOCK)

ALTER TABLE dbo.RE_FEED ADD CONSTRAINT PK__RE_FEED__SEQ__MEMBER_SEQ PRIMARY KEY (seq,member_seq)



ALTER TABLE dbo.RE_FEED DROP CONSTRAINT PK__re_feed__DDDFBCBE92ACEB9C


ALTER TABLE dbo.RE_FEED ALTER COLUMN member_seq BIGINT NOT NULL


re_feed






select * from dbo.KAKAO_PRODUCT_IMG with(nolock)

begin tran


select * from dbo.KAKAO_PRODUCT_IMG with(nolock) where product_img like N'%(%'



update dbo.KAKAO_PRODUCT_IMG set product_img = replace(product_img,N')',N'')

rollback tran




/* 
	Author      : Seunghwan Shin 
	Create date : 2021-08-21  
	Description : 상품 장바구니로 보내는 로직
	     
	History	: 2021-08-21 Seunghwan Shin	#최초 생성
			  
*/
alter proc dbo.kakao_popular_product_input_basket
	@qoouser_seq	bigint		-- 회원 고유번호
,	@product_id		bigint		-- 상품번호
,	@result			int output	-- 결과값
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	begin try
		-- 회원이 선택한 품목이 장바구니 내역에 없는경우
		if not exists (select * from dbo.KAKAO_USER_SHOPPING_CART where qoouser_seq = @qoouser_seq and product_id = @product_id and cart_del_yn = 'N' )
		begin
			begin tran
			
				insert into dbo.KAKAO_USER_SHOPPING_CART
				(
					qoouser_seq
				,	product_id
				,	product_count
				,	cart_reg_dt
				,	cart_chg_dt
				,	cart_del_yn
				)
				values
				(
					@qoouser_seq
				,	@product_id
				,	1
				,	getdate()
				,	null
				,	'N'
				)
			commit tran
			
			set @result = 1

		end
		-- 회원이 선택한 품목이 장바구니 내역에 있는경우
		else
		begin
			set @result = -1
		end

	end try
	begin catch
		
		set @result = -2--에러발생

		rollback tran
	end catch

	
end





select * from dbo.KAKAO_USER_SHOPPING_CART with(nolock)

truncate table dbo.KAKAO_USER_SHOPPING_CART



--background-image: url(/SYJ_Mall/resources/images/hot/cart.png);



/* 
	Author      : Seunghwan Shin 
	Create date : 2021-08-13   
	Description : 인기페이지 상품 바둑판처럼 배열하는 로직
	     
	History	: 2021-08-13 Seunghwan Shin	#최초 생성 : 아직 구매 로직이 없어서 이미지 뜨는지만 테스트
			  2021-08-13 Seunghwan Shin	#가져올 상품 갯수 변경
			  2021-08-14 Seunghwan Shin	#구매정보에 기반한 데이터 추가
			  2021-08-19 Seunghwan Shin	#rownumber 추가
			  2021-08-22 Seunghwan Shin	#장바구니 이미지 불러오기 추가
*/
alter proc dbo.kakao_popular_product_list
	@paging			int				-- 페이지 넘버
,	@qoouser_seq	int				-- 회원고유번호
,	@basket_info	varchar(3000)	-- 쿠키정보
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	declare @start_dt	datetime 			
	,		@end_dt		datetime = getdate()

	set @start_dt = dateadd(yy,-2,@end_dt)


	--로그인이 안되어 있는경우 : 쿠키 사용
	if (@qoouser_seq = 0)
	begin
		
		select
			pdc.rn
		,	pdc.productId
		,	pdc.productImg
		,	pdc.basket
		from
		(
			select
				row_number() over (order by pd.cnt desc) as rn
			,	pd.productId as productId
			,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as productImg
			,	pd.cnt
			,	case 
					when ss.value is null then 'cart.png'
				else 'cart_on.png'
				end as basket
			from 
			(	select
					kpt.product_id as productId
				,	count(*) as cnt
				from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
				inner join dbo.KAKAO_PRODUCT_PAYMENT kpp with(nolock) on kpt.product_id = kpp.product_id
				where kpp.product_buy_dt between @start_dt and @end_dt
				and kpt.del_yn = 'N'
				group by kpt.product_id
			) as pd
			inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock,forceseek) on kpi.product_id = pd.productId
			left join string_split(@basket_info,',') ss on convert(bigint,ss.value) = pd.productId
			where kpi.rep_img_yn = 'Y' and kpi.head_img_yn = 'Y'
		) as pdc
		where rn between (@paging * 18) - 17 and (@paging * 18)

	end
	--로그인이 되어있는 경우
	else
	begin
		select
			pdc.rn
		,	pdc.productId
		,	pdc.productImg
		,	pdc.basket
		from
		(
			select
				row_number() over (order by pd.cnt desc) as rn
			,	pd.productId as productId
			,	replace(replace(replace(kpi.product_img,N' ',N'%20'),N'(',N'%20'),N')',N'') as productImg
			,	pd.cnt
			,	case 
					when kusc.product_id is null then 'cart.png'
				else 'cart_on.png'
				end as basket
			from 
			(	select
					kpt.product_id as productId
				,	count(*) as cnt
				from dbo.KAKAO_PRODUCT_TABLE kpt with(nolock)
				inner join dbo.KAKAO_PRODUCT_PAYMENT kpp with(nolock) on kpt.product_id = kpp.product_id
				where kpp.product_buy_dt between @start_dt and @end_dt
				and kpt.del_yn = 'N'
				group by kpt.product_id
			) as pd
			inner join dbo.KAKAO_PRODUCT_IMG kpi with(nolock,forceseek) on kpi.product_id = pd.productId
			left join dbo.KAKAO_USER_SHOPPING_CART kusc with(nolock) on kusc.qoouser_seq = @qoouser_seq and kusc.product_id = kpi.product_id
			where kpi.rep_img_yn = 'Y' and kpi.head_img_yn = 'Y'
		) as pdc
		where rn between (@paging * 18) - 17 and (@paging * 18)
	end

end


/* 
	Author      : Seunghwan Shin 
	Create date : 2021-08-21  
	Description : 상품 장바구니로 보내는 로직
	     
	History	: 2021-08-21 Seunghwan Shin	#최초 생성
			  2021-08-24 Seunghwan Shin	#장바구니에서 삭제했던 상품 다시 집어넣는 로직 추가
			  
*/
alter proc dbo.kakao_popular_product_input_basket
	@qoouser_seq	bigint		-- 회원 고유번호
,	@product_id		bigint		-- 상품번호
,	@result			int output	-- 결과값
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	begin try
		-- 회원이 선택한 품목이 장바구니 내역에 없는경우
		if not exists (select * from dbo.KAKAO_USER_SHOPPING_CART where qoouser_seq = @qoouser_seq and product_id = @product_id)
		begin
			begin tran
			
				insert into dbo.KAKAO_USER_SHOPPING_CART
				(
					qoouser_seq
				,	product_id
				,	product_count
				,	cart_reg_dt
				,	cart_chg_dt
				,	cart_del_yn
				)
				values
				(
					@qoouser_seq
				,	@product_id
				,	1
				,	getdate()
				,	null
				,	'N'
				)
			commit tran
			
			set @result = 1

		end
		--회원이 선택한 품목이 지난번에 장바구니에 집어넣었다가 장바구니에서 삭제한 경우
		else if exists (select * from dbo.KAKAO_USER_SHOPPING_CART where qoouser_seq = @qoouser_seq and product_id = @product_id and cart_del_yn = 'Y')
		begin
			
			begin tran

				update dbo.KAKAO_USER_SHOPPING_CART
				set cart_del_yn = 'N'
				,	cart_chg_dt = getdate()
				where qoouser_seq = @qoouser_seq and product_id = @product_id

			commit tran

			set @result = 1

		end
		-- 회원이 선택한 품목이 장바구니 내역에 있는경우
		else
		begin
			set @result = -1
		end

	end try
	begin catch
		
		set @result = -2--에러발생

		rollback tran
	end catch

	
end


select * from dbo.KAKAO_USER_SHOPPING_CART with(nolock)







select * from dbo.KAKAO_USER_SHOPPING_CART with(nolock)



Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 
	Author      : Seunghwan Shin 
	Create date : 2021-08-24
	Description : 상품 장바구니에서 제외하는 로직
	     
	History	: 2021-08-24 Seunghwan Shin	#최초 생성
			  
*/
CREATE proc dbo.kakao_popular_product_output_basket
	@qoouser_seq	bigint		-- 회원 고유번호
,	@product_id		bigint		-- 상품번호
,	@result			int output	-- 결과값
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	begin try
		-- 회원이 선택한 품목이 장바구니 내역에 있경우
		if exists (select * from dbo.KAKAO_USER_SHOPPING_CART where qoouser_seq = @qoouser_seq and product_id = @product_id and cart_del_yn = 'N' )
		begin
			begin tran
			
				update dbo.KAKAO_USER_SHOPPING_CART
				set cart_del_yn = 'Y'
				,	cart_chg_dt = getdate()
				where qoouser_seq = @qoouser_seq and product_id = @product_id

			commit tran
			
			set @result = 1

		end
		-- 회원이 선택한 품목이 장바구니 내역에 없는경우
		else
		begin
			set @result = -1
		end

	end try
	begin catch
		
		set @result = -2--에러발생

		rollback tran
	end catch

	
end




/* 
	Author      : Seunghwan Shin 
	Create date : 2021-08-28
	Description : 쿠키에 들어있는 
	     
	History	: 2021-08-28 Seunghwan Shin	#최초 생성
	Real DB : exec dbo.kakao_cookie_product_user_nohave 2000001 
			  
*/
create proc dbo.kakao_cookie_product_to_db
	@qoouser_seq	bigint			-- 회원 고유번호
,	@basket_list	varchar(1000)	-- 쿠키에 존재하는 물품 : 회원이 이미 가지고 있는 물품은 제외
,	@result			int -- 결과값 1: 성공 , -1 : 실패
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	begin try
	
		begin tran

			insert into dbo.KAKAO_USER_SHOPPING_CART
			(
				qoouser_seq
			,	product_id
			,	product_count
			,	cart_reg_dt
			,	cart_chg_dt
			,	cart_del_yn
			)
			select
				@qoouser_seq
			,	convert(bigint,ss.value)
			,	1
			,	getdate()
			,	null
			,	'N'
			from string_split(@basket_list,'#') ss


			set @result = 1	
		commit tran
	
	end try
	begin catch
		rollback tran
		set @result = -1
	end catch
		
end




/* 
	Author      : Seunghwan Shin 
	Create date : 2021-08-28
	Description : 회원의 장바구니에 존재하는 물품리스트를 가져와준다.
	     
	History	: 2021-08-28 Seunghwan Shin	#최초 생성
			  2021-08-29 Seunghwan Shin	#조회쿼리에 cart_del_yn 추가	
	Real DB : exec dbo.kakao_cookie_product_user_nohave 2000001 
			  
*/
alter proc dbo.kakao_cookie_product_user_nohave
	@qoouser_seq	bigint		-- 회원 고유번호
as
set nocount on 
set transaction isolation level read uncommitted 
begin
	
	select 
		product_id as productId 
	,	cart_del_yn as delYn
	from dbo.KAKAO_USER_SHOPPING_CART with(nolock)
	where qoouser_seq = @qoouser_seq
		
end




/* 
	Author      : Seunghwan Shin 
	Create date : 2021-05-19   
	Description : 테스트  
	     
	History	: 2021-05-19 Seunghwan Shin	#최초 생성 
			  2021-05-19 Seunghwan Shin #top(),order by 절 추가
			  2021-09-01 Seunghwan Shin #top() -> 직접 카운트해서 추가
*/ 
alter proc dbo.advertise_show
as 
set nocount on 
set transaction isolation level read uncommitted 
begin 
    
	declare @top_num int = 1
	select 
		@top_num = count(*)
	from dbo.ADVERTISE_INFO with(nolock)

	select top(@top_num)
		ad_seq as adSeq
	,	ad_name as adName
	,	ad_pic_url as adpPcUrl
	,	ad_url as adUrl
	,	ad_price_monthly as adPriceMonthly
	from dbo.ADVERTISE_INFO with(nolock)
	order by adPriceMonthly
	

end




select * from dbo.ADVERTISE_INFO with(nolock)

begin tran

insert into dbo.ADVERTISE_INFO values (N'JYP',N'jyp.jpg',N'https://www.jype.com/',1500000000)

commit tran