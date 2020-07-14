package dev.mvc.notice;

/*
  noticeno              NUMBER(10)     NOT NULL, -- 공지 번호
  notice_title           VARCHAR2(100)     NOT NULL, -- 공지 제목
  notice_content      VARCHAR2(100)     NOT NULL, -- 공지 내용
  notice_rname        VARCHAR2(10)    NOT NULL, -- 등록자
  notice_passwd       VARCHAR2(15)    NOT NULL, -- 패스워드
  notice_visible        CHAR(1)    DEFAULT 'Y'     NOT NULL, -- 출력 모드
  notice_cnt             NUMBER(7)     NOT NULL, -- 조회수
  notice_division       VARCHAR2(10)    NOT NULL, -- 구분
  notice_rdate          DATE               NOT NULL -- 등록일  
*/
public class NoticeVO {
  /** 공지 번호 */
  private int noticeno;
  /** 공지 제목 */
  private String notice_title;
  /** 공지 내용 */
  private String notice_content;
  /** 등록자 */
  private String notice_rname;
  /** 패스워드 */
  private String notice_passwd;
  /** 출력 모드 */
  private String notice_visible;
  /** 조회수 */
  private int notice_cnt;
  /** 구분 */
  private String notice_division;
  /** 등록일 */
  private String notice_rdate;

  public int getNoticeno() {
    return noticeno;
  }

  public void setNoticeno(int noticeno) {
    this.noticeno = noticeno;
  }

  public String getNotice_title() {
    return notice_title;
  }

  public void setNotice_title(String notice_title) {
    this.notice_title = notice_title;
  }

  public String getNotice_content() {
    return notice_content;
  }

  public void setNotice_content(String notice_content) {
    this.notice_content = notice_content;
  }

  public String getNotice_rname() {
    return notice_rname;
  }

  public void setNotice_rname(String notice_rname) {
    this.notice_rname = notice_rname;
  }

  public String getNotice_passwd() {
    return notice_passwd;
  }

  public void setNotice_passwd(String notice_passwd) {
    this.notice_passwd = notice_passwd;
  }

  public String getNotice_visible() {
    return notice_visible;
  }

  public void setNotice_visible(String notice_visible) {
    this.notice_visible = notice_visible;
  }

  public int getNotice_cnt() {
    return notice_cnt;
  }

  public void setNotice_cnt(int notice_cnt) {
    this.notice_cnt = notice_cnt;
  }

  public String getNotice_division() {
    return notice_division;
  }

  public void setNotice_division(String notice_division) {
    this.notice_division = notice_division;
  }

  public String getNotice_rdate() {
    return notice_rdate;
  }

  public void setNotice_rdate(String notice_rdate) {
    this.notice_rdate = notice_rdate;
  }

}
