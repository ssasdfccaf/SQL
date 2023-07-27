-- 기본 조인 방법
-- 별칭 e d
select *
from employees e JOIN departments d
ON e.department_id = d.department_id;

-- 필요한 부분만
select e.employee_id 직원번호, e.last_name 직원이름, e.department_id 부서번호, d.department_name 부서명
from employees e JOIN departments d
ON e.department_id = d.department_id;

--e.department_id / d.department_id 부서번호 반드시 적어야함
select employee_id 직원번호, last_name 직원이름, e.department_id 부서번호, d.department_name 부서명
from employees e JOIN departments d
ON e.department_id = d.department_id;

-- 3개 테이블 조인 -ON절(테이블간관계)을 알아야함
select e.employee_id, l.city, d.department_name
from employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN locations l
    ON d.location_id = l.location_id;
    
select employee_id, city, department_name
from employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN locations l
    ON d.location_id = l.location_id;

-- 조인과 함께 where 조건절을 적는다고 하면
select employee_id 직원번호, last_name 직원이름, e.department_id 부서번호, d.department_name 부서명
from employees e 
JOIN departments d
    ON e.department_id = d.department_id
where d.department_id = 50;

--예제) 부서명, 도시명, 국가명을 나타내는 테이블 출력, 테이블들은 countries와 departments와 locations 조인
---조건은 시티가 Seattle혹은London, 국가명 앞쪽에 United

--select d.department_name 부서명, city_name 도시명, country_name 국가명
--from employees e 
--JOIN departments d 
--    ON e.department_name = d.department_name
--where city='Seattle' OR city='London' AND country_name LIKE 'United%';
select d.department_name 부서명, city_name 도시명, country_name 국가명
from departments d  
JOIN locations l ON l.location_id = d.location_id
JOIN countries l ON c.country_id = l.country_id
WHERE l.city IN('Seattle', 'London') AND c.country_name LIKE 'United%';
--조인 순서는 상관 X



-- [ 자체조인 ] (같은 테이블내에서 참조하고 있을경우)
select e.last_name 직원, m.last_name 매니저
from employees e JOIN employees m
    ON e.manager_id = m.employee_id;
--매니저도 직원, manager_id가 employee_id 참조 > 자체조인 가능 : HR계정 테이블 관계도 참고





-- [ 외부조인 ]
-- [ 왼쪽 외부조인 ] : 왼쪽열의 모든 직원 출력
select last_name 직원, e.department_id 부서번호, d.department_name 부서명
from employees e LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id;
-- 조건 안맞아도 null값으로 출력(107Grant직원)    


-- [ 오른쪽 외부조인 ] : 오른쪽열의 모든 직원 출력
--select last_name 직원, e.department_id 부서번호, d.department_name 부서명
--from employees e RIGHT OUTER JOIN departments d
--    ON e.department_id = d.department_id;
---- 모든 부서 출력, 직원이 배치되지않은 부서에 직원없음(null) 
select last_name 직원, d.department_id 부서번호, d.department_name 부서명
from employees e RIGHT OUTER JOIN departments d
    ON e.department_id = d.department_id;
-- e.department_id를 d.department_id로 바꾸면 null 자리에 부서번호가 배치


-- [ 풀 외부조인 ] 
select last_name 직원, d.department_id 부서번호, d.department_name 부서명
from employees e FULL OUTER JOIN departments d
    ON e.department_id = d.department_id;
-- 같지 않아도 출력

--예제)
--select country_name 국가, country_id 국가번호, l.location_id 지역번호, city 도시
--from locations l FULL OUTER JOIN locations d
--    ON l.location_id = o.location_id
--ORDER BY 지역번호 DESC;
--
--select c.country_name 국가, c.country_id 국가번호, l.location_id 지역번호, l.city 도시
--from locations l LEFT OUTER JOIN countries c 
--    ON l.location_id = c.location_id
--ORDER BY 지역번호 DESC;

select c.country_name 국가, c.country_id 국가번호, l.location_id 지역번호, l.city 도시
from countries c LEFT OUTER JOIN locations l  
    ON c.country_id = l.country_id
ORDER BY 지역번호 DESC;

--크로스 조인 예제 CROSS JOIN ( 25 * 4 )
SELECT c.country_name 국가, r.region_name 지역이름
FROM countries c CROSS JOIN regions r;







