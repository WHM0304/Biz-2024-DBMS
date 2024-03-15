-- 여기는 관리자 화면입니다.

/*
TABLESPACE : schoolDB
DataFile : c:/app/data/schoolDB.dbf
초기크기 : 500k
자동확장 : 1k

사용자 : schoolUser
비번 : 12341234

접속 프로파일 생성
*/

CREATE TABLESPACE schoolDB
DATAFILE 'c:/app/data/schoolDB.dbf'
SIZE 500K AUTOEXTEND ON NEXT 1K;


ALTER SESSION SET "_ORACLE_SCRIPT" = true;

CREATE USER schoolUser IDENTIFIED BY 12341234
DEFAULT TABLESPACE schoolDB;

GRANT DBA TO schoolUser;

