DROP TABLE AT_IMG CASCADE CONSTRAINTS;
DROP SEQUENCE at_img_seq;

/**********************************/
/* Table Name: 상품이미지 */
/**********************************/
CREATE TABLE AT_IMG(
        AT_IMG_NO                           NUMBER(10)       NOT NULL        PRIMARY KEY,
        AT_NO                               NUMBER(10)       NOT NULL,
        AT_IMG_FNAME                        VARCHAR2(100)        NOT NULL,
        AT_IMG_FUPNAME                      VARCHAR2(100)        NOT NULL,
        AT_IMG_THUMB                        VARCHAR2(100)        NOT NULL,
        AT_IMG_SIZE                         NUMBER(10)       NOT NULL,
        AT_IMG_SEQNO                    NUMBER(7)        DEFAULT 0       NOT NULL,
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO)
);

COMMENT ON TABLE AT_IMG is '상품이미지';
COMMENT ON COLUMN AT_IMG.AT_IMG_NO is '상품이미지번호';
COMMENT ON COLUMN AT_IMG.AT_NO is '상품번호';
COMMENT ON COLUMN AT_IMG.AT_IMG_FNAME is '상품이미지원본이름';
COMMENT ON COLUMN AT_IMG.AT_IMG_FUPNAME is '상품이미지업로드이름';
COMMENT ON COLUMN AT_IMG.AT_IMG_THUMB is '상품이미지썸네일';
COMMENT ON COLUMN AT_IMG.AT_IMG_SIZE is '상품이미지사이즈';
COMMENT ON COLUMN AT_IMG.AT_IMG_SEQNO is '상품이미지순서';

DROP SEQUENCE at_img_seq;
CREATE SEQUENCE at_img_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  commit;
  
SELECT *
from at_img
where at_no=1;

SELECT at_img_no, at_no, at_img_fname, at_img_fupname, at_img_thumb, at_img_size
from at_img
ORDER BY at_no ASC, at_img_no ASC;


DELETE FROM at_img
WHERE at_img_no=1;


INSERT INTO COUNTRIES(
        COUNTRY_ID,
        COUNTRY_NAME,
        REGION_ID) 
    VALUES(
        'CB',
        'CODING BUB',
        (SELECT NVL(MAX(REGION_ID)+1,0) FROM COUNTRIES));

-- insert 파일 개수 만큼 반복
insert into at_img(at_img_no, at_no, at_img_fname, at_img_fupname, at_img_thumb, at_img_size, at_img_seqno)
values(at_img_seq.nextval, 1, 'aaa', '첫번째이미지', 'ccc', '0', (select count(*) from at_img where at_no=1));

  
SELECT *
from at_img
commit;


insert into at_img(at_img_no, at_no, at_img_fname, at_img_fupname, at_img_thumb, at_img_size,at_img_seqno)
values(at_img_seq.nextval, 1, 'aaa', '두번째', 'ccc', '0', ((select count (*) as cnt from at_img)+1);

insert into at_img(at_img_no, at_no, at_img_fname, at_img_fupname, at_img_thumb, at_img_size,at_img_seqno)
values(at_img_seq.nextval, 1, 'aaa', '세번째', 'ccc', '0', (select count (*) as cnt from at_img)+1);


insert into at_img(at_img_no, at_no, at_img_fname, at_img_fupname, at_img_thumb, at_img_size,at_img_seqno)
values(at_img_seq.nextval, 2, 'aaa', '첫번째', 'ccc', '0',(select count (*) as cnt from at_img));


insert into at_img(at_img_no, at_no, at_img_fname, at_img_fupname, at_img_thumb, at_img_size,at_img_seqno)
values(at_img_seq.nextval, 2, 'aaa', '두번째', 'ccc', '0', (select count (*) as cnt from at_img));

insert into at_img(at_img_no, at_no, at_img_fname, at_img_fupname, at_img_thumb, at_img_size,at_img_seqno)
values(at_img_seq.nextval, 3, 'aaa', '첫번째', 'ccc', '0',  (select count (*) as cnt from at_img));

rollback;







