package dev.mvc.faq;

/*
    faqno               NUMBER(10)     NOT NULL, -- 질문 번호
    faq_title             VARCHAR2(100)  NOT NULL, -- 질문 제목
    faq_content         VARCHAR2(100)  NOT NULL, -- 질문 내용
    faq_rname         VARCHAR2(10)     NOT NULL, -- 등록자
    faq_passwd        VARCHAR2(15)     NOT NULL, -- 패스워드
    faq_seqno            NUMBER(10)    NOT NULL, -- 출력 순서
    faq_division          VARCHAR2(10)    NOT NULL, -- 구분
    word                  VARCHAR2(300)   NULL , -- 검색어
    faq_date              DATE                 NOT NULL -- 등록일
*/
public class FaqVO {
  /** 질문 번호 */
  private int faqno;
  /** 질문 제목 */
  private String faq_title;
  /** 질문 내용 */
  private String faq_content;
  /** 등록자 */
  private String faq_rname;
  /** 패스워드 */
  private String faq_passwd;
  /** 출력 순서 */
  private String faq_seqno;
  /** 구분 */
  private String faq_division;
  /** 등록일 */
  private String faq_date;

  public int getFaqno() {
    return faqno;
  }

  public void setFaqno(int faqno) {
    this.faqno = faqno;
  }

  public String getFaq_title() {
    return faq_title;
  }

  public void setFaq_title(String faq_title) {
    this.faq_title = faq_title;
  }

  public String getFaq_content() {
    return faq_content;
  }

  public void setFaq_content(String faq_content) {
    this.faq_content = faq_content;
  }

  public String getFaq_rname() {
    return faq_rname;
  }

  public void setFaq_rname(String faq_rname) {
    this.faq_rname = faq_rname;
  }

  public String getFaq_passwd() {
    return faq_passwd;
  }

  public void setFaq_passwd(String faq_passwd) {
    this.faq_passwd = faq_passwd;
  }

  public String getFaq_seqno() {
    return faq_seqno;
  }

  public void setFaq_seqno(String faq_seqno) {
    this.faq_seqno = faq_seqno;
  }

  public String getFaq_division() {
    return faq_division;
  }

  public void setFaq_division(String faq_division) {
    this.faq_division = faq_division;
  }

  public String getFaq_date() {
    return faq_date;
  }

  public void setFaq_date(String faq_date) {
    this.faq_date = faq_date;
  }

}
