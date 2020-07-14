/**********************************/
/* Table Name: 설문조사 */
/**********************************/
drop table MEM;
DROP TABLE SURV_RES;
DROP TABLE SURV_ITEM;
DROP TABLE SURV cascade constraints;
CREATE TABLE surv(
        SURV_NO                             NUMBER(10)       NOT NULL        PRIMARY KEY,
        SURV_SEQNO                          NUMBER(10)       NOT NULL,
        SURV_TITLE                          VARCHAR2(300)        NOT NULL,
        SURV_PASSWD                         VARCHAR2(15)          NOT NULL,
        SURV_STARTDATE                      VARCHAR2(50)         NOT NULL,
        SURV_ENDDATE                        VARCHAR2(50)         NOT NULL,
        SURV_rdate                          date                not null,
        SURV_CNT                            NUMBER(10)       NOT NULL,
        SURV_CONTINUE                  VARCHAR2(100)             NOT NULL,
        MEM_NO                              NUMBER(10)       NULL ,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO)
);

COMMENT ON TABLE SURV is '설문조사';
COMMENT ON COLUMN SURV.SURV_NO is '설문조사번호';
COMMENT ON COLUMN SURV.SURV_SEQNO is '설문조사출력순서';
COMMENT ON COLUMN SURV.SURV_TITLE is '설문조사제목';
COMMENT ON COLUMN SURV.SURV_PASSWD  is '설문조사패스워드';
COMMENT ON COLUMN SURV.SURV_STARTDATE is '설문조사시작날짜';
COMMENT ON COLUMN SURV.SURV_ENDDATE is '설문조사종료날짜';
COMMENT ON COLUMN SURV.SURV_CNT is '설문조사참여인원';
COMMENT ON COLUMN SURV.SURV_CONTINUE is '설문조사진행여부';
COMMENT ON COLUMN SURV.SURV_rdate is '설문조사등록일';
COMMENT ON COLUMN SURV.MEM_NO is '회원번호';

DROP SEQUENCE SURV_seq;
CREATE SEQUENCE SURV_seq
    START WITH 1         -- 시작번호
    INCREMENT BY 1     -- 증가 값
    MAXVALUE 9999999999 -- 최대값 : 9999999999 --> NUMBER(10) 대응
    CACHE 2                  -- 2번은 메모리에서만 계산(업데이트를 계속해서 하지 않음 ), insert가 많으면 cache를 100~200정도로 하면 오라클 속도가 빨라짐..
    NOCYCLE;   

commit;
1) 등록
INSERT INTO surv(surv_no, surv_seqno, surv_title,surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_rdate, mem_no)
VALUES(SURV_seq.nextval, 1, '설문조사제목', '1234', '2020-07-07', '2020-07-14', 0, '설문진행',sysdate, 1);

INSERT INTO surv(surv_no, surv_seqno, surv_title,surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_rdate, mem_no)
VALUES(SURV_seq.nextval, 2, '설문조사제목2', '1234', '2020-07-07', '2020-07-14', 0, '설문진행',sysdate, 1);

INSERT INTO surv(surv_no, surv_seqno, surv_title,surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_rdate, mem_no)
VALUES(SURV_seq.nextval, 3, '설문조사제목', '1234', '2020-07-07', '2020-07-14', 0, '설문진행',sysdate, 1);

INSERT INTO surv(surv_no, surv_seqno, surv_title,surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_rdate, mem_no)
VALUES(SURV_seq.nextval, 4, '설문조사제목', '1234', '2020-07-07', '2020-07-14', 0, '설문진행',sysdate, 1);

commit;
2) 목록
SELECT surv_no, surv_seqno, surv_title,surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_rdate, mem_no
FROM SURV
ORDER BY SURV_NO DESC;
 
commit;


3-1) 조회
SELECT surv_no, surv_seqno, surv_title,surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_rdate, mem_no
FROM SURV
WHERE SURV_NO = 6;

COMMIT;

3-2) 조회수 증가
UPDATE SURV 
SET surv_cnt=surv_cnt+1 
WHERE surv_no = 4;       

4) 수정
UPDATE SURV
SET  surv_seqno=4, surv_title ='제목수정테스트', surv_startdate='2020-05-16', surv_enddate='2020-06-15',surv_continue='설문종료'
WHERE surv_no = 4;


5) 삭제
DELETE FROM SURV
WHERE SURV_NO=4;

commit;

6) 검색

7) 페이징
-- step1
select SURV_NO, surv_seqno, SURV_TITLE, surv_content, surv_passwd, SURV_STARTDATE, SURV_ENDDATE, SURV_CNT, SURV_CONTINUE, surv_word, MEM_NO 
from surv
where surv_no=1 and surv_word like '%설문%'
order by surv_no desc;

-- step2
select SURV_NO, surv_seqno, SURV_TITLE, surv_content, surv_passwd, SURV_STARTDATE, SURV_ENDDATE, SURV_CNT, SURV_CONTINUE, surv_word, MEM_NO, rownum as r
from(
        select SURV_NO, surv_seqno, SURV_TITLE, surv_content, surv_passwd, SURV_STARTDATE, SURV_ENDDATE, SURV_CNT, SURV_CONTINUE, surv_word, MEM_NO 
        from surv
        where surv_no=1 and surv_word like '%설문%'
        order by surv_no desc
);

-- step3(rownum을 바깥으로 전달함), 1page
-- r이 1보다 크거나 같고 10보다 작거나 같으면 1페이지.
select surv_no, surv_seqno, surv_title, surv_content, surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_word, mem_no, r
from(
        select surv_no, surv_seqno, surv_title, surv_content, surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_word, mem_no, rownum as r
        from(
                select SURV_NO, surv_seqno, SURV_TITLE, surv_content, surv_passwd, SURV_STARTDATE, SURV_ENDDATE, SURV_CNT, SURV_CONTINUE, surv_word, MEM_NO 
                from surv
                where surv_no=1 and surv_word like '%설문%'
                order by surv_no desc
        )
)
where r >=1 and r<=10;

commit;
8) 검색된갯수
select count(*) as cnt
from surv
