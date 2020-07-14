package dev.mvc.notice_attachfile;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Notice_attachfileVO {
  /*
   * notice_attachfileno NUMBER(10) NOT NULL PRIMARY KEY, -- 첨부파일 번호 noticeno
   * NUMBER(10) NULL, -- 공지 번호 notice_fname VARCHAR2(100) NOT NULL, -- 원본 파일명
   * notice_fupname VARCHAR2(100) NOT NULL, -- 업로드 파일명 notice_thumb VARCHAR2(100)
   * NULL, --Thumb 파일명 notice_fsize NUMBER(10) NOT NULL, -- 파일 사이즈 notice_rdate
   * DATE NOT NULL, -- 등록일 FOREIGN KEY (noticeno) REFERENCES notice (noticeno)
   */
  /** 첨부 파일 번호 */
  private int notice_attachfileno;
  /** 공지 번호(FK) */
  private int noticeno;
  /** 원본 파일명 */
  private String notice_fname;
  /** 업로드된 파일명 */
  private String notice_fupname;
  /** Thumb 이미지 */
  private String notice_thumb;
  /** 파일 크기 */
  private long notice_fsize;
  /** 등록일 */
  private String notice_rdate;

  /** Form의 파일을 MultipartFile로 변환하여 List에 저장 */
  private List<MultipartFile> fnamesMF;
  
  public int getNotice_attachfileno() {
    return notice_attachfileno;
  }

  public void setNotice_attachfileno(int notice_attachfileno) {
    this.notice_attachfileno = notice_attachfileno;
  }

  public int getNoticeno() {
    return noticeno;
  }

  public void setNoticeno(int noticeno) {
    this.noticeno = noticeno;
  }

  public String getNotice_fname() {
    return notice_fname;
  }

  public void setNotice_fname(String notice_fname) {
    this.notice_fname = notice_fname;
  }

  public String getNotice_fupname() {
    return notice_fupname;
  }

  public void setNotice_fupname(String notice_fupname) {
    this.notice_fupname = notice_fupname;
  }

  public String getNotice_thumb() {
    return notice_thumb;
  }

  public void setNotice_thumb(String notice_thumb) {
    this.notice_thumb = notice_thumb;
  }

  public long getNotice_fsize() {
    return notice_fsize;
  }

  public void setNotice_fsize(long notice_fsize) {
    this.notice_fsize = notice_fsize;
  }

  public String getNotice_rdate() {
    return notice_rdate;
  }

  public void setNotice_rdate(String notice_rdate) {
    this.notice_rdate = notice_rdate;
  }

  public List<MultipartFile> getFnamesMF() {
    return fnamesMF;
  }

  public void setFnamesMF(List<MultipartFile> fnamesMF) {
    this.fnamesMF = fnamesMF;
  }

}
