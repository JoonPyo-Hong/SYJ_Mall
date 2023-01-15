create database admin;


use admin;






alter table USER 
       add constraint FK__USER__TEAM_ID
       foreign key (team_id) 
       references TEAM (team_id);
       
       


 create table TEAM (
       team_id bigint not null auto_increment,
        name varchar(255),
        primary key (team_id)
    );

    
    create table USER (
       member_id bigint not null auto_increment,
        user_name varchar(255),
        team_id bigint,
        primary key (member_id)
        );

select * from TEAM;

select * from USER;

insert into USER values (3,'member3',1);