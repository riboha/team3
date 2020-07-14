/**********************************/
/* Table Name: 자주 묻는 질문 */
/**********************************/
DROP TABLE faq;
CREATE TABLE faq(
        faqno                   NUMBER(10)       NOT NULL, -- 질문 번호
        faq_title               VARCHAR2(100)    NOT NULL, -- 질문 제목
        faq_content             VARCHAR2(100)    NOT NULL, -- 질문 내용
        faq_rname           VARCHAR2(10)         NOT NULL, -- 등록자
        faq_passwd          VARCHAR2(15)         NOT NULL, -- 패스워드
        faq_seqno            NUMBER(10)      NOT NULL, -- 출력 순서
        faq_division          VARCHAR2(10)    NOT NULL, -- 구분
        word                  VARCHAR2(300)   NULL , -- 검색어
        faq_date              DATE                   NOT NULL -- 등록일
);

COMMENT ON TABLE faq is '자주 묻는 질문';
COMMENT ON COLUMN faq.faqno is '질문 번호';
COMMENT ON COLUMN faq.faq_title is '질문 제목';
COMMENT ON COLUMN faq.faq_content is '질문 내용';
COMMENT ON COLUMN faq.faq_rname is '등록자';
COMMENT ON COLUMN faq.faq_passwd is '패스워드';
COMMENT ON COLUMN faq.faq_seqno is '출력 순서';
COMMENT ON COLUMN faq.faq_division is '구분';
COMMENT ON COLUMN faq.word is '검색어';
COMMENT ON COLUMN faq.faq_date is '등록일';


DROP SEQUENCE faq_seq;
CREATE SEQUENCE faq_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  
1) 자주 묻는 질문 등록
INSERT INTO faq(faqno, faq_title, faq_content, faq_rname, faq_passwd, faq_seqno, faq_division, faq_date)
VALUES(faq_seq.nextval, 'faq1', 'faq1', '관리자1', '1234', 1, '상품', sysdate);

INSERT INTO faq(faqno, faq_title, faq_content, faq_rname, faq_passwd, faq_seqno, faq_division, faq_date)
VALUES(faq_seq.nextval, 'faq2', 'faq2', '관리자2', '1234', 2, '예약', sysdate);
            
INSERT INTO faq(faqno, faq_title, faq_content, faq_rname, faq_passwd, faq_seqno, faq_division, faq_date)
VALUES(faq_seq.nextval, 'faq3', 'faq3', '관리자3', '1234', 3, '서비스', sysdate);

commit;


2-1) 전체목록
1) 전체 목록
SELECT faqno, faq_title, faq_content, faq_rname, faq_passwd, faq_seqno, faq_division, faq_date
FROM faq 
ORDER BY faqno DESC;

2) 출력 순서별 전체 목록
SELECT faqno, faq_title, faq_content, faq_rname, faq_passwd, faq_seqno, faq_division, faq_date
FROM faq
ORDER BY faq_seqno DESC;

2-2) 검색 목록
1) 검색
① 검색 목록
-- title, content, word column search
SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date
FROM faq
WHERE (faq_title LIKE '%faq%' OR faq_content LIKE '%faq%')
ORDER BY faqno DESC;


② 검색 레코드 갯수
-- 전체 레코드 갯수
SELECT COUNT(*) as cnt
FROM faq
WHERE faqno=1;

-- 검색된 레코드 갯수
SELECT COUNT(*) as cnt
FROM faq
WHERE faqno=1 AND faq_title LIKE '%faq%';

SELECT COUNT(*) as cnt
FROM faq
WHERE faqno=1 AND (faq_title LIKE '%faq%' OR faq_content LIKE '%faq%')


3) 1건 조회
SELECT faqno, faq_title, faq_content, faq_rname, faq_passwd, faq_seqno, faq_division, faq_date
FROM faq 
WHERE faqno = 1;

4) 수정
UPDATE faq 
SET faq_title='공지사항11', faq_content='공지사항2', faq_rname='공지'
WHERE faqno = 4;

COMMIT;

5) 패스워드 검사
SELECT COUNT(*) as faq_passwd_cnt
FROM faq
WHERE faqno=1 AND faq_passwd='1234';

5-1) 패스워드 확인
SELECT faqno, faq_passwd
FROM faq 
ORDER BY faqno DESC;    

6) 삭제
DELETE FROM faq
WHERE faqno=4;

COMMIT;  


7) 출력 순서 상향, 10 ▷ 1
UPDATE faq
SET faq_seqno = faq_seqno - 1
WHERE faqno=1;
 
SELECT faqno, faq_title, faq_content, faq_rname, faq_passwd, faq_seqno, faq_division, faq_date
FROM faq 
WHERE faqno = 1;

8) 출력순서 하향, 1 ▷ 10
UPDATE faq
SET faq_seqno = faq_seqno + 1
WHERE faqno=1;

commit;
  
9) 검색 + 페이징
SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date
FROM faq
WHERE faqno=1 AND (faq_title LIKE '%faq%' OR faq_content LIKE '%faq%')
ORDER BY faqno DESC;

-- step 1
SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date
FROM faq
WHERE faqno=1 AND faq_content LIKE '%faq%')
ORDER BY faqno DESC;

-- step 2
SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date, rownum as r
FROM (
          SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date
          FROM faq
          WHERE (faq_title LIKE '%faq%' OR faq_content LIKE '%faq%')
          ORDER BY faqno DESC
);

-- step 3, 1 page
SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date, r
FROM (
           SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date, rownum as r
           FROM (
                     SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date
                     FROM faq
                     WHERE (faq_title LIKE '%faq%' OR faq_content LIKE '%faq%')
                     ORDER BY faqno DESC
           )          
)
WHERE r >= 1 AND r <= 10;

-- step 3, 2 page
SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date, r
FROM (
           SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date, rownum as r
           FROM (
                     SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date
                     FROM faq
                     WHERE (faq_title LIKE '%faq%' OR faq_content LIKE '%faq%')
                     ORDER BY faqno DESC
           )          
)
WHERE r >= 11 AND r <= 20;  