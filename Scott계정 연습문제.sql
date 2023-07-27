
-- Scott계정 연습문제 --
select * 
from emp
where ;


1 #
SELECT DEPTNO 부서번호, EMPNO 사원번호, ENAME 이름, SAL 월급
FROM EMP WHERE DEPTNO = 10
ORDER BY DEPTNO;

2
SELECT EMPNO 사원번호, ENAME 이름, HIREDATE 입사일, DEPTNO 부서번호
FROM EMP WHERE EMPNO = 7369
ORDER BY DEPTNO;

3
SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
FROM EMP 
WHERE ENAME = 'ALLEN'
ORDER BY DEPTNO;

4
SELECT ENAME 이름, SAL 월급 , DEPTNO 부서번호
FROM EMP 
WHERE HIREDATE = '81/02/20'
ORDER BY DEPTNO;

5 #
SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
FROM EMP 
WHERE JOB ! = 'MANAGER'
ORDER BY DEPTNO;

6
SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
FROM EMP 
WHERE HIREDATE >= '81/04/02'
ORDER BY DEPTNO;

7
SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
FROM EMP 
WHERE SAL >= 800
ORDER BY DEPTNO;

8
SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
FROM EMP 
WHERE DEPTNO >= 20
ORDER BY DEPTNO;

--9 WHERE ename >= 'L';
SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
FROM EMP 
WHERE ENAME > 'K'
ORDER BY DEPTNO;

10
SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
FROM EMP 
WHERE HIREDATE < '81/12/09'
ORDER BY DEPTNO;

11 #
--FROM EMP WHERE EMPNO =< 7698
SELECT EMPNO 직원번호, ENAME 이름
FROM EMP
WHERE EMPNO <= 7698
ORDER BY DEPTNO;

12 #
--WHERE HIREDATE =< '81/04/02', HIREDATE => '82/12/09'
SELECT HIREDATE 입사일, ENAME 이름, SAL 월급, DEPTNO 부서번호
FROM EMP  
WHERE HIREDATE >= '1981-04-02' AND HIREDATE <= '1982-12-09'
ORDER BY DEPTNO;

13
SELECT ENAME 이름, JOB 직업 , SAL 급여
FROM EMP WHERE SAL > 1600 AND SAL <3000
ORDER BY DEPTNO;

14 //직원번호가 7654와 7782 사이가 아닌 //NOT AND
--SELECT ENAME 이름, JOB 직업 , SAL 급여
--FROM EMP WHERE ENAME NOT LIKE BETWEEN 7654 AND 7782 
--ORDER BY DEPTNO;

--SELECT EMPNO 직원번호, ENAME 이름, JOB 직업 ,  SAL 급여
--FROM EMP WHERE EMPNO ! = 7654 AND 7782
--ORDER BY DEPTNO;

SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
FROM EMP 
WHERE EMPNO < 7654 OR EMPNO > 7782
ORDER BY DEPTNO;

?
SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
FROM EMP 
WHERE EMPNO NOT('7654' AND '7782')
ORDER BY DEPTNO;

--15 # NOT LIKE과 ! 차이
SELECT ENAME 이름, JOB 직업 , SAL 급여
FROM EMP 
WHERE ENAME BETWEEN 'B' AND  'J'
ORDER BY DEPTNO;

16 // WHERE NOT(HIREDATE>=' ' AND HIREDATE<=' ') -괄호,부등호방향
--SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
--FROM EMP WHERE HIREDATE NOT LIKE 81
--ORDER BY DEPTNO;

--SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
--FROM EMP WHERE HIREDATE NOT BEWEEN 81
--ORDER BY DEPTNO;

SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
FROM EMP WHERE NOT (HIREDATE>='81/01/01' AND HIREDATE<='81/12/31')
ORDER BY DEPTNO;


17 # //OR 뒤에 JOB꼭
SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
FROM EMP WHERE JOB = 'MANAGER' OR JOB ='SALESMAN'
ORDER BY DEPTNO;

18 // 제외 NOT IN( , )
--SELECT ENAME 이름, EMPNO 사원번호, DEPTNO 부서번호
--FROM EMP 
--WHERE DEPTNO NOT IN =(20, 30);
--ORDER BY DEPTNO;
select ename, empno, deptno
from emp
where deptno not in (20,30);

19 //LIKE 'S%'
select empno, ename, hiredate, deptno
from emp
where ename like 'S%';

20 //BETWEEN 1981/01/03 AND 1981/12/31
select empno, ename, hiredate, deptno
from emp
where hiredate between '1981-01-01' AND '1981-12-31';


21 # //where...like '%'
--SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
--FROM EMP 
--WHERE ENAME = 'S'
--ORDER BY DEPTNO;
SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
FROM EMP 
WHERE ENAME LIKE '%S%';

22
SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
FROM EMP 
WHERE ENAME LIKE 'M____N'
ORDER BY DEPTNO;

23
SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
FROM EMP 
WHERE ENAME LIKE '_A%'
ORDER BY DEPTNO;

24 #
--SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
--FROM EMP 
--WHERE COMM LIKE 'IS NULL'
--ORDER BY DEPTNO;
SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
FROM EMP 
WHERE COMM IS NULL
ORDER BY DEPTNO;

25 //where ...is not null
--SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
--FROM EMP 
--WHERE COMM LIKE 'IS NOT NULL'
--ORDER BY DEPTNO;

SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
FROM EMP 
WHERE COMM IS NOT NULL
ORDER BY DEPTNO;

