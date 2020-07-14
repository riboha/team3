/**********************************/
/* Table Name: ���� */
/**********************************/
DROP TABLE payment;
CREATE TABLE payment(
		payment_no                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		mem_no                        		NUMBER(10)		 NOT NULL,
		at_no                         		NUMBER(10)		 NOT NULL,
        payment_cnt                         		NUMBER(10)		 NOT NULL,
		payment_way                   		VARCHAR2(100)		 NOT NULL,
		payment_total                 		NUMBER(10)		 NOT NULL,
        payment_date                           DATE       NOT NULL,
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO),
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO)
);

COMMENT ON TABLE payment is '����';
COMMENT ON COLUMN payment.payment_no is '������ȣ';
COMMENT ON COLUMN payment.mem_no is 'ȸ����ȣ';
COMMENT ON COLUMN payment.at_no is '��ǰ��ȣ';
COMMENT ON COLUMN payment.payment_cnt is '����';
COMMENT ON COLUMN payment.payment_way is '�������';
COMMENT ON COLUMN payment.payment_total is '�����ݾ�';
COMMENT ON COLUMN payment.payment_date is '������';

DROP SEQUENCE payment_seq;
CREATE SEQUENCE payment_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
  --create		
INSERT INTO payment(payment_no, mem_no, at_no, payment_cnt, payment_way, payment_total, payment_date)
VALUES(payment_seq.nextval, 1, 12, 1, '������ü', 1111,  sysdate);

INSERT INTO payment(payment_no, mem_no, at_no, payment_cnt, payment_way, payment_total, payment_date)
VALUES(payment_seq.nextval, 1, 12, 2, '������ü', 1112,  sysdate);

INSERT INTO payment(payment_no, mem_no, at_no, payment_cnt, payment_way, payment_total, payment_date)
VALUES(payment_seq.nextval, 1, 12, 3,  '������ü', 1113,  sysdate);
  
  
  --list
SELECT payment_no, mem_no, at_no,payment_cnt, payment_way, payment_total, payment_date
FROM payment
ORDER BY payment_no ASC;

  --join list
  -- 1) at, payment, mem  join
  
  SELECT   p.payment_no as p_payment_no, p.payment_cnt as p_payment_cnt, p.payment_way as p_payment_way, p.payment_total as p_payment_total, p.payment_date as p_payment_date,
                a.at_no  as  a_at_no, a.at_price as a_at_price, a.at_name as a_at_name,
                m.mem_no as m_mem_no, m.mem_id as m_mem_id
FROM   payment p,  at  a,  mem m
WHERE           p.at_no = a.at_no
              AND p.mem_no = m.mem_no
              AND m.mem_no =1
ORDER BY payment_no ASC;
  
--2) payment , at join

SELECT   p.payment_no as p_payment_no, p.payment_cnt as p_payment_cnt, p.payment_way as p_payment_way, p.payment_total as p_payment_total, p.payment_date as p_payment_date,
                a.at_no  as  a_at_no, a.at_price as a_at_price, a.at_name as a_at_name
FROM   payment p,  at  a,  mem m
WHERE           p.at_no = a.at_no
              AND p.mem_no = m.mem_no
              AND m.mem_no =17
ORDER BY payment_no ASC; 
  --read
SELECT  payment_no, mem_no, at_no,payment_cnt, payment_way, payment_total, payment_date
FROM payment
WHERE payment_no=1;
  --update
  
  --delete
DELETE FROM payment
WHERE payment_no = 3 AND mem_no=1;
  
  commit;
