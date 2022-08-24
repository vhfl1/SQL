#날짜 : 2022/08/24
#이름 : 윤사랑
#내용 : 제4장 sql 고급

#4-1
create table `Member`(
   `uid` char(10) primary key,
   `name` varchar(10) not null,
   `hp` char(13) unique not null,
   `pos` varchar(10)  not null,
   `dep` tinyint,
   `rdate` datetime not null

);

create table `Department`(
  `depN0` int primary key,
  `name` varchar(10) not null,
  `tel` char(12) not null
);
create table `Sales`(
 `seq` int auto_increment primary key,
 `uid` varchar(10) not null,
 `year` year not null,
 `month` tinyint not null,
 `sale` int not null
);

#4-2

INSERT INTO `Member` VALUES ('a102', '김유신',   '010-1234-1002', '차장', 101, NOW());
INSERT INTO `Member` VALUES ('a103', '김춘추',   '010-1234-1003', '사원', 101, NOW());
INSERT INTO `Member` VALUES ('a104', '장보고',   '010-1234-1004', '대리', 102, NOW());
INSERT INTO `Member` VALUES ('a105', '강감찬',   '010-1234-1005', '과장', 102, NOW());
INSERT INTO `Member` VALUES ('a106', '이성계',   '010-1234-1006', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a107', '정철',     '010-1234-1007', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a108', '이순신',   '010-1234-1008', '부장', 104, NOW());
INSERT INTO `Member` VALUES ('a109', '허균',     '010-1234-1009', '부장', 104, NOW());
INSERT INTO `Member` VALUES ('a110', '정약용',   '010-1234-1010', '사원', 105, NOW());
INSERT INTO `Member` VALUES ('a111', '박지원',   '010-1234-1011', '사원', 105, NOW());

INSERT INTO `Department` VALUES (101, '영업1부', '051-512-1001');
INSERT INTO `Department` VALUES (102, '영업2부', '051-512-1002');
INSERT INTO `Department` VALUES (103, '영업3부', '051-512-1003');
INSERT INTO `Department` VALUES (104, '영업4부', '051-512-1004');
INSERT INTO `Department` VALUES (105, '영업5부', '051-512-1005');
INSERT INTO `Department` VALUES (106, '영업지원부', '051-512-1006');
INSERT INTO `Department` VALUES (107, '인사부', '051-512-1007');

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 1,  98100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 1, 136000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 1,  80100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2018, 1,  78000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 1,  93000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 2,  23500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 2, 126000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 2,  18500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 2,  19000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2018, 2,  53000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2019, 1,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 1, 109000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 1, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 1,  53500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2019, 1,  24000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 2, 160000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 2, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 2,  43000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2019, 2,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2019, 2, 109000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 1, 201000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 1,  63000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 1,  74000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2020, 1, 122000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2020, 1, 111000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 2, 120000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2020, 2,  93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 2,  84000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 2, 180000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a108', 2020, 2,  76000);

#4-3
select * from `member` where `name`<>'김춘추'; 
select * from `member` where `pos`in('사원', '대리');
select * from `member` where `name` like '%신';
select * from `member` where `name` like '정_'; #정씨로 시작하는 이름 한 자
select * from `member` where `name` = '김유신';
select * from `member` where `pos`='차장' and dep=101;
select * from `member` where `pos`='차장' or `dep`=101;
select * from `member` where `name` != '김춘추';
select * from `member` where `pos`='사원' or `pos`='대리';
select * from `member` where `dep` in (101, 102, 103);
select * from `member` where `name` like '김%';
select * from `member` where `name` like '김__';
select * from `member` where `name` like '_성_';
select * from `Sales` where `sale`>50000;
select * from `Sales` where `sale` >= 50000 and `sale` <100000 and `month`=1;
select * from `Sales` where `sale` between 50000 and 100000; 
select * from `Sales` where `sale` not between 50000 and 100000;
select * from `Sales` where `year` in(2020);
select * from `Sales` where `month` in(1, 2);

#4-4
select * from `Sales` order by `sale` asc;
select * from `Sales` order by `sale` desc;
select * from `Sales`
where `sale` > 50000
order by `year`, `month`, `sale` desc;
select * from `member` order by `name`;
select * from `member` order by `name` desc; 
select * from `member` order by `rdate` asc;
select * from `Sales` where `sale` > 50000 order by `sale` desc;

#4-5
select * from `Sales` limit 3;
select * from `Sales` limit 0, 3; 
select * from `Sales` limit 1, 2;
select * from `Sales` limit 5, 3;

select* from `Sales`
where `sale`> 50000
order by `year` desc, `month`, `sale` desc
limit 5;
select * from `sales` order by `sale` desc limit 3, 5;
select * from `Sales` where `sale` < 50000 order by `sale` desc limit 3;

#4-6
#4-7
#4-8
#4-9
#4-10
#4-11
#4-12
#4-13
#4-14
#4-15
#4-16
#4-17