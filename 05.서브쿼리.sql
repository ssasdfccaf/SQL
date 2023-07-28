-- 서브쿼리 : 하나의 메인 SQL문에 포함된 또 다른 SQL문, 메인쿼리보다 먼저 실행

-- 팝 직원의 고용일보다 이후에 고용된 직원들
-- [단일행]서브쿼리는 서브쿼리 결과가 한줄만 나와야함
select last_name 이름, hire_date 고용일자
from employees
where hire_date > (select hire_date
                         from employees 
                         where last_name = 'Popp'); //popp(X) Smith(x-하나의 값을 비교해야함)
                         
-- 집계함수 서브쿼리
-- 원래는 불가능) where절의 서브쿼리로 집계함수를 사용
select last_name 이름, job_id 직종, salary 급여
from employees
where salary = (select min(salary) from employees);

-- 예제1)            
select last_name, salary
from employees
where salary > (select salary
                    from employees
                    where last_name = 'Abel');
                    
-- 예제2) 부서 같음을 먼저 입력          
--select employee_id, last_name, department_id, salary
--from employees
--where salary > (select salary
--                    from employees
--                    where last_name = 'Bull');

select employee_id, last_name, department_id, salary
from employees
where department_id = (select department_id
                    from employees
                    where last_name = 'Bull')
and salary > (select salary
                    from employees
                    where last_name = 'Bull');                 
                    
                                        
-- 예제3) 이름 철자 유의           
--select last_name, salary, manager_id
--from employees
--where manager_id = (select manager_id
--                            from employees
--                             where last_name = 'Russel');

select last_name, salary, manager_id 매니저
from employees
where manager_id = (select employee_id
                            from employees
                             where last_name = 'Russell');
                             
                    
-- 예제4) 모든 정보 입력은 select *             
--select employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
--from jobs
--where job_id = (select job_id
--                    from employees
--                    where job_title = 'Stock Manager');
//jobs와 employees 자리 바뀜                     
select employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
from employees
where job_id = (select job_id
                    from jobs
                    where job_title = 'Stock Manager');

select *
from employees
where job_id = (select job_id
                    from jobs
                    where job_title = 'Stock Manager');
                   
                     
                    
-- [다중행]서브쿼리                   
select min(salary)
from employees
group by department_id;

-- 부서별 최소급여와 같은 급여를 받는 직원들
select employee_id, last_name
from employees
where salary = (select min(salary)
                    from employees
                    where department_id);
        
                    
//////////// 연산자 뒤에 항상 any(하나라도참)/all(모두참)////////////////

-- 다중열 ANY연산자 : 서브쿼리 결과 중 하나라도 참이면 검색됨
select employee_id, last_name, job_id, salary
from employees
where salary < ANY 
                       (select salary
                        from employees
                        where job_id = 'IT_PROG')
and job_id <> 'IT_PROG'
order by salary desc;      
-- >< 는 !=

-- ALL : 서브쿼리 결과가 모두 참이여야 검색됨
select employee_id, last_name, job_id, salary
from employees
where salary < ALL 
                       (select salary
                        from employees
                        where job_id = 'IT_PROG')
and job_id <> 'IT_PROG'
order by salary desc;                       

--예제1) #
--select employee_id, first_name, job_id, salary 
--from employees
--where manager_id = any
--                            (select manager_id
--                             from employees
--                             where department_id = 20);
select employee_id, first_name, job_id, salary 
from employees
where manager_id in (select manager_id
                             from employees
                             where department_id = 20)
and department_id ! = 20;
//in연산자는 하나의 컬럼이 여러개의 =조건을 가지는 경우에 사용
                        
--예제2)
select employee_id, last_name, job_id 직종, salary 
from employees
where salary < any
                            (select salary
                             from employees
                             where job_id = 'ST_MAN');

--예제3)
select employee_id, last_name, job_id, salary 
from employees
where salary < all
                            (select salary
                             from employees
                             where job_id = 'IT_PROG');



-- [다중열]서브쿼리 #
-- : 여러 개의 컬럼 검색
--브루스와 같은 직종 및 같은 상사를 가진 직원들
select employee_id, first_name, job_id, salary, manager_id 
from employees
where (manager_id, job_id) in (select manager_id, job_id
                                     from employees
                                     where first_name = 'Bruce'); 
and first_name <> 'Bruce';

-- 예제)
select first_name, job_id, salary, department_id 부서번호
from employees
where 




-- [ 집합연산자 : UNION, INTERSECT 교집합, MINUS 차집합 ] --
select *
from employees
//직원테이블 검색


-- UNION 
-- : (107+10)117인데 총 115줄
select employee_id, job_id
from employees
union
select employee_id, job_id
from job_history;

//employees 107줄, job_history 10줄


-- INTERSECT
-- : 중복되는 값만 나옴
select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history;
                    
                    
-- MINUS
-- 마이너스 A-B : 빼면 중복된 2개가 빠져서 총 105개의 결과
select employee_id, job_id
from employees
minus
select employee_id, job_id
from job_history;


// // // 세미콜론 꼭 넣기 // // // 
--예제1) 
select department_id
from employees
union
select department_id
from departments;

--예제2)
select department_id
from employees
union all
select department_id
from departments;

--예제3)
select department_id
from employees
intersect
select department_id
from departments;

--예제4)# 마이너스 연산자: 순서가 중요
select department_id
from departments
minus
select department_id
from employees;

                    
                                   
                    