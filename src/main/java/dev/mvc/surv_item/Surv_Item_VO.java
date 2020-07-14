package dev.mvc.surv_item;

public class Surv_Item_VO {
//  surv_item_no NUMERIC(10) NOT NULL PRIMARY KEY,
//  surv_item_seqno  NUMERIC(10) NOT NULL,
//  surv_item_ques VARCHAR(1000) NOT NULL,
//  surv_item_passwd VARCHAR(1000) NOT NULL,
//  surv_no NUMERIC(10) NOT NULL,
  
  /** 설문항목번호*/
  private int surv_item_no;
  
  /** 설문조사번호*/
  private int surv_no;
  
  /** 설문항목순서*/
  private int surv_item_seqno;
  
  /**설문항목질문*/
  private String surv_item_ques;
  
  /** itemcnt증가 */
  private int surv_item_cnt;
  
  /**설문항목 패스워드*/
  private String surv_item_passwd;
  
  
  public Surv_Item_VO() {
    
  }


  public int getSurv_item_no() {
    return surv_item_no;
  }


  public void setSurv_item_no(int surv_item_no) {
    this.surv_item_no = surv_item_no;
  }


  public int getSurv_no() {
    return surv_no;
  }


  public void setSurv_no(int surv_no) {
    this.surv_no = surv_no;
  }

  public String getSurv_item_ques() {
    return surv_item_ques;
  }


  public void setSurv_item_ques(String surv_item_ques) {
    this.surv_item_ques = surv_item_ques;
  }


  public int getSurv_item_seqno() {
    return surv_item_seqno;
  }


  public void setSurv_item_seqno(int surv_item_seqno) {
    this.surv_item_seqno = surv_item_seqno;
  }


  public String getSurv_item_passwd() {
    return surv_item_passwd;
  }


  public void setSurv_item_passwd(String surv_item_passwd) {
    this.surv_item_passwd = surv_item_passwd;
  }


public int getSurv_item_cnt() {
  return surv_item_cnt;
}


public void setSurv_item_cnt(int surv_item_cnt) {
  this.surv_item_cnt = surv_item_cnt;
}
  
  
}
