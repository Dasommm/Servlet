DROP SEQUENCE MBSEQ;
DROP TABLE SOMLOGIN;

CREATE SEQUENCE MBSEQ;

--멤버번호, 아이디, 패스워드, 이름, 주소, 전화번호, 이메일, 가입여부(Y/N), 등급(ADMIN/USER...)
CREATE TABLE SOMLOGIN(
	MBNO NUMBER PRIMARY KEY,
	MBID VARCHAR2(500) NOT NULL,
	MBPW VARCHAR2(500) NOT NULL,
	MBNAME VARCHAR2(100) NOT NULL,
	MBADDR VARCHAR2(4000) NOT NULL,
	MBMOBILE VARCHAR2(20) NOT NULL,
	MBEMAIL VARCHAR2(100) NOT NULL,
	MBENABLED VARCHAR2(2) NOT NULL,
	MBROLL VARCHAR2(100) NOT NULL,
CONSTRAINT MB_UQ_ID UNIQUE(MBID),
CONSTRAINT MB_UQ_MOBILE UNIQUE(MBMOBILE),
CONSTRAINT MB_UQ_EMAIL UNIQUE(MBEMAIL),
CONSTRAINT MB_CHK_ENABLED CHECK(MBENABLED IN('Y','N'))
);

INSERT INTO SOMLOGIN
VALUES(MBSEQ.NEXTVAL,'SOM','1234','SOMSOM','CITY','0987','@DO.COM','Y','ADMIN');

INSERT INTO SOMLOGIN
VALUES(MBSEQ.NEXTVAL,'JO','1234','JON','TOWN','5959','@JUN.COM','Y','MANAGER');
 
INSERT INTO SOMLOGIN
VALUES(MBSEQ.NEXTVAL,'YU','1234','AA','COUNTRY','8282','@Y.COM','Y','USER');

SELECT * FROM SOMLOGIN ORDER BY MBNO DESC;






