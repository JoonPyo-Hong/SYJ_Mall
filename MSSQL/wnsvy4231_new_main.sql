--select * from dbo.main_list
--select * from dbo.main_img
--select * from dbo.main_list
--select * from dbo.main_heart
select top(10)* from dbo.KAKAO_PRODUCT_TABLE
--join 해서 사용할 것
create table kakao_new_main(
	seq bigint primary key identity (1,1), -- 게시글 번호
	character_name nvarchar(50), -- 상단 캐릭터 이름
	reg_dt datetime default getdate(), -- 등록일
	title nvarchar(200), -- 제목
	content nvarchar(300), -- 내용
	tag nvarchar(200) null -- 태그 | 구분자로 사용
);
create table kaka_new_main_image(
	seq bigint, -- 번호
	img_nm nvarchar(50) -- 이미지 명
);
create table kaka_new_main_heart(
	main_seq bigint, -- 게시글 번호
	member_seq bigint -- 멤버 번호
);

USE [ADMIN]
GO

INSERT INTO [dbo].[kakao_new_main]
           ([character_name]
           ,[title]
           ,[content]
           ,[tag])
     VALUES
           (N'콥',N'재택 스타일👩🏻‍💻',N'나는 어떤 스타일?',N'프렌즈일상')
GO
INSERT INTO [dbo].[kakao_new_main]
           ([character_name]
           ,[title]
           ,[content])
     VALUES
           (N'라이언',N'라이언 춘식이랑<br>집에서 불-멍🔥',N'오들오들 집밖은 너무 추워🥶<br>따뜻한 벽난로 앞에 앉아<br>시린 손과 발을 녹여볼까?🔥')
GO
INSERT INTO [dbo].[kakao_new_main]
           ([character_name]
           ,[title]
           ,[content])
     VALUES
           (N'라이언',N'2021 크리스마스🎄<br>본격 준비 START🔴',N'기다리던 🎅🏼 NEW 프렌즈 크리스마스💚<br>올해는 토이샵에 모인 프렌즈와 홈 파티!🏡<br>파티를 함께 즐길 병정 친구들부터 〰<br>집을 장식할 리빙템까지 모두 준비했어.🎁')
GO
INSERT INTO [dbo].[kakao_new_main]
           ([character_name]
           ,[title]
           ,[content])
     VALUES
           (N'라이언',N'라이언과 촉촉하게💦',N'간절기부터 시작되는 건조함😥<br>무드등도 되는 감성 가습기로 수분을 지키자.🛒')
GO
INSERT INTO [dbo].[kakao_new_main]
           ([character_name]
           ,[title]
           ,[content]
           ,[tag])
     VALUES
           (N'프렌즈 도감',N'미스테리 콘🐊<br>정체를 밝혀라!',N'아무도 없는 콘의 연구실🔬<br>무시무시한 악어로 변한다는 소문이?💬',N'프렌즈도감')
GO
-- 댓글 관련 추후에 feed 이후에

