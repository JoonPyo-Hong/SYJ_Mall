create table dbo.detail_feed (
	seq bigint, -- 번호
	name nvarchar(40), -- 이름
	star bigint, -- 별점
	reg_dt datetime, -- 등록일
	text nvarchar(300), -- 문장
)