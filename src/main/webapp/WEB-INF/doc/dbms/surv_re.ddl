/**********************************/
/* Table Name: �����׸� */
/**********************************/
DROP TABLE SURV_ITEM;
CREATE TABLE SURV_ITEM(
        SURV_ITEM_NO                        NUMBER(10)       NOT NULL        PRIMARY KEY,
        SURV_NO                             NUMBER(10)       NOT NULL,
        SURV_item_SEQNO                             NUMBER(10)       NOT NULL,
        SURV_item_QUES                          VARCHAR2(300)        NOT NULL,
        SURV_item_ANS_1                             CLOB         NULL,
        SURV_item_ANS_2                             CLOB         NULL,
        SURV_item_ANS_3                             CLOB         NULL,
        SURV_item_ANS_4                             CLOB         NULL,
        SURV_item_RESP                            NUMBER(10)           NOT NULL,
        surv_item_passwd                    varchar2(300)       not null,
  FOREIGN KEY (SURV_NO) REFERENCES SURV (SURV_NO)
);

COMMENT ON TABLE SURV_ITEM is '�����׸�';
COMMENT ON COLUMN SURV_ITEM.SURV_ITEM_NO is '�����׸��ȣ';
COMMENT ON COLUMN SURV_ITEM.SURV_NO is '���������ȣ';
COMMENT ON COLUMN SURV_ITEM.SURV_item_SEQNO is '�����׸����';
COMMENT ON COLUMN SURV_ITEM.SURV_item_QUES is '�����׸�����';
COMMENT ON COLUMN SURV_ITEM.SURV_item_ANS_1  is '�����׸�亯1';
COMMENT ON COLUMN SURV_ITEM.SURV_item_ANS_2  is '�����׸�亯2';
COMMENT ON COLUMN SURV_ITEM.SURV_item_ANS_3  is '�����׸�亯3';
COMMENT ON COLUMN SURV_ITEM.SURV_item_ANS_4  is '�����׸�亯4';
COMMENT ON COLUMN SURV_ITEM.SURV_item_RESP is '���������';
COMMENT ON COLUMN SURV_ITEM.SURV_item_passwd is '�����׸��н�����';

DROP SEQUENCE SURV_ITEM_seq;
CREATE SEQUENCE SURV_ITEM_seq
    START WITH 1         -- ���۹�ȣ
    INCREMENT BY 1     -- ���� ��
    MAXVALUE 9999999999 -- �ִ밪 : 9999999999 --> NUMBER(10) ����
    CACHE 2                  -- 2���� �޸𸮿����� ���(������Ʈ�� ����ؼ� ���� ���� ), insert�� ������ cache�� 100~200������ �ϸ� ����Ŭ �ӵ��� ������..
    NOCYCLE;   


1) ���
INSERT INTO SURV_ITEM(SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, SURV_item_ANS_1, SURV_item_ANS_2, SURV_item_ANS_3, SURV_item_ANS_4, SURV_item_RESP,surv_item_passwd)
VALUES(surv_item_seq.nextval, 1, 1, '��������1','�����亯�׸�1', '�����亯�׸�2', '�����亯�׸�3', '�����亯�׸�4', 0, '1234'); 

INSERT INTO SURV_ITEM(SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, SURV_item_ANS_1, SURV_item_ANS_2, SURV_item_ANS_3, SURV_item_ANS_4, SURV_item_RESP,surv_item_passwd)
VALUES(surv_item_seq.nextval, 1, 1, '��������2','�����亯�׸�1', '�����亯�׸�2', '�����亯�׸�3', '�����亯�׸�4', 0,'1234'); 

INSERT INTO SURV_ITEM(SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, SURV_item_ANS_1, SURV_item_ANS_2, SURV_item_ANS_3, SURV_item_ANS_4, SURV_item_RESP,surv_item_passwd)
VALUES(surv_item_seq.nextval, 1, 1, '��������3','�����亯�׸�1', '�����亯�׸�2', '�����亯�׸�3', '�����亯�׸�4', 0,'1234'); 

INSERT INTO SURV_ITEM(SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, SURV_item_ANS_1, SURV_item_ANS_2, SURV_item_ANS_3, SURV_item_ANS_4, SURV_item_RESP,surv_item_passwd)
VALUES(surv_item_seq.nextval, 1, 1, '��������4','�����亯�׸�1', '�����亯�׸�2', '�����亯�׸�3', '�����亯�׸�4', 0,'1234'); 

2) ���
SELECT SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, SURV_item_ANS_1, SURV_item_ANS_2, SURV_item_ANS_3, SURV_item_ANS_4, SURV_item_RESP,surv_item_passwd
FROM SURV_ITEM
ORDER BY SURV_item_SEQNO ASC;

commit;

3) ��ȸ
SELECT SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, SURV_item_ANS_1, SURV_item_ANS_2, SURV_item_ANS_3, SURV_item_ANS_4, SURV_item_RESP,surv_item_passwd
FROM SURV_ITEM
where surv_item_seqno=1;

4) ����
update surv_item
set surv_item_seqno=2, surv_item_ques='��������', surv_item_ans_1='�׸����1',  surv_item_ans_2='�׸����2',  surv_item_ans_3='�׸����3',  surv_item_ans_4='�׸����4',surv_item_passwd='5678'
where surv_item_no=2;

commit;
5) ����
delete 
from surv_item
where surv_item_no=6;

commit;

-- �н����� Ȯ��

SELECT COUNT(*) as passwd_cnt
FROM surv_item
WHERE surv_item_no= 1 AND surv_item_passwd='1234'

--  surv�� surv_item ���̺� join

SELECT s.surv_no as s_surv_no, s.surv_seqno as s_surv_seqno, s.surv_title as s_surv_title, s.surv_content as s_surv_content, s.surv_passwd as surv_passwd, 
           s.surv_startdate as s_surv_startdate, s.surv_enddate as s_surv_enddate, s.surv_cnt as s_surv_cnt, s.surv_continue as s_surv_continue, s.mem_no as s_mem_no,
           i.surv_item_no as i_surv_item_no, i.surv_no as i_surv_no, i.surv_item_seqno as i_surv_item_seqno, i.surv_item_ques as i_surv_item_ques, i.surv_item_ans_1 as i_surv_item_ans_1, 
           i.surv_item_ans_2 as i_surv_item_ans_2, i.surv_item_ans_3 as i_surv_item_ans_3, i.surv_item_ans_4 as i_surv_item_ans_4, i.surv_item_resp as i_surv_item_resp, i.surv_item_passwd as i_surv_item_passwd
FROM surv s, surv_item i
WHERE s.surv_no = i.surv_no 
ORDER BY  s.surv_no ASC, i.surv_no DESC;
