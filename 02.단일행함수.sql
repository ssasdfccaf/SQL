-- �������Լ�
select LOWER('ABC') , UPPER('abc'), INITCAP('abc')
from dual;

-- CONCAT, SUBSTR(���ڿ�, ������ġ, ���ڿ�����)
select CONCAT('��ο�', ' ����!'),  SUBSTR('��ο����',2,2), LENGTH('��ο�'),
            INSTR('��ο�', '��'), TRIM('      ����      '), '      ����      '
from dual;

-- ������ �Լ� ����
SELECT department_id, last_name, department_id
FROM employees
WHERE lower(last_name) = 'higgins';

select last_name, CONCAT('��������  ', job_id)  as  ������
from employees
where SUBSTR(job_id, 4, 3) = 'REP';

--���ڿ� ġȯ �Լ� replace
SELECT REPLACE('��ο����', '����', '����') FROM DUAL;

-- ����)
SELECT  LOWER('LAST_NAME'), UPPER('last_name'), INITCAP('email')
from dual;

-- ����)
select SUBSTR('job_id',1,2)
from dual;

-- ������ �Լ� : round�� �ݿø�, trunc�� ����
select ROUND(15.193,1) �Ҽ�ù°, ROUND(15.193) ����, ROUND(15.193,2) �Ҽ���°
-- �ڸ����� 1�̸� �Ҽ�ù°�ڸ����� �ݿø�, �ڸ����� ������ ����
from dual; 

select TRUNC(15.193,1) �Ҽ�ù°, TRUNC(15.193) ����, TRUNC(15.193,2) �Ҽ���°
-- �Ҽ�ù°�ڸ����� ����
from dual; 

-- mod�� ���� ������
-- ¦����° ��ȣ�� ���� ������
select employee_id ¦����ȣ, last_name �̸�
from employees
where MOD (employee_id, 2) = 0
order by 1; //ù��°���� ����

select SALARY ROUND(SALARY/30) ����,  ROUND (SALARY/30,1) �Ҽ�ù°, ROUND(SALARY/30,10) 10���ڸ�
from employees
order by 1;

-- ��¥�� �Լ�  //sysdate=���糯¥�ͽð�
SELECT ROUND(sysdate, 'DD') ��, 
              ROUND(sysdate, 'MM') ��,
              ROUND(sysdate, 'YYYY') �⵵,
              MONTHS_BETWEEN('2017/10/10', '2017/07/10') ������,
              ADD_MONTHS('2017/07/10', 3) �ֵ�վ�
FROM dual;

-- ��¥����
SELECT SYSDATE-1 ����, SYSDATE ����, SYSDATE+1 ���� 
FROM DUAL;

-- 90�� �μ� �������� �ٹ����� (���ñ���)
SELECT last_name, FLOOR(SYSDATE - hire_date) �ٹ��ϼ�
FROM employees
WHERE department_id = 90;

--����1)
SELECT SYSDATE,  hire_date,  MONTHS_BETWEEN(SYSDATE, hire_date)
FROM employees
WHERE department_id = 100;

 //�Ҽ���X
SELECT SYSDATE,  hire_date,  FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date))       
FROM employees
WHERE department_id = 100;

 //�Ҽ���1�ڸ�
SELECT SYSDATE,  hire_date, TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date), 1)              
FROM employees
WHERE department_id = 100;

--����2)
SELECT  hire_date,              
FROM employees
WHERE employee_id
BETWEEN 100 AND 106;


-- ��ȯ�� �Լ� 
-- CHAR = CHARACTER ����
-- TO_CHAR ���ڸ� ���Ŀ� �°� ���ڿ��� ǥ��
SELECT 
TO_CHAR(12345678, '999,999,999') �޸�,
TO_CHAR(123.45678,'999,999,999.99') �Ҽ���,
TO_CHAR(123.45678, '$999,999,999.99') �޷�,
TO_CHAR(12345678, 'L999,999,999') ��ȭ
FROM DUAL;

-- ��¥�� ���ڿ��� ��ȯ
-- ��, ��, ��, ��, ��, �� ����
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') ���糯¥�ð�
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') ���糯¥�ð�
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY MM DD HH24:MI:SS') ���糯¥�ð�
FROM DUAL;

--���� 1)
--SELECT EMPLOYEE_ID, TO_CHAR(SYSDATE, 'MM/YY') �Ի��
--from employees;
--department_id=100;
SELECT EMPLOYEE_ID, TO_CHAR(hire_date, 'MM/YY') �Ի��
from employees;
department_id=100;


