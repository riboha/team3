package dev.mvc.payment_details;

public class Payment_detailsVO {
/*
 CREATE TABLE payment_details(
    payment_details_no                NUMBER(10)     NOT NULL    PRIMARY KEY,
    payment_no                              NUMBER(10)     NOT NULL,
        at_no                                         NUMBER(10)     NOT NULL,
        mem_no                                    NUMBER(10)     NOT NULL,
        payment_total                           NUMBER(10)     NOT NULL,
  FOREIGN KEY (payment_no) REFERENCES payment (payment_no)
);
 */
  
  private int payment_details_no;   
  private int payment_no;               
  private int at_no;                     
  private int mem_no;                
  private int payment_total;
  
  
  public int getPayment_details_no() {
    return payment_details_no;
  }
  public void setPayment_details_no(int payment_details_no) {
    this.payment_details_no = payment_details_no;
  }
  public int getPayment_no() {
    return payment_no;
  }
  public void setPayment_no(int payment_no) {
    this.payment_no = payment_no;
  }
  public int getAt_no() {
    return at_no;
  }
  public void setAt_no(int at_no) {
    this.at_no = at_no;
  }
  public int getMem_no() {
    return mem_no;
  }
  public void setMem_no(int mem_no) {
    this.mem_no = mem_no;
  }
  public int getPayment_total() {
    return payment_total;
  }
  public void setPayment_total(int payment_total) {
    this.payment_total = payment_total;
  }        
  
  
  
  
}


