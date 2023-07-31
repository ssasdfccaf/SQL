-- 테이블 만들기
DROP TABLE comp;
CREATE TABLE comp (
    고정열 CHAR(10),
    가변열 VARCHAR2(10)
);
DESC comp;
INSERT INTO comp VALUES('1', '하나');
INSERT INTO comp VALUES('2', '둘');
INSERT INTO comp VALUES('3', '셋');
select * from comp;

--숫자와 날짜 테이블
CREATE TABLE ex_date(
    id NUMBER(2),
    start_date DATE DEFAULT SYSDATE
);

DESC ex_date;
-- 디폴트값DEFAULT SYSDATE은 해당열에 값을 입력하지 않았을 때 생성
INSERT INTO ex_date(id) VALUES(10);
INSERT INTO ex_date(id) VALUES(11);
INSERT INTO ex_date(id) VALUES(12);
select * from ex_date;

//롤백누르면 테이블만 남아있고 입력내용 사라짐

DROP TABLE comp;
DROP TABLE ex_date;

---- 예제1)
--CREATE TABLE sample_product(
--    CHAR(10),
--    product_name VARCHAR2(20)
--    );
--    id NUMBER(product_id),
--    menu_date DATE DEFAULT SYSDATE
--    
---- 예제2)
--DROP TABLE sample_product;

-- 테이블 제약조건 
-- : 중복X, 잘못된 트랜잭션X
// // 테이블열 옆 또는 다른 행에 입력
CREATE TABLE emp1 (
    id number(3) PRIMARY KEY, --기본키 설정
    name VARCHAR2(20)
);
--
--DESC emp1;
--INSERT INTO empl VALUES( 1, '길동');
--INSERT INTO empl VALUES( 1, '펭수'); --기본키는 중복안됨
--
--DESC emp1;
--INSERT INTO empl VALUES( 1, '길동');
--INSERT INTO empl VALUES( null, '펭수'); --기본키는 널값 입력안됨
--

//NOT NULL 제약조건
CREATE TABLE emp1 (
    id number(3) PRIMARY KEY, --기본키 
    name VARCHAR2(20) NOT NULL --널값을 입력할수없음
    sal NUMBER CHECK(sal>1000) --체크는 조건을 입력
    );
//sal(조건) 

DESC emp1;
INSERT INTO empl VALUES( 1, '길동', 1001);
INSERT INTO empl VALUES( 1, '펭수', 2000);


-- 예제) #
-- : members라는 새 테이블 만들기
CREATE TABLE members(
    id number(2) PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    gender VARCHAR2(5) CHECK ( gender IN ('Man' , 'Woman')),
    birth_day DATE DEFAULT SYSDATE,
    emalil VARCHAR2(200) NOT NULL UNIQUE
);


-- 외래키 설정
-- : 한열과 참조된 테이블의 열간의 외래키 관계 설정


DESC 부서;
INSERT INTO 부서 VALUES(1,'경영');
INSERT INTO 부서 VALUES(2,'개발');

DESC 직원;
INSERT INTO 직원 VALUES(1,'홍길동',1);
INSERT INTO 직원 VALUES(2,'펭수',2);


--//1번 부서를 삭제하고 싶으면
--DELETE FROM 부서 WHERE 번호 = 1;
DESC 부서;
INSERT INTO 부서 VALUES(1,'경영');
INSERT INTO 부서 VALUES(2,'개발');
DELETE FROM 부서 WHERE 번호 = 1;

DESC 직원;
INSERT INTO 직원 VALUES(1,'홍길동',1);
INSERT INTO 직원 VALUES(2,'펭수',2);


--FOREIGN KEY
--REFERENCES dept


--- CREATE TABLE AS
DROP TABLE emp_temp;
CREATE TABLE emp_temp
AS
select * from emp where 1!=1; -- where절 조건에 만족하는 데이터가 없음
// // 서브쿼리 select문의 결과가 emp_temp 생성

select * from emp _temp; -- 조건에 참이 되는 데이터가 없으므로 열만 복사

.













































