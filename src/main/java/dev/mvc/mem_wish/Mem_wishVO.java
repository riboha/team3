package dev.mvc.mem_wish;

public class Mem_wishVO {
  
  
  /*
    mem_wish_no                       NUMBER(10)     NOT NULL    PRIMARY KEY,
    at_no                             NUMBER(10)     NOT NULL,
    mem_no                            NUMBER(10)     NOT NULL,
    mem_wish_seqno                    NUMBER(10)     DEFAULT 1     NOT NULL,
    word                                    VARCHAR2(100)   NULL,
    FOREIGN KEY (mem_no) REFERENCES mem (mem_no),
    FOREIGN KEY (at_no) REFERENCES at (at_no)

    COMMENT ON TABLE mem_wish is '회원 위시리스트';
    COMMENT ON COLUMN mem_wish.mem_wish_no is '회원 위시 번호';
    COMMENT ON COLUMN mem_wish.at_no is '상품 번호';
    COMMENT ON COLUMN mem_wish.mem_no is '회원 번호';
    COMMENT ON COLUMN mem_wish.mem_wish_seqno is '회원 위시 출력 번호';
    COMMENT ON COLUMN mem_wish.word is '회원 위시 검색어';
   */
  
  
  private int mem_wish_no; /**회원 위시 번호*/
  private int at_no; /**상품 번호*/
  private int mem_no; /**회원 번호*/
  private int mem_wish_seqno; /**회원 위시 출력 번호*/
  private String word; /**회원 위시 검색어*/
  
  
  
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
  public String getWord() {
    return word;
  }
  public void setWord(String word) {
    this.word = word;
  }
  
  
  
  

}
