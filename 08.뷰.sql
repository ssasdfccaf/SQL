--- �� view  ������ ���̺�
CREATE VIEW EMP_V2
AS
select employee_id ������ȣ, first_name �̸�, last_name ��, email, hire_date, job_id
from employees;

select * from emp_v2;
INSERT INTO emp_v2 VALUES(207, '�浿', 'ȫ', 'HONG', '2023-7-31', 'IT_PROG');
-- ��� ���� �������� ���̺��� �ƴѵ� �Է��� ���� -> ������ �並 ���� ���̺� �Էµ�!
Delete from emp_v2 where ������ȣ = 207;
select * from employees;
// view ���� �� ��Ī ���(������ȣ)

-- �б⸸ ������ ��� �����(with read only)
CREATE VIEW EMP_read(������ȣ,�̸�,��,�̸���,�������,����)
AS
select employee_id ������ȣ, first_name �̸�, last_name ��, email, hire_date, job_id
from employees with read only;

select * from emp_read;
Delete from emp_read where ������ȣ =100;
-- �б⸸ ������ ��� DML(�Է�, ����, ����)�� �ȵ�.
