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

create table member(
    id int primary key auto_increment,
  email varchar(200) not null UNIQUE ,
  password varchar(200) not null,
  nick_name varchar(100) not null UNIQUE
);

select *
from member;

