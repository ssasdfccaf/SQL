-- 데이터 조회하기
select department_id 부서번호, department_name 부서이름 
from departments;
-- 산술연산(+-*/)
select last_name 이름, job_id 직종, salary 월급, salary+100 보너스월급, salary - salary*0.1 감봉
from employees;
-- DISTINCT 중복 값 제거 (똑같은 값이 있을경우 하나만 표시됨)
select DISTINCT job_id 직종
from employees;
-- 예제 문제 풀기
--1
select employee_id, first_name, last_name
from employees;
--2
select first_name, salary,  salary * 1.1  AS 뉴셀러리
from employees;
--3
select employee_id 사원번호, first_name 이름, last_name 성
from employees;
-- 연결 연산자 || 문자열을 연결
SELECT last_name || ' is a '|| job_id as 직업정보
from employees;
-- 예제 4
SELECT employee_id, first_name||' '||last_name 풀네임, email||'@company.com' 이메일
from employees;
-- WHERE 조건절
select *
from employees
where salary > 14000;

select *
from employees
where last_name = 'King'; -- 같을경우 = , 데이터는 대소문자를 구별한다. 문자열은 한개따옴표

SELECT * 
FROM employees
WHERE hire_date < '2002-06-10'; --날짜도 비교가 된다. 비교시 문자열을 날짜형태로 적으면 자동변환됨
-- AND OR NOT 연산자
select last_name, department_id, salary
from employees
where department_id = 60
OR department_id = 80 AND salary > 10000; 
--NOT
select *
from employees
where not(hire_date >'2004/01/01' OR salary > 5000);
-- where (hire_date <='2004/01/01' AND salary <= 5000);
-- 1
select * from employees
where salary > 4000 AND job_id = 'IT_PROG';
-- 2
select * from employees
where salary > 4000 AND (job_id = 'IT_PROG' OR job_id = 'FI_ACCOUNT');

-- IN 연산자
select * from employees
where salary = 4000 OR salary = 3000 OR salary = 2700;

select * from employees
where salary IN(4000, 3000, 2700);
--1 
select * from employees
where salary IN(10000, 17000, 24000);
--2
select * from employees
where department_id NOT IN(30,50,80,100,110);

-- BETWEEN
--1
select * from employees
where salary BETWEEN 10000 AND 20000;
--2
select * from employees
where hire_date BETWEEN '2004-01-01' AND '2004-12-30';
--3
select * from employees
where salary NOT BETWEEN 7000 AND 17000;

-- LIKE 연산자 문자열 키워드 조회시 % 또는 _ 같이 사용
SELECT *
FROM employees
WHERE last_name LIKE 'B%'; --B로 시작하는 모든 문자열 검색
SELECT *
FROM employees
WHERE last_name LIKE '%b%'; --중간에 b가 들어가는 모든 문자열
SELECT *
FROM employees
WHERE last_name LIKE '____y'; -- 언더바_는 딱 한 문자를 의미
-- 예제 1
SELECT * FROM employees
WHERE job_id LIKE '%AD%';
-- 예제 2
SELECT * FROM employees
WHERE job_id LIKE '%AD___';
-- 예제 3
SELECT * FROM employees
WHERE phone_number LIKE '%1234';
-- 예제 4
SELECT * FROM employees
WHERE phone_number NOT LIKE '%3%' AND phone_number LIKE '%9';
-- 예제 5
SELECT * FROM employees
WHERE job_id LIKE '%MGR%' OR  job_id LIKE '%ASST%';

-- 널값을 검색할때 is null
SELECT * FROM employees
where commission_pct is null;
-- 널이 아닌 경우 is not null
SELECT * FROM employees
where commission_pct is not null;
-- 예제 
SELECT * FROM employees
where manager_id is null;

-- ORDER BY 정렬순서를 정함
SELECT * FROM employees
ORDER BY salary DESC; -- ASC(순차적,디폴트 생략가능) DESC(내림차순)
-- 2개 이상 열로 정렬시
SELECT department_id, employee_id, first_name, last_name 
FROM employees
ORDER BY department_id , employee_id; -- 처음에 부서번호순이고 같으면 직원번호순서
-- 별칭열로 정렬
SELECT department_id, last_name, salary*12 연봉
FROM employees
ORDER BY 연봉 DESC; --연봉이 큰순으로 정렬
--1
SELECT employee_id, first_name, last_name
FROM employees
ORDER BY employee_id DESC;
--2
SELECT * FROM employees
where job_id LIKE '%CLERK%'
ORDER BY salary DESC;
-- 3
SELECT employee_id 직원번호, last_name 이름, department_id 부서번호, salary 월급
FROM employees
where employee_id BETWEEN 120 AND 150
ORDER BY department_id DESC, salary DESC;

