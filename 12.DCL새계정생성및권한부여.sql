-- �� ������ �����Ϸ��� �Ϲ� �������� �۾�X, ������ �������� ����
CREATE USER john IDENTIFIED BY 1234; --��� 1234�������� ����

- ���ӱ��� �� �����ѵ��� ��Ƽ� �Ѳ����� CONNECT, RESOURCE ���� �ο�
GRANT CONNECT, RESOURCE TO john;
//�ý��� ����, ������Ʈ ����

-- ���� ����
REVOKE RESOURCE FROM john;
REVOKE CONNECT FROM john;

-- ���� ����(������ ����� ��� ������ ����)
DROP USER john CASCADE;