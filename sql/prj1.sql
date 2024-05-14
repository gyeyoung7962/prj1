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

select *
from member;


desc board;
desc member;
desc authority;

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

create table product(
    id int auto_increment primary key comment '빈번호',
    name varchar(50) not null unique comment '상품이름',
    price int not null comment '상품가격',
    quantity int default 0 comment '수량',
    stock int default 0 comment '재고수량',
    content varchar(2000) comment '상품설명',
    regDate datetime default now() comment '등록일',
    subCategory_id int references subCategory(subCategory_id)
);

create table category(

    category_id int primary key auto_increment,
    category_name varchar(20) not null
);

create table subCategory(
    subCategory_id int primary key auto_increment,
    parent_category_id int references category(category_id),
    subCategory_name varchar(20) not null
);

insert into category( category_name)
values('아우터'),
      ('상의'),
      ('하의'),
      ('신발'),
      ('Acc');

insert into subCategory(parent_category_id, subcategory_name)
values (1,'자켓'),
       (1, '패딩'),
       (2, '스웨터'),
       (2, '맨투맨'),
       (2, '반팔셔츠'),
       (3, '청바지'),
       (3, '슬랙스'),
       (4, '구두'),
       (4, '런닝화'),
       (4, '운동화');

select *
from category;

select *
from subCategory;

select *
from category;

select c.category_id, c.category_name, s.subCategory_name
from category c join subCategory s
on c.category_id = s.parent_category_id
where c.category_id =1;

select *
from subCategory
order by parent_category_id, subCategory_id;



select p.name, p.price, p.stock, c.category_name, s.subCategory_name
from product p join subCategory s
on p.subCategory_id = s.subCategory_id
join category c
on c.category_id = s.parent_category_id
where c.category_id = 2
order by c.category_id, s.subCategory_id;

select *
from subCategory
where parent_category_id = 1;



drop table product;
drop table product_img;
drop table category;
drop table subCategory;


desc product;
desc product_img;

select *
from product;
select *
from product_img;

select *
from product p join product_img i
on p.id = i.product_id
where p.id = 2;

select p.name, i.name, i.path as uploadpath, i.is_title_img as "대표사진여부(1대표 2일반)"
from product p join product_img i
                    on p.id = i.product_id
where p.id = 2;

select p.name , pi.path as image
from product p join product_img pi
on p.id = pi.product_id and pi.is_title_img = 1;



create table product_img(
    id int primary key auto_increment,
    name varchar(100),
    path varchar(2000),
    product_id int references product(id),
    is_title_img boolean default false
);


