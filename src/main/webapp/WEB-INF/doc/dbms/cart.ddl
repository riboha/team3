/**********************************/
/* Table Name: ��ٱ��� */
/**********************************/
DROP TABLE cart CASCADE CONSTRAINTS; 
DROP TABLE cart;
CREATE TABLE cart(
      cart_no                             NUMBER(10)       NOT NULL       PRIMARY KEY,
      mem_no                              NUMBER(10)       NOT NULL,
      at_no                               NUMBER(10)       NOT NULL,
      cart_cnt                                 NUMBER(10)       NOT NULL,
      cart_payment                             NUMBER(10)       NOT NULL,        
      cart_date                           DATE       NOT NULL,
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO),
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO)
);

COMMENT ON TABLE cart is '��ٱ���';
COMMENT ON COLUMN cart.cart_no is '��ٱ��Ϲ�ȣ';
COMMENT ON COLUMN cart.mem_no is 'ȸ����ȣ';
COMMENT ON COLUMN cart.at_no is '��ǰ��ȣ';
COMMENT ON COLUMN cart.cart_cnt is '����';
COMMENT ON COLUMN cart.cart_payment is '�����ݾ�';
COMMENT ON COLUMN cart.cart_date is '�����ð�';


DROP SEQUENCE cart_seq;
CREATE SEQUENCE cart_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����


-- ���
INSERT INTO CART(cart_no, mem_no, at_no, cart_cnt, cart_payment,  cart_date)
VALUES(cart_seq.nextval, 1, 1, 1, 50000,  sysdate);

INSERT INTO CART(cart_no, mem_no, at_no, cart_cnt, cart_payment,   cart_date)
VALUES(cart_seq.nextval, 1, 1, 2, 2222 , sysdate);

INSERT INTO CART(cart_no, mem_no, at_no, cart_cnt, cart_payment,  cart_date)
VALUES(cart_seq.nextval, 1, 1, 3, 3333, sysdate);


INSERT INTO CART(cart_no, mem_no, at_no, cart_cnt, cart_payment,  cart_date)
VALUES(cart_seq.nextval, 1, 1, 2, 4444, sysdate);

COMMIT;


--���
SELECT cart_no, mem_no, at_no, cart_cnt, cart_payment,  cart_date
FROM cart
ORDER BY cart_no ASC;

--join list
-- 1) cart, mem ,at join
SELECT   c.cart_no as c_cart_no, c.cart_cnt as c_cart_cnt, c.cart_payment as c_cart_payment,  c.cart_date as c_cart_date,
                a.at_no  as  a_at_no, a.at_price as a_at_price,
                m.mem_no as m_mem_no, m.mem_id as m_mem_id
FROM   cart c,  at  a,  mem m
WHERE           c.at_no = a.at_no
              AND c.mem_no = m.mem_no
              AND m.mem_no =1
ORDER BY cart_no ASC;

--2) cart , at join

SELECT   c.cart_no as c_cart_no, c.cart_cnt as c_cart_cnt, c.cart_payment as c_cart_payment,  c.cart_date as c_cart_date,
                a.at_no  as  a_at_no, a.at_price as a_at_price
FROM   cart c,  at  a,  mem  m
WHERE           c.at_no = a.at_no
              AND c.mem_no = m.mem_no
              AND m.mem_no =1
ORDER BY cart_no ASC;



--3) cart , mem

SELECT   c.cart_no as c_cart_no, c.cart_cnt as c_cart_cnt, c.cart_payment as c_cart_payment,  c.cart_date as c_cart_date,
                a.at_no  as  a_at_no, a.at_price as a_at_price
FROM   cart c,  at  a,  mem  m
WHERE           c.at_no = a.at_no
              AND c.mem_no = m.mem_no
              AND m.mem_no =1
ORDER BY cart_no ASC;

--
--SELECT  c.cart_no ,  c.mem_no ,  c.at_no , c.cnt , c.payment , c.cart_date,
--                    m.mem_no as m_mem_no,
--                    a.at_no as a_at_no
--FROM mem m , at a, cart c
--WHERE         m.mem_no = c.mem_no 
--            AND a.at_no = c.at_no
--ORDER BY c.cart_no ASC;
--
--
--SELECT  c.cart_no ,  c.mem_no ,  c.at_no , c.cnt , c.payment , c.cart_date,
--                    m.mem_no as m_mem_no,
--                    a.at_no as a_at_no
--FROM mem m , at a, cart c
--WHERE         m.mem_no = c.mem_no 
--            AND a.at_no = c.at_no 
--            AND c.mem_no =1
--ORDER BY c.cart_no ASC;


--��ȸ
SELECT cart_no, mem_no, at_no, cart_cnt, cart_payment,  cart_date
FROM cart
WHERE cart_no=1;

--����
UPDATE cart
SET  cart_cnt=3
WHERE cart_no=1 AND mem_no=1;

commit;

--����
DELETE FROM cart
WHERE cart_no = 29 AND mem_no=1;

commit;


SELECT NVL(sum(cart_payment),0) cart_sum
FROM cart 
WHERE mem_no=1



