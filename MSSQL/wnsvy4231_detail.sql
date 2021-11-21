create table dbo.detail_feed (
	d_seq bigint, -- 게시글 번호
	f_seq bigint identity(1,1), --  댓글 번호
	name nvarchar(40), -- 이름
	star bigint, -- 별점
	reg_dt datetime, -- 등록일
	text nvarchar(300), -- 문장
)