--���� 2)
--SELECT last_name �̸�, TO_CHAR(salary>$10,000, '$999,999,999.99') ����
--from employees;
SELECT last_name �̸�, TO_CHAR(salary, '$99,999.99') ����  
from employees WHERE salary>10000 ORDER BY salary DESC;
//$99,999.99-���ڿ��� ���ڿ��� �ٲ۰� 
// 10,000(X)-�����̹Ƿ� �޸� ���� �ȵ�

-- ���ڸ� DATE Ÿ������ ��ȯ�ϴ� ����
SELECT TO_DATE('2011-01-01' , 'YYYY-MM-DD') 
FROM DUAL;

-- ���ڸ� ���ڷ� ��ȯ�ϴ� ����
SELECT TO_NUMBER('012') 
FROM DUAL;

SELECT TO_NUMBER('012') +10
FROM DUAL;

--�ΰ� ���� �Լ�
--NVL�Լ��� null�� ��ſ� ���� �ٲ���
select last_name, NVL(manager_id, '����') �Ŵ���
from employees where last_name = 'king';

select last_name, NVL(manager_id, 0) �Ŵ���
from employees where last_name = 'King';

--NVL2�� �ش翭�� �ΰ��� �ƴ� ���� �ΰ��� ��� ��� ���� �ٲ���
select last_name, NVL2(manager_id, 1, 0) �Ŵ���
from employees where last_name = 'King';


----����1)
--select last_name �̸�, salary ����, commision_pct Ŀ�̼�,  NVL((salary*12) + (salary*12*commision))  ����
--from employees

--����1) Ŀ�̼��� �ΰ� ��� 0���� �ٲ����
SELECT last_name �̸�, salary ����,  NVL(commission_pct , 0) Ŀ�̼�,
            salary*12 + salary*12*NVL(commission_pct, 0)  ����
FROM employees ORDER BY ���� DESC;

----����2)
--select last_name �̸�, salary ����, commision_pct Ŀ�̼�,  NVL2(salary*12, ((salary*12) + (salary*12*commision)))  ����
--from employees

--����2) commission = Ŀ�̼� ö������
SELECT last_name �̸�, salary ����,  NVL(commission_pct , 0) Ŀ�̼�,
            salary*12 + salary*12*NVL(commission_pct, 0)  ����,
            NVL2(commission_pct, '����+Ŀ�̼�', '���޸�') ���������
FROM employees ORDER BY ���� DESC;


-- decode �Լ�
SELECT last_name �̸�, job_id, salary,
      DECODE(job_id, 'IT_PROG', salary * 1.10,
                             'ST_CLERK', salary * 1.15,
                                'SA_REP', salary * 1.20,
                                              salary) "��������"
 FROM employees;
--job_id�� IT_PROG�� ������ salary��ŭ ���

--����) ���޿� ���� ���� ��Ÿ����
--SELECT last_name �̸�, ����, salary ����, tax rate ����
--  DECODE('TRUNC (salary/2000)', 0, salary,
--                                                 1, salary*0.09,
--                                                 2, salary*0.2,
--                                                 3, salary*0.3,
--                                                 4, salary*0.4,
--                                                 5, salary*0.42,
--                                                 6, salary*0.44,
--                                                 7, salary*0.45,
--                                                 Tax Rate) "����"
--FROM employees;

SELECT last_name �̸�, job_id ����, salary ����,
  DECODE( TRUNC (salary/2000),  0, 0,
                                                 1, 0.09,
                                                 2, 0.2,
                                                 3, 0.3,
                                                 4, 0.4,
                                                 5, 0.42,
                                                 6, 0.44,
                                                     0.45 ) "����"
FROM employees;



-- CASE ���� �� ����
SELECT last_name �̸�, job_id ����, salary ����,
          CASE  WHEN salary<5000 THEN 'Low'
                    WHEN salary<10000 THEN 'Medium'
                    WHEN salary<20000 THEN 'Good'
                     ELSE                                ' Excellent'
    END "�޿� ����"
FROM employees;



--����)
--SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY ����,
--    CASE  WHEN salary>9000 THEN '����'
--                    WHEN 6000<salary THEN '����'
--                    WHEN salary<8999 THEN '����'
--                    
--                     ELSE                                        '����'
--    END "�޿� ���"
--FROM employees WHERE

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY ����,
    CASE  WHEN salary>=9000          THEN '����'
                    WHEN salary>6000   THEN '����'
                    WHEN salary<8999      THEN '����'              
                     ELSE                                    '����'
    END "�޿� ���"
FROM employees WHERE job_id = 'IT_PROG';



