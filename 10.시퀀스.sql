---- ������
--������ �⺻Ű PRIMARY KEY �� ������ ���� �� �������ִ� ����Ŭ ��ü

CREATE SEQUENCE ������1; -- ����(�ɼ� ����)
CREATE SEQUENCE ������2
start with 1000
INCREMENT by 10; --1000������ ����, 10�� �����ϴ� ������2

select * from user_sequences
where sequence_name = '������1';

-- ���̺� �Է½� ������ �����
DROP TABLE �μ�;
CREATE TABLE �μ� (
    ��ȣ number primary key,
    �̸� VARCHAR2(100)
    );
    
INSERT INTO �μ� VALUES(������2.NEXTVAL, '������');
INSERT INTO �μ� VALUES(������2.NEXTVAL, '���ߺ�');
INSERT INTO �μ� VALUES(������2.NEXTVAL, 'ȸ���');
INSERT INTO �μ� VALUES(������2.NEXTVAL, '�濵��');
select * from �μ�;

-- �������� ���簪 Ȯ�� CURRVAL
select ������1.currval from dual;
select ������2.currval from dual;


-- �������� ���� DROP
DROP SEQUENCE ������1;
DROP SEQUENCE ������2;

update_�μ�
set ��ȣ = ������1.NEXTVAL;
select * from �μ�;




