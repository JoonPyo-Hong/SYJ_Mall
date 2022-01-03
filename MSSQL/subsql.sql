select top(10) * from dbo.PRODUCT_TABLE
select top(10) * from dbo.KAKAO_PRODUCT_IMG

drop table kakao_new_main_sub;

select * from dbo.kakao_new_main_sub where list_seq =1
create table kakao_new_main_sub(
	seq bigint identity(1,1),
	list_seq bigint ,
	product_id bigint ,
);

insert into kakao_new_main_sub values(1,1);
insert into kakao_new_main_sub values(1,2);
insert into kakao_new_main_sub values(2,3);

select a.product_id,product_nm,product_price,product_img from dbo.PRODUCT_TABLE a inner join dbo.KAKAO_PRODUCT_IMG b on a.product_id = b.img_seq where a.product_id =1