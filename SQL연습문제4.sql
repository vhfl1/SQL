#날짜 : 2022/09/02
#이름 : 윤사랑
#내용 : SQL 연습문제4

#4-1
create database `java1_BookStore`;
create user 'java1_admin4'@'%' identified by '1234';
grant all privileges on `java1_BookStore`.* to 'java1_admin4'@'%';
flush privileges;

#4-2
create table `Customer`(
	   `custId` int not null primary key auto_increment,
       `name` varchar(10) not null,
       `address` varchar(20) default null,
       `phone` varchar(13) default null
);
create table `Book`(
	   `bookId` int not null primary key,
       `bookName` varchar(20) not null,
       `publisher` varchar(20) not null,
       `price` int default null
);
create table `Order`(
       `orderId` int not null primary key auto_increment,
       `custId` int not null,
       `bookId` int not null,
       `salePrice` int not null,
       `orderDate` date not null
);

#4-3
insert into `Customer` values (1, '박지성', '영국 맨체스타', '000-5000-0001');
insert into `Customer` values (2, '김연아', '대한민국 서울', '000-6000-0001');
insert into `Customer` values (3, '장미란', '대한민국 강원도', '000-7000-0001');
insert into `Customer` values (4, '추신수', '미국 클리블랜드', '000-8000-0001');
insert into `Customer` (`custId`, `name`, `address`)values (5, '박세리', '대한민국 대전');

insert into `Book` values (1, '축구의 역사', '굿스포츠', 7000);
insert into `Book` values (2, '축구아는 여자', '나무수', 13000);
insert into `Book` values (3, '축구의 이해', '대한미디어', 22000);
insert into `Book` values (4, '골프 바이블', '대한미디어', 35000);
insert into `Book` values (5, '피겨교본', '굿스포츠', 8000);
insert into `Book` values (6, '역도 단계별 기술', '굿스포츠', 6000);
insert into `Book` values (7, '야구의 추억', '이상미디어', 20000);
insert into `Book` values (8, '야구를 부탁해', '이상미디어', 13000);
insert into `Book` values (9, '올림픽 이야기', '삼성당', 7500);
insert into `Book` values (10, 'Olympic Champions', 'Pearson', 13000);

insert into `Order` values (1, 1, 1, 6000, '2014-07-01');
insert into `Order` values (2, 1, 3, 21000, '2014-07-03');
insert into `Order` values (3, 2, 5, 8000, '2014-07-03');
insert into `Order` values (4, 3, 6, 6000, '2014-07-04');
insert into `Order` values (5, 4, 7, 20000, '2014-07-05');
insert into `Order` values (6, 1, 2, 12000, '2014-07-07');
insert into `Order` values (7, 4, 8, 13000, '2014-07-07');
insert into `Order` values (8, 3, 10, 12000, '2014-07-08');
insert into `Order` values (9, 2, 10, 7000, '2014-07-09');
insert into `Order` values (10, 3, 8, 13000, '2014-07-10');

#4-4
select * from `Customer`;

#4-5
select `bookName`,`price` from `Book`;

#4-6
select `price`, `bookName` from `Book`;

#4-7
select `bookId`, `bookName`, `publisher`, `price` from `Book`;

#4-8
select `Publisher` from `Book`;

#4-9
select distinct `publisher` from `Book`;

#4-10
select * from `Book` where `price` >= 20000;

#4-11
select * from `Book` where `price` < 20000;

#4-12
select * from `Book` where `price` >= 10000 and `price` <= 20000;

#4-13
select `bookId`, `bookName`, `price` from `Book` where `price` >= 15000 and `price` <= 30000;

#4-14
select * from `Book` where `bookId` in (2,3,5);

#4-15
select * from `Book` where mod(`bookId`, 2)=0;
select * from `Book` where `bookId`%2=0;
#4-16
select * from `customer` where `name` like '박%';

#4-17
select * from `customer` where `address` like '대한민국 %';

#4-18
select * from `customer` where `phone` is not null;

#4-19
select * from `Book` where `publisher` = '굿스포츠' or `publisher` = '대한미디어';

#4-20
select `publisher` from `Book` where `bookName` = '축구의 역사';

#4-21
select `publisher` from `Book` where `bookName` like '축구%';

#4-22
select * from `Book` where `bookName` like '_구%';

#4-23
select * from `Book` where `bookName` like '축구%' and `price` >= 20000;

#4-24
select * from `Book` order by `bookName` asc;

#4-25
select * from `Book` order by `price` asc, `bookName` asc;

#4-26
select * from `Book` order by `price` desc, `publisher` asc;

#4-27
select * from `Book` order by `price` desc limit 3;

#4-28
select * from `Book` order by `price` asc limit 3;

#4-29
select sum(`salePrice`) as `총판매액` from `Order`;

#4-30
select sum(`salePrice`) as `총판매액`, 
       avg(`salePrice`) as `평균값`, 
       min(`salePrice`) as `최저가`, 
       max(`salePrice`) as `최고가` 
from `Order`;

#4-31
select count(*) as `판매건수` from `Order`;

#4-32
update `Book` set `bookName` = replace(`bookName`, '야구', '농구');

#4-33
select `custId`, 
       count(`custId`) as `수량` 
from `Order`
where `salePrice` >= 8000
group by `custId`
having count(`custId`) >= 2
order by `custId` asc ;

#4-34
select *
from `customer` as a
join `Order` as b
on a.`custId`=b.`custId`;

#4-35
select *
from `customer` as a
join `Order` as b
on a.`custId`=b.`custId`
order by a.`custId` asc;

#4-36
select `name`,
       `salePrice` 
from `Customer` as a
join `Order` as b
on a.`custId`=b.`custId`;

#4-37
select `name`,
       sum(`salePrice`)
from `Customer` as a
join `Order` as b
on a.`custId`=b.`custId`
group by `name`
order by `name` asc;

#4-38
select `name`,
       `bookname` 
from `Customer` as a
join `Order` as b
on a.`custId`=b.`custId`
join `Book` as c
on b.`bookId`=c.`bookId`;

#4-39
select `name`,
       `bookname`
from `Customer` as a
join `Order` as b
on a.`custId`=b.`custId`
join `Book` as c
on b.`bookId`=c.`bookId`
where `price` = 20000;

#4-40
select `name`,
       `saleprice`
from `Customer` as a
left join `Order` as b
on a.`custId`=b.`custId`;

#4-41
select `bookName` from `Book` where `price`=(select max(`price`) from `Book`);

#4-42
select `name` from `Customer` where `custId` not in (select distinct `custId` from `Order`);

#4-43
select sum(`saleprice`) as `총매출` from `Order` where `custId`=(select `custId` from `Customer` where `name`='김연아');

#4-44
insert into `Book` (`bookId`, `bookName`, `publisher`) values (11, '스포츠의학', '한솔의학서적');

#4-45
update `Customer` set `address` = '대한민국 부산' where `custId` = 5;

#4-46
delete from `customer` where `custId` = 5;
