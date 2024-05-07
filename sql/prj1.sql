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
    id        int primary key auto_increment,
    email     varchar(200) not null,
    password  varchar(200) not null,
    nick_name varchar(100) not null UNIQUE,
    regDate   datetime default now()
);

alter table member
    add column regDate datetime default now();

select *
from member;


select count(*)
from member
where email = 'test1@naver.com';

insert into board(title, content, writer) (select title, content, writer from board);

insert into board(title, content, writer)
values ('첫글입니다', 'ㅇㅇㅇㅇ', '테스트');


select *
from board;

alter table board
    auto_increment = 1;

#board 테이블 수정
#writer 컬럼 지우기
#member_id int references member(id) 컬럼추가

alter table board
    drop column writer;

alter table board
    add column member_id int references member (id);

update board
set member_id = 2
where id > 0;


desc board;
desc member;

select *
from board
order by id desc;

select *
from member;

create table authority
(
    id        int auto_increment primary key,
    member_id int         not null references member (id),
    name      varchar(20) not null
);

insert into authority
(member_id, name) values (8, 'admin');

select *
from authority;


select *
from member m left join authority a
on m.id = a.member_id;




select *
from board b
         join member m
group by b.id;


