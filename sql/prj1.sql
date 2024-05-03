create database prj1;

use prj1;

drop table board;

create table board
(
    id      int primary key auto_increment,
    title   varchar(200)  not null,
    content varchar(3000) not null,
    writer  varchar(100)  not null,
    regDate datetime      not null default now()
);

desc board;

select *
from board;

drop table member;
create table member
(
    id       int primary key auto_increment,
    email    varchar(200) not null,
    password varchar(200) not null,
    nick_name varchar(100) not null UNIQUE,
    regDate  datetime default now()
);

alter table member
    add column regDate datetime default now();

select *
from member;


select count(*)
from member
where email = 'test1@naver.com';

insert into board(title, content, writer)  (select title,content,writer from board);

insert into board(title,content,writer)
values ('첫글입니다', 'ㅇㅇㅇㅇ', '테스트');


select *
from board;

alter table board auto_increment = 1;