drop table detail_feed
create table dbo.detail_feed (
	d_seq bigint, -- 게시글 번호
	f_seq bigint identity(1,1), --  댓글 번호
	name nvarchar(40), -- 이름
	star bigint, -- 별점
	reg_dt datetime default getdate(), -- 등록일
	text nvarchar(300), -- 문장
)


insert  into detail_feed (d_seq,name,star,reg_dt,text) values (1,N'홍준표',1,getdate(),N'별로에요');