--26 # DEPTNO T유의
--SELECT DEPTNO 부서번호, ENAME 이름, SAL 월급
--FROM EMP 
--WHERE SAL>1500
--ORDER BY DEPTNO;

--SELECT DEPTNO 부서번호, ENAME 이름, SAL 월급
--FROM EMP 
--WHERE DEPNO=30 AND SAL>=1500
--ORDER BY DEPTNO;

SELECT EMPNO 사원번호, ENAME 이름, SAL 월급
FROM EMP 
WHERE DEPTNO=30 AND SAL>=1500;



27
SELECT DEPTNO 부서번호, ENAME 이름, SAL 월급
FROM EMP 
WHERE ENAME='K%' OR DEPTNO=30
ORDER BY DEPTNO;

28
SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
FROM EMP 
WHERE SAL>=1500 AND DEPTNO=30 
AND JOB='MANAGER'
ORDER BY DEPTNO;

29
--SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
--FROM EMP 
--WHERE DEPTNO=30 
--ORDER BY DEPTNO;
SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
FROM EMP 
WHERE DEPTNO=30 
ORDER BY EMPNO;

30 # //SORT 정렬 
SELECT EMPNO 사원번호, ENAME 이름, JOB 직업 , MGR 상사, HIREDATE 입사일, SAL 월급, COMM 커미션 , DEPTNO 부서번호
FROM EMP 
ORDER BY SAL DESC;


31 //ASCENDINGSORT
--SELECT DEPTNO 부서번호, ENAME 이름, SAL 월급
--FROM EMP 
--ORDER BY DEPTNO;
SELECT DEPTNO 부서번호, ENAME 이름, SAL 월급
FROM EMP 
ORDER BY DEPTNO ASC, SAL DESC;

32 # //DECENDINGSORT
--SELECT DEPTNO 부서번호, ENAME 이름, SAL 월급
--FROM EMP 
--ORDER BY DEPTNO DESC
--ORDER BY ENAME
--ORDER BY SAL DESC;

SELECT DEPTNO 부서번호, ENAME 이름, SAL 월급
FROM EMP 
ORDER BY DEPTNO DESC, ENAME, SAL DESC;

33 ##
--SELECT ENAME 이름, SAL 급여, BONUS 보너스, DEPTNO 부서번호 
--ROUND(SAL*0.13)
--FROM EMP
--ORDER BY DEPTNO;
--
--SELECT ENAME 이름, SAL 급여, ROUND(SAL*0.13) BONUS 보너스, DEPTNO 부서번호 
--FROM EMP
--WHERE DEPTNO = 10;

select ename, sal, round(sal*0.13) bonus
from emp
where deptno=10;


34 # //총액=급여+커미션
--SELECT ENAME 이름, SAL 급여, COMM 커미션, SUM 총액
--NVL
--FROM EMP
--ORDER BY SUM DESC;

--SELECT ENAME 이름, SAL 월급,  NVL(commission_pct , 0) 커미션, SUM(salary) 총액
--FROM employees 
--salary*12 + salary*12*NVL(commission_pct, 0)  연봉
--ORDER BY SUM DESC;

--SELECT last_name 이름, salary 월급,  NVL(commission_pct , 0) 급여+커미션,
--FROM employees 
--ORDER BY 연봉 DESC;

--SELECT ENAME,SAL,NVL(comm ,0), SAL + NVL(comm , 0) TOTAL,
--FROM EMP
--ORDER BY TOTAL DESC;

--SELECT ENAME,SAL,NVL(COMM,0), SAL + NVL(COMM,0) TOTAL
--FROM EMP
--ORDER BY TOTAL DESC;

select ename, sla, nvl(comm, 0), coalesce(sal+comm, sal) total
from emp
order b coalesce(sal_comm, sal) desc ;

35 //콤마 , 꼭 적기
--SELECT ENAME 이름, SAL 급여, MON(salary*012) 회비
--FROM employees 
--BETWEEN SAL>1500 AND SAL<3000 
--ORDER BY SUM DESC;
SELECT ENAME, SAL TO_CHAR(ROUND(SAL*0.15,1), '$999.0') 회비
FROM emp
WHERE SAL BETWEEN 1500 AND 3000;

select ename, sal, to_char(round(sal*0.15,1), '$999.0') 회비
from emp
where sal between 1500 and 3000;

--------------------------------------------------------------------------------------------------------------------------------------어렵
36 #
--select e.employee_id 직원번호, e.last_name 직원이름, e.department_id 부서번호, d.department_name 부서명
select d.dname, count(e.empno)
from emp e
JOIN dept d ON e.deptno=d.deptno
group by d.dname
having count(e.empno) > 5;


37 //직업별로 그룹나누기
--SELECT JOB, SUM(x) SUM(sal)(o) 급여합계
SELECT JOB, SUM(sal) 급여합계
FROM EMP
WHERE JOB != 'SALESMAN'
GROUP BY JOB
HAVING SUM(SAL) > 5000
ORDER BY SUM(SAL) DESC;


38 ####
SELECT e.empno, e.ename, e.sal, s.grade
FROM EMP e
JOIN salgrade s
ON e.sal between s.losal and s.hisal;

39 ##
SELECT deptno, count(*) as "사원수", count(comm) as "커미션 받은 사원"
FROM EMP
GROUP BY deptno;

40 ####
--SELECT ename, deptno
--        decode(deptno,  10, '총무부',
--                             20, '개발부',
--                             30, '영업부'
--                ) 부서명
--from emp;
SELECT ename, deptno,
        decode(deptno,  10, '총무부',
                             20, '개발부',
                             30, '영업부'
                ) 부서명
from emp;


















