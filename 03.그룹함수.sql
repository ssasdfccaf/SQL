-- 그룹함수(집계함수)

--ROUND써서 정수로 표현
SELECT  ROUND(AVG(salary)) 평균월급, MAX(salary), MIN(salary), SUM(salary) 월급들의총합, COUNT(salary) 총행의개수
From employees
WHERE job_id = 'IT_PROG';


-- 그룹별 집계함수
-- 그룹절 GROUP BY : 그룹으로 나눈 [부서별 평균급여] 출력 - ORDER BY는 항상 마지막에
SELECT  department_id 부서명, ROUND(AVG(salary)) 평균급여 
From employees
GROUP BY department_id
ORDER BY department_id;

//그룹으로 나눈 부서가 아닌 job_id은 SELECT에 X


--예제1)
--SELECT department_id 부서명, 사원수, MAX(salary) 최고급여, SUM(salary) 급여합계, ROUND(AVG(salary)) 평균급여
--From employees
--GROUP BY department_id, salary
--ORDER BY department_id DESC;

SELECT department_id 부서명, COUNT(*) 사원수, MAX(salary) 최고급여, MIN(salary) 최소급여, SUM(salary) 급여합계, ROUND(AVG(salary)) 평균급여
From employees
GROUP BY department_id
ORDER BY department_id DESC;


--예제2)
--부서가 같더라도 직종이 다르면 다른 그룹

SELECT department_id 부서번호, job_id 직종, SUM(SALARY) 급여합계, COUNT(*) 직원수
From employees
GROUP BY department_id, job_id
ORDER BY department_id;



--예제3)
--SELECT 
--        AVG(MAX(salary)) 부서별최고월급평균,
--        AVG(MIN(salary)) 부서별최저월급평균
--From employees
--GROUP BY department_id;

SELECT 
        ROUND(AVG(MAX(salary))) 부서별최고월급평균,
        AVG(MIN(salary)) 부서별최저월급평균
From employees
GROUP BY department_id;

