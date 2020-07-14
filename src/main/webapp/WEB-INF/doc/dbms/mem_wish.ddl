/**********************************/
/* Table Name: 회원 위시리스트 */
/**********************************/

DROP TABLE MEM_WISH CASCADE CONSTRAINTS;


CREATE TABLE mem_wish(
		mem_wish_no                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		at_no                         		NUMBER(10)		 NOT NULL       UNIQUE,
		mem_no                        		NUMBER(10)		 NOT NULL,
		mem_wish_seqno                		NUMBER(10)		 DEFAULT 1		 NOT NULL,
        word                                    VARCHAR2(100)   NULL,
        FOREIGN KEY (mem_no) REFERENCES mem (mem_no),
        FOREIGN KEY (at_no) REFERENCES at (at_no)
);

COMMENT ON TABLE mem_wish is '회원 위시리스트';
COMMENT ON COLUMN mem_wish.mem_wish_no is '회원 위시 번호';
COMMENT ON COLUMN mem_wish.at_no is '상품 번호';
COMMENT ON COLUMN mem_wish.mem_no is '회원 번호';
COMMENT ON COLUMN mem_wish.mem_wish_seqno is '회원 위시 출력 번호';
COMMENT ON COLUMN mem_wish.word is '회원 위시 검색어';


-- ALTER TABLE mem_wish ADD (word VARCHAR2(100));


INSERT INTO at(at_no, at_grp_no, at_seqno, at_visible, at_name, at_detail,
at_price, at_content, at_cancle, at_lowest, at_hit, at_dur, at_lang, at_sns, at_map)
VALUES (at_seq.nextval, 1, 1, 'Y', '진진자라', '전메뉴 이용권', 50000, '중국집', 'Y', 'Y', 0, 2, '영어', 'http://www.daum.net', 0);

INSERT INTO at(at_no, at_grp_no, at_seqno, at_visible, at_name, at_detail,
at_price, at_content, at_cancle, at_lowest, at_hit, at_dur, at_lang, at_sns, at_map)
VALUES (at_seq.nextval, 1, 1, 'Y', '티볼로24', '3종 세트', 40000, '호텔 운영 뷔페', 'Y', 'Y', 0, 2, '영어', 'http://www.daum.net', 0);

INSERT INTO at(at_no, at_grp_no, at_seqno, at_visible, at_name, at_detail,
at_price, at_content, at_cancle, at_lowest, at_hit, at_dur, at_lang, at_sns, at_map)
VALUES (at_seq.nextval, 1, 1, 'Y', '교촌치킨', '반반', 50000, '이민호 광고 치킨집', 'Y', 'Y', 0, 2, '영어', 'http://www.daum.net', 0);
INSERT INTO at(at_no, at_grp_no, at_seqno, at_visible, at_name, at_detail,
at_price, at_content, at_cancle, at_lowest, at_hit, at_dur, at_lang, at_sns, at_map)
VALUES (at_seq.nextval, 1, 1, 'Y', '진진자라', '전메뉴 이용권', 50000, '중국집', 'Y', 'Y', 0, 2, '영어', 'http://www.daum.net', 0);



 -- ▷시퀀스 삭제
DROP SEQUENCE mem_wish_seq;  
 

-- ▷시퀀스 생성
CREATE SEQUENCE mem_wish_seq
    START WITH 1                     -- 시작 번호
    INCREMENT BY 1                -- 증가값
    MAXVALUE 9999999999      --최댓값:9999999999 → NUMBER(10) 대응
    CACHE 2                              -- 2번은 메모리에서 계산 (insert가 큰 데이터의 경우 캐시 값을 크게 잡기)
    NOCYCLE;                            -- 순환 x, 다시 1부터 생성되는 것을 방지
    
    
 
 
1. 등록


SELECT NVL(MAX(mem_wish_seqno), 0) + 1 as mem_wish_seqno FROM mem_wish;

 

INSERT INTO mem_wish(mem_wish_no, at_no, mem_wish_seqno, mem_no)
VALUES (mem_wish_seq.nextval, '1', (SELECT NVL(MAX(mem_wish_seqno), 0) + 1 as mem_wish_seqno FROM mem_wish), '2');

INSERT INTO mem_wish(mem_wish_no, at_no, mem_wish_seqno, mem_no)
VALUES (mem_wish_seq.nextval, '1', (SELECT NVL(MAX(mem_wish_seqno), 0) + 1 as mem_wish_seqno FROM mem_wish), '2');

INSERT INTO mem_wish(mem_wish_no, at_no, mem_wish_seqno, mem_no)
VALUES (mem_wish_seq.nextval, '1', (SELECT NVL(MAX(mem_wish_seqno), 0) + 1 as mem_wish_seqno FROM mem_wish), '1');


INSERT INTO mem_wish(mem_wish_no, at_no, mem_wish_seqno, mem_no)
VALUES (mem_wish_seq.nextval, '2', (SELECT NVL(MAX(mem_wish_seqno), 0) + 1 as mem_wish_seqno FROM mem_wish), '1');


