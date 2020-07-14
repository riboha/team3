DROP TABLE at CASCADE CONSTRAINTS;
DROP SEQUENCE at_seq;

/**********************************/
/* Table Name: 상품 */
/**********************************/
CREATE TABLE AT(
        AT_NO                               NUMBER(10)       NOT NULL        PRIMARY KEY,
        AT_GRP_NO                           NUMBER(10)       NOT NULL,
        AT_SEQNO                            NUMBER(7)        NOT NULL,
        AT_VISIBLE                          CHAR(1)      DEFAULT 'Y'         NOT NULL,
        AT_NAME                             VARCHAR2(100)        NOT NULL,
        AT_DETAIL                           VARCHAR2(100)        NOT NULL,
        AT_PRICE                            NUMBER(10)       NOT NULL,
        AT_CONTENT                          CLOB         NOT NULL,
        AT_CANCLE                           CHAR(1)      DEFAULT 'Y'         NOT NULL,
        AT_LOWEST                           CHAR(1)      DEFAULT 'Y'         NOT NULL,
        AT_HIT                              NUMBER(10)       DEFAULT 0       NOT NULL,
        AT_DUR                              NUMBER(10)       NOT NULL,
        AT_LANG                             VARCHAR2(100)        NOT NULL,
        AT_SNS                              VARCHAR2(1000)       NOT NULL,
        AT_MAP                              VARCHAR2(100)        NOT NULL,

  FOREIGN KEY (AT_GRP_NO) REFERENCES AT_GRP (AT_GRP_NO)
);

COMMENT ON TABLE AT is '상품';
COMMENT ON COLUMN AT.AT_NO is '상품번호';
COMMENT ON COLUMN AT.AT_GRP_NO is '상품그룹번호';
COMMENT ON COLUMN AT.AT_SEQNO is '상품출력순서';
COMMENT ON COLUMN AT.AT_VISIBLE is '상품출력모드';
COMMENT ON COLUMN AT.AT_NAME is '상품명';
COMMENT ON COLUMN AT.AT_DETAIL is '상품명상세';
COMMENT ON COLUMN AT.AT_PRICE is '상품가격';
COMMENT ON COLUMN AT.AT_CONTENT is '상품내용';
COMMENT ON COLUMN AT.AT_CANCLE is '상품취소가능여부';
COMMENT ON COLUMN AT.AT_LOWEST is '상품최저가보장여부';
COMMENT ON COLUMN AT.AT_HIT is '상품조회수';
COMMENT ON COLUMN AT.AT_DUR is '상품소요시간';
COMMENT ON COLUMN AT.AT_LANG is '상품지원언어';
COMMENT ON COLUMN AT.AT_SNS is '상품소셜';
COMMENT ON COLUMN AT.AT_MAP is '상품지도';

DROP SEQUENCE at_seq;
CREATE SEQUENCE at_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  commit;
  
  ---------------------------------------------------------------

-- 1)Create

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
VALUES (at_seq.nextval, 2, 1, 'Y', '한복체험', '경복궁 한복체험', 50000, '한복 착용시 경복궁 입장 무료!', 'Y', 'Y', 0, 2, '영어', 'http://www.daum.net', 0);

INSERT INTO at(at_no, at_grp_no, at_seqno, at_visible, at_name, at_detail, 
at_price, at_content, at_cancle, at_lowest, at_hit, at_dur, at_lang, at_sns, at_map)
VALUES (at_seq.nextval, 2, 1, 'Y', '롯데월드타워', '전망대 입장권', 50000, '초고층 전망대에서 야경을!', 'Y', 'Y', 0, 2, '영어', 'http://www.daum.net', 0);

COMMIT;

-- 2)List

SELECT at_no, at_grp_no, at_seqno, at_visible, at_name, at_detail, 
at_price, at_content, at_cancle, at_lowest, at_hit, at_dur, at_lang, at_sns, at_map
FROM at
ORDER BY at_no ASC; 

-- 3)Read
SELECT at_no, at_grp_no, at_seqno, at_visible, at_name, at_detail, 
at_price, at_content, at_cancle, at_lowest, at_hit, at_dur, at_lang, at_sns, at_map
FROM at
WHERE at_no =1; 


-- 4)Update
UPDATE at
SET at_name='진찐자라'
WHERE at_no = 1;


-- 5)Delete

DELETE FROM at
WHERE at_no=6;  

--하위 테이블에서 사용시 삭제 불가 (child record found)

-- 완전 상품 삭제 ( child table관련 row 포함)

DELETE FROM at ON DELETE CASCADE 
WHERE at_no=1

 
-- 출력 순서에따른 전체 목록
SELECT at_no, at_grp_no, at_seqno, at_visible, at_name, at_detail, at_price, at_content, at_cancle, at_lowest, at_hit, at_dur, at_lang, at_sns, at_map
FROM at
ORDER BY at_seqno ASC;

-- 출력 순서 상향, 10 ▷ 1
UPDATE at
SET at_seqno = at_seqno - 1
WHERE at_no=1;


-- 출력순서 하향, 1 ▷ 10
UPDATE at
SET at_seqno = at_seqno + 1
WHERE at_no=1;


-- 출력여부 조정 하향, 1 ▷ 10
UPDATE at
SET at_visible= 'Y'
WHERE at_no=7;

COMMIT;

 -- 전체 레코드 갯수
SELECT COUNT(*) as cnt
FROM at


-- at+ list + 페이징 +검색
select *
from at


SELECT at_no, at_img_fupname, at_grp_no, at_seqno, at_visible, at_name, at_detail, at_price, dates_date, r
FROM (
           SELECT at_no, at_img_fupname, at_grp_no, at_seqno, at_visible, at_name, at_detail, at_price, dates_date, rownum as r
           FROM (
                     SELECT a.at_no, b.at_img_fupname, a.at_grp_no, a.at_seqno, a.at_visible, a.at_name, a.at_detail, a.at_price, c.dates_date
                     FROM at a, at_img b, dates c
                     WHERE a.at_no = b.at_no and at_grp_no=1 and b.at_img_seqno=0 and (a.at_name like '%진진%' or dates_date='2020-09-17')
                     ORDER BY at_seqno DESC
                )         
)
WHERE r >= 1 AND r <= 10;

-- 특정 상품 해당날짜 재고 등록 : at.at_no=1 인 페이지에서  dates.dates_date='2020-07-01' 등록하고자 함 //등록 개수만큼 반복
-- ★★★★★ 동일한 at_no 사용하기!!!!(같은 insert문에서의 nextval는 1번만 실행 되는 듯), 동일 수 row 등록 문제
INSERT  ALL
INTO    at   VALUES (at_seq.nextval, 1, 1, 'Y', '이장수해장국', '김치콩나물국', 15000, '100년 전통의 김치콩나물국집입니다. 모든재료는 국내산 사용', 'Y', 'Y', 0, 2, '영어', 'http://www.daum.net', 0)
INTO    dates   VALUES (dates_seq.nextval, at_seq.nextval, '2020-07-28')
SELECT  *
FROM    DUAL;

rollback;

 
