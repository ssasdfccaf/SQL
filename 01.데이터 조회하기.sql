-- ������ ��ȸ�ϱ�
select department_id �μ���ȣ, department_name �μ��̸� 
from departments;
-- �������(+-*/)
select last_name �̸�, job_id ����, salary ����, salary+100 ���ʽ�����, salary - salary*0.1 ����
from employees;
-- DISTINCT �ߺ� �� ���� (�Ȱ��� ���� ������� �ϳ��� ǥ�õ�)
select DISTINCT job_id ����
from employees;
-- ���� ���� Ǯ��
--1
select employee_id, first_name, last_name
from employees;
--2
select first_name, salary,  salary * 1.1  AS ��������
from employees;
--3
select employee_id �����ȣ, first_name �̸�, last_name ��
from employees;
-- ���� ������ || ���ڿ��� ����
SELECT last_name || ' is a '|| job_id as ��������
from employees;
-- ���� 4
SELECT employee_id, first_name||' '||last_name Ǯ����, email||'@company.com' �̸���
from employees;
-- WHERE ������
select *
from employees
where salary > 14000;

select *
from employees
where last_name = 'King'; -- ������� = , �����ʹ� ��ҹ��ڸ� �����Ѵ�. ���ڿ��� �Ѱ�����ǥ

SELECT * 
FROM employees
WHERE hire_date < '2002-06-10'; --��¥�� �񱳰� �ȴ�. �񱳽� ���ڿ��� ��¥���·� ������ �ڵ���ȯ��
-- AND OR NOT ������
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

-- IN ������
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

-- LIKE ������ ���ڿ� Ű���� ��ȸ�� % �Ǵ� _ ���� ���
SELECT *
FROM employees
WHERE last_name LIKE 'B%'; --B�� �����ϴ� ��� ���ڿ� �˻�
SELECT *
FROM employees
WHERE last_name LIKE '%b%'; --�߰��� b�� ���� ��� ���ڿ�
SELECT *
FROM employees
WHERE last_name LIKE '____y'; -- �����_�� �� �� ���ڸ� �ǹ�
-- ���� 1
SELECT * FROM employees
WHERE job_id LIKE '%AD%';
-- ���� 2
SELECT * FROM employees
WHERE job_id LIKE '%AD___';
-- ���� 3
SELECT * FROM employees
WHERE phone_number LIKE '%1234';
-- ���� 4
SELECT * FROM employees
WHERE phone_number NOT LIKE '%3%' AND phone_number LIKE '%9';
-- ���� 5
SELECT * FROM employees
WHERE job_id LIKE '%MGR%' OR  job_id LIKE '%ASST%';

-- �ΰ��� �˻��Ҷ� is null
SELECT * FROM employees
where commission_pct is null;
-- ���� �ƴ� ��� is not null
SELECT * FROM employees
where commission_pct is not null;
-- ���� 
SELECT * FROM employees
where manager_id is null;

-- ORDER BY ���ļ����� ����
SELECT * FROM employees
ORDER BY salary DESC; -- ASC(������,����Ʈ ��������) DESC(��������)
-- 2�� �̻� ���� ���Ľ�
SELECT department_id, employee_id, first_name, last_name 
FROM employees
ORDER BY department_id , employee_id; -- ó���� �μ���ȣ���̰� ������ ������ȣ����
-- ��Ī���� ����
SELECT department_id, last_name, salary*12 ����
FROM employees
ORDER BY ���� DESC; --������ ū������ ����
--1
SELECT employee_id, first_name, last_name
FROM employees
ORDER BY employee_id DESC;
--2
SELECT * FROM employees
where job_id LIKE '%CLERK%'
ORDER BY salary DESC;
-- 3
SELECT employee_id ������ȣ, last_name �̸�, department_id �μ���ȣ, salary ����
FROM employees
where employee_id BETWEEN 120 AND 150
ORDER BY department_id DESC, salary DESC;

