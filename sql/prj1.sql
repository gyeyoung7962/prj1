create database prj1;

use prj1;

show tables;

create table board
(
    id      int primary key auto_increment,
    title   varchar(200)  not null,
    content varchar(3000) not null,
    writer  varchar(100)  not null,
    regDate datetime      not null default now()
);

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

#board 테이블 수정
#writer 컬럼 지우기
#member_id int references member(id) 컬럼추가

alter table board
    add column member_id int references member (id);

create table authority
(
    id        int auto_increment primary key,
    member_id int         not null references member (id),
    name      varchar(20) not null
);

insert into authority
    (member_id, name)
values (8, 'admin');

select *
from authority;

create table product
(
    id             int auto_increment primary key comment '빈번호',
    name           varchar(50) not null unique comment '상품이름',
    price          int         not null comment '상품가격',
    quantity       int      default 0 comment '수량',
    stock          int      default 0 comment '재고수량',
    content        varchar(2000) comment '상품설명',
    regDate        datetime default now() comment '등록일',
    subCategory_id int references subCategory (subCategory_id)
);

alter table product
    drop column quantity;


create table category
(
    category_id   int primary key auto_increment,
    category_name varchar(20) not null
);

create table subCategory
(
    subCategory_id     int primary key auto_increment,
    parent_category_id int references category (category_id),
    subCategory_name   varchar(20) not null
);

insert into category(category_name)
values ('아우터'),
       ('상의'),
       ('하의'),
       ('신발'),
       ('Acc');

insert into subCategory(parent_category_id, subcategory_name)
values (1, '자켓'),
       (1, '패딩'),
       (2, '스웨터'),
       (2, '맨투맨'),
       (2, '반팔셔츠'),
       (3, '청바지'),
       (3, '슬랙스'),
       (4, '구두'),
       (4, '런닝화'),
       (4, '운동화');

drop table product;
drop table product_img;
drop table category;
drop table subCategory;
drop table comment_qna;
drop table product_review;
drop table product_qna;

select *
from product_qna;

select *
from comment_qna;

show tables;

create table product_img
(
    id           int primary key auto_increment,
    name         varchar(100),
    path         varchar(2000),
    product_id   int references product (id),
    is_title_img boolean default false
);

create table product_review
(
    id         int primary key auto_increment,
    writer     varchar(50),
    content    varchar(2000) not null,
    rating     int           not null,
    product_id int references product (id),
    member_id  int references member (id),
    regDate    datetime default now()
);

create table product_qna
(
    id         int auto_increment primary key,
    title      varchar(100),
    content    varchar(2000),
    writer     varchar(100),
    regDate    datetime default now(),
    product_id int references product (id)
);

create table comment_qna
(
    id             int auto_increment primary key,
    product_qna_id int references product_qna (id),
    content        varchar(2000),
    writer         varchar(100),
    regDate        datetime default now()
);

create table cart
(
    id         int primary key auto_increment,
    product_id int references product (id),
    member_id  int references member (id),
    quantity   int      default 1,
    price      int,
    regDate    datetime default now()
);
alter table cart add column path varchar(200);
alter table cart add column name varchar(100);
alter table cart add column original_price int;

desc cart;


select m.email, m.nick_name, p.name, c.quantity, c.price
from cart c
         join member m
              on c.member_id = m.id
         join product p
              on p.id = c.product_id;

select m.email, m.nick_name, p.name, c.quantity, c.price
from cart c
         join member m
              on c.member_id = m.id
         join product p
              on p.id = c.product_id
where m.email = 'admin@naver.com'
  and p.id = 14;

select c.product_id
from cart c
         join member m
              on c.member_id = m.id
         join product p
              on p.id = c.product_id
where m.email = 'admin@naver.com';

select *
from cart;

select *
from product;

select *
from member;

select c.product_id
from cart c
         join member m
              on c.member_id = m.id
         join product p on c.product_id = p.id
where p.id = 11;

select c.product_id, c.original_price , p.name, c.quantity, c.price, pi.path, c.regDate
from cart c
         join member m
              on c.member_id = m.id
         join product p on c.product_id = p.id
        join product_img pi
        on pi.product_id = p.id
where m.id = 8
order by c.regDate desc;

select *
from cart
where product_id = 1;

select *
from cart
where member_id = 8;

desc product;
desc product_img;

delete from
           cart where member_id = 8;


select *
from subCategory;

desc subCategory;
desc category;
desc product;

select p.name ,sc.subCategory_name, sc.subCategory_id from
             product p join subCategory sc
on p.subCategory_id = sc.subCategory_id
join category c
on c.category_id = sc.parent_category_id
where sc.parent_category_id = 1;

select count(*) from
                    subCategory s join product p
on p.subCategory_id = s.subCategory_id
        join category c
        on c.category_id = s.parent_category_id
where s.subCategory_id = 1;


select *
from member;

