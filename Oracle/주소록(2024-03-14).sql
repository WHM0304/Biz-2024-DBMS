-- addrUser 화면
/*
주소록 테이블 명세를 보고
tbl_address 테이블을 생성하시오
*/

CREATE TABLE tbl_address
(a_code	VARCHAR2(6)		PRIMARY KEY,
a_name	nVARCHAR2(20)	NOT NULL	,
a_tel	VARCHAR2(15)	NOT NULL	,
a_addr	nVARCHAR2(125)		,
a_hobby1	nVARCHAR2(20)	,	
a_hobby2	nVARCHAR2(20)	,	
a_hobby3	nVARCHAR2(20)		
);
