DROP SEQUENCE BDNOSEQ;
DROP SEQUENCE GNOSEQ;
DROP TABLE ANSBOARD;

CREATE SEQUENCE BDNOSEQ;
CREATE SEQUENCE GNOSEQ;

--글번호 그룹번호 그룹순서 제목탭 제목 내용 작성자 작성일 삭제여부(Y,N)
CREATE TABLE ANSBOARD(
	BDNO NUMBER PRIMARY KEY,
	GNO NUMBER NOT NULL,
	GSEQ NUMBER NOT NULL,
	TTAB NUMBER NOT NULL,
	TITLE VARCHAR2(500) NOT NULL,
	CONTENT VARCHAR2(2000) NOT NULL,
	WRITER VARCHAR2(500) NOT NULL,
	REGDATE DATE NOT NULL,
	ENBDELETE VARCHAR2(2) NOT NULL
CONSTRAINT ENABDELETE_CHK CHECK (ENBDELETE IN('Y','N'))
);

SELECT * FROM ANSBOARD ORDER BY GNO DESC, GSEQ;

INSERT INTO ANSBOARD
VALUES(BDNOSEQ.NEXTVAL, GNOSEQ.NEXTVAL, 1,0,'NUMBER1','NUM1 TITLE','JJ',SYSDATE,'N');

INSERT INTO ANSBOARD
VALUES(BDNOSEQ.NEXTVAL, GNOSEQ.NEXTVAL, 1,0,'NUMBER2','NUM2 TITLE','TT',SYSDATE,'N');

UPDATE ANSBOARD 
SET GSEQ = GSEQ +1
WHERE GNO =(SELECT GNO FROM ANSBOARD WHERE BDNO =1)
AND GSEQ > (SELECT GSEQ FROM ANSBOARD WHERE BDNO =1)

INSERT INTO ANSBOARD
VALUES(
	BDNOSEQ.NEXTVAL,
	(SELECT GNO FROM ANSBOARD WHERE BDNO=1),
	(SELECT GSEQ FROM ANSBOARD WHERE BDNO = 1)+1,
	(SELECT TTAB FROM ANSBOARD WHERE BDNO = 1)+1,
	'RE:1번글입니다',
	'1번글에 답변달기',
	'학생',
	SYSDATE,
	'N'
);


UPDATE ANSBOARD 
SET GSEQ = GSEQ +1
WHERE GNO =(SELECT GNO FROM ANSBOARD WHERE BDNO =2)
AND GSEQ > (SELECT GSEQ FROM ANSBOARD WHERE BDNO =2)

INSERT INTO ANSBOARD
VALUES(
	BDNOSEQ.NEXTVAL,
	(SELECT GNO FROM ANSBOARD WHERE BDNO=2),
	(SELECT GSEQ FROM ANSBOARD WHERE BDNO = 2)+1,
	(SELECT TTAB FROM ANSBOARD WHERE BDNO = 2)+1,
	'RE:2번글입니다',
	'2번글에 답변달기',
	'학생',
	SYSDATE,
	'N'
);
--삭제 쿼리
UPDATE ANSBOARD SET ENBDELETE ='Y' WHERE BDNO =1;


UPDATE ANSBOARD SET GSEQ = GSEQ+1 WHERE GNO = (SELECT GNO FROM ANSBOARD WHERE BDNO = 1) AND GSEQ > (SELECT GSEQ FROM ANSBOARD WHERE BDNO = 1);




