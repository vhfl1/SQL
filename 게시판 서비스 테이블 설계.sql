#날짜 : 2022/10/18
#이름 : 윤사랑
#내용 : 게시판 서비스 테이블 설계

#데이터베이스 생성
CREATE DATABASE `java1_board`;
CREATE USER 'java1_board'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `java1_board`.*TO 'java1_board'@'%';
FLUSH PRIVILEGES;

#회원 테이블 생성
CREATE TABLE `board_user` (
   `uid`		VARCHAR(20) PRIMARY key,
   `pass`	VARCHAR(255),
   `name`	VARCHAR(20),
   `nick`	VARCHAR(20) unique,
   `email`	VARCHAR(100) unique,
   `hp`		CHAR(13) unique,
   `grade`	TINYINT DEFAULT 2,
   `zip`		CHAR(5),
   `addr1`	VARCHAR(255),
   `addr2`	VARCHAR(255),
   `regip`	VARCHAR(100),
   `rdate`	datetime
);

#약관 테이블 생성
CREATE TABLE `board_terms` (
	`terms` 		TEXT,
	`privacy`	text
);

#게시물 테이블 생성
CREATE TABLE `board_article` (
	`no`			INT AUTO_INCREMENT PRIMARY KEY,
	`parent`		INT DEFAULT 0,
	`comment`	INT DEFAULT 0,
	`cate`		VARCHAR(20) DEFAULT 'free',
	`title`		VARCHAR(255),
	`content`	TEXT NOT null,
	`file`		TINYINT DEFAULT 0,
	`hit`			INT DEFAULT 0,	
	`uid`			VARCHAR(20) NOT null,
	`regip`		VARCHAR(100) NOT null,
	`rdate`		DATETIME NOT null
);

#파일 테이블 생성
CREATE TABLE `board_file` (
	`fno` 		INT AUTO_INCREMENT PRIMARY KEY,
	`parent`		INT,
	`newName`	VARCHAR(255),
	`oriName`	VARCHAR(255),
	`download`	INT DEFAULT 0,
	`rdate`     datetime
);

SELECT SHA('1234');
SELECT SHA2('1234', 256);

SELECT a.*, b.`nick` FROM `board_article` AS a
JOIN `board_user` AS b ON a.uid = b.uid
ORDER BY `no` DESC
LIMIT 10, 10;

SELECT COUNT(`no`) FROM `board_article`;
java1dbjava1dbjava1_collegejava1_college
INSERT INTO `board_article` (`title`, `content`, `uid`, `regip`, `rdate`)
SELECT `title`, `content`, `uid`, `regip`, `rdate` FROM `board_article`;

SELECT b.`orderNo`, b.`orderCount`, b.`orderDate`, a.`name`, c.`prodName`
FROM `customer` AS a
JOIN `order` AS b
ON a.custId = b.orderId
JOIN `product` AS c
ON b.orderProduct = c.prodNo;

SELECT a.*, b.`fno`, b.`oriName`, b.`download` FROM `board_article` AS a
left JOIN `board_file` AS b
ON a.`no` = b.`parent`
WHERE `no`=2;

UPDATE `board_article` SET `hit` = `hit` + 1 WHERE `no`=1;

SELECT c.`stdNo`, c.`stdName`, a.`lecName`, a.`lecNo`, b.`regMidScore`, b.`regFinalScore`, b.`regTotalScore`, b.`regGrade`  
FROM `lecture` AS a
JOIN `register` AS b
ON a.lecNo = b.regLecNo
JOIN `student` AS c
ON b.regStdNo = c.stdNo

ALTER TABLE `board_user` ADD COLUMN `sessId` VARCHAR(100) unique;
ALTER TABLE `board_user` ADD COLUMN `sessLimitDate` DATETIME;
ALTER TABLE `board_user` drop COLUMN `sessId`;
ALTER TABLE `board_user` drop COLUMN `sessLimitDate`;

UPDATE `board_user` SET `sessId`=NULL, `wessLimitDate`=NULL WHERE

java1_shopjava1_shoppingmall