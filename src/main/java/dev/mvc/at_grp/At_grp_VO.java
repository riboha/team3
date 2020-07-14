package dev.mvc.at_grp;

public class At_grp_VO {
 /* 
  at_grp_no                         NUMBER(10)     NOT NULL,
  at_grp_name                         VARCHAR2(50)     NOT NULL,
  at_grp_seqno                        NUMBER(7)    DEFAULT 0     NOT NULL
  
COMMENT ON TABLE at_grp is '상품그룹';
COMMENT ON COLUMN at_grp.at_grp_no is '상품그룹번호';
COMMENT ON COLUMN at_grp.at_grp_name is '상품그룹명';
COMMENT ON COLUMN at_grp.at_grp_seqno is '상품그룹출력순서';
 */
  
  //상품그룹번호
  private int at_grp_no;
  //상품그룹명
  private String at_grp_name;
  //상품그룹출력순서
  private int at_grp_seqno;
  //상품그룹출력모드
  private String at_grp_visible;
  
  
  public int getAt_grp_no() {
    return at_grp_no;
  }
  public void setAt_grp_no(int at_grp_no) {
    this.at_grp_no = at_grp_no;
  }
  public String getAt_grp_name() {
    return at_grp_name;
  }
  public void setAt_grp_name(String at_grp_name) {
    this.at_grp_name = at_grp_name;
  }
  public int getAt_grp_seqno() {
    return at_grp_seqno;
  }
  public void setAt_grp_seqno(int at_grp_seqno) {
    this.at_grp_seqno = at_grp_seqno;
  }
  public String getAt_grp_visible() {
    return at_grp_visible;
  }
  public void setAt_grp_visible(String at_grp_visible) {
    this.at_grp_visible = at_grp_visible;
  }
  
  
}
