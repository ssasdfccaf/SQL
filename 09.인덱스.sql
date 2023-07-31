-- �������̺��� �ε��� ����
SELECT
    TABLE_NAME ���̺��,
    INDEX_NAME �ε����̸�,
    COLUMN_NAME �÷��̸�
FROM ALL_IND_COLUMNS
WHERE TABLE_NAME = 'EMPLOYEES';

--EMP_DEPARTMENT_IX
--EMP_JOB_IX
--EMP_MANAGER_IX
--EMP_NAME_IX
--EMP_NAME_IX
--���� �ٸ� ���̺� �ִ� Ű�̹Ƿ� �ڵ����� INDEX

--�⺻Ű, ����ũ ���� �ڵ����� �ε����� ������ ���� �⺻Ű�� �����ϴ� �ܷ�Ű�� �ε����� ����

CREATE TABLE members(
    member_id NUMBER,
    first_name VARCHAR2(100) NOT NULL,
    last_name VARCHAR2(100) NOT NULL,
    gender CHAR(1) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR2(255) NOT NULL,
    PRIMARY KEY(member_id) --���������� �Ʒ��� �࿡ ���� ���� �� ��ȣ �ȿ� ���� �̸� �Է�
);
SELECT
    TABLE_NAME ���̺��,
    INDEX_NAME �ε����̸�,
    COLUMN_NAME �÷��̸�
FROM ALL_IND_COLUMNS
WHERE TABLE_NAME = 'MEMBERS'; --���̺���� �빮��

select * from members
where last_name = 'Harse';

EXPLAIN PLAN FOR
 select * from members
 where last_name = 'Harse';
-- ���� Ȯ��
SELECT
        PLAN_TABLE_OUTPUT
FROM
        TABLE(DBMS_XPLAN.DISPLAY());

-- �ε��� ����� ����� ���̺��� last_name��, �̸��� members_last_name_i
CREATE INDEX members_last_name_i
ON members(last_name);

-- �ε��� ���� (�ε����� ���̺� ������ �ڵ�������)
// // �ε����� ���̺��� drop/���� �� ���� ����
DROP INDEX MEMBERS_LAST_NAME_I;







