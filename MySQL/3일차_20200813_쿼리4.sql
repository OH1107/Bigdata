use employees;

-- select 쿼리 4
-- 1-1번
select count(*) `row 개수` from employees;
select count(emp_no) from employees;

-- 1-2번
select count(*) `남성 사원의 수` from employees group by gender having gender ='M';
select count(gender) `남성 사원의 수` from employees group by gender having gender ='M';

-- 1-3번
select count(*) `여성 사원의 수` from employees group by gender having gender= 'F';

-- 1-4번
select gender, count(*) `인원수` from employees group by gender;

-- case 문 활용하기
select
	case
		when gender = 'F' then '여자'
		when gender = 'M' then '남자'
	end as '성별',
    count(*) as 인원수
from employees
group by gender;

-- 1-5번
select count(distinct emp_no) from salaries where salary between 60000 and 70000;

-- 1-6번
select dept_no, count(dept_no) from dept_emp group by dept_no;

-- 1-7번
select dept_no, count(dept_no) from dept_emp where to_date > curdate() group by dept_no order by count(dept_no) desc;

select * from dept_emp;
select dept_no, count(dept_no) from dept_emp group by dept_no order by count(dept_no) desc;

-- 1-8번
select count(*) from world.country where indepyear is not null;

-- 1-9번
select count(IndepYear) from world.country;

-- 1-10번
select count(*), count(distinct region) from world.country;

-- 1-11번
select * from world.city;
select countrycode ,count(name) from world.city group by countrycode order by countrycode;

-- 2-1번
use employees;
select sum(salary), max(salary), min(salary), avg(salary), stddev(salary) from salaries;

-- 2-2번
select emp_no, sum(salary), max(salary), min(salary), avg(salary), stddev(salary) from salaries group by emp_no;

-- 2-3번
select * from salaries where salary > (select avg(salary) from salaries);

-- 2-4번
select count(*) from salaries where salary > (select avg(salary) from salaries);

-- 3-1번
select * from world.city;
select countrycode, name, sum(population) 인구수 from world.city group by countrycode, name with rollup;