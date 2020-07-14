DROP TABLE at_grp CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 상품그룹 */
/**********************************/
CREATE TABLE AT_GRP(
        AT_GRP_NO                           NUMBER(10)       NOT NULL        PRIMARY KEY,
        AT_GRP_NAME                         VARCHAR2(50)         NOT NULL,
        AT_GRP_SEQNO                        NUMBER(7)        NOT NULL,
        AT_GRP_VISIBLE                      CHAR(1)      DEFAULT 'Y'         NOT NULL
);

COMMENT ON TABLE AT_GRP is '상품그룹';
COMMENT ON COLUMN AT_GRP.AT_GRP_NO is '상품그룹번호';
COMMENT ON COLUMN AT_GRP.AT_GRP_NAME is '상품그룹명';
COMMENT ON COLUMN AT_GRP.AT_GRP_SEQNO is '상품그룹출력순서';
COMMENT ON COLUMN AT_GRP.AT_GRP_VISIBLE is '상품그룹출력모드';



DROP SEQUENCE at_grp_seq;
CREATE SEQUENCE at_grp_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

---------------------------------------------------------------


commit;

-- 1)Create

INSERT INTO at_grp(at_grp_no, at_grp_name, at_grp_seqno, at_grp_visible)
VALUES (at_grp_seq.nextval, '인기맛집', 1, 'Y');

INSERT INTO at_grp(at_grp_no, at_grp_name, at_grp_seqno,at_grp_visible)
VALUES (at_grp_seq.nextval, '체험', 2, 'Y');

INSERT INTO at_grp(at_grp_no, at_grp_name, at_grp_seqno,at_grp_visible)
VALUES (at_grp_seq.nextval, '명소', 3, 'Y');

COMMIT;

-- 2)List

SELECT at_grp_no, at_grp_name, at_grp_seqno, at_grp_visible
FROM at_grp
ORDER BY at_grp_no ASC; 

-- 3)Read
SELECT at_grp_no, at_grp_name, at_grp_seqno, at_grp_visible
FROM at_grp
WHERE at_grp_no =1; 

-- 4)Update
UPDATE at_grp
SET at_grp_name='맛집', at_grp_seqno = 1
WHERE at_grp_no = 1;

-- 5)Delete
DELETE FROM at_grp
WHERE at_grp_no=1;  --하위 테이블에서 사용시 삭제 불가 (child record found)
 
-- 출력 순서에따른 전체 목록
SELECT at_grp_no, at_grp_name, at_grp_seqno,at_grp_visible
FROM at_grp
ORDER BY at_grp_seqno ASC;

-- 출력 순서 상향, 10 ▷ 1
UPDATE at_grp
SET at_grp_seqno = at_grp_seqno - 1
WHERE at_grp_no=1;

-- 출력순서 하향, 1 ▷ 10
UPDATE at_grp
SET at_grp_seqno = at_grp_seqno + 1
WHERE at_grp_no=1;

-- 페이징
SELECT at_grp_no, at_grp_name, at_grp_seqno, at_grp_visible, r
FROM (
           SELECT at_grp_no, at_grp_name, at_grp_seqno, at_grp_visible, rownum as r
           FROM at_grp
           ORDER BY at_grp_seqno                
)
WHERE r >= 1 AND r <= 10;

 -- 전체 레코드 갯수
SELECT COUNT(*) as cnt
FROM at_grp
