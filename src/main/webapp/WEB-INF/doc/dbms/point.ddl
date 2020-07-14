/**********************************/
/* Table Name: 포인트적립 */
/**********************************/
DROP TABLE point_save;

CREATE TABLE point_save(
        point_save_no                       NUMBER(10)       NOT NULL        PRIMARY KEY,
        payment_details_no                  NUMBER(10)       NULL ,
        mem_no                              NUMBER(10)       NOT NULL,
        point_saved                         NUMBER(10)       NOT NULL,   
  FOREIGN KEY (payment_details_no) REFERENCES payment_details (payment_details_no)
);

COMMENT ON TABLE point_save is '포인트적립';
COMMENT ON COLUMN point_save.point_save_no is '포인트적립번호';
COMMENT ON COLUMN point_save.payment_details_no is '결제세부내역번호';
COMMENT ON COLUMN point_save.mem_no is '회원번호';
COMMENT ON COLUMN point_save.point_saved is '적립금액';

DROP SEQUENCE point_save_seq;
CREATE SEQUENCE point_save_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지


--insert
INSERT INTO point_save(point_save_no, payment_details_no, mem_no, point_saved)
VALUES(point_save_seq.nextval, 1, 1,1000);

commit;


