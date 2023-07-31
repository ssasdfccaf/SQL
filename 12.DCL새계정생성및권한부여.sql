-- 새 계정을 생성하려면 일반 계정에서 작업X, 관리자 계정에서 가능
CREATE USER john IDENTIFIED BY 1234; --비번 1234존계정을 생성

- 접속권한 및 사용권한들을 모아서 한꺼번에 CONNECT, RESOURCE 롤을 부여
GRANT CONNECT, RESOURCE TO john;
//시스템 권한, 오브젝트 권한

-- 권한 제거
REVOKE RESOURCE FROM john;
REVOKE CONNECT FROM john;

-- 계정 삭제(계정과 관계된 모든 데이터 삭제)
DROP USER john CASCADE;