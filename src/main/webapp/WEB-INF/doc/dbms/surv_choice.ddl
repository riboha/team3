/**********************************/
/* Table Name: �����׸� */
/**********************************/
drop table surv_choice;
CREATE TABLE surv_choice(
        surv_choice_no NUMERIC(10) NOT NULL PRIMARY KEY,
        surv_ans_1 VARCHAR(1000) NOT NULL,
        surv_ans_2 VARCHAR(1000),
        surv_ans_3 VARCHAR(1000),
        surv_ans_4 VARCHAR(1000),
        surv_choice_passwd VARCHAR(1000),
        surv_item_no NUMERIC(10),
  FOREIGN KEY (surv_item_no) REFERENCES surv_item (surv_item_no)
);


COMMENT ON TABLE surv_choice is '�������缱��';
COMMENT ON COLUMN surv_choice.surv_select_no is '�������缱�ù�ȣ';
COMMENT ON COLUMN surv_choice.surv_ans_1 is '�亯1';
COMMENT ON COLUMN surv_choice.surv_ans_2 is '�亯2';
COMMENT ON COLUMN surv_choice.surv_ans_3  is '�亯3';
COMMENT ON COLUMN surv_choice.surv_ans_4 is '�亯4';
COMMENT ON COLUMN surv_choice.surv_choice_passwd is '�������缱���н�����';
COMMENT ON COLUMN surv_choice.surv_item_no is '���������׸��ȣ';

1) ���
INSERT INTO surv_choice(surv_choice_no, surv_item_no, surv_ans_1, surv_ans_2, surv_ans_3, surv_ans_4, surv_choice_passwd)
values((select NVL(max(surv_choice_no),0)+1 as surv_choice_no from surv_choice), 1, '�亯1', '�亯2', '�亯3', '�亯4', '1234');

INSERT INTO surv_choice(surv_choice_no, surv_item_no, surv_ans_1, surv_ans_2, surv_ans_3, surv_ans_4, surv_choice_passwd)
values((select NVL(max(surv_choice_no),0)+1 as surv_choice_no from surv_choice), 2, '�亯1', '�亯2', '�亯3', '�亯4', '1234');

commit;
    
    
2) ���(list)
SELECT i.SURV_ITEM_NO as i_surv_item_no, i.SURV_item_QUES as i_surv_item_ques,
       c.surv_choice_no as c_surv_choice_no, c.surv_item_no as c_surv_item_no, c.surv_ans_1 as c_surv_ans_1, c.surv_ans_2 as surv_ans_2,
       c.surv_ans_3 as c_surv_ans_3, c.surv_ans_4 as c_surv_ans_4
from surv_item i, surv_choice c
where i.surv_item_no = c.surv_item_no and i.surv_item_no=1
order by i.surv_item_no asc, c.surv_choice_no asc;

2-1) ��ȸ
SELECT i.SURV_ITEM_NO as i_surv_item_no, i.SURV_item_QUES as i_surv_item_ques,
       c.surv_choice_no as c_surv_choice_no, c.surv_item_no as c_surv_item_no, c.surv_ans_1 as c_surv_ans_1, c.surv_ans_2 as surv_ans_2,
       c.surv_ans_3 as c_surv_ans_3, c.surv_ans_4 as c_surv_ans_4
from surv_item i, surv_choice c
where i.surv_item_no = c.surv_item_no and i.surv_item_no=1
order by i.surv_item_no asc, c.surv_choice_no asc;

3) ����
update surv_choice
set surv_ans_1='�亯����1', surv_ans_2='�亯����2', surv_ans_3='�亯����3', surv_ans_4='�亯����4'
where surv_choice_no=4;

commit;

4) ����
delete from surv_choice
where surv_item_no=4;

commit;
       