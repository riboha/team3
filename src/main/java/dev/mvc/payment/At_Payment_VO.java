package dev.mvc.payment;
/*
 SELECT   p.payment_no as p_payment_no, p.payment_cnt as p_payment_cnt, p.payment_way as p_payment_way, p.payment_total as p_payment_total, p.payment_date as p_payment_date,
                a.at_no  as  a_at_no, a.at_price as a_at_price, a.at_name as a_at_name,
FROM   payment p,  at  a,  mem m
WHERE           p.at_no = a.at_no
              AND p.mem_no = m.mem_no
              AND m.mem_no =1
ORDER BY payment_no ASC;
 */
public class At_Payment_VO {
  //at table
  private int at_no;
  private int at_price;
  private String at_name;
  
  //payment table
  private int payment_no;
  private int cart_no;
  private String payment_way;
  private int payment_total;
  private String payment_date;
  
  
  
  public int getCart_no() {
    return cart_no;
  }
  public void setCart_no(int cart_no) {
    this.cart_no = cart_no;
  }
  public int getAt_no() {
    return at_no;
  }
  public void setAt_no(int at_no) {
    this.at_no = at_no;
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
  public int getPayment_no() {
    return payment_no;
  }
  public void setPayment_no(int payment_no) {
    this.payment_no = payment_no;
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
  
  
  
  
}
