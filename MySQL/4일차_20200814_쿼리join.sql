use sqldb;

insert into sqldb.usertbl values('kdong','홍길동',1725, '강원','010','12341234', 172,curdate());
select * from sqldb.usertbl;
-- 참조 무결성 제약조건 ( FK가 동시존재해야함)
insert into sqldb.buytbl values(null,'hong','운동화',null,30,15);
select * from buytbl;

update sqldb.buytbl set groupname = '전자제품' 
where groupname = '전자';


update buytbl set amount = '5'
where num = '8';

update buytbl set price = 1.1*price
where prodname ='모니터';

delete from buytbl
where num =5;

-- 삭제 불가 ( 참조 무결성 제약조건 때문 )
delete from usertbl
where userid ='BBK';

select curdate()-2;

select curdate()-'1995-11-7';
select datediff(curdate(),'1995-11-7');
select timestampdiff(year,'2014-3-2',curdate());


-- select 쿼리 join
use sqldb;
-- 1-1번
select * from sqldb.usertbl u join sqldb.buytbl b on u.userid=b.userid;

-- 1-2번
select * from usertbl u join buytbl b on u.userid=b.userid where u.userid='JYP';

-- 1-3번
select u.userid, u.name, u.addr, u.mobile1, u.mobile2, b.prodname, b.price, b.amount, price*amount as '총금액'
from usertbl u join buytbl b on u.userid=b.userid where u.userid='JYP';

-- 1-4번
select userid, name, addr from usertbl where userid in (select userid from buytbl);

-- 1-5번
select distinct u.userid, name, addr from usertbl u join buytbl b on u.userid=b.userid;

-- 1-6번
select distinct userid, name, addr from usertbl u where exists (select userid from buytbl b where u.userid=b.userid);

-- 1-7번
select userid, name, addr from usertbl where userid not in (select userid from buytbl);

-- 1-8번
select distinct userid, name, addr from usertbl u where not exists (select userid from buytbl b where u.userid=b.userid);

-- 2번 테이블 만들기

create database joinExdb;
use joinexdb;
create table stdtbl(
	`stdname` varchar(10) primary key,
    `addr` char(4)
);

create table stdclubtbl(
	`num` int auto_increment primary key,
    `stdName` varchar(10),
    `clubname` varchar(10)
);

create table clubtbl(
	`clubname` varchar(10) primary key,
    `roomNo` char(4)
);

use joinexdb2;
insert into clubtbl values ('수영','101호');
insert into clubtbl values ('바둑','102호');
insert into clubtbl values ('축구','103호');
insert into clubtbl values ('봉사','104호');

insert into stdtbl values ('김범수','경남');
insert into stdtbl values ('성시경','서울');
insert into stdtbl values ('조용필','경기');
insert into stdtbl values ('은지원','경북');
insert into stdtbl values ('바비킴','서울');

insert into stdclubtbl values(null,'김범수','바둑');
insert into stdclubtbl values(null,'김범수','축구');
insert into stdclubtbl values(null,'조용필','축구');
insert into stdclubtbl values(null,'은지원','축구');
insert into stdclubtbl values(null,'은지원','봉사');
insert into stdclubtbl values(null,'바비킴','봉사');

-- 4-1번
select sc.stdname, addr, c.clubname, roomno from stdclubtbl sc
join clubtbl c  on sc.clubname = c.clubname
join stdtbl s on sc.stdname = s.stdname;

select * from stdtbl
	inner join stdclubtbl
    on stdtbl.stdname = stdclubtbl.stdname
    inner join clubtbl
    on stdclubtbl.clubname = clubtbl.clubname;

-- 4-2번
select sc.stdname, addr, c.clubname, roomno from stdclubtbl sc
join clubtbl c  on sc.clubname = c.clubname
join stdtbl s on sc.stdname = s.stdname
where sc.stdname ='김범수';

-- 문제 폐기
select count(distinct stdname) `동아리에 가입한 학생수` from stdclubtbl;

-- outer join
select * from stdtbl s
left outer join stdclubtbl sc on s.stdname = sc.stdname; 

select * from stdclubtbl sc
right outer join clubtbl c on sc.clubname = c.clubname;

-- 5-1번
select s.stdname 동아리미가입학생 from stdtbl s
left outer join stdclubtbl sc on s.stdname = sc.stdname
where sc.clubname is null;

-- 5-2번
select c.clubname `가입학생 없는 동아리` from clubtbl c
left outer join stdclubtbl sc on c.clubname = sc.clubname
where stdname is null;

-- 5-3번
select s.stdname 동아리미가입학생 from stdclubtbl sc
right outer join stdtbl s on s.stdname = sc.stdname
where sc.clubname is null;

-- 5-4번
select c.clubname `가입학생 없는 동아리` from stdclubtbl sc
right outer join clubtbl c on c.clubname = sc.clubname
where stdname is null;

-- cross join
select * from stdtbl s
cross join stdclubtbl sc;

-- self join
create database empdb;
CREATE TABLE empTbl (
	emp CHAR(3), 
	manager CHAR(3), 
	empTel VARCHAR(8)
);

INSERT INTO empTbl VALUES('나사장',NULL,'0000');
INSERT INTO empTbl VALUES('김재무','나사장','2222');
INSERT INTO empTbl VALUES('김부장','김재무','2222-1');
INSERT INTO empTbl VALUES('이부장','김재무','2222-2');
INSERT INTO empTbl VALUES('우대리','이부장','2222-2-1');
INSERT INTO empTbl VALUES('지사원','이부장','2222-2-2');
INSERT INTO empTbl VALUES('이영업','나사장','1111');
INSERT INTO empTbl VALUES('한과장','이영업','1111-1');
INSERT INTO empTbl VALUES('최정보','나사장','3333');
INSERT INTO empTbl VALUES('윤차장','최정보','3333-1');
INSERT INTO empTbl VALUES('이주임','윤차장','3333-1-1');

select * from emptbl;
SELECT A.emp AS '부하직원' , B.emp AS '직속상관', B.empTel AS '직속상관연락처'
   FROM empTbl A
      INNER JOIN empTbl B
         ON A.manager = B.emp
   WHERE A.emp = '우대리';
   
   
-- on delete cascade 옵션을 fk에 추가하면 부모속성을지울때 해당 자식속성도 지워짐