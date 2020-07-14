package dev.mvc.cart;
/*
CREATE TABLE cart(
      cart_no                             NUMBER(10)       NOT NULL       PRIMARY KEY,
      mem_no                              NUMBER(10)       NOT NULL,
      at_no                               NUMBER(10)       NOT NULL,
      cart_cnt                                 NUMBER(10)       NOT NULL,
      cart_payment                             NUMBER(10)       NOT NULL,        
      cart_date                           DATE       NOT NULL,
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO),
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO)
);
 */

public class CartVO {
    private int cart_no;                         
    private int mem_no;                              
    private int at_no;                         
    private int cart_cnt;                                
    private int cart_payment;              // 한개가격                
    private String cart_date;
    
    
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
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
