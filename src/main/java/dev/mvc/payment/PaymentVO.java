package dev.mvc.payment;

public class PaymentVO {
/*
 * CREATE TABLE payment(
    payment_no                        NUMBER(10)     NOT NULL    PRIMARY KEY,
    mem_no                            NUMBER(10)     NOT NULL,
    at_no                             NUMBER(10)     NOT NULL,
        cart_no                         NUMBER(10)     NOT NULL,
    payment_way                       VARCHAR2(100)    NOT NULL,
    payment_total                     NUMBER(10)     NOT NULL,
        payment_date                           DATE       NOT NULL,
        cart_cnt                                        NUMBER(10)     NOT NULL,
        at_price                          NUMBER(10)     NOT NULL,        
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO),
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO)
);
 */
  
  private int payment_no;
  private int mem_no;                     
  private int at_no;                          
  private int cart_no;                   
  private String payment_way;              
  private int payment_total;             
  private String payment_date;
  private int cart_cnt;
  private int at_price;
  private String at_name;
  
  public int getPayment_no() {
    return payment_no;
  }
  public void setPayment_no(int payment_no) {
    this.payment_no = payment_no;
  }
  public int getMem_no() {
    return mem_no;
  }
  public void setMem_no(int mem_no) {
    this.mem_no = mem_no;
  }
  public int getAt_no() {
    return at_no;
  }
  public void setAt_no(int at_no) {
    this.at_no = at_no;
  }
  public int getCart_no() {
    return cart_no;
  }
  public void setCart_no(int cart_no) {
    this.cart_no = cart_no;
  }
  public String getPayment_way() {
    return payment_way;
  }
  public void setPayment_way(String payment_way) {
    this.payment_way = payment_way;
  }
  public int getPayment_total() {
    return payment_total;
  }
  public void setPayment_total(int payment_total) {
    this.payment_total = payment_total;
  }
  public String getPayment_date() {
    return payment_date;
  }
  public void setPayment_date(String payment_date) {
    this.payment_date = payment_date;
  }
  public int getCart_cnt() {
    return cart_cnt;
  }
  public void setCart_cnt(int cart_cnt) {
    this.cart_cnt = cart_cnt;
  }
  public int getAt_price() {
    return at_price;
  }
  public void setAt_price(int at_price) {
    this.at_price = at_price;
  }
  public String getAt_name() {
    return at_name;
  }
  public void setAt_name(String at_name) {
    this.at_name = at_name;
  }
  
  
  
  
  
  
  
  
  
  
}