INSERT INTO mem_wish(mem_wish_no, at_no, mem_wish_seqno, mem_no)
VALUES (mem_wish_seq.nextval, '1', (SELECT NVL(MAX(mem_wish_seqno), 0) + 1 as mem_wish_seqno FROM mem_wish), '1');

 COMMIT;
 
 
 
2. 목록

 
 SELECT mem_wish_no, at_no, mem_wish_seqno, mem_no
 FROM mem_wish
 ORDER BY mem_wish_no ASC;
 
   
3. 조회

  
  SELECT mem_wish_no, at_no, mem_wish_seqno, mem_no, word
  FROM mem_wish
  WHERE mem_wish_no = 1;
  
  
  
  -- At, Mem_wish Join
  SELECT mem_wish_no,  mem_wish_seqno, mem_no, w.at_no as w_at_no,
                 at_visible, at_name, at_detail, at_price, a.at_no as a_at_no
  FROM mem_wish w, at a
  WHERE (w.at_no  = a.at_no) and mem_no = 12
  ORDER BY mem_wish_seqno DESC;
  


-- 상품 이름 검색 + 페이징
-- step 1

SELECT mem_wish_no,  mem_wish_seqno, mem_no, word, w.at_no as w_at_no,
             at_visible, at_name, at_detail, at_price, a.at_no as a_at_no
FROM mem_wish w, at a
WHERE w.at_no = a.at_no AND mem_no = 2
-- WHERE at_name LIKE '%진진%'
ORDER BY mem_wish_seqno DESC;
  
  
-- step 2
SELECT mem_wish_no,  mem_wish_seqno, mem_no, word, w_at_no,
             at_visible, at_name, at_detail, at_price,  a_at_no, rownum as r
FROM (
            SELECT mem_wish_no,  mem_wish_seqno, mem_no, word,  w.at_no as w_at_no,
             at_visible, at_name, at_detail, at_price, a.at_no as a_at_no
             FROM mem_wish w, at a
             WHERE w.at_no = a.at_no AND mem_no = 2
             -- WHERE at_name LIKE '%진진%'
             ORDER BY mem_wish_seqno DESC
);

-- step 3, 1 page
SELECT mem_wish_no,  mem_wish_seqno, mem_no, w_at_no,
             at_visible, at_name, at_detail, at_price,  a_at_no, r
FROM (
            SELECT mem_wish_no,  mem_wish_seqno, mem_no,  w_at_no,
                         at_visible, at_name, at_detail, at_price,  a_at_no, rownum as r
            FROM (
                        SELECT mem_wish_no,  mem_wish_seqno, mem_no, w.at_no as w_at_no,
                         at_visible, at_name, at_detail, at_price, a.at_no as a_at_no
                         FROM mem_wish w, at a
                          WHERE w.at_no = a.at_no AND mem_no = 1
                         -- WHERE at_name LIKE '%진진%'
                         -- WHERE mem_no = 1 AND (w.at_no = a.at_no) AND at_name LIKE '%24%' 
                         ORDER BY mem_wish_seqno DESC
            )
)
WHERE r >= 1 AND r <= 10;


-- step 3, 2 page
SELECT mem_wish_no,  mem_wish_seqno, mem_no, word, w_at_no,
             at_visible, at_name, at_detail, at_price,  a_at_no, r
FROM (
            SELECT mem_wish_no,  mem_wish_seqno, mem_no, word, w_at_no,
                         at_visible, at_name, at_detail, at_price,  a_at_no, rownum as r
            FROM (
                        SELECT mem_wish_no,  mem_wish_seqno, mem_no, word, w.at_no as w_at_no,
                         at_visible, at_name, at_detail, at_price, a.at_no as a_at_no
                         FROM mem_wish w, at a
                         -- WHERE w.at_no = a.at_no AND mem_no = 2
                         -- WHERE at_name LIKE '%진진%'
                         WHERE mem_no = 2 AND (w.at_no = a.at_no) AND at_name LIKE   '%치%' 
                         ORDER BY mem_wish_seqno DESC
            )
)
WHERE r >= 11 AND r <= 20;





 <!-- 검색 레코드 갯수 -->

SELECT COUNT(*) as cnt
FROM mem_wish w, at a
WHERE (w.at_no  = a.at_no) and mem_no = 1
--  at_name LIKE '%#{word}%'


 
select * from book;
   
4. 수정


UPDATE mem_wish 
SET at_no='1', mem_wish_seqno='4',  mem_no='1'
WHERE mem_wish_no=1;
 

 
 
6. 삭제

1) 모두 삭제
DELETE FROM mem_wish;
 
 
 
2) 특정 삭제
DELETE FROM mem_wish
WHERE mem_wish_no=9;

DELETE FROM mem_wish
WHERE mem_no=1; 




 


