-- �׷��Լ�(�����Լ�)

--ROUND�Ἥ ������ ǥ��
SELECT  ROUND(AVG(salary)) ��տ���, MAX(salary), MIN(salary), SUM(salary) ���޵�������, COUNT(salary) �����ǰ���
From employees
WHERE job_id = 'IT_PROG';


-- �׷캰 �����Լ�
-- �׷��� GROUP BY : �׷����� ���� [�μ��� ��ձ޿�] ��� - ORDER BY�� �׻� ��������
SELECT  department_id �μ���, ROUND(AVG(salary)) ��ձ޿� 
From employees
GROUP BY department_id
ORDER BY department_id;

//�׷����� ���� �μ��� �ƴ� job_id�� SELECT�� X


--����1)
--SELECT department_id �μ���, �����, MAX(salary) �ְ�޿�, SUM(salary) �޿��հ�, ROUND(AVG(salary)) ��ձ޿�
--From employees
--GROUP BY department_id, salary
--ORDER BY department_id DESC;

SELECT department_id �μ���, COUNT(*) �����, MAX(salary) �ְ�޿�, MIN(salary) �ּұ޿�, SUM(salary) �޿��հ�, ROUND(AVG(salary)) ��ձ޿�
From employees
GROUP BY department_id
ORDER BY department_id DESC;


--����2)
--�μ��� ������ ������ �ٸ��� �ٸ� �׷�

SELECT department_id �μ���ȣ, job_id ����, SUM(SALARY) �޿��հ�, COUNT(*) ������
From employees
GROUP BY department_id, job_id
ORDER BY department_id;



--����3)
--SELECT 
--        AVG(MAX(salary)) �μ����ְ�������,
--        AVG(MIN(salary)) �μ��������������
--From employees
--GROUP BY department_id;

SELECT 
        ROUND(AVG(MAX(salary))) �μ����ְ�������,
        AVG(MIN(salary)) �μ��������������
From employees
GROUP BY department_id;

