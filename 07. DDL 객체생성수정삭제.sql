-- ���̺� �����
DROP TABLE comp;
CREATE TABLE comp (
    ������ CHAR(10),
    ������ VARCHAR2(10)
);
DESC comp;
INSERT INTO comp VALUES('1', '�ϳ�');
INSERT INTO comp VALUES('2', '��');
INSERT INTO comp VALUES('3', '��');
select * from comp;

--���ڿ� ��¥ ���̺�
CREATE TABLE ex_date(
    id NUMBER(2),
    start_date DATE DEFAULT SYSDATE
);

DESC ex_date;
-- ����Ʈ��DEFAULT SYSDATE�� �ش翭�� ���� �Է����� �ʾ��� �� ����
INSERT INTO ex_date(id) VALUES(10);
INSERT INTO ex_date(id) VALUES(11);
INSERT INTO ex_date(id) VALUES(12);
select * from ex_date;

//�ѹ鴩���� ���̺� �����ְ� �Է³��� �����

DROP TABLE comp;
DROP TABLE ex_date;

---- ����1)
--CREATE TABLE sample_product(
--    CHAR(10),
--    product_name VARCHAR2(20)
--    );
--    id NUMBER(product_id),
--    menu_date DATE DEFAULT SYSDATE
--    
---- ����2)
--DROP TABLE sample_product;

-- ���̺� �������� 
-- : �ߺ�X, �߸��� Ʈ�����X
// // ���̺� �� �Ǵ� �ٸ� �࿡ �Է�
CREATE TABLE emp1 (
    id number(3) PRIMARY KEY, --�⺻Ű ����
    name VARCHAR2(20)
);
--
--DESC emp1;
--INSERT INTO empl VALUES( 1, '�浿');
--INSERT INTO empl VALUES( 1, '���'); --�⺻Ű�� �ߺ��ȵ�
--
--DESC emp1;
--INSERT INTO empl VALUES( 1, '�浿');
--INSERT INTO empl VALUES( null, '���'); --�⺻Ű�� �ΰ� �Է¾ȵ�
--

//NOT NULL ��������
CREATE TABLE emp1 (
    id number(3) PRIMARY KEY, --�⺻Ű 
    name VARCHAR2(20) NOT NULL --�ΰ��� �Է��Ҽ�����
    sal NUMBER CHECK(sal>1000) --üũ�� ������ �Է�
    );
//sal(����) 

DESC emp1;
INSERT INTO empl VALUES( 1, '�浿', 1001);
INSERT INTO empl VALUES( 1, '���', 2000);


-- ����) #
-- : members��� �� ���̺� �����
CREATE TABLE members(
    id number(2) PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    gender VARCHAR2(5) CHECK ( gender IN ('Man' , 'Woman')),
    birth_day DATE DEFAULT SYSDATE,
    emalil VARCHAR2(200) NOT NULL UNIQUE
);


-- �ܷ�Ű ����
-- : �ѿ��� ������ ���̺��� ������ �ܷ�Ű ���� ����


DESC �μ�;
INSERT INTO �μ� VALUES(1,'�濵');
INSERT INTO �μ� VALUES(2,'����');

DESC ����;
INSERT INTO ���� VALUES(1,'ȫ�浿',1);
INSERT INTO ���� VALUES(2,'���',2);


--//1�� �μ��� �����ϰ� ������
--DELETE FROM �μ� WHERE ��ȣ = 1;
DESC �μ�;
INSERT INTO �μ� VALUES(1,'�濵');
INSERT INTO �μ� VALUES(2,'����');
DELETE FROM �μ� WHERE ��ȣ = 1;

DESC ����;
INSERT INTO ���� VALUES(1,'ȫ�浿',1);
INSERT INTO ���� VALUES(2,'���',2);


--FOREIGN KEY
--REFERENCES dept


--- CREATE TABLE AS
DROP TABLE emp_temp;
CREATE TABLE emp_temp
AS
select * from emp where 1!=1; -- where�� ���ǿ� �����ϴ� �����Ͱ� ����
// // �������� select���� ����� emp_temp ����

select * from emp _temp; -- ���ǿ� ���� �Ǵ� �����Ͱ� �����Ƿ� ���� ����

.













































