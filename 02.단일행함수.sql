-- 문자형함수
select LOWER('ABC') , UPPER('abc'), INITCAP('abc')
from dual;

-- CONCAT, SUBSTR(문자열, 시작위치, 문자열개수)
select CONCAT('헬로우', ' 월드!'),  SUBSTR('헬로우월드',2,2), LENGTH('헬로우'),
            INSTR('헬로우', '로'), TRIM('      공백      '), '      공백      '
from dual;

-- 문자형 함수 예제
SELECT department_id, last_name, department_id
FROM employees
WHERE lower(last_name) = 'higgins';

select last_name, CONCAT('직업명이  ', job_id)  as  직업명
from employees
where SUBSTR(job_id, 4, 3) = 'REP';

--문자열 치환 함수 replace
SELECT REPLACE('헬로우월드', '월드', '세상') FROM DUAL;

-- 예제)
SELECT  LOWER('LAST_NAME'), UPPER('last_name'), INITCAP('email')
from dual;

-- 예제)
select SUBSTR('job_id',1,2)
from dual;

-- 숫자형 함수 : round는 반올림, trunc는 버림
select ROUND(15.193,1) 소수첫째, ROUND(15.193) 정수, ROUND(15.193,2) 소수둘째
-- 자릿수가 1이면 소수첫째자리까지 반올림, 자릿수가 없으면 정수
from dual; 

select TRUNC(15.193,1) 소수첫째, TRUNC(15.193) 정수, TRUNC(15.193,2) 소수둘째
-- 소수첫째자리까지 절삭
from dual; 

-- mod는 나눈 나머지
-- 짝수번째 번호를 가진 직원들
select employee_id 짝수번호, last_name 이름
from employees
where MOD (employee_id, 2) = 0
order by 1; //첫번째열로 정렬

select SALARY ROUND(SALARY/30) 정수,  ROUND (SALARY/30,1) 소수첫째, ROUND(SALARY/30,10) 10의자리
from employees
order by 1;

-- 날짜형 함수  //sysdate=현재날짜와시간
SELECT ROUND(sysdate, 'DD') 일, 
              ROUND(sysdate, 'MM') 월,
              ROUND(sysdate, 'YYYY') 년도,
              MONTHS_BETWEEN('2017/10/10', '2017/07/10') 월차이,
              ADD_MONTHS('2017/07/10', 3) 애드먼쓰
FROM dual;

-- 날짜연산
SELECT SYSDATE-1 어제, SYSDATE 오늘, SYSDATE+1 내일 
FROM DUAL;

-- 90번 부서 직원들의 근무일자 (오늘까지)
SELECT last_name, FLOOR(SYSDATE - hire_date) 근무일수
FROM employees
WHERE department_id = 90;

--예제1)
SELECT SYSDATE,  hire_date,  MONTHS_BETWEEN(SYSDATE, hire_date)
FROM employees
WHERE department_id = 100;

 //소수점X
SELECT SYSDATE,  hire_date,  FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date))       
FROM employees
WHERE department_id = 100;

 //소수점1자리
SELECT SYSDATE,  hire_date, TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date), 1)              
FROM employees
WHERE department_id = 100;

--예제2)
SELECT  hire_date,              
FROM employees
WHERE employee_id
BETWEEN 100 AND 106;


-- 변환형 함수 
-- CHAR = CHARACTER 문자
-- TO_CHAR 숫자를 형식에 맞게 문자열로 표시
SELECT 
TO_CHAR(12345678, '999,999,999') 콤마,
TO_CHAR(123.45678,'999,999,999.99') 소수점,
TO_CHAR(123.45678, '$999,999,999.99') 달러,
TO_CHAR(12345678, 'L999,999,999') 원화
FROM DUAL;

-- 날짜를 문자열로 변환
-- 년, 월, 일, 시, 분, 초 예제
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') 현재날짜시간
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') 현재날짜시간
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY MM DD HH24:MI:SS') 현재날짜시간
FROM DUAL;

--예제 1)
--SELECT EMPLOYEE_ID, TO_CHAR(SYSDATE, 'MM/YY') 입사월
--from employees;
--department_id=100;
SELECT EMPLOYEE_ID, TO_CHAR(hire_date, 'MM/YY') 입사월
from employees;
department_id=100;


