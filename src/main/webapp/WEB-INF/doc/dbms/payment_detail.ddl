/**********************************/
/* Table Name: �������γ��� */
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

COMMENT ON TABLE payment_details is '�������γ���';
COMMENT ON COLUMN payment_details.payment_details_no is '�������γ�����ȣ';
COMMENT ON COLUMN payment_details.payment_no is '������ȣ';
COMMENT ON COLUMN payment_details.at_no is '��ǰ��ȣ';
COMMENT ON COLUMN payment_details.mem_no is 'ȸ����ȣ';
COMMENT ON COLUMN payment_details.payment_total is '�Ѱ����ݾ�';

DROP SEQUENCE payment_details_seq;
CREATE SEQUENCE payment_details_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

--���

INSERT INTO payment_details(payment_details_no, payment_no, at_no,mem_no, payment_total)
VALUES(payment_details_seq.nextval, 1,1, 1, 50000 );

INSERT INTO payment_details(payment_details_no, payment_no, at_name, mem_name, mem_tel, payment_total)
VALUES(payment_details_seq.nextval, 1, '��ǰ1', '���', '010-0000-0000', 11);

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
  
