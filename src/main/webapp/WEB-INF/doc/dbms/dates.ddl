DROP TABLE DATES CASCADE CONSTRAINTS;
DROP SEQUENCE dates_seq;

/**********************************/
/* Table Name: 상품별날짜 */
/**********************************/
CREATE TABLE DATES(
        DATES_NO                            NUMBER(10)       NOT NULL        PRIMARY KEY,
        AT_NO                               NUMBER(10)       NOT NULL,
        DATES_DATE                          VARCHAR2(100)        NOT NULL,
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO) ON DELETE CASCADE
);

COMMENT ON TABLE DATES is '상품별날짜';
COMMENT ON COLUMN DATES.DATES_NO is '상품별날짜번호';
COMMENT ON COLUMN DATES.AT_NO is '상품번호';
COMMENT ON COLUMN DATES.DATES_DATE is '상품별날짜';





DROP SEQUENCE dates_seq;
CREATE SEQUENCE dates_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  commit;

select * from user_sequences;
---------------------------------------------------------------

-- 1)Create

INSERT INTO dates(dates_no, at_no, dates_date)
VALUES (dates_seq.nextval, '1', '2020-07-01');

INSERT INTO dates(dates_no, at_no, dates_date)
VALUES (dates_seq.nextval, '1', '2020-07-01');

INSERT INTO dates(dates_no, at_no, dates_date)
VALUES (dates_seq.nextval, '1', '2020-07-01');


INSERT INTO dates(dates_no, at_no, dates_date)
VALUES (dates_seq.nextval, '1', '2020-07-02');

INSERT INTO dates(dates_no, at_no, dates_date)
VALUES (dates_seq.nextval, '1', '2020-07-02');

INSERT INTO dates(dates_no, at_no, dates_date)
VALUES (dates_seq.nextval, '2', '2020-07-02');

INSERT INTO dates(dates_no, at_no, dates_date)
VALUES (dates_seq.nextval, '2', '2020-07-02');

INSERT INTO dates(dates_no, at_no, dates_date)
VALUES (dates_seq.nextval, '2', '2020-07-02');

INSERT INTO dates(dates_no, at_no, dates_date)
VALUES (dates_seq.nextval, '3', '2020-07-02');

-- 연관 insert
INSERT INTO dates(dates_no, at_no, dates_date)
VALUES (dates_seq.nextval, at_seq.currval, '2020-09-02');

-- 연관 delete
DELETE FROM dates
WHERE at_no=1 and dates_date='2020-06-03' and ROWNUM=1;

rollback;
---------------------------------------------------------

DELETE FROM dates
WHERE rn =
SELECT at_no,dates_date, rn FROM(
                    SELECT at_no, dates_date, rownum as rn
                    FROM dates
                    WHERE at_no= 1 and  dates_date='2020-07-01'
                 )WHERE rn =1


------------------------------------
SELECT at_no,dates_date, rn
FROM (
        SELECT at_no,dates_date, rn FROM(
                    SELECT at_no, dates_date, rownum as rn
                    FROM dates
                    WHERE at_no= 1 and  dates_date='2020-07-01'
                 )WHERE rn =1
     )
WHERE rn=1;
COMMIT;

-- 2)List

SELECT dates_no, at_no, dates_date
FROM dates
ORDER BY dates_no ASC; 


-- left outer join 
SELECT a.at_grp_no, a.at_no,b.at_no,a.at_name, b.dates_date, b.dates_no
FROM at a, dates b
WHERE a.at_no = b.at_no(+)
ORDER BY a.at_no ASC, b.dates_date ASC;



-- ★상품페이지에서 총 재고 개수 출력 (list 리턴)
SELECT dates_date, COUNT(*) as cnt
FROM dates
WHERE at_no=1
GROUP BY dates_date
ORDER BY dates_date ASC;

-- 특정날짜 재고 개수 출력 (int 리턴 , null일 경우 0리턴--group by 제거하면 0 나오긴 함)

SELECT COUNT(*) as cnt
FROM dates
WHERE at_no=1  and dates_date='2020-09-01'
ORDER BY dates_date ASC;

--3)update
UPDATE dates
SET dates_date='2018-09-01'
WHERE at_no = 1;


