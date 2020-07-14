package dev.mvc.at_img;

import java.util.List;

import dev.mvc.at.At_Dates_Img;

public interface At_Img_DAOInter {
  
  /**
   * 이미지등록
   */
  
  public int create(At_Dates_Img at_Dates_Img);
  
  /**
   * 이미지등록
   */
  
  public int modify(At_Dates_Img at_Dates_Img);
  
  
  /**
   * 상품 이미지 조회
   */
  
  public List<At_Dates_Img> read (int at_no);
  
  /**
   * 상품 이미지 조회 1건
   */
  
  public At_Dates_Img read_row (int at_no);
  
  
  /**
   * 상품 이미지 전체 삭제
   * 
   */
  
  public int delete(int at_no);
  
}
