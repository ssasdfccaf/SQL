-- ROWNUM �������� �Ϸù�ȣ
select ROWNUM, members.*
from members where ROWNUM <=5 ;
-- 6������ 10������? (�ο���� 1������ �ӽ÷� ��ȣ�� �ű�°Ŷ� �ٸ� �������δ� �˻��ȵ�)
select ROWNUM, members.*
from members where ROWNUM BETWEEN 6 AND 10;
//�ο�ѿ� -> �Ϸù�ȣ ���� (�Ϸù�ȣ �� 5��������)


--���̺� ���������� �Է½� �ӽù�ȣ ROWNUM�� �ִ� ���̺�
SELECT * FROM (select ROWNUM AS RN,members.* from members) 
WHERE RN BETWEEN 6 AND 10;
//RN ��Ī

-- ����(order by) ������ ROWNUM ��ȣ�� �ű�� ������
SELECT ROWNUM, MEMBERS.*
FROM MEMBERS
WHERE ROWNUM <= 5 ORDER BY FIRST_NAME;
-- ������ ���̺��� ���������� ���� ������ �ο������ ��ȣ
SELECT ROWNUM, A.*
FROM (
    SELECT MEMBER_ID, FIRST_NAME FROM MEMBERS ORDER BY FIRST_NAME
) A
WHERE ROWNUM <= 5;


select * from emp;
