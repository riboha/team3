package dev.mvc.surv_item;

import dev.mvc.surv.Surv_VO;

/*
  SELECT s.surv_no as s_surv_no, s.surv_seqno as s_surv_seqno, s.surv_title as s_surv_title, s.surv_content as s_surv_content, s.surv_passwd as surv_passwd, 
           s.surv_startdate as s_surv_startdate, s.surv_enddate as s_surv_enddate, s.surv_cnt as s_surv_cnt, s.surv_continue as s_surv_continue, s.mem_no as s_mem_no,
           i.surv_item_no, i.surv_no, i.surv_item_seqno, i.surv_item_ques, i.surv_item_ans_1, i.surv_item_ans_2, i.surv_item_ans_3, i.surv_item_ans_4, i.surv_item_resp, i.surv_item_passwd
  FROM surv s, surv_item i
  WHERE s.surv_no = i.surv_no
  ORDER BY  s.surv_no ASC, i.surv_no DESC;
  */
public class Surv_Surv_Item_VO {

  private Surv_VO surv_VO;
  private Surv_Item_VO surv_Item_VO;
  
  public Surv_VO getSurv_VO() {
    return surv_VO;
  }
  public void setSurv_VO(Surv_VO surv_VO) {
    this.surv_VO = surv_VO;
  }
  public Surv_Item_VO getSurv_Item_VO() {
    return surv_Item_VO;
  }
  public void setSurv_Item_VO(Surv_Item_VO surv_Item_VO) {
    this.surv_Item_VO = surv_Item_VO;
  }
  
  
 
}
