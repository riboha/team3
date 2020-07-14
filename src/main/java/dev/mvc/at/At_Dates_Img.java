package dev.mvc.at;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class At_Dates_Img {
   

/**
 * 

  특정 상품 해당날짜 재고 등록 : at.at_no=1 인 페이지에서  dates.dates_date='2020-07-01' 등록하고자 함 //등록 개수만큼 반복
      --★★★★★ 동일한 at_no 사용하기!!!!(같은 insert문에서의 nextval는 1번만 실행 되는 듯)
      INSERT  ALL
      INTO    at   VALUES (at_seq.nextval, 1, 1, 'Y', '이장수해장국', '김치콩나물국', 15000, '100년 전통의 김치콩나물국집입니다. 모든재료는 국내산 사용', 'Y', 'Y', 0, 2, '영어', 'http://www.daum.net', 0)
      INTO    dates   VALUES (dates_seq.nextval, at_seq.nextval, '2020-07-28')
      SELECT  *
      FROM    DUAL;
      
      
      
      <!-- at, dates 동시 등록 -->
<insert id="create" parameterType="At_Dates_Img">
INSERT  ALL
INTO    at   VALUES (at_seq.nextval, #{at_grp_no}, #{at_seqno}, #{at_visible}, #{at_name}, #{at_detail}, #{at_price},#{at_content}, #{at_cancle}, #{at_lowest}, #{at_dur}, #{at_lang},#{at_sns}, #{at_map})
INTO    dates   VALUES (dates_seq.nextval, at_seq.nextval, '2020-07-28', #{dates_date})
SELECT  *
FROM    DUAL;
</insert>

      
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
  private String at_sns;
  private String at_map;
  
  
  //////////////////////////////
  

  private int dates_no;
  private String dates_date;
  
  
  /////////////////////////


  private int at_img_no;
  private String at_img_fname;
  private String at_img_fupname;
  private String at_img_thumb;
  private long at_img_size;
  private int at_img_seqno;
  
  private List<MultipartFile> fnamesMF;
  
  
  
  

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


  public String getAt_sns() {
    return at_sns;
  }

  public void setAt_sns(String at_sns) {
    this.at_sns = at_sns;
  }

  public String getAt_map() {
    return at_map;
  }

  public void setAt_map(String at_map) {
    this.at_map = at_map;
  }

  /////////////////////////////////////
  
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

  public int getAt_img_no() {
    return at_img_no;
  }

  public void setAt_img_no(int at_img_no) {
    this.at_img_no = at_img_no;
  }

  public String getAt_img_fname() {
    return at_img_fname;
  }

  public void setAt_img_fname(String at_img_fname) {
    this.at_img_fname = at_img_fname;
  }

  public String getAt_img_fupname() {
    return at_img_fupname;
  }

  public void setAt_img_fupname(String at_img_fupname) {
    this.at_img_fupname = at_img_fupname;
  }

  public String getAt_img_thumb() {
    return at_img_thumb;
  }

  public void setAt_img_thumb(String at_img_thumb) {
    this.at_img_thumb = at_img_thumb;
  }

  public long getAt_img_size() {
    return at_img_size;
  }

  public void setAt_img_size(long at_img_size) {
    this.at_img_size = at_img_size;
  }

 
  public List<MultipartFile> getFnamesMF() {
    return fnamesMF;
  }

  public void setFnamesMF(List<MultipartFile> fnamesMF) {
    this.fnamesMF = fnamesMF;
  }

  public int getAt_img_seqno() {
    return at_img_seqno;
  }

  public void setAt_img_seqno(int at_img_seqno) {
    this.at_img_seqno = at_img_seqno;
  }

  

  
  


}
