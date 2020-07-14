package dev.mvc.mem_wish;

public class At_Mem_wishVO {
  
  
  // At 상품 테이블
  private int a_at_no; /**상품*/
  private String at_name; /**상품명*/
  private int at_price; /**상품가격*/
  private String at_visible; /**상품출력모드*/
  private String at_detail; /**상품 디테일*/

  
  
  // Mem_wish 회원 위시리스트 테이블
  
  private int mem_wish_no; /**회원 위시 번호*/
  private int at_no; /**상품 번호*/
  private int mem_no; /**회원 번호*/
  private int mem_wish_seqno; /**회원 위시 출력 번호*/
  private String word; /**회원 위시 검색어*/

  
  
  public int getA_at_no() {
    return a_at_no;
  }
  public String getWord() {
    return word;
  }
  public void setWord(String word) {
    this.word = word;
  }
  public void setA_at_no(int a_at_no) {
    this.a_at_no = a_at_no;
  }
  public String getAt_name() {
    return at_name;
  }
  public void setAt_name(String at_name) {
    this.at_name = at_name;
  }
  public int getAt_price() {
    return at_price;
  }
  public void setAt_price(int at_price) {
    this.at_price = at_price;
  }
  public String getAt_visible() {
    return at_visible;
  }
  public void setAt_visible(String at_visible) {
    this.at_visible = at_visible;
  }
  public int getMem_wish_no() {
    return mem_wish_no;
  }
  public void setMem_wish_no(int mem_wish_no) {
    this.mem_wish_no = mem_wish_no;
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
  public int getMem_wish_seqno() {
    return mem_wish_seqno;
  }
  public void setMem_wish_seqno(int mem_wish_seqno) {
    this.mem_wish_seqno = mem_wish_seqno;
  }
  public String getAt_detail() {
    return at_detail;
  }
  public void setAt_detail(String at_detail) {
    this.at_detail = at_detail;
  }
  
  
  
  





  
  
}
