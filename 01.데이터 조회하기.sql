-- ������ ��ȸ�ϱ�
select * from countries;

select department_name

from departments;


select department_id, department_name


-- ������ ��ȸ�ϱ�
select * from countries;
select department_id �μ���ȣ, department_name �μ��̸�
from departments;
--  �������(+-*/)
select last_name �̸�, job_id ����, salary ����, salary+100 ���ʽ�����, salary - salary*0.1 ����
from employees;
-- DISTINCT �ߺ� �� ����(�Ȱ��� ���� ������� �ϳ��� ǥ�õ�)
select DISTINCT job_id ����
from employees;

--���� ���� Ǯ��



//���� ������  ���ڿ�������
SELECT last_name 'is a 'job_id "���� ����"
from employees





where salary > 14000;

SELECT *
from employees
where last_name ='King'; //�������//,�����ʹ� ��ҹ��ڸ� �����Ѵ�. ���ڿ��� �Ѱ�����ǥ
                
SELECT *
from employees
where hire_date < '2002-06-10'; //��¥�� �񱳰� �ȴ�. �񱳽� ���ڿ��� ��¥���·� ������ �ڵ���ȯ��

SELECT employee_id = 100
from employees 
where

SELECT first_name = David
from employees 
where

SELECT employee_id =< 105
from employees 
where


--AND OR NOT ������
select last_name, department_id, salary
from employees
where department_id = 60
OR department_id = 80 AND salary > 10000);
--NOT
Select *
from employees
where not(hire_date >'2004/01/01' OR salary > 5000);
--where (hire_date <='2004/01/01' AND salary <= 5000);

-- 1
select *
from employees
where not(salary > 4000 AND job_id='IT_PROG');

-- 2
select *
from employees
where not(salary > 4000 AND job_id='IT_PROG' OR job_id='FI_ACCOUNT');



--IN ������
select * from employees
where salary = 4000 OR salary = 3000 OR salary = 2700;

select * from employees
where salary IN(4000, 3000, 2700);

--1
select* from employees
where salary IN(10000, 17000, 24000);

--2
select* from employees
where department_ID NOT IN(30, 450, 80, 100, 110);



--BETWEEN ������
--1
select*from employees
where salary between 10000 and 20000;

--2
select*from employees
where (hire_date between '2004-01-01' and '2004-12-30';

--3
select*from employees
where salary not between 7000 and 17000;




--LIKE ������ (��ȸ���ǰ��� ��ȮX) ���ڿ� Ű���� ��ȸ�� % �Ǵ� _ ���� ���
SELECT *
FROM employees
WHERE last_name LIKE 'B%'; --B�� �����ϴ� ��� ���ڿ� �˻�

SELECT *
FROM employees
WHERE last_name LIKE '%b%'; --�߰��� b�� ���� ��� ���ڿ� �˻�

SELECT *
FROM employees
WHERE job_id LIKE '__y'; --�����_�� �� �� ���ڸ� �ǹ�

--����1)
SELECT * FROM employees
WHERE job_id LIKE '%AD%';

--����2)
SELECT * FROM employees
WHERE job_id LIKE 'AD___'; 

--����3)
SELECT * FROM employees
WHERE job_id LIKE '%1234'; 

--����4)
SELECT * FROM employees
WHERE job_id NOT LIKE '%3%'; AND LIKE '%9';

--����5)
SELECT * FROM employees
WHERE job_id NOT LIKE '%MGR%'; OR '%ASST%';



--�ΰ��� �˻��Ҷ� is null
SELECT * FROM employees
where commission_pct is null;

--���� �ƴ� ��� is not null
SELECT * FROM employees
where commission_pct is not null;


--����)
SELECT * FROM employees
where manager_id is null;




-- ORDER BY ���ļ����� ����
SELECT*FROM employees
ORDER BY salary DESC; --���� ASC(������,����Ʈ ��������) DESC(��������)

--2�� �̻� ���� ���Ľ�
SELECT department_id, manager_id, first_name, last_name
FROM employees
ORDER BY department_id, manager_id; --ó���� �μ���ȣ���̰� ������ ������ȣ����

--��Ī���� ����
SELECT department_id, last_name, salary*12 ����
FROM employees
ORDER BY ���� DESC; //������ ū������ ����

--����1)
SELECT employee_id, first_name, last_name
FROM employees
ORDER BY employee_id DESC;

--����2)
SELECT * FROM employees
WHERE job_id LIKE '%CLERK%';
ORDER BY salary DESC;

--����3)
SELECT employee_id ������ȣ, last_name �̸�, department_id �μ���ȣ, salary ����
FROM employees
WHERE employee_id BETWEEN 120 and 150;
ORDER BY department_id, salary DESC;































