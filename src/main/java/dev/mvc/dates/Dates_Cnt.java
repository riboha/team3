package dev.mvc.dates;

public class Dates_Cnt {
  
  
/**
 * Dates테이블 셀프 조인 
 */
//  SELECT dates_date, COUNT(*) as cnt
//  FROM dates
//  WHERE at_no=1
//  GROUP BY dates_date
//  ORDER BY dates_date ASC;
//  
  
  private String dates_date;
  private int cnt;
  
  
  public String getDates_date() {
    return dates_date;
  }
  public void setDates_date(String dates_date) {
    this.dates_date = dates_date;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  
  

}
