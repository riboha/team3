package dev.mvc.dates;

public class Dates_VO {
  
//  CREATE TABLE DATES(
//      DATES_NO                          NUMBER(10)     NOT NULL    PRIMARY KEY,
//      AT_NO                             NUMBER(10)     NOT NULL,
//      DATES_DATE                        VARCHAR2(100)    NOT NULL,
//    FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO)
//  );
//
//  COMMENT ON TABLE DATES is '상품별날짜';
//  COMMENT ON COLUMN DATES.DATES_NO is '상품별날짜번호';
//  COMMENT ON COLUMN DATES.AT_NO is '상품번호';
//  COMMENT ON COLUMN DATES.DATES_DATE is '상품별날짜';
//  
  
  private int dates_no;
  private int at_no;
  private String dates_date;
  
  public int getDates_no() {
    return dates_no;
  }
  public void setDates_no(int dates_no) {
    this.dates_no = dates_no;
  }
  public int getAt_no() {
    return at_no;
  }
  public void setAt_no(int at_no) {
    this.at_no = at_no;
  }
  public String getDates_date() {
    return dates_date;
  }
  public void setDates_date(String dates_date) {
    this.dates_date = dates_date;
  }
 
  
}
