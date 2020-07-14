package dev.mvc.surv_choice;

public class Surv_Choice_VO {
//  surv_choice_no NUMERIC(10) NOT NULL PRIMARY KEY,
//  surv_ans_1 VARCHAR(1000) NOT NULL,
//  surv_ans_2 VARCHAR(1000),
//  surv_ans_3 VARCHAR(1000),
//  surv_ans_4 VARCHAR(1000),
//  surv_choice_passwd VARCHAR(1000),
//  surv_item_no NUMERIC(10),
  
  /** 선택항목번호 */
  private int surv_choice_no;
  
  /** 1번 문항 */
  private String surv_ans_1;
  
  /** 2번 문항 */
  private String surv_ans_2;
  
  /** 3번 문항 */
  private String surv_ans_3;
  
  /** 4번 문항 */
  private String surv_ans_4;
  
  /** 선택항목 패스워드 */
  private String surv_choice_passwd;
  
  /** 항목번호 */
  private int surv_item_no;

  
  public int getSurv_choice_no() {
    return surv_choice_no;
  }

  public void setSurv_choice_no(int surv_choice_no) {
    this.surv_choice_no = surv_choice_no;
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

  public String getSurv_choice_passwd() {
    return surv_choice_passwd;
  }

  public void setSurv_choice_passwd(String surv_choice_passwd) {
    this.surv_choice_passwd = surv_choice_passwd;
  }

  public int getSurv_item_no() {
    return surv_item_no;
  }

  public void setSurv_item_no(int surv_item_no) {
    this.surv_item_no = surv_item_no;
  }
  
  
}
