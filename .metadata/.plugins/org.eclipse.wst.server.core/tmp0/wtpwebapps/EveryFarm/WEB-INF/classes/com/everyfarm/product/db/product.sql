DROP TABLE STOCK;
CREATE SEQUENCE STOCKSEQ;
DROP SEQUENCE STOCKSEQ;
CREATE TABLE STOCK(    --상품테이블
	stock_no NUMBER(15) NOT NULL,  --상품번호(시퀀스)
	mem_id VARCHAR2(30) NOT NULL, --회원아이디
	stock_name VARCHAR2(100) NOT NULL,    --상품명
	stock_detail VARCHAR2(500) NOT NULL,  --상품특징
	stock_kg NUMBER(10) NOT NULL,  --무게(전체)
	stock_price NUMBER(10) NOT NULL,  --상품가격
	stock_image VARCHAR2(1000) NOT NULL,   --상품이미지(섬네일+내용) 총4개          / 로 구분
	stock_location VARCHAR2(30) NOT NULL,  --지역( ex.성동구,강남구.....)
	stock_kind NUMBER(5) NOT NULL, --품목( (1)과일 /(2)채소 / (3)곡류 / (4)견과류 / (5)약용작물 / (6)버섯류
	CONSTRAINT STOCK_PK_stock_no PRIMARY KEY(stock_no),
	CONSTRAINT STOCK_FK_mem_id FOREIGN KEY(mem_id) REFERENCES MEMBER(mem_id)
);

select *from stock order by stock_no desc;

DELETE FROM STOCK;

INSERT INTO STOCK
<<<<<<< HEAD
VALUES(STOCKSEQ.NEXTVAL,'FARMERKANG','사과','내농장 오렌쥐./이과일은 정말 맛있습니다./새빨간 알록달록이 바나나/여러분께 제공합니다.',
		50,20000,'resources\images\productstorage\apple.png/
					resources\images\productstorage\apple.png/
					resources\images\productstorage\apple.png/
					resources\images\productstorage\apple.png',
		'강남구',1);
=======
VALUES(STOCKSEQ.NEXTVAL,'FARMER','경매에이작스 테스트','바나나./바나나 정말 맛있습니다./귀요미 오렌지/여러분께 제공합니다.',
		50,0,'resources\images\productstorage\banana.png/
					resources\images\productstorage\banana.png/
					resources\images\productstorage\banana.png/
					resources\images\productstorage\banana.png',
		'오산시',1);
>>>>>>> 27f0cc756e38972b7b100e2d7df4b3961c9ecc6e
		
		
		
		
		SELECT COUNT(*) AS TOTALPAGE FROM AUCTION FULL OUTER JOIN STOCK
        ON AUCTION.stock_no = STOCK.stock_no;
        
        --경매 전체출력
        SELECT B.* 
		FROM (SELECT A.*, ROWNUM AS RNUM
		FROM (SELECT * FROM AUCTION INNER JOIN STOCK
        ON AUCTION.stock_no = STOCK.stock_no ORDER BY auc_regDate DESC) A) B;
		
		 T1 INNER JOIN T2 ON T1.A=T2.A
		DELETE FROM STOCK WHERE STOCK_NO = 18;
		
		--경매 지역별 출력
		SELECT B.* 
		FROM (SELECT A.*, ROWNUM AS RNUM
		FROM (SELECT * FROM AUCTION FULL OUTER JOIN STOCK
        ON AUCTION.stock_no = STOCK.stock_no WHERE stock_location = '양주시' ORDER BY auc_regDate DESC) A) B
		WHERE RNUM BETWEEN 1 AND 16;
		
		SELECT COUNT(*) AS TOTALPAGE FROM AUCTION FULL OUTER JOIN STOCK
        ON AUCTION.stock_no = STOCK.stock_no WHERE stock_location = '성동구';
        
        --경매detail출력
        SELECT * FROM
        (SELECT * FROM AUCTION FULL OUTER JOIN STOCK
        ON AUCTION.stock_no = STOCK.stock_no WHERE auc_no = 12);
        
        
 --쪽지 테이블---------------------------------------------------------
 SELECT * FROM LETTERS;
 select * from lettersseq;
 
INSERT INTO LETTERS
		VALUES(LETTERSSEQ.NEXTVAL,'GUESTKIM','FARMER','안녕','안녕',sysdate);
 
 ------------------------------------------------------------------       
      