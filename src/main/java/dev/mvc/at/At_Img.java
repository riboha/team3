package dev.mvc.at;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class At_Img {
   


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
  
  
  //////////////////////////////
  

  private String at_img_fupname;
  private List<MultipartFile> fnamesMF;
  
  // dates 검색 위해 추가 
  private int dates_no;
  public int getDates_no() {
    return dates_no;
  }

  public void setDates_no(int dates_no) {
    this.dates_no = dates_no;
  }

  public String getDates_date() {
    return dates_date;
  }

  public void setDates_date(String dates_date) {
    this.dates_date = dates_date;
  }

  private String dates_date;
  
  
  

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

  public String getAt_map() {
    return at_map;
  }

  public void setAt_map(String at_map) {
    this.at_map = at_map;
  }

  /////////////////////////////////////
  
  

  public String getAt_img_fupname() {
    return at_img_fupname;
  }

  public void setAt_img_fupname(String at_img_fupname) {
    this.at_img_fupname = at_img_fupname;
  }

 
  public List<MultipartFile> getFnamesMF() {
    return fnamesMF;
  }

  public void setFnamesMF(List<MultipartFile> fnamesMF) {
    this.fnamesMF = fnamesMF;
  }

  

  
  


}
