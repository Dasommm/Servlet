INSERT INTO MVCBOARD
VALUES(MVCSEQ.NEXTVAL, '김도미','제목','내용',SYSDATE);

SELECT CONSTRAINT_NAME, STATUS
FROM ALL_CONSTRAINTS
WHERE TABLE_NAME='MVCBOARD';

 SELECT SEQ, WRITER, TITLE, CONTENT, REGDATE 
							 FROM (SELECT ROWNUM AS row_num, mvcboard.* FROM MVCBOARD) 
							WHERE row_num >=1 AND row_num <=5; 
		
							SELECT * FROM MVCBOARD;
							