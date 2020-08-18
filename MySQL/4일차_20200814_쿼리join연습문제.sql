-- 1-1번
use employees;
select * from employees e
inner join titles t
on e.emp_no=t.emp_no;

-- 1-2번
select * from employees e
inner join titles t
on e.emp_no=t.emp_no
where e.emp_no = 10007;

-- 1-3번
select first_name, last_name, title from employees e
inner join titles t
on e.emp_no=t.emp_no
where t.to_date>curdate();

-- 1-4번
select e.emp_no, e.first_name, e.last_name, e.hire_date, de.from_date, timestampdiff(year,e.hire_date,curdate()) `근무년수`
from employees e
	join dept_emp de
	on de.emp_no=e.emp_no
    join departments d
    on d.dept_no=de.dept_no
where dept_name ='Finance' and de.to_date>curdate();

-- 1-5번
select first_name, last_name, hire_date, timestampdiff(year,de.from_date,curdate()) `근무년수`
from employees e, dept_emp de, departments d
where e.emp_no = de.emp_no and d.dept_no = de.dept_no and d.dept_name = 'Finance' and de.to_date>curdate();


select first_name, last_name, hire_date, timestampdiff(year,hire_date,curdate()) `근무년수`
from employees 
where emp_no 
	in (select emp_no from dept_emp where dept_no = 
		(select dept_no 
        from departments 
        where dept_name='Finance') and to_date>curdate())
;

-- 1-6번
select first_name, last_name, dept_name, title, salary from employees e
	join dept_emp de
	on de.emp_no = e.emp_no
    join departments d
    on d.dept_no = de.dept_no
    join salaries s
    on s.emp_no = e.emp_no
    join titles t
    on t.emp_no = e.emp_no
where t.to_date>curdate()
order by salary desc
limit 1;

-- 가장 많이 받는 급여
select max(salary) from salaries where to_date>curdate();
-- 급여를 많이 받는 사원의 번호
select emp_no from salaries where salary=(select max(salary) from salaries) and to_date>curdate();

select e.first_name, d.dept_name, t.title, max(s.salary) from employees e
join titles t on e.emp_no = t.emp_no
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no=de.dept_no
join salaries s on s.emp_no = e.emp_no
where e.emp_no = (select emp_no from salaries s where salary=(select max(salary) from salaries) and to_date>curdate()) and t.to_date>curdate();

-- 1-7번
select first_name, last_name, dept_name, title, salary 
from employees e, dept_emp de, departments d, salaries s, titles t
where de.emp_no = e.emp_no and d.dept_no = de.dept_no and s.emp_no = e.emp_no and t.emp_no = e.emp_no and t.to_date>curdate()
order by salary desc
limit 1;

select first_name, salary from employees e, salaries s
where salary = (select max(salary) from salaries) and s.emp_no = e.emp_no; 


-- 1-8번
select e. emp_no, first_name, last_name, hire_date, to_date from employees e
	join dept_emp de
    on de.emp_no=e.emp_no
where de.emp_no not in (select distinct emp_no from dept_emp where to_date>curdate());

select * from dept_emp;

select distinct emp_no from dept_emp where to_date>curdate();