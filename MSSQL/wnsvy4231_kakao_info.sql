
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


