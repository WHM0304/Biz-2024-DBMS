-- 주문서 프로젝트
/*
주문서 exel 파일의 고객정보, 상품정보 
데이터를 참조하여
1. 주문원장의 "상품코드" 칼럼의 데이터를 분리 후 
2. "주문내역" 테이블로 이전하는 정규화 실행
3. 주문원장, 주문내역, 고객정보, 상품정보
	4가지 Entity 의 개념적 모델링
4. 논리적, 물리적 모델링
5. Table 명세 생성

DATABASE : tmp_order
*/
DROP DATABASE tmp_order;
CREATE DATABASE tmp_order;
USE tmp_order;

DROP TABLE _tbl_order;
TRUNCATE _tbl_order;
CREATE TABLE _tbl_order(
o_num	VARCHAR(6) PRIMARY KEY ,
o_date	VARCHAR(10),
o_ccode	VARCHAR(6),
o_pcode1 VARCHAR(6),
o_pcode2 VARCHAR(6),
o_pcode3 VARCHAR(6)
);

SELECT * FROM _tbl_order;


SELECT * FROM _tbl_order;

SELECT o_num,o_date,o_ccode,o_pcode3
FROM _tbl_order
GROUP BY o_num;



DROP TABLE tbl_rel_order;
CREATE TABLE tbl_rel_order(
	r_onum	VARCHAR(6)	,
r_date	VARCHAR(15)		,
r_ccode	VARCHAR(6)		,
r_pcode	VARCHAR(6)		,
		PRIMARY KEY (r_onum)

);

CREATE TABLE tbl_customer(
c_code	VARCHAR(6)		PRIMARY KEY,
c_name	VARCHAR(6)		,
c_tel	VARCHAR(15)		
);

CREATE TABLE tbl_product(
p_code	VARCHAR(6)		PRIMARY KEY,
p_name	VARCHAR(20)		,
p_item	VARCHAR(6)		,
p_price	VARCHAR(6)		
);
SELECT * FROM tbl_product;
SELECT * FROM tbl_customer;

ALTER TABLE tbl_rel_order
ADD CONSTRAINT FOREIGN KEY fk_ccode (r_ccode) 
REFERENCES tbl_customer(c_code);

ALTER TABLE tbl_rel_order
ADD CONSTRAINT FOREIGN KEY fk_pcode (r_pcode) 
REFERENCES tbl_product(p_code);

TRUNCATE TABLE tbl_rel_order;
SELECT * FROM tbl_rel_order;

-- outer join FK 무결성확인
SELECT * FROM tbl_rel_order A LEFT JOIN tbl_product B
ON A.r_pcode = B.p_code;