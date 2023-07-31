
-- 1.
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM emp
where empno is not null;



-- 2.
select empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp
where upper(ename) = 'SMITH';

-- 3.
select ename, null, data_type
from emp
where ename =< '____';

-- 4.
select 
    count(distinct job) as job_count
    from emp;

--5.
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
from emp 
WHERE deptno = (select deptno
                        from emp
                        where ename = 'MARTIN')
and salary > (select salary
                    from emp
                    where ename = 'MARTIN');

--6.
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
from emp 
WHERE salary > (select salary
                    from emp
                    where depno = 30');


--8
rollback;


--9. 
select empno, ename, sal, comm, nvl(comm,0), sal*12+comm annsal
from emp;


--10.
select empno, deptno, sal
where sal >=3000
from dept;
