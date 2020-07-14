package dev.mvc.review;

import java.util.HashMap;
import java.util.List;

public interface ReviewProcInter {
  
  /**
   * 리뷰 등록
   * @param reviewVO
   * @return
   */
  public int create(ReviewVO reviewVO);
  

  /**
   * 리뷰 조회
   * @param mem_ReviewVO
   * @return
   */
  public Mem_ReviewVO read (int review_no);
  
  
  /**
   * 리뷰 목록 (전체)
   * @return
   */
  public List<ReviewVO> list();
  
  
  /**
   * 리뷰 목록 (상품별)
   * @param at_no
   * @return
   */
  public List<ReviewVO> list_by_at_no(int at_no);

  
  /**
   * 리뷰 목록 (회원별)
   * @param mem_no
   * @return
   */
  public List<ReviewVO> list_by_mem_no(int mem_no);
  
  
  /**
   * 리뷰 갯수 (상품별)
   * @param at_no
   * @return
   */
  public int count_by_at_no (int at_no);
  
  
  /**
   * 리뷰 갯수 (회원별)
   * @param mem_no
   * @return
   */
  public int count_by_mem_no (int mem_no);

  
  /**
   * 리뷰 수정
   * @param reviewVO
   * @return
   */
  public int update (ReviewVO reviewVO);
  
  
  /**
   * 리뷰 삭제
   * @param review_no
   * @return
   */
  public int delete(int review_no);
  
  
  /**
   * 더보기 버튼 페이징 구현 
   * <select id="list_by_at_no_join_add_view" resultType="mem_review_VO" parameterType="HashMap" >
   * @param map
   * @return
   */
  public List<Mem_ReviewVO> list_by_at_no_join_add_view(HashMap<String, Object> map);

}
