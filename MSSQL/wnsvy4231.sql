create table dbo.KAKAO_ORDER(
	seq bigint, -- ��ȣ
	reg_dt date not null default getdate(), -- �����
	reg_nm nvarchar(20), -- �����
	reg_email varchar(100), --��ϸ���
	country nvarchar(20), --����
	reg_phone_num nvarchar(100), -- �������ȣ 
	price money, -- ����
	stat varchar(2) -- �ֹ� ����
);

create table dbo.KAKAO_SHIPPING(
	seq bigint, -- ��ȣ
	reg_nm nvarchar(20), -- �����
	reg_phone_num varchar(100), -- �������ȣ 
	adress nvarchar(500), --�ּ�
	country nvarchar(20), --����	
	message nvarchar(500), -- ��û����
	stat varchar(2) -- �⺻ ����� ����
);