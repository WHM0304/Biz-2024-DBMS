-- 주문서 데이터 정규화

CREATE DATABASE orderDB;
USE orderDB;
CREATE TABLE tbl_temp_order(
	o_num	VARCHAR(6),
	o_date	VARCHAR(10),
	o_ccode	VARCHAR(5),
	o_ccname	VARCHAR(20),
	o_ctel	VARCHAR(20),
	o_pcode1	VARCHAR(6),
	o_pcode2	VARCHAR(6),
	o_pcode3	VARCHAR(6)
);
