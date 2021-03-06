
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

insert into dbo.kakao_info_en(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_gangnam_M.jpg',N'Gangnam Flagship Store',N'02-6494-1100 (Store)',N'Daily 10:30 - 22:00',N'1-2nd Fl., Yuchang Bldg., 1305-7, Seocho-dong, Seocho-gu, Seoul',N'');
insert into dbo.kakao_info_en(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_hongdae_M.jpg',N'Hongdae Flagship Store',N'02-6010-0104',N'Daily 10:30 - 22:00',N'1-3rd Fl., Joeun Saramdeul Bldg., 162, Yanghwa-ro, Mapo-gu, Seoul (Donggyo Daea Bldg., Donggyo-dong)',N'');
insert into dbo.kakao_info_en(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_busan_M.jpg',N'Busan Flagship Store',N'051-256-0815',N'Daily 12:00 - 21:00',N'62, Gwangbok-ro, Jung-gu, Busan (Gwangbok-dong 2-ga)',N'');
insert into dbo.kakao_info_en(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W001_incheon_T2.jpg',N'Incheon International Airport T2 Shinsegae Duty Free',N'032-743-4759',N'Daily 6:50 - 21:30',N'ear West Wing Gate 248, 3rd Fl., T2, 272, Gonghang-ro, Jung-gu, Incheon (Incheon International Airport, Unseo-dong)',N'https://map.kakao.com/?itemId=1366732473');
insert into dbo.kakao_info_en(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W004_goyang.jpg',N'Myeongdong Lotte Young Plaza',N'02-2118-5150',N'Daily 11:30 - 21:30',N'1st Fl., 67, Namdaemun-ro, Jung-gu, Seoul (Lotte Young Plaza, Namdaemun-ro 2-ga)',N'https://map.kakao.com/?itemId=1044004404');
insert into dbo.kakao_info_en(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W002_lotte.jpg',N'Times Square Yeongdeungpo',N'031-5173-1007',N'Daily 10:00 - 22:00',N'Kakao Friends, 1st Fl., 15, Yeongjung-ro, Yeongdeungpo-gu, Seoul (Times Square, Yeongdeungpo-dong 4(sa)-ga)',N'https://map.kakao.com/?itemId=1579610492');

insert into dbo.kakao_info_jp(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_gangnam_M.jpg',N'江南フラッグシップストア',N'02-6494-1100 (Store)',N'?日 10:30 - 22:00',N'ソウル特別市 瑞草? 瑞草洞 1305-7 ユチャンビルディング 1～2階',N'');
insert into dbo.kakao_info_jp(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_hongdae_M.jpg',N'弘大フラッグシップストア',N'02-6010-0104',N'?日 10:30 - 22:00',N'ソウル特別市 麻浦? ヤンファロ 162 (東橋洞、東橋洞テアビルディング) チョウンサラムドゥルビルディング 1～3階',N'');
insert into dbo.kakao_info_jp(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_busan_M.jpg',N'釜山フラッグシップストア',N'051-256-0815',N'?日 12:00 - 21:00',N'釜山?域市 中? クァンボクロ 62 (光復洞2街)',N'');
insert into dbo.kakao_info_jp(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W001_incheon_T2.jpg',N'仁川?際空港 T2新世界免?店',N'032-743-4759',N'?日 6:50 - 21:30',N'仁川?域市 中? コンハンロ 272 (雲西洞、仁川?際空港) T2 3階西側 248番ゲ?ト付近',N'https://map.kakao.com/?itemId=1366732473');
insert into dbo.kakao_info_jp(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W004_goyang.jpg',N'明洞 ロッテヤングプラザ店',N'02-2118-5150',N'?日 11:30 - 21:30',N'ソウル特別市 中? ナムデムンロ 67 (南大門路2街、ロッテヤングプラザ) 1階',N'https://map.kakao.com/?itemId=1044004404');
insert into dbo.kakao_info_jp(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W002_lotte.jpg',N'タイムズスクエア 永登浦店',N'031-5173-1007',N'?日 10:00 - 22:00',N'ウル特別市 永登浦? ヨンジュンロ 15 (永登浦洞4街、タイムズスクエア) 1階 カカオフレンズ',N'https://map.kakao.com/?itemId=1579610492');

insert into dbo.kakao_info_cn(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_gangnam_M.jpg',N'江南旗?店',N'02-6494-1100 (Store)',N'每天 :每天 10:30 - 22:00',N'首?瑞草?瑞草洞1305-7 Yoo Chang大厦1-2?',N'');
insert into dbo.kakao_info_cn(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_hongdae_M.jpg',N'弘大旗?店',N'02-6010-0104',N'每天 10:30 - 22:00',N'首?麻浦??花路162（??洞，??洞Dea大厦）好人?大厦1-3?',N'');
insert into dbo.kakao_info_cn(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_busan_M.jpg',N'釜山旗?店',N'051-256-0815',N'每天 12:00 - 21:00',N'釜山中?光?路62 （光?洞2街）',N'');
insert into dbo.kakao_info_cn(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W001_incheon_T2.jpg',N'仁川机?T2新世界免?店',N'032-743-4759',N'每天 6:50 - 21:30',N'仁川中?机?路272（云西洞，仁川机?）T2 3?西?248?登机口附近',N'https://map.kakao.com/?itemId=1366732473');
insert into dbo.kakao_info_cn(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W004_goyang.jpg',N'明洞?天Young Plaza店',N'02-2118-5150',N'每天 11:30 - 21:30',N'首?中?南大?路67（南大?路2街，?天Young Plaza）1?',N'https://map.kakao.com/?itemId=1044004404');
insert into dbo.kakao_info_cn(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W002_lotte.jpg',N'?代??永登浦店',N'031-5173-1007',N'每天 10:00 - 22:00',首?永登浦?永中路15（永登浦洞4街，?代??) 1? Kakao Friends',N'https://map.kakao.com/?itemId=1579610492');

insert into dbo.kakao_info_cn2(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_gangnam_M.jpg',N'江南旗?店',N'02-6494-1100 (Store)',N'每天 :每天 10:30 - 22:00',N'首?瑞草?瑞草洞1305-7 Yoo Chang大厦1-2?',N'');
insert into dbo.kakao_info_cn2(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_hongdae_M.jpg',N'弘大旗?店',N'02-6010-0104',N'每天 10:30 - 22:00',N'首?麻浦??花路162（??洞，??洞Dea大厦）好人?大厦1-3?',N'');
insert into dbo.kakao_info_cn2(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_busan_M.jpg',N'釜山旗?店',N'051-256-0815',N'每天 12:00 - 21:00',N'釜山中?光?路62 （光?洞2街）',N'');
insert into dbo.kakao_info_cn2(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W001_incheon_T2.jpg',N'仁川机?T2新世界免?店',N'032-743-4759',N'每天 6:50 - 21:30',N'仁川中?机?路272（云西洞，仁川机?）T2 3?西?248?登机口附近',N'https://map.kakao.com/?itemId=1366732473');
insert into dbo.kakao_info_cn2(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W004_goyang.jpg',N'明洞?天Young Plaza店',N'02-2118-5150',N'每天 11:30 - 21:30',N'首?中?南大?路67（南大?路2街，?天Young Plaza）1?',N'https://map.kakao.com/?itemId=1044004404');
insert into dbo.kakao_info_cn2(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W002_lotte.jpg',N'?代??永登浦店',N'031-5173-1007',N'每天 10:00 - 22:00',首?永登浦?永中路15（永登浦洞4街，?代??) 1? Kakao Friends',N'https://map.kakao.com/?itemId=1579610492');