

use admin;

drop table ADMIN_INFO_TABLE;





CREATE TABLE ADMIN_INFO_TABLE (
admin_seq INT AUTO_INCREMENT NOT NULL,
admin_name NVARCHAR(10) NOT NULL,
admin_level INT NOT NULL,
admin_email VARCHAR(100) NOT NULL,
captcha_secure_key VARCHAR(100) NULL,
captcha_site_key VARCHAR(100) NULL,
CONSTRAINT PK__ADMIN_INFO_TABLE__ADMIN_SEQ PRIMARY KEY (admin_seq)
);



select * from ADMIN_INFO_TABLE;




 table USER_TEST;


select * from JPQL_MEMBER;

select * from JPQL_TEAM;


select * from JPQL_TEAM jt 
inner join JPQL_MEMBER jm on jt.team_id = jm.team_id;

truncate JPQL_TEAM;

create table JPQL_MEMBER (
       member_id bigint not null auto_increment,
        member_age integer,
        type varchar(255),
        member_name varchar(255),
        team_id bigint,
        primary key (member_id)
    );

 create table JPQL_TEAM (
       team_id bigint not null auto_increment,
        team_name varchar(255),
        primary key (team_id)
    );

select * from JPQL_TEAM;

select * from JPQL_MEMBER;


create table JPQL_ORDER (
       order_id bigint not null auto_increment,
        user_city varchar(255),
        user_street varchar(255),
        user_zip_code varchar(255),
        orderAmount integer not null,
        product_id bigint,
        primary key (order_id)
    );


create table JPQL_PRODUCT (
       product_id bigint not null auto_increment,
        product_name varchar(255),
        product_price integer,
        product_amount integer,
        primary key (product_id)
    );

create table JPQL_MEMBER (
       member_id bigint not null auto_increment,
        member_age integer,
        member_name varchar(255),
        team_id bigint,
        primary key (member_id)
    );
    
    create table JPQL_TEAM (
       team_id bigint not null auto_increment,
        team_name varchar(255),
        primary key (team_id)
    );


select * from JPQL_TEAM;

select jm.* from JPQL_MEMBER jm 
inner join JPQL_TEAM jt on jm.team_id = jt.team_id;


update JPQL_MEMBER set team_id = 1 where member_id <> 0;


insert into JPQL_TEAM values (1,'test');


   create table ADDRESS (
       user_id bigint not null,
        user_city varchar(255),
        user_street varchar(255),
        user_zip_code varchar(255)
    ); 
    
    create table FAVORITE_FOOD (
       user_id bigint not null,
        food_name varchar(255)
    ); 
    
    
    select * from ADDRESS;
    
    
    create table USER_TEST (
       user_id bigint not null auto_increment,
        user_city varchar(255),
        user_street varchar(255),
        user_zip_code varchar(255),
        user_name varchar(255),
        user_end_date datetime,
        user_start_date datetime,
        primary key (user_id)
    ); 
    
    alter table ADDRESS 
       add constraint FKsljyse6kw83oux35puosj98h0 
       foreign key (user_id) 
       references USER_TEST (user_id);
    
    
    alter table FAVORITE_FOOD 
       add constraint FK6ih6gqbqfsaxl4ussoborrfbc 
      
      foreign key (user_id) 
       references USER_TEST (user_id);
       
       
       

create table USER_TEST (
       user_id bigint not null auto_increment,
        user_city varchar(255),
        user_end_date datetime,
        user_start_date datetime,
        user_street varchar(255),
        user_name varchar(255),
        user_zip_code varchar(255),
        primary key (user_id)
    );
    
    drop table USER_TEST;
    
    select * from USER_TEST;
    
    drop table USER_TEST;



