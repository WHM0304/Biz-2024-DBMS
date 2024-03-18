-- 여기는 학생성적 user;

DROP TABLE tbl_student;
CREATE TABLE tbl_student(
    s_code	VARCHAR2(6)		PRIMARY KEY,
    s_name	nVARCHAR2(20)	NOT NULL	,
    s_dept	nVARCHAR2(20)	NOT NULL	,
    s_grade	VARCHAR2(2)	NOT NULL	,
    s_tel	VARCHAR2(15)		,
    s_addr	nVARCHAR2(125)		
);

CREATE TABLE tbl_p(
    p_code	VARCHAR2(6)		PRIMARY KEY,
    p_p1code	VARCHAR2(6)	NOT NULL	,
    p_p1score    NUMBER ,
    p_p2code	VARCHAR2(6)	NOT NULL	,
    p_p2score NUMBER,
    p_p3code	VARCHAR2(6)	NOT NULL	,
    p_p3score NUMBER,
    p_p4code	VARCHAR2(6)	NOT NULL	,
    p_p4score NUMBER,
    p_p5code	VARCHAR2(6)	NOT NULL	,
    p_p5score NUMBER,
    p_p6code	VARCHAR2(6)	NOT NULL	,
    p_p6score NUMBER,
    p_p7code	VARCHAR2(6)	NOT NULL	,
    p_p7score NUMBER
);
DROP TABLE tbl_p;


SELECT * FROM tbl_p;


SELECT p_code,p_p7code, p_p7score 
FROM tbl_p;

SELECT p_code
FROM tbl_p;





CREATE TABLE tbl_point(
    p_code	VARCHAR2(6)		PRIMARY KEY,
    p_name	nVARCHAR2(20)	NOT NULL	
);


SELECT * FROM tbl_point;

DROP TABLE tbl_stu_point;
CREATE TABLE tbl_stu_point(
    r_scode	VARCHAR2(6)	NOT NULL,
    r_pcode	VARCHAR2(6)	NOT NULL,
    r_pscore	NUMBER	NOT NULL,
        CONSTRAINT ah_pk PRIMARY KEY(r_scode,r_pcode)	
);


SELECT * FROM tbl_stu_point;







ALTER TABLE tbl_stu_point
ADD CONSTRAINT fk_stu 
FOREIGN KEY (r_scode)
REFERENCES tbl_student(s_code);


ALTER TABLE tbl_stu_point
ADD CONSTRAINT fk_point 
FOREIGN KEY (r_pcode)
REFERENCES tbl_point(p_code);


SELECT * FROM tbl_stu_point
ORDER BY r_scode,r_pcode;


SELECT r_scode FROM tbl_stu_point
GROUP BY r_scode;


SELECT * FROM tbl_stu_point
WHERE r_scode = 'S0001';


SELECT S.* ,SP.r_scode,P.p_name ,sp.r_pscore
FROM tbl_student S
    JOIN tbl_stu_point SP
        ON s_code = r_scode
    JOIN tbl_point P
        ON r_pcode = p_code;
        
TRUNCATE TABLE tbl_stu_point;
CREATE VIEW view_student AS
(
SELECT S.* ,SP.r_scode,P.p_name ,sp.r_pscore
FROM tbl_student S
    JOIN tbl_stu_point SP
        ON s_code = r_scode
    JOIN tbl_point P
        ON r_pcode = p_code

);
SELECT * FROM view_student;









