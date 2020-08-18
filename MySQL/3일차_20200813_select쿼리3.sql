-- 1-1번 employees 테이블에서 frist_name이 Greger이고 last_name이 Angelopoulos 보다 늦게 태어난 사원의 레코드를 검색하시오
-- 하위 쿼리부터 작성
select birth_date from employees where first_name='Greger' and last_name='Angelopoulos';

-- 본 쿼리
select * from employees 
where birth_date > (select birth_date from employees where first_name='Greger' and last_name='Angelopoulos')
order by birth_date;

-- 1-2번
-- 하위 쿼리
select birth_date from employees where first_name='Aamer' and last_name='Bahl';

-- 본 쿼리
select * from employees 
where birth_date > (select birth_date from employees where first_name='Aamer' and last_name='Bahl')
order by birth_date;

-- 에러 코드 : 서브쿼리 값이 1개 이상의 레코드값을 리턴합니다.
-- 서브쿼리의 값은 무조건 1개의 레코드 값을 지녀야한다.

-- 1-3번
select * from employees 
where birth_date =any (select birth_date from employees where first_name='Aamer' and last_name='Bahl')
order by birth_date;
-- =any(서브쿼리) 는  in(서브쿼리)와 동일한 의미
-- some과 any와 동일한 의미로 사용

-- 1-4번
select * from employees 
where birth_date in (select birth_date from employees where first_name='Aamer' and last_name='Bahl')
order by birth_date;

-- 2-1번
select emp_no from salaries where salary < 40000;

-- 2-2번
select distinct emp_no from salaries where salary<40000;

-- 2-3번
select distinct emp_no , salary from salaries where salary<40000;

-- 2-4번
use world;
select distinct Language from countrylanguage;

-- 번외
use employees;
select concat(last_name, first_name) from employees order by last_name, first_name;
select concat(last_name, first_name) from employees order by last_name, first_name;
select distinct last_name, first_name from employees order by last_name, first_name;

-- 3-1번
use employees;
select emp_no from salaries where salary < 40000 order by salary desc limit 100;

-- 3-2번
select * from employees where gender ='F' order by last_name limit 50;

-- 3-3번 limit 21번째부터 10개
select * from employees order by last_name limit 21,10;

-- 4-1번
create table `copy salaries` select * from salaries limit 500;
select * from `copy salaries`;

-- 4-2번
create table copy_employees select emp_no, first_name, last_name, gender from employees order by first_name, last_name limit 300;
select * from copy_employees;