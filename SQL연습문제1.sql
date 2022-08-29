#날짜 : 2022/08/29
#이름 : 윤사랑
#내용 : SQL 연습문제1

#실습1-1
create database `Java1_Shop`;
create user 'java1_admin1'@'%' identified by '1234';
grant all privileges on `Java1_Shop`.* to 'java1_admin1'@'%';
flush privileges;

#실습1-2
drop table `customer`;
drop table `product`;
drop table `order`;
create table `Customer`(
       `custId` varchar(10) not null primary key,
       `name` varchar(10) not null,
       `hp` char(13) default null,
       `addr` varchar(100) default null,
       `rdate` date not null
);
create table `Product`(
       `prodNo` int not null primary key,
       `prodname` varchar(10) not null,
       `stock` int,
       `price` int default null,
       `company` varchar(20) not null
);
create table `Order`(
       `orderNo` int not null primary key,
       `orderId` varchar(10) not null,
       `orderProduct` int not null,
       `orderCount` int not null,
       `orderDate` datetime
);

#실습1-3
insert into `Customer` values ('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01');
insert into `Customer` values ('c102', '김춘추', '010-1234-1002', '경주시 보문', '2022-01-02');
insert into `Customer` values ('c103', '장보고', '010-1234-1003', '완도군 정산면', '2022-01-03');
insert into `Customer` values ('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04');
insert into `Customer` (`custId`, `name`, `rdate`) values ('c105', '이성계', '2022-01-05');
insert into `Customer` values ('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06');
insert into `Customer` (`custId`, `name`, `rdate`) values ('c107', '허준', '2022-01-07');
insert into `Customer` values ('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08');
insert into `Customer` values ('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09');
insert into `Customer` values ('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10');

insert into `Product` values (1, '새우깡', 5000, 1500, '농심');
insert into `Product` values (2, '초코파이', 2500, 2500, '오리온');
insert into `Product` values (3, '포카칩', 3600, 1700, '오리온');
insert into `Product` values (4, '양파링', 1250, 1800, '농심');
insert into `Product` (`prodNo`, `prodName`, `stock`, `company`) values (5, '죠리퐁', 2200, '크라운');
insert into `Product` values (6, '마카렛트', 3500, 3500, '롯데');
insert into `Product` values (7, '뿌셔뿌셔', 1650, 1200, '오뚜기');

insert into `Order` values (1, 'c102', 3, 2, '2022-07-01 13:15:10');
insert into `Order` values (2, 'c101', 4, 1, '2022-07-01 13:15:10');
insert into `Order` values (3, 'c108', 1, 1, '2022-07-01 13:15:10');
insert into `Order` values (4, 'c109', 6, 5, '2022-07-01 13:15:10');
insert into `Order` values (5, 'c102', 2, 1, '2022-07-01 13:15:10');
insert into `Order` values (6, 'c101', 7, 3, '2022-07-01 13:15:10');
insert into `Order` values (7, 'c110', 1, 2, '2022-07-01 13:15:10');
insert into `Order` values (8, 'c104', 2, 4, '2022-07-01 13:15:10');
insert into `Order` values (9, 'c102', 1, 3, '2022-07-01 13:15:10');
insert into `Order` values (10, 'c107', 6, 1, '2022-07-01 13:15:10');

#실습1-4
select * from `Customer`;

#실습1-5
select `custId`, `name`, `hp` from `customer`;

#실습1-6
select * from `product`;

#실습1-7
select `company` from `product`;

#실습1-8
select  distinct `company` from `product` ;

#실습1-9
select `prodName`, `price` from `Product`;

#실습1-10
select `prodName`, `price` + 500 as `조정단가` from `product`;

#실습1-11
select `prodName`, `stock`, `price` from `Product` where `company` = '오리온';

#실습1-12
select `orderProduct`, `ordercount`, `orderDate` from `Order` where `orderId` = 'c102';

#실습1-13
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderId` = 'c102' and `ordercount` >= 2;

#실습1-14
select * from `Product` where 2000 >= `price` and `price` >= 1000;

#실습1-15
select `custid`, `name`, `hp`, `addr` from `customer` where `name` like '김%';

#실습1-16
select `custid`, `name`, `hp`, `addr` from `customer` where `name` like '__';

#실습1-17
select * from `customer` where `hp` is null;

#실습1-18
select * from `Customer` where `addr` is not null;

#실습1-19
select * from `customer` order by `rdate` desc;

#실습1-20
select * from `Order` where `ordercount` >= 3
                      order by `ordercount` desc, `orderProduct` asc;
                      
#실습1-21
select avg(`price`) from `Product`;

#실습1-22
select sum(`stock`) as `재고량 합계` from `product` where `company` = '농심';

#실습1-23
select count(`custId`) as `고객수` from `Customer`;

#실습1-24
select count(distinct `company`) as `제조업체 수` from `Product`;

#실습1-25
select `orderProduct` as `주문 상품번호`, sum(`ordercount`) as `총 주문수량` 
from `Order` 
group by `orderProduct` 
order by `orderProduct` asc;

#실습1-26
select `company` as `제조업체`, count(*) as `제품수`, max(`price`) as `최고가` 
from `Product`
group by `company`
order by `company` asc;

#실습1-27
select `company` as `제조업체`, count(*) as `제품수`, max(`price`) as `최고가` 
from `Product` 
group by `company`
having count(*) >= 2;

#실습1-28
select `orderProduct`, `orderId`, sum(`orderCount`) as `총 주문수량` 
from `Order`
group by `orderProduct`, `orderId`
order by `orderProduct` asc, sum(`orderCount`) asc;

#실습1-29
select `orderId`, `prodName` from `Order` as a
join `product` as b
on a.`orderProduct` = b.`prodNo`
where `orderId` = 'c102';

#실습1-30
select `custid`, `name`, `prodname`, `orderdate` 
from `order` as a
join `customer` as b
on a.`orderid` = b.`custid`
join `Product` as c
on a.`orderProduct` = c.`prodNo`
where substr(`orderdate`, 1, 10) = '2022-07-01';


