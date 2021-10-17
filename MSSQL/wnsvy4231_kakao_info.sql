
create table dbo.kakao_info(				-- 안내
	seq bigint identity(1,1) primary key,   -- 번호
	image_url nvarchar(50) not null,        -- 이미지
	title nvarchar(50) not null,			-- 제목
	phone_number nvarchar(20) not null,		-- 폰번호
	opening_hours nvarchar(50) not null,	-- 영업시간
	adress nvarchar(50) not null,			-- 주소
	adress_detail nvarchar(50) null		    -- 상세주소
);

insert into dbo.kakao_info(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_gangnam_M.jpg',N'강남 플래그십 스토어',N'02-6494-1100 (매장)',N'매일 10:30 - 22:00',N'서울 서초구 서초동 1305-7 유창빌딩 1~2층',N'');
insert into dbo.kakao_info(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_hongdae_M.jpg',N'홍대 플래그십 스토어',N'02-6010-0104',N'매일 10:30 - 22:00',N'서울 마포구 양화로 162 (동교동, 동교동대아빌딩) 좋은사람들빌딩 1~3층',N'');
insert into dbo.kakao_info(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_busan_M.jpg',N'부산 플래그십 스토어',N'051-256-0815',N'매일 12:00 - 21:00',N'부산 중구 광복로 62 (광복동2가)',N'');
insert into dbo.kakao_info(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W001_incheon_T2.jpg',N'인천공항 T2 면세점',N'032-743-4759',N'매일 6:50 - 21:30',N'인천 중구 공항로 272 (운서동, 인천공항) T2 3층 서편 248게이트 부근',N'https://map.kakao.com/?itemId=1366732473');
insert into dbo.kakao_info(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W004_goyang.jpg',N'롯데 영플라자 명동점',N'02-2118-5150',N'매일 11:30 - 21:30',N'서울 중구 남대문로 67 (남대문로2가, 롯데영플라자) 1층',N'https://map.kakao.com/?itemId=1044004404');
insert into dbo.kakao_info(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W002_lotte.jpg',N'스타필드 고양점',N'031-5173-1007',N'매일 10:00 - 22:00 (연중무휴)',N'경기 고양시 덕양구 고양대로 1955 (동산동, 스타필드 고양) 1층 1113호',N'https://map.kakao.com/?itemId=1579610492');


