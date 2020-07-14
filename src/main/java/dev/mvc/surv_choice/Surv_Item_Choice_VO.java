package dev.mvc.surv_choice;

public class Surv_Item_Choice_VO {
//  SELECT i.SURV_ITEM_NO as i_surv_item_no, i.SURV_item_QUES as i_surv_item_ques,
//  c.surv_choice_no as c_surv_choice_no, c.surv_item_no as c_surv_item_no, c.surv_ans_1 as c_surv_ans_1, c.surv_ans_2 as surv_ans_2,
//  c.surv_ans_3 as c_surv_ans_3, c.surv_ans_4 as c_surv_ans_4
//  from surv_item i, surv_choice c
//  where i.surv_item_no = c.surv_item_no and i.surv_item_no=1
//  order by i.surv_item_no asc, c.surv_choice_no asc;
  
  // surv_item 
  private int surv_item_no;
  private String surv_item_ques;
  
  // surv_choice
  private String surv_ans_1;
  private String surv_ans_2;
  private String surv_ans_3;
  private String surv_ans_4;
  
  
  public int getSurv_item_no() {
    return surv_item_no;
  }
  public void setSurv_item_no(int surv_item_no) {
    this.surv_item_no = surv_item_no;
  }
  public String getSurv_item_ques() {
    return surv_item_ques;
  }
  public void setSurv_item_ques(String surv_item_ques) {
    this.surv_item_ques = surv_item_ques;
  }
  public String getSurv_ans_1() {
    return surv_ans_1;
  }
  public void setSurv_ans_1(String surv_ans_1) {
    this.surv_ans_1 = surv_ans_1;
  }
  public String getSurv_ans_2() {
    return surv_ans_2;
  }
  public void setSurv_ans_2(String surv_ans_2) {
    this.surv_ans_2 = surv_ans_2;
  }
  public String getSurv_ans_3() {
    return surv_ans_3;
  }
  public void setSurv_ans_3(String surv_ans_3) {
    this.surv_ans_3 = surv_ans_3;
  }
  public String getSurv_ans_4() {
    return surv_ans_4;
  }
  public void setSurv_ans_4(String surv_ans_4) {
    this.surv_ans_4 = surv_ans_4;
  }
  
}
