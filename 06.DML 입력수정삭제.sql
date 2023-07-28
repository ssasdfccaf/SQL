-- 트랜잭션 : 상태변화 작업 →반드시 동시에 실행COMMIT 또는 취소 ROLLBACK

//// DML=데이터베이스에 데이터를 입력,수정,삭제하는 명령어

-- 커밋하기
commit;

-- 데이터 입력 INSERT
// // // INSERT INTO 테이블명(입력내용)
// // // // 필수입력: ID, NAME 등의 NOT NULL부분 

// 테이블열의 데이터타입 파악(describe)
DESC departments;
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES(300, '게임', 100, 1700);

//열이름 생략할때(모든 열을 다 입력해야함) #
INSERT INTO departments
VALUES(290, '낚시', 100, 1700);

--널값이 입력될때 //입력하지않으면 null
INSERT INTO departments(department_id, department_name)
VALUES(280, '음악');


-- 직원테이블 입력
DESC employees;
INSERT INTO employees
VALUES(207, '길동', '홍', 'hong@naver.com', '010.1234.1234', sysdate, 'IT_PROG', 9999, null, 205, 300)


--예제1)
--desc departments;
--insert into departments(department_id, department_name, manager_id, location_id)
--values(271, 'Samle Dept 1', 200,1700);
--values(272, 'Samle Dept 2', 200,1700);
--values(273, 'Samle Dept 3', 200,1700);

--insert into departments values(271, 'Samle Dept 1', 200, 1700);
--values(272, 'Samle Dept 2', 200, 1700);
--values(273, 'Samle Dept 3', 200, 1700);

INSERT INTO departments VALUES(271, 'Samle Dept 1', 200, 1700);
INSERT INTO departments VALUES(272, 'Samle Dept 2', 200, 1700);
INSERT INTO departments VALUES(273, 'Samle Dept 3', 200, 1700);

insert into departments values(271, 'Samle Dept 1', 200, 1700);
insert into departments values(272, 'Samle Dept 2', 200, 1700);
insert into departments values(273, 'Samle Dept 3', 200, 1700);

//테이블 구조 확인→ 테이블에 입력할 내용 확인 → 테이블에 입력할 열 또는 모든 열

--예제2) #
--select departments
--departments(department_id, department_name, manager_id, location_id)

--
--UPDATE 수정할 테이블
--SET 부서번호 = _ -수정할 부서번호
--WHERE 사원번호 = _


-- 데이터 수정 UPDATE
-- ※ 주의: WHERE이 없으면 모든  행이 업데이트됨.
-- 음악 부서의 매니저와 로케이션 수정하기
UPDATE departments
SET manager_id = 100, location_id = 1700
WHERE department_id = 280;

-- 예제) 부서번호 150에서 200까지 매니저ID를 100으로 수정하기
--update deparments
--set manager_id=100
--where department_id >= 150 and department_id  =< 200;

UPDATE departments
SET manager_id = 100
WHERE department_id BETWEEN 150 AND 200;

-- 데이터 삭제 DELETE
DELETE FROM departments
WHERE department_name = '음악';

DELETE FROM departments
WHERE department_name = '게임';
//게임부서직원 존재 → 게임부서 삭제 안됨 → 직원을 삭제해야함
-- 만약 삭제하는 데이터를 참조하는 테이블과 데이터가 있을 경우, '참조하는 데이터'를 먼저 삭제해야 삭제가 가능
DELETE FROM employees WHERE first_name = '길동';

// 삭제시 where절을 안적으면? 전체가 적용
-- DELETE FROM emlpoyees;

UPDATE employees SET phone_number = '010-1234-1234';


--그전상태로 복구(이전의 성공적인 commit 상태로 돌아감)
rollback;

--입력 수정 삭제 연습하기
--DESC
--INSERT INTO
--VALUES()
--
--INSERT INTO VALUES()
--
--UPDATE SET WHERE
--
--ROLLBACK;
--
--COMMIT;
--DELETE FROM WHERE


--scott 계정
commit;
delete from salgrade;
//삭제후커밋은X




