create table Album (
       artist varchar(255),
        etc varchar(255),
        item_id bigint not null,
        primary key (item_id)
    );
    create table Book (
       author varchar(255),
        isbn varchar(255),
        item_id bigint not null,
        primary key (item_id)
    );
    
    create table CATEGORY (
       category_id bigint not null auto_increment,
        category_name varchar(255),
        parent_id bigint,
        primary key (category_id)
    );
    
    
    
    select * from USER;
    
    select * from TEAMS;
    
    
    create table CHILD (
       child_id bigint not null auto_increment,
        name varchar(255),
        parent_id bigint,
        primary key (child_id)
    );
    
    create table PARENT (
       parent_id bigint not null auto_increment,
        name varchar(255),
        primary key (parent_id)
    ); 
    
    
    alter table CHILD 
       add constraint FK__CHILD__PARENT_ID
       foreign key (parent_id) 
       references PARENT (parent_id);
    
    select * from PARENT;
    select * from CHILD;
    
    create table category_item (
       category_id bigint not null,
        item_id bigint not null
    );
    
    drop table MEMBER;
    
    create table DELIVERY (
       delivery_id bigint not null auto_increment,
        status varchar(255),
        primary key (delivery_id)
    );
    
    create table ITEM (
       d_type varchar(31) not null,
        item_id bigint not null auto_increment,
        name varchar(255),
        price integer not null,
        stockQuantity integer not null,
        primary key (item_id)
    );
    
    
    select * from MEMBER;
    
    create table MEMBER (
       member_id bigint not null auto_increment,
        member_city varchar(255),
        member_name varchar(255),
        member_strret varchar(255),
        member_zipcode varchar(255),
        primary key (member_id)
    );
    
    create table Movie (
       actor varchar(255),
        director varchar(255),
        item_id bigint not null,
        primary key (item_id)
    );
    
    
    select * from BOOK;
    select * from ITEM;
    
    create table ORDERITEM (
       order_item_id bigint not null auto_increment,
        item_id bigint,
        order_id bigint,
        primary key (order_item_id)
    );
    
    create table ORDERS (
       order_id bigint not null auto_increment,
        orderDate datetime,
        status varchar(255),
        delivery_id bigint,
        member_id bigint,
        primary key (order_id)
    );
    
    alter table Album 
       add constraint FK90mrb7c3ejr9u0bqjlwbrgm4u 
       foreign key (item_id) 
       references ITEM (item_id);
    
    alter table Book 
       add constraint FK3qrbn0xgxx7hlyq68hdvwbt49 
       foreign key (item_id) 
       references ITEM (item_id);
    
    alter table CATEGORY 
       add constraint FK3621cmx4bvts058yi3iapt852 
       foreign key (parent_id) 
       references CATEGORY (category_id);
    
    alter table category_item 
       add constraint FKfbme0r7h0jkf11gl15o4vrl7h 
       foreign key (item_id) 
       references ITEM (item_id);
    
    alter table category_item 
       add constraint FK59tvdlrakri7ihk6plyhswps3 
       foreign key (category_id) 
       references CATEGORY (category_id);
    
    alter table Movie 
       add constraint FKr078lftmjjx5g6uory2depycc 
       foreign key (item_id) 
       references ITEM (item_id);
    
    alter table ORDERITEM 
       add constraint FKkb9iknkydqaab7ct0309kxons 
       foreign key (item_id) 
       references ITEM (item_id);
    
    alter table ORDERITEM 
       add constraint FKjejlkhihifkowuknhvvvwi8ku 
       foreign key (order_id) 
       references ORDERS (order_id);
    
    alter table ORDERS 
       add constraint FK13bfao9soxbne3xh0fhx7idlg 
       foreign key (delivery_id) 
       references DELIVERY (delivery_id);
    
    alter table ORDERS 
       add constraint FKotgv07al9mty856r89g66okj3 
       foreign key (member_id) 
       references MEMBER (member_id);
       
       
select * from TEAMS;

drop table USER;
drop table TEAMS;     
     
create table TEAMS (
       team_id bigint not null auto_increment,
        createBy varchar(255),
        createdDate datetime,
        lastModifiedBy varchar(255),
        lastModifiedDate datetime,
        name varchar(255),
        primary key (team_id)
    );
    
create table USER (
       member_id bigint not null auto_increment,
        createBy varchar(255),
        createdDate datetime,
        lastModifiedBy varchar(255),
        lastModifiedDate datetime,
        user_name varchar(255),
        team_id bigint,
        primary key (member_id)
    );
    
    alter table USER 
       add constraint FK76bmaafn8luoyhc0bxo9e2507 
       foreign key (team_id) 
       references TEAMS (team_id);    
       
select * from USER;

select * from TEAMS;


     
     
       