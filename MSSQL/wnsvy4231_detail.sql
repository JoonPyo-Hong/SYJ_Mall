drop table detail_feed
create table dbo.detail_feed (
	d_seq bigint, -- �Խñ� ��ȣ
	f_seq bigint identity(1,1), --  ��� ��ȣ
	name nvarchar(40), -- �̸�
	star bigint, -- ����
	reg_dt datetime default getdate(), -- �����
	text nvarchar(300), -- ����
)


insert  into detail_feed (d_seq,name,star,reg_dt,text) values (1,N'ȫ��ǥ',1,getdate(),N'���ο���');