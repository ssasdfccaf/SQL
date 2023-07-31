--- 뷰 view  가상의 테이블
CREATE VIEW EMP_V2
AS
select employee_id 직원번호, first_name 이름, last_name 성, email, hire_date, job_id
from employees;

select * from emp_v2;
INSERT INTO emp_v2 VALUES(207, '길동', '홍', 'HONG', '2023-7-31', 'IT_PROG');
-- 뷰는 실제 물리적인 테이블이 아닌데 입력을 했음 -> 실제로 뷰를 만든 테이블에 입력됨!
Delete from emp_v2 where 직원번호 = 207;
select * from employees;
// view 생성 시 별칭 사용(직원번호)

-- 읽기만 가능한 뷰로 만들기(with read only)
CREATE VIEW EMP_read(직원번호,이름,성,이메일,고용일자,직종)
AS
select employee_id 직원번호, first_name 이름, last_name 성, email, hire_date, job_id
from employees with read only;

select * from emp_read;
Delete from emp_read where 직원번호 =100;
-- 읽기만 가능한 뷰는 DML(입력, 수정, 삭제)가 안됨.
