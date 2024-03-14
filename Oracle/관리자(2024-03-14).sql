-- 여기는 관리자 화면입니다.

/*
오라클에서는 데이터저장소를 TableSpace 라고 한다
TableSpace 는 로컬스토리지에 파일형식으로 생성을 하여
이 TableSpace 에 Table 등의 객체, 데이터를 저장한다.

오라클 DB 를 사용할때 제일먼저 할일이 관리자로 접속하여
Table Space를 만드는 일이다.

프로그램등에서 
오라클 DB를 접속할때는 SYS , SYSTEM 등 시스템과 관련된 id 는 절대 사용하지 말자.
관리자 화면에서 사용자를 생성하고, 사용자의 권한을 부여하여 접속을 한다.

오라클에서 사용자는 SCHEMA 개념을 갖는다.
사용자로 로그인을 하면, 별도의 Database 를 접속, 연결(USE)를 하지 않는다.
*/

-- myDB 라는 TableSpace 를 만들어라
-- 물리적 저장소는 c:/app/data/myDB.dbf 라는 파일로 만들어라
-- 초기 크기는 1M Byte 저장소를 설정하고
-- 만약 저장소 크기가 부족하면 1K Byte 씩 자동으로 확장하라
CREATE TABLESPACE myDB
DATAFILE 'c:/app/data/myDB.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

-- myDB TableSpace를 삭제하라
-- 삭제할때 모든내용, 파일, 제약조건 등을 함께 깨끗하게 삭제하라
DROP TABLESPACE myDB
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;

-- oracle 12c 이상에서 사용자를 생성하는 방법
-- 사용자 이름 앞에 반드시 C## 를 붙여줘야한다.
CREATE USER C##user1 IDENTIFIED BY 12341234
DEFAULT TABLESPACE myDB;

/*
Oracle 12c 이상 버전에서 보안, 계정 정책이 변경되어
사용자의 이름 앞에 C## 를 부착해야 하는 규정이 생겼다.
사용자를 생성할때마다 불편함을 가지게 된다.

특별하게 명령을 수행하면 이전 방법으로 사용자 생성을 할수 있도록 했다
*/
-- 오라클 12c 이전의 표준 SQL 명령으로 사용자 생성을 할수 있도록하는 명령
-- 사용자 생성을 하게 되면 항상 실행해야 한다.
ALTER SESSION SET "_ORACLE_SCRIPT" = true;

CREATE USER user1 IDENTIFIED BY 12341234
DEFAULT TABLESPACE myDB;


