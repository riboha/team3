/**********************************/
/* Table Name: ����Ʈ���� */
/**********************************/
DROP TABLE point_save;

CREATE TABLE point_save(
        point_save_no                       NUMBER(10)       NOT NULL        PRIMARY KEY,
        payment_details_no                  NUMBER(10)       NULL ,
        mem_no                              NUMBER(10)       NOT NULL,
        point_saved                         NUMBER(10)       NOT NULL,   
  FOREIGN KEY (payment_details_no) REFERENCES payment_details (payment_details_no)
);

COMMENT ON TABLE point_save is '����Ʈ����';
COMMENT ON COLUMN point_save.point_save_no is '����Ʈ������ȣ';
COMMENT ON COLUMN point_save.payment_details_no is '�������γ�����ȣ';
COMMENT ON COLUMN point_save.mem_no is 'ȸ����ȣ';
COMMENT ON COLUMN point_save.point_saved is '�����ݾ�';

DROP SEQUENCE point_save_seq;
CREATE SEQUENCE point_save_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����


--insert
INSERT INTO point_save(point_save_no, payment_details_no, mem_no, point_saved)
VALUES(point_save_seq.nextval, 1, 1,1000);

commit;


