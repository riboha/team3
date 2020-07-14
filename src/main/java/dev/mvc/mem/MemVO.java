package dev.mvc.mem;

import org.springframework.web.multipart.MultipartFile;

public class MemVO {
  
  /*
    MEM_NO                            NUMBER(10)     NOT NULL    PRIMARY KEY,
    MEM_ID                            VARCHAR2(60)     NOT NULL,
    MEM_PW                            VARCHAR2(60)     NOT NULL,
    MEM_NAME                          VARCHAR2(20)     NOT NULL,
    MEM_NICK                          VARCHAR2(20)     NULL ,
    MEM_ADDR1                         VARCHAR2(400)    NULL ,
    MEM_ADDR2                         VARCHAR2(400)    NULL ,
    MEM_ZIP                           VARCHAR2(100)     NULL ,
    MEM_TEL                           NUMBER(20)     NOT NULL,
    MEM_PT                            NUMBER(10)     DEFAULT 0     NOT NULL,
    MEM_DATE                          DATE     NOT NULL,
    MEM_STS                           NUMBER(1)    DEFAULT 0     NOT NULL,
    MEM_PIC_NO                        NUMBER(10)     NULL ,
    MEM_PIC_NAME                      VARCHAR2(100)    NULL ,
    MEM_PIC_NAME_UP                   VARCHAR2(100)    NULL ,
    NAME_PIC_TH                       VARCHAR2(100)    NULL ,
    NAME_PIC_SIZE                     INTEGER(100)     NULL 
   */
  
  
  private int mem_no ;
  private String mem_id;
  private String mem_pw;
  
  private String mem_pw_new; /** 새 비밀번호*/
  private String mem_pw_new2; /** 새 비밀번호 확인 */
  
  private String mem_nick;
  private String mem_name;
  private String mem_addr1;
  private String mem_addr2;
  private String mem_zip;
  private String mem_tel;
  private int mem_pt;
  private String mem_date;
  private int mem_sts;
  
  /* private String mem_pic_name; */
  private String mem_pic_name;
  private String mem_pic_name_up;
  private String mem_pic_th;
  private long mem_pic_size;
  
  /** Form의 파일을 MultipartFile로 변환하여 List에 저장  */
  // private List<MultipartFile> mem_pic_nameMF; // 필요에 따라 컬럼에 존재하지 않는 것도 명시
  
  private MultipartFile mem_pic_nameMF;  // 하나의 파일 처리
  
  private String flabel;   /** 파일 단위 출력 */

  
  
  public int getMem_no() {
    return mem_no;
  }

  public void setMem_no(int mem_no) {
    this.mem_no = mem_no;
  }

  public String getMem_id() {
    return mem_id;
  }

  public void setMem_id(String mem_id) {
    this.mem_id = mem_id;
  }

  public String getMem_pw() {
    return mem_pw;
  }

  public void setMem_pw(String mem_pw) {
    this.mem_pw = mem_pw;
  }

  public String getMem_nick() {
    return mem_nick;
  }

  public void setMem_nick(String mem_nick) {
    this.mem_nick = mem_nick;
  }

  public String getMem_name() {
    return mem_name;
  }

  public void setMem_name(String mem_name) {
    this.mem_name = mem_name;
  }

  public String getMem_addr1() {
    return mem_addr1;
  }

  public void setMem_addr1(String mem_addr1) {
    this.mem_addr1 = mem_addr1;
  }

  public String getMem_addr2() {
    return mem_addr2;
  }

  public void setMem_addr2(String mem_addr2) {
    this.mem_addr2 = mem_addr2;
  }

  public String getMem_zip() {
    return mem_zip;
  }

  public void setMem_zip(String mem_zip) {
    this.mem_zip = mem_zip;
  }

  public String getMem_tel() {
    return mem_tel;
  }

  public void setMem_tel(String mem_tel) {
    this.mem_tel = mem_tel;
  }

  public int getMem_pt() {
    return mem_pt;
  }

  public void setMem_pt(int mem_pt) {
    this.mem_pt = mem_pt;
  }

  public String getMem_date() {
    return mem_date;
  }

  public void setMem_date(String mem_date) {
    this.mem_date = mem_date;
  }

  public int getMem_sts() {
    return mem_sts;
  }

  public void setMem_sts(int mem_sts) {
    this.mem_sts = mem_sts;
  }

  public String getMem_pic_name() {
    return mem_pic_name;
  }

  public void setMem_pic_name(String mem_pic_name) {
    this.mem_pic_name = mem_pic_name;
  }

  public String getMem_pic_name_up() {
    return mem_pic_name_up;
  }

  public void setMem_pic_name_up(String mem_pic_name_up) {
    this.mem_pic_name_up = mem_pic_name_up;
  }

  public String getMem_pic_th() {
    return mem_pic_th;
  }

  public void setMem_pic_th(String mem_pic_th) {
    this.mem_pic_th = mem_pic_th;
  }

  public long getMem_pic_size() {
    return mem_pic_size;
  }

  public void setMem_pic_size(long mem_pic_size) {
    this.mem_pic_size = mem_pic_size;
  }



  public String getFlabel() {
    return flabel;
  }

  public void setFlabel(String flabel) {
    this.flabel = flabel;
  }

  public MultipartFile getMem_pic_nameMF() {
    return mem_pic_nameMF;
  }

  public void setMem_pic_nameMF(MultipartFile mem_pic_nameMF) {
    this.mem_pic_nameMF = mem_pic_nameMF;
  }

  public String getMem_pw_new() {
    return mem_pw_new;
  }

  public void setMem_pw_new(String mem_pw_new) {
    this.mem_pw_new = mem_pw_new;
  }

  public String getMem_pw_new2() {
    return mem_pw_new2;
  }

  public void setMem_pw_new2(String mem_pw_new2) {
    this.mem_pw_new2 = mem_pw_new2;
  }


  
  
  

  
 

}
