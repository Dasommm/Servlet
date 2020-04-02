DROP SEQUENCE CALBOARDSEQ;
DROP TABLE CALBOARD;

CREATE SEQUENCE CALBOARDSEQ;

--번호, 아이디, 제목, 내용, 일정, 작성일
CREATE TABLE CALBOARD(
	SEQ NUMBER PRIMARY KEY,
	ID VARCHAR2(1000) NOT NULL,
	TITLE VARCHAR2(2000) NOT NULL,
	CONTENT VARCHAR2(4000) NOT NULL,
	MDATE VARCHAR2(12) NOT NULL,
	REGDATE DATE NOT NULL
);

SELECT * FROM CALBOARD;

--row_number() over(partition by @ order by)
--@별로 group by 해서, 그룹 별 rownum 사용할 때
SELECT * FROM (
	select (ROW_NUMBER() OVER(PARTITION BY SUBSTR(MDATE,1,8) ORDER BY MDATE)) RN,
	SEQ, ID, TITLE, CONTENT, MDATE, REGDATE
	FROM CALBOARD
	WHERE ID='kh' AND SUBSTR(MDATE,1,6)='202001'
)
WHERE RN BETWEEN 1 AND 3;