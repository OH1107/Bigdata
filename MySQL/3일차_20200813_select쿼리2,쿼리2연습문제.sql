use employees;

select * , curdate() as 오늘날짜
from employees
where emp_no between 30000 and 35000
order by last_name desc, first_name desc;

-- 비교연산자 논리연산자
select * , curdate() as 오늘날짜
from employees
where emp_no >=30000 and emp_no <=35000
order by last_name desc, first_name desc;

select *, year(birth_date) 생일년, month(birth_date) as 생일월, day(birth_date) 생일일
from employees;

select *, year(birth_date) 생일년, month(birth_date) as 생일월, day(birth_date) 생일일
from employees
where month(birth_date) in (5,8,11);

select *, year(birth_date) 생일년, month(birth_date) as 생일월, day(birth_date) 생일일
from employees
where month(birth_date) = 5 or month(birth_date) = 8 or month(birth_date) = 11;

-- 이건 됨 select 에서 별명을 정해주고 where문에는 포함안되나 order by는 마지막에 수행하기에 가능
select *, year(birth_date) 생일년, month(birth_date) as 생일월, day(birth_date) 생일일
from employees
where month(birth_date) in (5,8,11)
order by 생일년, 생일월, 생일일;

select * from employees
where first_name like 'den%';

select * from employees
where first_name like '%den%';

select * from employees
where last_name like '%ina';

-- 5번
select * from employees where first_name like '__________';

-- 6번
select * from employees where length(first_name) = 10;
-- 여기 까지가 select 쿼리 2 --------------------------------------------------------------------------------------



-- selcet 쿼리 2 연습문제 -----------------------------------------------------------------------------------------
-- 연습문제 1-1
select * from employees where emp_no between 20000 and 30000;

-- 연습분제 1-2
select * from salaries where salary between 50000 and 60000;

-- 연습문제 2-1
select * from dept_emp where dept_no in ('d001','doo5','d009');

-- 연습문제 2-2
select * from dept_emp 
where month(from_date) in ('1','5','8','12') and to_date > curdate();
-- 선생님답
select * from dept_emp 
where month(from_date) in ('1','5','8','12') and emp_no in (select emp_no from dept_emp where to_date>curdate());

-- 연습문제 3-1
select * from titles where title like 'Senior%';

-- 연습문제 3-2
select * from titles where title like '%sis%';

-- 연습문제 3-3
select * from titles where title like '%staff';

-- 연습문제 3-4
select * from titles where title like 'sta__';

-- 연습문제 3-5
select * from titles where title like '________';

-- 연습문제 3-6
select * from titles where length(title) >= '18';



select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

-- 현재 종사자의 평균 급여
select emp_no, max(salary) from salaries group by emp_no;