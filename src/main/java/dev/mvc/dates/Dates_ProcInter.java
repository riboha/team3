package dev.mvc.dates;

import java.util.HashMap;
import java.util.List;

import dev.mvc.at.At_Dates_Img;

public interface Dates_ProcInter {
  

  /**
   * 상품페이지 모든 날짜의 재고 개수 
   * @param at_no
   * @return
   */
  
  public List<Dates_Cnt> total_dates_cnt(int at_no);
  public Dates_Cnt total_dates_cnt_for_update(int at_no);
  
  /**
   * 특정 날짜의 재고 개수 
   */
  public int specific_dates_cnt(HashMap hashmap);
  
  /**
   * 상품등록(At, Dates)
   * @param at_VO
   * @return
   */
  public int create(At_Dates_Img at_Dates_Img);
  
  /**
   * 재고추가
   * @param 
   * @return
   */
  public int add(At_Dates_Img at_Dates_Img);
  
  /**
   * 재고수정
   * @param 
   * @return
   */
  public int update(At_Dates_Img at_Dates_Img);
  
  /**재고 삭제
   * 
   * @param at_dates
   * @return
   */
  public int delete(HashMap hasmap);
  

}
