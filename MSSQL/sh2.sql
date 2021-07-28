


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