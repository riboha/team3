/**********************************/
/* Table Name: 공지사항 */
/**********************************/
DROP TABLE notice;
CREATE TABLE notice(
      noticeno              NUMBER(10)     NOT NULL PRIMARY KEY, -- 공지 번호
      notice_title           VARCHAR2(100)     NOT NULL, -- 공지 제목
      notice_content      VARCHAR2(100)     NOT NULL, -- 공지 내용
      notice_rname        VARCHAR2(10)    NOT NULL, -- 등록자
      notice_passwd       VARCHAR2(15)    NOT NULL, -- 패스워드
      notice_visible        CHAR(1)    DEFAULT 'Y'     NOT NULL, -- 출력 모드
      notice_cnt             NUMBER(7)     NOT NULL, -- 조회수
      notice_division       VARCHAR2(10)    NOT NULL, -- 구분
      word                  VARCHAR2(300)        NULL , -- 검색어
      notice_rdate          DATE               NOT NULL -- 등록일  
);

COMMENT ON TABLE notice is '공지사항';
COMMENT ON COLUMN notice.noticeno is '공지 번호';
COMMENT ON COLUMN notice.notice_title is '공지 제목';
COMMENT ON COLUMN notice.notice_content is '공지 내용';
COMMENT ON COLUMN notice.notice_rname is '등록자';
COMMENT ON COLUMN notice.notice_passwd is '패스워드';
COMMENT ON COLUMN notice.notice_visible is '출력 모드';
COMMENT ON COLUMN notice.notice_cnt is '조회수';
COMMENT ON COLUMN notice.notice_division is '구분';
COMMENT ON COLUMN notice.word is '검색어';
COMMENT ON COLUMN notice.notice_rdate is '등록일';


DROP SEQUENCE notice_seq;
CREATE SEQUENCE notice_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지


1) 공지사항 등록
INSERT INTO notice(noticeno, notice_title, notice_content, notice_rname, notice_passwd, notice_visible, notice_cnt, notice_division, notice_rdate)
VALUES(notice_seq.nextval, '공지사항1', '공지사항', '관리자1', '1234', 'Y', 0, '공지', sysdate);

INSERT INTO notice(noticeno, notice_title, notice_content, notice_rname, notice_passwd, notice_visible, notice_cnt, notice_division, notice_rdate)
VALUES(notice_seq.nextval, '공지사항2', '공지사', '관리자2', '1234', 'Y', 0, '일반', sysdate);
            
INSERT INTO notice(noticeno, notice_title, notice_content, notice_rname, notice_passwd, notice_visible, notice_cnt, notice_division, notice_rdate)
VALUES(notice_seq.nextval, '공지사항3', '공지', '관리자3', '1234', 'Y', 0, '서비스', sysdate);

commit;

2-1) 전체목록
SELECT noticeno, notice_title, notice_content, notice_rname, notice_passwd, notice_visible, notice_cnt, notice_division, notice_rdate
FROM notice 
ORDER BY noticeno DESC;

2-2) 검색 목록
1) 검색
① 검색 목록
-- title, content, word column search
SELECT noticeno, notice_title, notice_content, notice_rname,
           notice_cnt, notice_division, notice_rdate
FROM notice
WHERE (notice_title LIKE '%공지%' OR notice_content LIKE '%공지%')
ORDER BY noticeno DESC;


② 검색 레코드 갯수
-- 전체 레코드 갯수
SELECT COUNT(*) as cnt
FROM notice
WHERE noticeno=1;

-- cateno 별 검색된 레코드 갯수
SELECT COUNT(*) as cnt
FROM notice
WHERE noticeno=1 AND notice_title LIKE '%공지%';

SELECT COUNT(*) as cnt
FROM notice
WHERE noticeno=1 AND (notice_title LIKE '%공지%' OR notice_content LIKE '%공지%')


3) 1건 조회
SELECT noticeno, notice_title, notice_content, notice_rname, notice_passwd, notice_visible, notice_cnt, notice_division, notice_rdate
FROM notice 
WHERE noticeno = 1;

4) 수정
UPDATE notice 
SET notice_title='공지사항11', notice_content='공지사항2', notice_rname='공지', notice_visible='N'
WHERE noticeno = 4;

COMMIT;

5) 패스워드 검사
SELECT COUNT(*) as notice_passwd_cnt
FROM notice
WHERE noticeno=1 AND notice_passwd='1234';

SELECT noticeno, notice_passwd
FROM notice 
ORDER BY noticeno DESC;    

6) 삭제
DELETE FROM notice
WHERE noticeno=4;

COMMIT;  


7) 조회수
UPDATE notice
SET notice_cnt = notice_cnt + 1
WHERE noticeno = 1;

8) 출력 모드의 변경
UPDATE notice
SET notice_visible='Y'
WHERE noticeno=1;

UPDATE notice
SET notice_visible='N'
WHERE noticeno=1;

commit;  
  
  
12) 검색 + 페이징
SELECT noticeno, notice_title, notice_content, notice_rname,
           notice_cnt, notice_division, notice_rdate
FROM notice
WHERE noticeno=1 AND (notice_title LIKE '%공지%' OR notice_content LIKE '%공지%')
ORDER BY noticeno DESC;



-- step 1
SELECT noticeno, notice_title, notice_content, notice_rname, notice_cnt, notice_division, notice_rdate
FROM notice
WHERE noticeno=1 AND notice_title LIKE '%공지%'
ORDER BY noticeno DESC;

-- step 2
SELECT noticeno, notice_title, notice_content, notice_rname, notice_cnt, notice_division, notice_rdate, rownum as r
FROM (
          SELECT noticeno, notice_title, notice_content, notice_rname, notice_cnt, notice_division, notice_rdate
          FROM notice
          WHERE (notice_title LIKE '%공지%' OR notice_content LIKE '%공지%')
          ORDER BY noticeno DESC
);

-- step 3, 1 page
SELECT noticeno, notice_title, notice_content, notice_rname, notice_cnt, notice_division, notice_rdate, r
FROM (
           SELECT noticeno, notice_title, notice_content, notice_rname, notice_cnt, notice_division, notice_rdate, rownum as r
           FROM (
                     SELECT noticeno, notice_title, notice_content, notice_rname, notice_cnt, notice_division, notice_rdate
                     FROM notice
                     WHERE (notice_title LIKE '%공지%' OR notice_content LIKE '%공지%')
                     ORDER BY noticeno DESC
           )          
)
WHERE r >= 1 AND r <= 10;

-- step 3, 2 page
SELECT noticeno, notice_title, notice_content, notice_rname, notice_cnt, notice_division, notice_rdate, r
FROM (
           SELECT noticeno, notice_title, notice_content, notice_rname, notice_cnt, notice_division, notice_rdate, rownum as r
           FROM (
                     SELECT noticeno, notice_title, notice_content, notice_rname, notice_cnt, notice_division, notice_rdate
                     FROM notice
                     WHERE (notice_title LIKE '%공지%' OR notice_content LIKE '%공지%')
                     ORDER BY noticeno DESC
           )          
)
WHERE r >= 11 AND r <= 20;
 




