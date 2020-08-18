use employees;

-- employees 데이터베이스 이용
-- select 문을 이용하여 6개 테이블의 모든 필드를 조회하시오
-- 셀렉션 연산

select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

-- 셀렉션 연산, 관계연산자 이용

-- employees 테이블에서 emp no가 400000 이상인 레코드를 검색하시오

select * from employees where emp_no>=400000;

-- employees 테이블에서 생일이 1960년 7월 28일인 사원을 검색하시오

select * from employees where birth_date = '1960-7-28';

-- employees 테이블에서 first name이 Karlis사원을 검색하시오.

select * from employees where first_name = 'Karlis';

-- employees 테이블에서 성별이 여자(F)가 아닌 사원을 검색하시오

select * from employees where gender != 'F';
select * from employees where not (gender = 'F');

-- 셀렉션연산/조건부에 논리연산자 이용

-- employees 테이블에서 emp_no가 200000이상이고 300000 미만인 레코드를 검색하시오
select * from employees where emp_no >=200000 and emp_no < 300000;

-- employees 테이블에서 입사년도가 1958년 이거나 1990년인 사원을 검색하시오
select * from employees where year(hire_date) = 1985 or year(hire_date) = 1990;

-- employees 테이블에서 성별이 여자 이면서 생일이 1990.5.20 이하인 사원을 검색하시오
select * from employees where gender ='F' and birth_date <= '1990-5-20';

-- 프로젝션연산

-- employees 테이블에서 emp_no가 400000 이상인 레코드릉 검색하되 first_name, last_name, gender 필드만 출력하시오
select first_name, last_name, gender from employees where emp_no>=400000;

-- employees 테이블에서 생일이 1960.7.28인 레코드를 검색하되 first_name, last_name, gender 필드만 출력하시오
select first_name, last_name, gender from employees where birth_date='1960-7-28';

-- employees 테이블에서 first_name이 Karlis인 사원을 검색하되 first_name, last_name, gender 필드만 출력하시오
select first_name, last_name, gender from employees where first_name = 'Karlis';

-- salaries 테이블에서 emp_no, salary, salary를 10% 올린 금액을 검색하시오
select emp_no, salary, salary*1.1 from salaries;

-- employees 테이블에서 성별이 여자가 아닌 사원을 검색하되 first_name, last_name, gender 필드만 출력하시오
select first_name, last_name, gender from employees where gender != 'F';

-- 프로젝션 연산, 결과필드이름 바꾸기, 
-- first_name ->이름, last_name->성 , gender -> 성별
-- 이름에 공백을 부여하고자 할 경우 `로 묶어준다.

-- employees 테이블에서 emp_no가 4000000 이상인 레코드를 검색하되 first_name, last_name, gender 필드만 출력하시오
select last_name as '성', first_name as '이름' , gender as '성별' from employees where emp_no>=400000;

-- 이름을 대한민국 형태로 성과 이름을 합쳐서 출력하시오 concat 함수 이용
select concat(last_name, first_name) as `성 이름` from employees;
select concat(last_name,' ', first_name) as `성 이름` from employees;



-- employees 테이블에서 퇴사한 사원의 레코드를 출력하시오 ----------------------------------------------------------------------
select * from employees join dept_emp on employees.emp_no=dept_emp.emp_no where to_date < now();

select e.emp_no, e.birth_date, e.first_name, e.last_name, d.from_date, d.to_date
from employees as e 
join dept_emp as d on e.emp_no=d.emp_no
-- join dept_manager as m on e.emp_no=m.emp_no 
where d.to_date > now();

-- 중복된 emp_no 찾기
select emp_no, count(*) as count from dept_emp group by emp_no having count(*)>1;  -- 사원급은 중복값 존재 (부서 이동 후 퇴사 가능)
select emp_no, count(*) as count from dept_manager group by emp_no having count(*)>1;  -- 매니저급은 중복값 없음

-- max(to_date) 찾기
select Max(to_date), emp_no, Max(dept_no), count(*) as count from dept_emp group by emp_no having count(*)>1;

-- 선생님 퇴사자 답 ------------------------------------------------------------
select * from dept_emp where emp_no not in(
select distinct emp_no from dept_emp where to_date>curdate()) order by emp_no;

-- 근무자 사원번호 
select distinct emp_no from dept_emp where to_date>curdate();

select * from dept_emp;

-- 다음문제 -------------------------------------------------------------------

-- employees 테이블에서 emp_no가 300000 초과하고 성별이 남자인 레코드를 검색하되 emp_no, last_name, first_name 필드만 추출하여 last_name의 오름차순으로 출력하시오.
select emp_no, last_name, first_name from employees where emp_no > 300000 order by last_name;

-- employees 테이블에서 emp_no가 300000 초과하고 성별이 남자인레코드를 검색하되 emp_no, last_name, first_name 필드만추출하여 last name의 오름차순, first_name의 내림차순으로 출력하시오
select emp_no, last_name, first_name from employees where emp_no > 300000 and gender = 'M' order by last_name, first_name desc;

-- employees 테이블에서 last_name에 on이라는 문자열이 있는 레코드를 검색하되 emp_no, last_name, first_name 필드만추출하여 last name의 내림차순, first_name의 오름차순으로 출력하시오
select emp_no, last_name, first_name from employees where last_name like '%on%' order by last_name desc, first_name;
