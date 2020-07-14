/**********************************/
/* Table Name: 회원 구매이력 */
/**********************************/

DROP TABLE MEM_HIS CASCADE CONSTRAINTS;

CREATE TABLE MEM_HIS(
		mem_his_no                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		mem_his_seqno                 		NUMBER(10)		 NOT NULL,

        
        mem_no                        		NUMBER(10)		 NOT NULL,
		at_no                         		NUMBER(10)		 NOT NULL,
        payment_no                       NUMBER(10)		 NOT NULL,

		
        FOREIGN KEY (mem_no) REFERENCES mem (mem_no),
        FOREIGN KEY (at_no) REFERENCES at (at_no),
        FOREIGN KEY (payment_no) REFERENCES payment (payment_no)
);

COMMENT ON TABLE MEM_HIS is '회원 구매이력';
COMMENT ON COLUMN MEM_HIS.mem_his_no is '회원 이력 번호';
COMMENT ON COLUMN MEM_HIS.mem_his_seqno is '회원 이력 출력 번호';

COMMENT ON COLUMN MEM_HIS.mem_no is '회원 번호';
COMMENT ON COLUMN MEM_HIS.at_no is '상품 번호';
COMMENT ON COLUMN MEM_HIS.payment_no is '결제번호';





 -- ▷시퀀스 삭제
DROP SEQUENCE mem_his_seq;  
 

-- ▷시퀀스 생성
CREATE SEQUENCE mem_his_seq
    START WITH 1                     -- 시작 번호
    INCREMENT BY 1                -- 증가값
    MAXVALUE 9999999999      --최댓값:9999999999 → NUMBER(10) 대응
    CACHE 2                              -- 2번은 메모리에서 계산 (insert가 큰 데이터의 경우 캐시 값을 크게 잡기)
    NOCYCLE;                            -- 순환 x, 다시 1부터 생성되는 것을 방지
    
    
 
 
1. 등록


SELECT NVL(MAX(mem_his_seqno), 0) + 1 as mem_his_seqno FROM mem_his;

 

INSERT INTO mem_his(mem_his_no, at_no, mem_his_seqno, mem_no)
VALUES (mem_his_seq.nextval, '1', (SELECT NVL(MAX(mem_his_seqno), 0) + 1 as mem_his_seqno FROM mem_his), '1', sysdate);


INSERT INTO mem_his(mem_his_no, at_no, mem_his_seqno, mem_no)
VALUES (mem_his_seq.nextval, '1', (SELECT NVL(MAX(mem_his_seqno), 0) + 1 as mem_his_seqno FROM mem_his), '1', sysdate);


INSERT INTO mem_his(mem_his_no, at_no, mem_his_seqno, mem_no)
VALUES (mem_his_seq.nextval, '1', (SELECT NVL(MAX(mem_his_seqno), 0) + 1 as mem_his_seqno FROM mem_his), '1', sysdate);

 
 COMMIT;
 
 
 
2. 목록

 
 SELECT mem_his_no, at_no, mem_his_seqno, mem_no
 FROM mem_his
 ORDER BY mem_his_no ASC;
 
 
 
     SELECT h.mem_his_no as h_mem_his_no, r.name as r_name, r.rdate as r_date,
                c.cateno , c.categrpno, c.name, c.seqno, c.visible, c.rdate, c.cnt
    FROM categrp r, cate c
    WHERE (r.categrpno = c.categrpno) AND r.categrpno = 2
    ORDER BY r.categrpno ASC, c.seqno ASC;
 
 
 
  -- ♧  ⒝ 통합 VO (categrp + cate INNER JOIN (1:多) ),  ▷categrpno별 cate 출력

    SELECT r.categrpno as r_categrpno, r.name as r_name, r.rdate as r_date,
                c.cateno , c.categrpno, c.name, c.seqno, c.visible, c.rdate, c.cnt
    FROM categrp r, cate c
    WHERE (r.categrpno = c.categrpno) AND r.categrpno = 2
    ORDER BY r.categrpno ASC, c.seqno ASC;
 
 
 
   
3. 조회

  
  SELECT mem_his_no, at_no, mem_his_seqno, mem_no
  FROM mem_his
  WHERE mem_his_no = 1;


   
4. 수정


UPDATE mem_his 
SET  mem_his_seqno='4'
WHERE mem_his_no=1;
 

 
 
6. 삭제

1) 모두 삭제
DELETE FROM mem_his;
 
 
 
2) 특정 삭제
DELETE FROM mem_his
WHERE mem_his_no=9;
 
 

