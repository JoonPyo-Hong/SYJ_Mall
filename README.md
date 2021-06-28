# SYJ_Mall
  
CREATE TABLE dbo.main_img(
	list_seq bigint,
	img_nm nvarchar(200)
);
CREATE TABLE dbo.main_heart(
	seq bigint identity (0,1) primary key, 
	list_seq bigint,
	member_seq bigint
);
