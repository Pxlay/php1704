create database shop default character set=utf8;

use shop;

#用户表
create table userinfo
(
  userId        int             auto_increment primary key,
  userName      varchar(20)     unique not null,
  password      varchar(20)     not null
);
insert into userinfo(userName,password)values('张三','123456');
insert into userinfo(userName,password)values('李四','123456');
insert into userinfo(userName,password)values('王五','123456');

#产品表
create table bookinfo
(
  bookId        int           auto_increment primary key,
  bookName      varchar(50)   not null,
  price         float         default 0
);
insert into bookinfo(bookName,price)values('PHP开发指南',60);
insert into bookinfo(bookName,price)values('MySQL详解',56);
insert into bookinfo(bookName,price)values('HTML亲密接触',67);
insert into bookinfo(bookName,price)values('Linux编程',90);
insert into bookinfo(bookName,price)values('MVC框架',73);
insert into bookinfo(bookName,price)values('Java2核心编程',65);
insert into bookinfo(bookName,price)values('程员上班那点事儿',60);

#购物车表
create table carinfo
(
  carId        int       auto_increment primary key,
  userId       int       not null,#购买产品的人
  bookId       int       not null,#产品的编号
  bookCount    int       default 0,#数量
  dateandtime  timestamp default current_timestamp
);

#订单表
create table orderinfo
(
  id            int              auto_increment primary key,
  orderId       varchar(13)      unique not null,#订单编号
  totalPrice    float            default 0,#订单总价
  userId        int              not null,#下订单的人
  accpter       varchar(50)      not null,#收件人
  tel           varchar(20)      not null,#联系电话
  address       varchar(200)     not null,#送货地址
  remark        varchar(500)     default '',#订单描述
  isPay         int              default 0,#是否付款 0未 1己
  isSend        int              default 0,#是否发货 0未 1己
  isCheck       int              default 0,#是否签收 0未 1己
  dateandtime   timestamp        default current_timestamp
);

#订单明细表(记录某订单下的产品信息)
create table orderdetails
(
  id         int          auto_increment primary key,
  orderId    varchar(13)  not null,#订单编号
  bookId     int          not null,#产品编号
  bookCount  int          default 0#产品数量
);

select * from userinfo;#用户表
select * from bookinfo;#产品表
select * from carinfo;#购物车表
select * from orderinfo;#订单表
select * from orderdetails;#订单明细表










