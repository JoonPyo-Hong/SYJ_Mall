create table dbo.detail_feed (
	d_seq bigint, -- �Խñ� ��ȣ
	f_seq bigint identity(1,1), --  ��� ��ȣ
	name nvarchar(40), -- �̸�
	star bigint, -- ����
	reg_dt datetime, -- �����
	text nvarchar(300), -- ����
)