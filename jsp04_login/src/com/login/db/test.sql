DROP SEQUENCE MYMEMBERSEQ;
DROP TABLE MYMEMBER;

CREATE SEQUENCE MYMEMBERSEQ;

--멤버번호, 아이디, 패스워드, 이름, 주소, 전화번호, 이메일, 가입여부(Y/N), 등급(ADMIN/USER...)
CREATE TABLE MYMEMBER(
	MYNO NUMBER NOT NULL,
	MYID VARCHAR2(500) NOT NULL,
	MYPW VARCHAR2(500) NOT NULL,
	MYNAME VARCHAR2(500) NOT NULL,
	MYADDR VARCHAR2(4000) NOT NULL,
	MYPHONE VARCHAR2(20) NOT NULL,
	MYEMAIL VARCHAR2(100) NOT NULL,
	MYENABLED VARCHAR2(2) NOT NULL,
	MYROLE VARCHAR2(100) NOT NULL,
CONSTRAINT MYMEMBER_PK PRIMARY KEY (MYNO),
CONSTRAINT MYMEMBER_UQ_ID UNIQUE (MYID),
CONSTRAINT MYMEMBER_UQ_PHONE UNIQUE (MYPHONE),
CONSTRAINT MYMEMBER_UQ_EMAIL UNIQUE (MYEMAIL),
CONSTRAINT MYMEMBER_CHK_ENABLED CHECK (MYENABLED IN('Y','N'))
);

INSERT INTO MYMEMBER 
VALUES(MYMEMBERSEQ.NEXTVAL,'ID','PW','NAME','STREET','1234-1234','@YAHOO.COM','Y','MANAGER');


INSERT INTO MYMEMBER 
VALUES(MYMEMBERSEQ.NEXTVAL,'SOM','6789','SOMSOM','CITY','0986','@YUU.COM','Y','ADMIN');


SELECT MYNO, MYID, MYPW, MYNAME, MYADDR, MYPHONE, MYEMAIL, MYENABLED, MYROLE
FROM MYMEMBER;

DELETE FROM MYMEMBER
WHERE MYNO = 1;





