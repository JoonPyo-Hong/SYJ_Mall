
create table dbo.kakao_info(				-- �ȳ�
	seq bigint identity(1,1) primary key,   -- ��ȣ
	image_url nvarchar(50) not null,        -- �̹���
	title nvarchar(50) not null,			-- ����
	phone_number nvarchar(20) not null,		-- ����ȣ
	opening_hours nvarchar(50) not null,	-- �����ð�
	adress nvarchar(50) not null,			-- �ּ�
	adress_detail nvarchar(50) null		    -- ���ּ�
);

insert into dbo.kakao_info(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_gangnam_M.jpg',N'���� �÷��׽� �����',N'02-6494-1100 (����)',N'���� 10:30 - 22:00',N'���� ���ʱ� ���ʵ� 1305-7 ��â���� 1~2��',N'');
insert into dbo.kakao_info(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_hongdae_M.jpg',N'ȫ�� �÷��׽� �����',N'02-6010-0104',N'���� 10:30 - 22:00',N'���� ������ ��ȭ�� 162 (������, ��������ƺ���) ������������ 1~3��',N'');
insert into dbo.kakao_info(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_busan_M.jpg',N'�λ� �÷��׽� �����',N'051-256-0815',N'���� 12:00 - 21:00',N'�λ� �߱� ������ 62 (������2��)',N'');
insert into dbo.kakao_info(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W001_incheon_T2.jpg',N'��õ���� T2 �鼼��',N'032-743-4759',N'���� 6:50 - 21:30',N'��õ �߱� ���׷� 272 (���, ��õ����) T2 3�� ���� 248����Ʈ �α�',N'https://map.kakao.com/?itemId=1366732473');
insert into dbo.kakao_info(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W004_goyang.jpg',N'�Ե� ���ö��� ����',N'02-2118-5150',N'���� 11:30 - 21:30',N'���� �߱� ���빮�� 67 (���빮��2��, �Ե����ö���) 1��',N'https://map.kakao.com/?itemId=1044004404');
insert into dbo.kakao_info(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W002_lotte.jpg',N'��Ÿ�ʵ� �����',N'031-5173-1007',N'���� 10:00 - 22:00 (���߹���)',N'��� ���� ���籸 ����� 1955 (���굿, ��Ÿ�ʵ� ���) 1�� 1113ȣ',N'https://map.kakao.com/?itemId=1579610492');

insert into dbo.kakao_info_en(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_gangnam_M.jpg',N'Gangnam Flagship Store',N'02-6494-1100 (Store)',N'Daily 10:30 - 22:00',N'1-2nd Fl., Yuchang Bldg., 1305-7, Seocho-dong, Seocho-gu, Seoul',N'');
insert into dbo.kakao_info_en(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_hongdae_M.jpg',N'Hongdae Flagship Store',N'02-6010-0104',N'Daily 10:30 - 22:00',N'1-3rd Fl., Joeun Saramdeul Bldg., 162, Yanghwa-ro, Mapo-gu, Seoul (Donggyo Daea Bldg., Donggyo-dong)',N'');
insert into dbo.kakao_info_en(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_busan_M.jpg',N'Busan Flagship Store',N'051-256-0815',N'Daily 12:00 - 21:00',N'62, Gwangbok-ro, Jung-gu, Busan (Gwangbok-dong 2-ga)',N'');
insert into dbo.kakao_info_en(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W001_incheon_T2.jpg',N'Incheon International Airport T2 Shinsegae Duty Free',N'032-743-4759',N'Daily 6:50 - 21:30',N'ear West Wing Gate 248, 3rd Fl., T2, 272, Gonghang-ro, Jung-gu, Incheon (Incheon International Airport, Unseo-dong)',N'https://map.kakao.com/?itemId=1366732473');
insert into dbo.kakao_info_en(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W004_goyang.jpg',N'Myeongdong Lotte Young Plaza',N'02-2118-5150',N'Daily 11:30 - 21:30',N'1st Fl., 67, Namdaemun-ro, Jung-gu, Seoul (Lotte Young Plaza, Namdaemun-ro 2-ga)',N'https://map.kakao.com/?itemId=1044004404');
insert into dbo.kakao_info_en(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W002_lotte.jpg',N'Times Square Yeongdeungpo',N'031-5173-1007',N'Daily 10:00 - 22:00',N'Kakao Friends, 1st Fl., 15, Yeongjung-ro, Yeongdeungpo-gu, Seoul (Times Square, Yeongdeungpo-dong 4(sa)-ga)',N'https://map.kakao.com/?itemId=1579610492');

insert into dbo.kakao_info_jp(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_gangnam_M.jpg',N'˰���ի�ë����ë׫��ȫ�',N'02-6494-1100 (Store)',N'?�� 10:30 - 22:00',N'��������ܬ� ����? ������ 1305-7 ������ӫ�ǫ��� 1��2ͭ',N'');
insert into dbo.kakao_info_jp(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_hongdae_M.jpg',N'���ޫի�ë����ë׫��ȫ�',N'02-6010-0104',N'?�� 10:30 - 22:00',N'��������ܬ� ث��? ���ի��� 162 (�����ס������׫ƫ��ӫ�ǫ���) ���竦�󫵫��ɫ���ӫ�ǫ��� 1��3ͭ',N'');
insert into dbo.kakao_info_jp(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_busan_M.jpg',N'ݼߣ�ի�ë����ë׫��ȫ�',N'051-256-0815',N'?�� 12:00 - 21:00',N'ݼߣ?�� ��? ������ܫ��� 62 (������2ʶ)',N'');
insert into dbo.kakao_info_jp(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W001_incheon_T2.jpg',N'����?����� T2���ͣ��?��',N'032-743-4759',N'?�� 6:50 - 21:30',N'����?�� ��? ����ϫ�� 272 (���ס�����?�����) T2 3ͭ��� 248�㫲?������',N'https://map.kakao.com/?itemId=1366732473');
insert into dbo.kakao_info_jp(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W004_goyang.jpg',N'٥�� ��ëƫ�󫰫׫髶��',N'02-2118-5150',N'?�� 11:30 - 21:30',N'��������ܬ� ��? �ʫ�ǫ��� 67 (����ڦ��2ʶ����ëƫ�󫰫׫髶) 1ͭ',N'https://map.kakao.com/?itemId=1044004404');
insert into dbo.kakao_info_jp(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W002_lotte.jpg',N'�����ૺ�������� �������',N'031-5173-1007',N'?�� 10:00 - 22:00',N'������ܬ� �����? ��󫸫��� 15 (�������4ʶ�������ૺ��������) 1ͭ �������ի��',N'https://map.kakao.com/?itemId=1579610492');

insert into dbo.kakao_info_cn(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_gangnam_M.jpg',N'˰����?��',N'02-6494-1100 (Store)',N'���� :���� 10:30 - 22:00',N'��?����?������1305-7 Yoo Chang����1-2?',N'');
insert into dbo.kakao_info_cn(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_hongdae_M.jpg',N'������?��',N'02-6010-0104',N'���� 10:30 - 22:00',N'��?ث��??����162��??�ף�??��Dea����������?����1-3?',N'');
insert into dbo.kakao_info_cn(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_busan_M.jpg',N'ݼߣ��?��',N'051-256-0815',N'���� 12:00 - 21:00',N'ݼߣ��?��?��62 ����?��2ʶ��',N'');
insert into dbo.kakao_info_cn(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W001_incheon_T2.jpg',N'������?T2���ͣ��?��',N'032-743-4759',N'���� 6:50 - 21:30',N'������?��?��272������ף�������?��T2 3?�?248?����Ϣݾ��',N'https://map.kakao.com/?itemId=1366732473');
insert into dbo.kakao_info_cn(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W004_goyang.jpg',N'٥��?��Young Plaza��',N'02-2118-5150',N'���� 11:30 - 21:30',N'��?��?����?��67������?��2ʶ��?��Young Plaza��1?',N'https://map.kakao.com/?itemId=1044004404');
insert into dbo.kakao_info_cn(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W002_lotte.jpg',N'?��??�������',N'031-5173-1007',N'���� 10:00 - 22:00',��?�����?�����15���������4ʶ��?��??) 1? Kakao Friends',N'https://map.kakao.com/?itemId=1579610492');

insert into dbo.kakao_info_cn2(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_gangnam_M.jpg',N'˰����?��',N'02-6494-1100 (Store)',N'���� :���� 10:30 - 22:00',N'��?����?������1305-7 Yoo Chang����1-2?',N'');
insert into dbo.kakao_info_cn2(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_hongdae_M.jpg',N'������?��',N'02-6010-0104',N'���� 10:30 - 22:00',N'��?ث��??����162��??�ף�??��Dea����������?����1-3?',N'');
insert into dbo.kakao_info_cn2(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'bg_storeInfo_busan_M.jpg',N'ݼߣ��?��',N'051-256-0815',N'���� 12:00 - 21:00',N'ݼߣ��?��?��62 ����?��2ʶ��',N'');
insert into dbo.kakao_info_cn2(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W001_incheon_T2.jpg',N'������?T2���ͣ��?��',N'032-743-4759',N'���� 6:50 - 21:30',N'������?��?��272������ף�������?��T2 3?�?248?����Ϣݾ��',N'https://map.kakao.com/?itemId=1366732473');
insert into dbo.kakao_info_cn2(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W004_goyang.jpg',N'٥��?��Young Plaza��',N'02-2118-5150',N'���� 11:30 - 21:30',N'��?��?����?��67������?��2ʶ��?��Young Plaza��1?',N'https://map.kakao.com/?itemId=1044004404');
insert into dbo.kakao_info_cn2(image_url,title,phone_number,opening_hours,adress,adress_detail) values (N'W002_lotte.jpg',N'?��??�������',N'031-5173-1007',N'���� 10:00 - 22:00',��?�����?�����15���������4ʶ��?��??) 1? Kakao Friends',N'https://map.kakao.com/?itemId=1579610492');