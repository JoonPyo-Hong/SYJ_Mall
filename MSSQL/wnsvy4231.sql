create table dbo.KAKAO_ORDER(
	seq bigint, -- ��ȣ
	p_seq bigint, -- ��ǰ��ȣ
	sum bigint, -- ��ǰ ����
);

create table dbo.KAKAO_SHIPPING(
	seq bigint, -- ��ȣ
	reg_dt date not null default getdate(), -- ��û��
	reg_nm nvarchar(20), -- �̸�
	reg_phone_num varchar(100), -- ��ȭ��ȣ
	adress nvarchar(500), --�ּ�	
	message nvarchar(500), -- ��û����
	pay varchar(2) -- ���� ����
	stat varchar(2) -- �ֹ� ����
	price money, -- ��ü ����
);