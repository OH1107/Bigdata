use employees;

-- employees 데이터 베이스 이용
-- 셀렉션연산 / 관계연산자

-- titles 테이블에서 emp_no가 100000미만인 레코드를 검색하시오
select * from titles where emp_no < 100000;

-- titles 테이블에서 title이 engineer인 레코드를 검색하시오
select * from titles where title = 'Engineer';

-- titles 테이블에서 from date가 2000.1.1이후의 레코드를검색하시오
select * from titles where from_date > '2000-1-1';

-- titles 테이블에서 from date의 년도가 9999년이 아닌 레코드를 검색하시오.
select * from titles where year(from_date) != '9999';

-- 셀렉션연산/ 조건부에 논리연산자 이용

-- titles 테이블에서 emp_no가 400000 초과이거나 1000미만인 레코드를 검색하시오
select * from titles where emp_no > 400000 or emp_no < 1000;

-- titles 테이블에서 title이 Senior Engineer이고 from_date의 월이 5인 레코드를 구하시오
select * from titles where title = 'Senior Engineer' and month(from_date) ='5';

-- titles 테이블에서 to date가 2000년 1월 1일부터 2001년 12월 31일 사이의 레코드를 검색하시오
select * from titles where to_date >= '2000-1-1' and to_date <= '2001-12-31';

-- titles 테이블에서 emp_no가 400000 초과이거나 1000미만인 레코드를 검색하되 emp_no, title 필드만 출력하시오
select emp_no, title from titles where emp_no > 400000 or emp_no < 1000;

-- title 테이블에서 title이 staff이거나 from_date의 월이 11인 레코드를 검색하되 emp_no, title,from_date의 필드만출력하시오
select emp_no, title, from_date from titles where title='staff' or month(from_date)='11';

-- titles 테이블에서 to_date가 2001년과 2002년인 레코드를 검색하되 emp_no, title, to_date 필드만 출룍하시오
select emp_no, title, to_date from titles where year(to_date) = '2001' or year(to_date)=2002;

-- 문제적기힘드므로 생략 연습문제 4번슬라이드a
select emp_no, title from titles where emp_no>450000 and title ='Assistant Engineer' order by title;
select emp_no, last_name, first_name from employees where emp_no>300000 and gender ='M' order by last_name, first_name desc;
select emp_no, title from titles where title like '%Staff%' order by emp_no desc, title;