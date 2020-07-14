/**********************************/
/* Table Name: 선택항목 */
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


COMMENT ON TABLE surv_choice is '설문조사선택';
COMMENT ON COLUMN surv_choice.surv_select_no is '설문조사선택번호';
COMMENT ON COLUMN surv_choice.surv_ans_1 is '답변1';
COMMENT ON COLUMN surv_choice.surv_ans_2 is '답변2';
COMMENT ON COLUMN surv_choice.surv_ans_3  is '답변3';
COMMENT ON COLUMN surv_choice.surv_ans_4 is '답변4';
COMMENT ON COLUMN surv_choice.surv_choice_passwd is '설문조사선택패스워드';
COMMENT ON COLUMN surv_choice.surv_item_no is '설문조사항목번호';

1) 등록
INSERT INTO surv_choice(surv_choice_no, surv_item_no, surv_ans_1, surv_ans_2, surv_ans_3, surv_ans_4, surv_choice_passwd)
values((select NVL(max(surv_choice_no),0)+1 as surv_choice_no from surv_choice), 1, '답변1', '답변2', '답변3', '답변4', '1234');

INSERT INTO surv_choice(surv_choice_no, surv_item_no, surv_ans_1, surv_ans_2, surv_ans_3, surv_ans_4, surv_choice_passwd)
values((select NVL(max(surv_choice_no),0)+1 as surv_choice_no from surv_choice), 2, '답변1', '답변2', '답변3', '답변4', '1234');

commit;
    
    
2) 목록(list)
SELECT i.SURV_ITEM_NO as i_surv_item_no, i.SURV_item_QUES as i_surv_item_ques,
       c.surv_choice_no as c_surv_choice_no, c.surv_item_no as c_surv_item_no, c.surv_ans_1 as c_surv_ans_1, c.surv_ans_2 as surv_ans_2,
       c.surv_ans_3 as c_surv_ans_3, c.surv_ans_4 as c_surv_ans_4
from surv_item i, surv_choice c
where i.surv_item_no = c.surv_item_no and i.surv_item_no=1
order by i.surv_item_no asc, c.surv_choice_no asc;

2-1) 조회
SELECT i.SURV_ITEM_NO as i_surv_item_no, i.SURV_item_QUES as i_surv_item_ques,
       c.surv_choice_no as c_surv_choice_no, c.surv_item_no as c_surv_item_no, c.surv_ans_1 as c_surv_ans_1, c.surv_ans_2 as surv_ans_2,
       c.surv_ans_3 as c_surv_ans_3, c.surv_ans_4 as c_surv_ans_4
from surv_item i, surv_choice c
where i.surv_item_no = c.surv_item_no and i.surv_item_no=1
order by i.surv_item_no asc, c.surv_choice_no asc;

3) 수정
update surv_choice
set surv_ans_1='답변수정1', surv_ans_2='답변수정2', surv_ans_3='답변수정3', surv_ans_4='답변수정4'
where surv_choice_no=4;

commit;

4) 삭제
delete from surv_choice
where surv_item_no=4;

commit;
       