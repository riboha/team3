/**********************************/
/* Table Name: 결제세부내역 */
/**********************************/
DROP TABLE payment_details;
CREATE TABLE payment_details(
        payment_details_no                  NUMBER(10)       NOT NULL        PRIMARY KEY,
        payment_no                                  NUMBER(10)       NOT NULL,
        at_no                                           NUMBER(10)       NOT NULL,
        mem_no                                      NUMBER(10)       NOT NULL,
        payment_total                               NUMBER(10)       NOT NULL,
  FOREIGN KEY (payment_no) REFERENCES payment (payment_no)
);

COMMENT ON TABLE payment_details is '결제세부내역';
COMMENT ON COLUMN payment_details.payment_details_no is '결제세부내역번호';
COMMENT ON COLUMN payment_details.payment_no is '결제번호';
COMMENT ON COLUMN payment_details.at_no is '상품번호';
COMMENT ON COLUMN payment_details.mem_no is '회원번호';
COMMENT ON COLUMN payment_details.payment_total is '총결제금액';

DROP SEQUENCE payment_details_seq;
CREATE SEQUENCE payment_details_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

--등록

INSERT INTO payment_details(payment_details_no, payment_no, at_no,mem_no, payment_total)
VALUES(payment_details_seq.nextval, 1,1, 1, 50000 );

INSERT INTO payment_details(payment_details_no, payment_no, at_name, mem_name, mem_tel, payment_total)
VALUES(payment_details_seq.nextval, 1, '상품1', '김김', '010-0000-0000', 11);

  commit;
  
  SELECT  payment_details_no, payment_no, at_no,mem_no, payment_total
FROM payment_details
ORDER BY payment_details_no ASC;
  
  

--read
SELECT  payment_details_no, payment_no, at_no,mem_no, payment_total
FROM payment_details
WHERE payment_no=2 AND mem_no=1;

--delete
DELETE FROM payment_details
WHERE payment_no =1 AND mem_no=1;

  commit;
  