--예제 2)
--SELECT last_name 이름, TO_CHAR(salary>$10,000, '$999,999,999.99') 월급
--from employees;
SELECT last_name 이름, TO_CHAR(salary, '$99,999.99') 월급  
from employees WHERE salary>10000 ORDER BY salary DESC;
//$99,999.99-숫자열을 문자열로 바꾼것 
// 10,000(X)-숫자이므로 콤마 쓰면 안됨

-- 문자를 DATE 타입으로 변환하는 예제
SELECT TO_DATE('2011-01-01' , 'YYYY-MM-DD') 
FROM DUAL;

-- 문자를 숫자로 변환하는 예제
SELECT TO_NUMBER('012') 
FROM DUAL;

SELECT TO_NUMBER('012') +10
FROM DUAL;

--널값 관련 함수
--NVL함수는 null값 대신에 값을 바꿔줌
select last_name, NVL(manager_id, '없음') 매니저
from employees where last_name = 'king';

select last_name, NVL(manager_id, 0) 매니저
from employees where last_name = 'King';

--NVL2은 해당열의 널값이 아닐 경우와 널값인 경우 모두 값을 바꿔줌
select last_name, NVL2(manager_id, 1, 0) 매니저
from employees where last_name = 'King';


----예제1)
--select last_name 이름, salary 월급, commision_pct 커미션,  NVL((salary*12) + (salary*12*commision))  연봉
--from employees

--예제1) 커미션을 널값 대신 0으로 바꿔야함
SELECT last_name 이름, salary 월급,  NVL(commission_pct , 0) 커미션,
            salary*12 + salary*12*NVL(commission_pct, 0)  연봉
FROM employees ORDER BY 연봉 DESC;

----예제2)
--select last_name 이름, salary 월급, commision_pct 커미션,  NVL2(salary*12, ((salary*12) + (salary*12*commision)))  연봉
--from employees

--예제2) commission = 커미션 철자유의
SELECT last_name 이름, salary 월급,  NVL(commission_pct , 0) 커미션,
            salary*12 + salary*12*NVL(commission_pct, 0)  연봉,
            NVL2(commission_pct, '월급+커미션', '월급만') 연봉계산방법
FROM employees ORDER BY 연봉 DESC;


-- decode 함수
SELECT last_name 이름, job_id, salary,
      DECODE(job_id, 'IT_PROG', salary * 1.10,
                             'ST_CLERK', salary * 1.15,
                                'SA_REP', salary * 1.20,
                                              salary) "수정월급"
 FROM employees;
--job_id가 IT_PROG와 같으면 salary만큼 출력

--예제) 월급에 따른 세율 나타내기
--SELECT last_name 이름, 직무, salary 월급, tax rate 세율
--  DECODE('TRUNC (salary/2000)', 0, salary,
--                                                 1, salary*0.09,
--                                                 2, salary*0.2,
--                                                 3, salary*0.3,
--                                                 4, salary*0.4,
--                                                 5, salary*0.42,
--                                                 6, salary*0.44,
--                                                 7, salary*0.45,
--                                                 Tax Rate) "세율"
--FROM employees;

SELECT last_name 이름, job_id 직무, salary 월급,
  DECODE( TRUNC (salary/2000),  0, 0,
                                                 1, 0.09,
                                                 2, 0.2,
                                                 3, 0.3,
                                                 4, 0.4,
                                                 5, 0.42,
                                                 6, 0.44,
                                                     0.45 ) "세율"
FROM employees;



-- CASE 문은 비교 가능
SELECT last_name 이름, job_id 직무, salary 월급,
          CASE  WHEN salary<5000 THEN 'Low'
                    WHEN salary<10000 THEN 'Medium'
                    WHEN salary<20000 THEN 'Good'
                     ELSE                                ' Excellent'
    END "급여 수준"
FROM employees;



--예제)
--SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY 월급,
--    CASE  WHEN salary>9000 THEN '상위'
--                    WHEN 6000<salary THEN '중위'
--                    WHEN salary<8999 THEN '중위'
--                    
--                     ELSE                                        '하위'
--    END "급여 등급"
--FROM employees WHERE

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY 월급,
    CASE  WHEN salary>=9000          THEN '상위'
                    WHEN salary>6000   THEN '중위'
                    WHEN salary<8999      THEN '중위'              
                     ELSE                                    '하위'
    END "급여 등급"
FROM employees WHERE job_id = 'IT_PROG';



