drop database `java1db`;
create database `Java1DB`;
#실습1-7
drop table `TablUser`;
create table `TblUser` (
   `userId` varchar(10),
   `userName` varchar(10),
   `userHp` char(13),
   `userAge` tinyint,
   `userAddr` varchar(20)
);
drop table `TablProduct`;
create table `TblProduct`(
   `prdCode`      int,
   `prdName`      varchar(10),
   `prdPrice`     int,
   `prdAmount`    int,
   `prdCompany`   varchar(10),
   `prdMakeDate`  date
);

insert into `TblUser` values ('p101', '김유신', '010-1234-1001', 25, '서울시 중구');
insert into `TblUser` values ('p102', '김춘추', '010-1234-1002', 23, '부산시 금정구');
insert into `TblUser` (`userId`, `userName`, `userAge`, `userAddr`) values ('p103', '장보고', 31, '경기도 광주시');
insert into `TblUser` (`userId`, `userName`, `userAddr`) values ('p104', '강감찬', '경남 창원시');
insert into `TblUser` set `userId`='p105', `userName`='이순신', `userHp`='010-1234-1005', `userAge`=50;

insert into `TblProduct` values (1, '냉장고', 800, 10, 'LG', '2022-01-06');
insert into `TblProduct` values (2, '노트북', 1200, 20, '삼성', '2022-01-06');
insert into `TblProduct` values (3, 'TV', 1400, 6, 'LG', '2022-01-06');
insert into `TblProduct` values (4, '세탁기', 1000, 8, 'LG', '2022-01-06');
insert into `TblProduct` (`prdCode`, `prdName`, `prdPrice`, `prdAmount`) values (5, '컴퓨터', 1100, 0);
insert into `TblProduct` values (6, '휴대폰', 900, 102, '삼성', '2022-01-06');

select * from `TblUser`;
select `userName` from `TblUser`;
select `userName`, `userHp` from `TblUser`;
select * from `TblUser` where `userId`='p102';
select * from `TblUser` where `userId`='p104' or `userId`='p105';
select * from `TblUser` where `userAddr`='신라';
select * from `TblUser` where `userAge`>30;
select * from `TblUser` where `userHp` is null;
update `TblUser` set `userAge`=42 where `userId`='p104';
update `TblUser` set `userAddr`='경남 김해시' where `userId`='p105';
delete from `TblUser` where `userId`='p103';

select * from `Tblproduct`;
select `prdName` from `Tblproduct`;
select `prdName`, `prdPrice` from `Tblproduct`;
select * from `Tblproduct` where `prdCompany`='LG';
select * from `Tblproduct` where `prdCompany`='삼성';
update `Tblproduct` set `prdComPany`='삼성',
                        `prdMakeDate`='2021-01-01'
                      where `prdCode`=5;

create table `User2`(
  `uid` varchar(10) primary key,
  `name` varchar(10),
  `hp` char(13),
  `age` int
);

insert into `User2` values ('a103', '김유신', '010-1234-1001', 25);
insert into `User2` values ('a102', '김춘추', '010-1234-1002', 23);

create table `User3`(
  `uid` varchar(10) primary key,
  `name` varchar(10),
  `hp` char(13) unique,
  `age` int
);

insert into `User3` values ('a101', '김유신', '010-1234-1004', 25);
insert into `User3` values ('a102', '김춘추', '010-1234-1003', 23);

create table `Parent`(
  `pid` varchar(10) primary key,
  `name` varchar(10),
  `hp` char(13) unique
);

create table `Child`(
  `cid` varchar(10) primary key,
  `name` varchar(10),
  `hp` char(13) unique,
  `pid` varchar(10),
  foreign key (`pid`) references `Parent`(`pid`)
  
);

insert into `Parent` values ('p101', '이성계', '010-1234-1111');
insert into `Child` values ('c101', '이방원', '010-1234-2222', 'p101');

create table `User4`(
  `seq` int primary key auto_increment,
  `name` varchar(10),
  `gender` tinyint,
  `age` int,
  `addr` varchar(255)
);

insert into `User4`(`name`, `gender`, `age`, `addr`) values ('김유신', 1, 25, '김해시');
insert into `User4`(`name`, `gender`, `age`, `addr`) values ('김춘추', 1, 23, '경주시');
insert into `User4`(`name`, `gender`, `age`, `addr`) values ('신사임당', 2, 27, '강릉시');
delete from `User4` where `name`='신사임당';

#2-9
create table `User5`(
  `name` varchar(10) not null,
  `gender` tinyint,
  `age`  int default 1,
  `addr` varchar(10)
  
);
#2-10
insert into `User5` set `name`='김유신';
insert into `User5` set `name`='김춘추', `addr`='부산시';

#2-11
alter table `User5` add `hp` varchar(20);
alter table `User5` add `birth` char (10) default '0000-00-00' after `name`;
alter table `User5` add `uid` varchar(10) first;

#2-12
alter table `User5` modify `hp` char(13);
alter table `User5` modify `age` tinyint;

#2-13
alter table `user5` change column `addr` `address` varchar(100);

#2-14
alter table `User5` drop `gender`;

#2-15
create table `User6` like `User5`;

#2-16
insert into `User6` select * from `User5`;



