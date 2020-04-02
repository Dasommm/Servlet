DROP TABLE WEEKENDFARM;
DROP SEQUENCE WEEKENDFARMSEQ;

CREATE SEQUENCE WEEKENDFARMSEQ;

CREATE TABLE WEEKENDFARM(
	wfarm_key number(10) NOT NULL,   --주말농장키(시퀀스)
	mem_id VARCHAR2(30) NOT NULL,   --회원아이디(FK)
	wfarm_title VARCHAR2(200),     --주말농장 이름
	wfarm_zoneCode VARCHAR2(10),   --주말농장 우편번호
	wfarm_addr VARCHAR2(1000),       --주말농장 주소
	wfarm_totalArea NUMBER(5),     --총 평수
	wfarm_price NUMBER(20),        --평당 가격(1x1)
	wfarm_status VARCHAR2(3),      --주말농장 상태(1.승인대기 , 2.승인)
	wfarm_regDate DATE DEFAULT SYSDATE,        --등록일
	wfarm_image VARCHAR2(3000),             --주말농장 이미지 4개 /   (resources\images\farmimage\apple.png/ +...)
	wfarm_content VARCHAR2(3000),           --주말농장 소개
	CONSTRAINT WEEKENDFARM_PK_wfarm_key PRIMARY KEY(wfarm_key),
	CONSTRAINT WEEKENDFARM_FK_mem_id FOREIGN KEY(mem_id) REFERENCES MEMBER(mem_id) 
);

INSERT INTO WEEKENDFARM
VALUES(WEEKENDFARMSEQ.NEXTVAL,'FARMER','에이작스팜','01234','경기도 용인시 동천동 232',25,1000,'2',SYSDATE,
'resources\images\farmimage\farm01-02.png/
resources\images\farmimage\farm01-01.png/
resources\images\farmimage\farm01-02.png/
resources\images\farmimage\farm01-03.png','토지좋은 주말농장입니다./우리농장최고/농장01전경/농장02전경');

select wfarm_key,mem_id,wfarm_title,wfarm_zoneCode,wfarm_addr,wfarm_totalArea,wfarm_price,
		wfarm_status,wfarm_image,wfarm_content,TO_DATE(wfarm_regDate,'RRRR-MM-DD') from WEEKENDFARM;

		
			select wfarm_key,mem_id,wfarm_title,wfarm_zoneCode,wfarm_addr,wfarm_totalArea,wfarm_price,
		wfarm_status,wfarm_image,wfarm_content,wfarm_regDate,TO_CHAR(wfarm_regDate,'RRRR/MM/DD') from WEEKENDFARM;
SELECT * FROM WEEKENDFARM;

SELECT wfarm_regDate,

TO_CHAR(wfarm_regDate, 'YYYY/MM/DD')

FROM WEEKENDFARM;

		SELECT COUNT(*) AS TOTALPAGE FROM WEEKENDFARM INNER JOIN MEMBER
        ON WEEKENDFARM.mem_id = MEMBER.mem_id;
        
SELECT B.* 
		FROM (SELECT A.*, ROWNUM AS RNUM
		FROM (SELECT * FROM WEEKENDFARM INNER JOIN MEMBER
        ON WEEKENDFARM.mem_id = Member.mem_id ORDER BY wfarm_regDate DESC) A) B
		WHERE RNUM BETWEEN 1 AND 16;  
		
	SELECT B.* 
		FROM (SELECT A.*, ROWNUM AS RNUM
		FROM (SELECT * FROM WEEKENDFARM JOIN MEMBER
        ON WEEKENDFARM.mem_id = Member.mem_id ORDER BY wfarm_regDate DESC) A) B
		WHERE RNUM BETWEEN 16 AND 23;		
		
		SELECT *from WEEKENDFARM;
		
			SELECT B.* 
		FROM (SELECT A.*, ROWNUM AS RNUM
		FROM (SELECT * FROM WEEKENDFARM INNER JOIN MEMBER
        ON WEEKENDFARM.mem_id = MEMBER.mem_id WHERE wfarm_addr LIKE '%용인시%' ORDER BY wfarm_regDate DESC) A) B
		WHERE RNUM BETWEEN 1 AND 16;
		
			SELECT COUNT(*) AS TOTALPAGE FROM WEEKENDFARM INNER JOIN MEMBER
        ON WEEKENDFARM.mem_id = MEMBER.mem_id WHERE wfarm_addr LIKE '%용인시%';
        
      SELECT * FROM
        (SELECT * FROM WEEKENDFARM INNER JOIN MEMBER
        ON WEEKENDFARM.mem_id = MEMBER.mem_id WHERE wfarm_key = 23);
        
        
    SELECT B.* 
		FROM (SELECT A.*, ROWNUM AS RNUM
		FROM (SELECT * FROM WEEKENDFARM INNER JOIN MEMBER
        ON WEEKENDFARM.mem_id = Member.mem_id ORDER BY wfarm_regDate DESC) A) B
		WHERE RNUM BETWEEN 1 AND 16 AND wfarm_status = '2';
		
			SELECT COUNT(*) FROM WEEKENDFARM INNER JOIN MEMBER
        ON WEEKENDFARM.mem_id = MEMBER.mem_id AND wfarm_status = '2';
        
  SELECT B.* 
		FROM (SELECT A.*, ROWNUM AS RNUM
		FROM (SELECT * FROM WEEKENDFARM INNER JOIN MEMBER
        ON WEEKENDFARM.mem_id = Member.mem_id ORDER BY wfarm_regDate DESC) A) B
		WHERE RNUM BETWEEN 1 AND 16 AND wfarm_status = '2'  ;
        
        
		
select * from MEMFARM;
select * from weekendfarm;

INSERT INTO MEMFARM
		VALUES(MEMFARMSEQ.NEXTVAL,'GUEST',7,sysdate,12);
		

	SELECT * FROM 
        (SELECT wfarm_key FROM WEEKENDFARM INNER JOIN MEMBER
        ON WEEKENDFARM.mem_id = MEMBER.mem_id WHERE wfarm_key = 28)A
        	(SELECT wfarm_key FROM MEMJOIN WHERE wfarm_key = 28)B
 		WHERE A.wfarm_key = B.wfarm_key;
        
 SELECT * FROM
 		(SELECT * FROM (SELECT * FROM MEMJOIN INNER JOIN A
 		ON MEMJOIN.wfarm_key = A.wfarm_key)WEEKENDFARM INNER JOIN MEMBER
		ON WEEKENDFARM.mem_id = MEMBER.mem_id WHERE wfarm_key = 28)AS A
		);

SELECT memfarm.wfarm_key
FROM MEMFARM AS memfarm
WHERE wfarm_key =
(SELECT wfarm_key FROM WEEKENDFARM INNER JOIN MEMBER
        ON WEEKENDFARM.mem_id = MEMBER.mem_id WHERE wfarm_key = 28);

FROM WEEKENDFARM c JOIN MEMBER a

USING ( mem_id )  

JOIN MEMJOIN g

ON ( c.wfarm_key = g.wfarm_key );

select * From MEMFARM
WHERE wfarm_key = 28;
	
SELECT COUNT(*)FROM MEMFARM
WHERE wfarm_key = 28;
     
select * From WEEKENDFARM
WHERE wfarm_key = 28;
	