package dev.mvc.cart;
/*
 SELECT   c.cart_no as c_cart_no, c.cart_cnt as c_cart_cnt, c.cart_payment as c_cart_payment, 
                  c.cart_date as c_cart_date,
                a.at_no  as  a_at_no, a.at_price as a_at_price
 */
public class At_Cart_VO {

  //at table
  private int at_no;
  private int at_price;
  
  //cart table 
  private int cart_no;
  private int cart_cnt;
  private int cart_payment;
  
  private String cart_date;
  
  
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
  public int getCart_no() {
    return cart_no;
  }
  public void setCart_no(int cart_no) {
    this.cart_no = cart_no;
  }
  public int getCart_cnt() {
    return cart_cnt;
  }
  public void setCart_cnt(int cart_cnt) {
    this.cart_cnt = cart_cnt;
  }
  public int getCart_payment() {
    return cart_payment;
  }
  public void setCart_payment(int cart_payment) {
    this.cart_payment = cart_payment;
  }
  public String getCart_date() {
    return cart_date;
  }
  public void setCart_date(String cart_date) {
    this.cart_date = cart_date;
  }

  
  
}
