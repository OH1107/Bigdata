create database sqlDB;
use sqlDB;
create table `sqlDB`.`usertbl`(
	`userID` char(8) not null,
    `name` varchar(10) not null,
    `birthYear` int not null,
    `addr` char(2),
    `mobile1` char(3),
    `mobile2` char(8),
    `height` smallint,
    `mDate` Date,
    primary key (`userID`)
);

create table `buytbl`(
	num int not null auto_increment,
    userID char(8) not null,
    prodName char(8) not null,
    groupname char(4),
    price int not null,
    amount smallint not null,
    primary key (num),
    foreign key (userid) references usertbl(userid)
);



-- 회원테이블 데이터 입력

insert into usertbl (userID, name, birthYear, addr, mobile1, mobile2, height, mDate) values ('LSG','이승기',1987,'서울','011','1111111',182,'2008-8-8');
insert into usertbl (userID, name, birthYear, addr, mobile1, mobile2, height, mDate) values ('KBS','김범수',1979,'경남','011','2222222',173,'2012-4-4');
insert into usertbl (userID, name, birthYear, addr, mobile1, mobile2, height, mDate) values ('KKH','김경호',1971,'전남','019','3333333',177,'2007-7-7');
insert into usertbl (userID, name, birthYear, addr, mobile1, mobile2, height, mDate) values ('JYP','조용필',1950,'경기','011','4444444',166,'2009-4-4');
insert into usertbl (userID, name, birthYear, addr, mobile1, mobile2, height, mDate) values ('SSK','성시경',1979,'서울',null,null,186,'2013-12-12');
insert into usertbl (userID, name, birthYear, addr, mobile1, mobile2, height, mDate) values ('LJB','임재범',1963,'서울','016','6666666',182,'2009-9-9');
insert into usertbl (userID, name, birthYear, addr, mobile1, mobile2, height, mDate) values ('YJS','윤종신',1969,'경남',null,null,170,'2014-3-3');
insert into usertbl (userID, name, birthYear, addr, mobile1, mobile2, height, mDate) values ('JKW','조관우',1965,'경기','018','9999999',172,'2010-10-10');
insert into usertbl (userID, name, birthYear, addr, mobile1, mobile2, height, mDate) values ('BBK','바비킴',1973,'서울','010','0000000',176,'2013-5-5');
insert into usertbl (userID, name, birthYear, addr, mobile1, mobile2, height, mDate) values ('EJW','은지원',1978,'경북','011','8888888',174,'2014-3-3');

select * from usertbl;
select * from buytbl;
-- 구매 테이블 데이터 입력

insert into buytbl (userID, prodName, groupname, price, amount) values ('KBS','운동화',null,30,2);
insert into buytbl (userID, prodName, groupname, price, amount) values ('KBS','노트북','전자',1000,1);
insert into buytbl (userID, prodName, groupname, price, amount) values ('JYP','모니터','전자',200,1);
insert into buytbl (userID, prodName, groupname, price, amount) values ('BBK','모니터','전자',200,5);
insert into buytbl (userID, prodName, groupname, price, amount) values ('KBS','청바지','의류',50,3);
insert into buytbl (userID, prodName, groupname, price, amount) values ('BBK','메모리','전자',90,10);
insert into buytbl (userID, prodName, groupname, price, amount) values ('SSK','책','서적',15,5);
insert into buytbl (userID, prodName, groupname, price, amount) values ('EJW','책','서적',15,2);
insert into buytbl (userID, prodName, groupname, price, amount) values ('EJW','청바지','의류',50,1);
insert into buytbl (userID, prodName, groupname, price, amount) values ('BBK','운동화',null,30,2);
insert into buytbl (userID, prodName, groupname, price, amount) values ('EJW','책','서적',15,1);
insert into buytbl (userID, prodName, groupname, price, amount) values ('BBK','운동화',null,30,2);

desc usertbl;
desc buytbl;


select * from sqldb2.buytbl;
select * from sqldb2.usertbl;

-- usertbl에서 키가 170 이상인 레코드 출력
select * from usertbl where height >= 170;

-- usertbl에서 입사일자가 2010년 이상인 레코드 출력
select * from usertbl where mdate >= '2010-1-1';

-- usertbl에서 1년 후 예상키 출력 : 내키 +10
-- 필드명 바꾸기 : as , 필드명에 공백이 있으면 ``/ '' 로 묵어줌
select *, height+10 as `1년 후 키` from usertbl;

-- sertbl에서 생일이 1970년 미만이거나 주소가 전남인 레코드 출력
select * from usertbl where birthYear<1970 or addr='전남';

-- 입사일 년도가 2010 초과하는 레코드 출력
select * from usertbl where mDate>2010;   -- 날짜 데이터가 다른 형식으로 저장되기에 모든 데이터가 다 출력됨
select * from usertbl where year(mDate)>2010;  -- year()라는 함수로 mdate값의 연도만을 출력

-- mobile1의 값이 null인 레코드 출력
select * from usertbl where mobile1 is null;

-- mobile1의 값이 null이 아닌 레코드 출력
select * from usertbl where mobile1 is not null;

-- 성이 조씨인 레코드 출력
select * from usertbl where `name` like '조%';

/* 와일드 카드
% : 공백포함 모든 것
_ : 글자하나 대체
*/

-- region 필드에 east로 끝나는 레코드 출력
use world;
select * from country where `region` like '%east';

-- region 필드에 dle 문자열이 있는 레코드 출력
select * from country where `region` like '%dle%';

-- name 필드에 en 문자열이 있는 레코드 출력
select * from country where `name` like '%en%';

-- name 필드에 ar 문자열로 시작하는 레코드 출력
select * from country where `name` like 'ar%';

-- name 필드에 ar 문자열로 시작하면서 길이가 5자인 레코드 출력
select * from country where `name` like 'ar%' and length(name)=5;
select * from country where `name` like 'ar___';

-- country 테이블에서 100개 레코드만 출력
select * from country limit 100;

-- country 테이블에서 name 순으로 출력
-- 정렬 ( 오름차순 asc: default, 내림차순 desc)
select * from country order by `name` limit 100;
select * from country order by `name` desc limit 100;

-- 2단 정렬
select * from country order by `name`, code desc limit 100;

-- 필드만 선택 출력
select now();

-- country에서 code, name, region, capital 필드만 출력하며
-- code는 내림차순 정렬, 50레코드만 출력
-- GNP가 10000이상인 데이터들로 출력
select code, name, region, capital from country where GNP >= 10000  order by code desc limit 50;

-- 데이터가 숫자로 구성되어 있으며 연속적인 값 : Between... and
use sqldb;
select name, height from usertbl where height between 180 and 183;
-- 다른 쿼리식
select name, height from usertbl where height >= 180 and height <= 183;

-- 이산적인 값의 조건 : in ()
select name, addr from usertbl where addr in ('경남','전남','경북');
select name, addr from usertbl where addr not in ('경남','전남','경북');
-- 다른 쿼리식 ( or로 이어줄 수 있지만 기준점이 많아지면 귀찮아짐)
select name, addr from usertbl where addr = '경남' or addr='전남' or addr='경북';

-- 하부 쿼리 ( 쿼리문 안에 또 쿼리문이 들어 있는 것)
-- 하부 쿼리 값은 둘 이상이 되면 에러 발생
select height from usertbl where name = '김경호';
-- 본 문장
select name, height from usertbl where height > (select height from usertbl where name = '김경호');