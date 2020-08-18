-- group by 연습
use sqldb;
select userid, sum(amount) from buytbl group by userid order by price;

-- 평균
select userid, avg(amount) 평균, max(amount) 최대값,min(amount)최소값 from buytbl group by userid;

-- count함수 행의 개수 세는 함수 * : 모든 행의 개수
select count(*) as '구매테이즐개수' from buytbl;

select userid,sum(amount) 총금액,  avg(amount) 평균,
max(amount) 최대값, min(amount) 최소값
from buytbl
group by userid
having  평균 >4
order by 총금액;

select num, groupname, sum(price * amount) as 비용
from buytbl
group by groupname, num
with rollup;

-- 쿼리3 연습문제

-- 1-1번
use employees;
select * from employees where birth_date < (select birth_date from employees where emp_no= '10010');
select birth_date from employees where emp_no= '10010';

-- 1-2번
select * from employees where birth_date > (select birth_date from employees where first_name ='Magy' and hire_date = '1995-09-26');
select birth_date from employees where first_name ='Magy' and hire_date = '1995-09-26';

-- 1-3번
select * from employees where birth_date > (select birth_date from employees where first_name = 'Magy' and hire_date > '1995-09-26' order by birth_date desc limit 1);
select * from employees where birth_date >all(select birth_date from employees where first_name = 'Magy' and hire_date > '1995-09-26');

select birth_date from employees where first_name = 'Magy' and hire_date > '1995-09-26' order by birth_date desc limit 1;

-- 1-4번
select * from employees where birth_date > (select birth_date from employees where first_name = 'Magy' and hire_date > '1995-09-26' order by birth_date limit 1);
select * from employees where birth_date >any(select birth_date from employees where first_name = 'Magy' and hire_date > '1995-09-26');

select birth_date from employees where first_name = 'Magy' and hire_date > '1995-09-26' order by birth_date;

-- 1-5번
select * from employees where birth_date =any(select birth_date from employees where first_name = 'Magy' and hire_date > '1995-09-26');
select * from employees where birth_date in (select birth_date from employees where first_name = 'Magy' and hire_date > '1995-09-26');

-- 2-1번
select title from titles limit 1000;

-- 2-2번
select distinct title from titles limit 1000;

-- 2-3번
use world;
select countrycode from city limit 2000;

-- 2-4번
select distinct countrycode from city limit 2000;

-- 3-1번
use employees;
select * from dept_emp where dept_no != 'd005' order by from_date, to_date limit 150;

-- 3-2번
select * from employees where first_name = 'Parto' or last_name like '%ford%' order by last_name limit 5;

-- 3-3번
select * from salaries limit 41, 10;

-- 4-1번
create table copy_dept_emp select * from dept_emp limit 1500;
select * from copy_dept_emp;

-- 4-2번
create table copy_titles select emp_no, title, from_date from titles order by title desc, emp_no desc limit 1300;
select * from copy_titles;