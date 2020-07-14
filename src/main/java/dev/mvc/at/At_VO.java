package dev.mvc.at;

import org.springframework.web.multipart.MultipartFile;

public class At_VO {

/*  

Table Name: 상품 

CREATE TABLE AT(
    AT_NO                             NUMBER(10)     NOT NULL    PRIMARY KEY,
    AT_GRP_NO                         NUMBER(10)     NOT NULL,
    AT_SEQNO                          NUMBER(7)    NOT NULL,
    AT_VISIBLE                        CHAR(1)    DEFAULT 'Y'     NOT NULL,
    AT_NAME                           VARCHAR2(100)    NOT NULL,
    AT_DETAIL                         VARCHAR2(100)    NOT NULL,
    AT_PRICE                          NUMBER(10)     NOT NULL,
    AT_CONTENT                        CLOB     NOT NULL,
    AT_CANCLE                         CHAR(1)    DEFAULT 'Y'     NOT NULL,
    AT_LOWEST                         CHAR(1)    DEFAULT 'Y'     NOT NULL,
    AT_HIT                            NUMBER(10)     DEFAULT 0     NOT NULL,
    AT_DUR                            NUMBER(10)     NOT NULL,
    AT_LANG                           VARCHAR2(100)    NOT NULL,
    AT_SNS                            VARCHAR2(1000)     NOT NULL,
    AT_MAP                            VARCHAR2(100)    NOT NULL,
    AT_IMG                            VARCHAR2(100)    NULL ,
    AT_THUM                           VARCHAR2(100)    NULL ,
    AT_IMG_SIZE                       NUMBER(10)     DEFAULT 0     NULL ,
  FOREIGN KEY (AT_GRP_NO) REFERENCES AT_GRP (AT_GRP_NO)
);

COMMENT ON TABLE AT is '상품';
COMMENT ON COLUMN AT.AT_NO is '상품번호';
COMMENT ON COLUMN AT.AT_GRP_NO is '상품그룹번호';
COMMENT ON COLUMN AT.AT_SEQNO is '상품출력순서';
COMMENT ON COLUMN AT.AT_VISIBLE is '상품출력모드';
COMMENT ON COLUMN AT.AT_NAME is '상품명';
COMMENT ON COLUMN AT.AT_DETAIL is '상품명상세';
COMMENT ON COLUMN AT.AT_PRICE is '상품가격';
COMMENT ON COLUMN AT.AT_CONTENT is '상품내용';
COMMENT ON COLUMN AT.AT_CANCLE is '상품취소가능여부';
COMMENT ON COLUMN AT.AT_LOWEST is '상품최저가보장여부';
COMMENT ON COLUMN AT.AT_HIT is '상품조회수';
COMMENT ON COLUMN AT.AT_DUR is '상품소요시간';
COMMENT ON COLUMN AT.AT_LANG is '상품지원언어';
COMMENT ON COLUMN AT.AT_SNS is '상품소셜';
COMMENT ON COLUMN AT.AT_MAP is '상품지도';
COMMENT ON COLUMN AT.AT_IMG is '상품이미지';
COMMENT ON COLUMN AT.AT_THUM is '상품썸네일';
COMMENT ON COLUMN AT.AT_IMG_SIZE is '상품이미지사이즈';

DROP SEQUENCE at_seq;
CREATE SEQUENCE at_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
 
  */
 


  private int at_no;
  private int at_grp_no;
  private int at_seqno;
  private String at_visible;
  private String at_name;
  private String at_detail;
  private int at_price;
  private String at_content;
  private String at_cancle;
  private String at_lowest;
  private String at_hit;
  private String at_dur;
  private String at_lang;
  private String at_tag;
  private String at_map;
  
  private String at_img;
  private String at_thum;
  private int at_img_size;
  private MultipartFile file1MF;
  
  

  public String getAt_img() {
    return at_img;
  }

  public void setAt_img(String at_img) {
    this.at_img = at_img;
  }

  public String getAt_thum() {
    return at_thum;
  }

  public void setAt_thum(String at_thum) {
    this.at_thum = at_thum;
  }

  public int getAt_img_size() {
    return at_img_size;
  }

  public void setAt_img_size(int at_img_size) {
    this.at_img_size = at_img_size;
  }

  public int getAt_no() {
    return at_no;
  }

  public void setAt_no(int at_no) {
    this.at_no = at_no;
  }

  public int getAt_grp_no() {
    return at_grp_no;
  }

  public void setAt_grp_no(int at_grp_no) {
    this.at_grp_no = at_grp_no;
  }

  public int getAt_seqno() {
    return at_seqno;
  }

  public void setAt_seqno(int at_seqno) {
    this.at_seqno = at_seqno;
  }

  public String getAt_visible() {
    return at_visible;
  }

  public void setAt_visible(String at_visible) {
    this.at_visible = at_visible;
  }

  public String getAt_name() {
    return at_name;
  }

  public void setAt_name(String at_name) {
    this.at_name = at_name;
  }

  public String getAt_detail() {
    return at_detail;
  }

  public void setAt_detail(String at_detail) {
    this.at_detail = at_detail;
  }

  public int getAt_price() {
    return at_price;
  }

  public void setAt_price(int at_price) {
    this.at_price = at_price;
  }

  public String getAt_content() {
    return at_content;
  }

  public void setAt_content(String at_content) {
    this.at_content = at_content;
  }

  public String getAt_cancle() {
    return at_cancle;
  }

  public void setAt_cancle(String at_cancle) {
    this.at_cancle = at_cancle;
  }

  public String getAt_lowest() {
    return at_lowest;
  }

  public void setAt_lowest(String at_lowest) {
    this.at_lowest = at_lowest;
  }

  public String getAt_hit() {
    return at_hit;
  }

  public void setAt_hit(String at_hit) {
    this.at_hit = at_hit;
  }

  public String getAt_dur() {
    return at_dur;
  }

  public void setAt_dur(String at_dur) {
    this.at_dur = at_dur;
  }

  public String getAt_lang() {
    return at_lang;
  }

  public void setAt_lang(String at_lang) {
    this.at_lang = at_lang;
  }


  public String getAt_tag() {
    return at_tag;
  }

  public void setAt_tag(String at_tag) {
    this.at_tag = at_tag;
  }

  public String getAt_map() {
    return at_map;
  }

  public void setAt_map(String at_map) {
    this.at_map = at_map;
  }

  public MultipartFile getFile1MF() {
    return file1MF;
  }

  public void setFile1MF(MultipartFile file1mf) {
    file1MF = file1mf;
  }

}
