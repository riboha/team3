package dev.mvc.review;

public class ReviewVO {
  
//      review_no                                NUMBER(10)         NOT NULL         PRIMARY KEY,
//      at_no                                      NUMBER(10)    NOT     NULL ,
//      mem_no                            NUMBER(10)         NOT NULL ,
//      payment_no                            NUMBER(10)         NOT NULL ,
//      review_word                               VARCHAR2(1000)         NOT NULL,
//      review_rate                                 NUMBER(1)               NOT NULL,

//      rdate                                  DATE NOT NULL,
//  FOREIGN KEY (at_no) REFERENCES at (at_no),
//  FOREIGN KEY (mem_no) REFERENCES mem (mem_no),
//  FOREIGN KEY (payment_no) REFERENCES payment (payment_no)

  
  

  
  
  private int review_no; /**댓글번호*/
  private int at_no; /**컨텐츠번호*/
  private int mem_no; /**회원 번호*/
  private int payment_no; /**결제 번호*/
  private String review_word; /**리뷰 내용*/
  private int review_rate; /**리뷰 평가*/
  private String review_pw; /**비밀번호*/ // 컬럼 X
  private String rdate; /**등록일*/
  public int getReview_no() {
    return review_no;
  }
  public void setReview_no(int review_no) {
    this.review_no = review_no;
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
  public int getPayment_no() {
    return payment_no;
  }
  public void setPayment_no(int payment_no) {
    this.payment_no = payment_no;
  }
  public String getReview_word() {
    return review_word;
  }
  public void setReview_word(String review_word) {
    this.review_word = review_word;
  }
  public int getReview_rate() {
    return review_rate;
  }
  public void setReview_rate(int review_rate) {
    this.review_rate = review_rate;
  }
  public String getReview_pw() {
    return review_pw;
  }
  public void setReview_pw(String review_pw) {
    this.review_pw = review_pw;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  
  
  
  
  
}
