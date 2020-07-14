package dev.mvc.review;

import java.util.HashMap;
import java.util.List;

public interface ReviewProcInter {
  
  /**
   * ���� ���
   * @param reviewVO
   * @return
   */
  public int create(ReviewVO reviewVO);
  

  /**
   * ���� ��ȸ
   * @param mem_ReviewVO
   * @return
   */
  public Mem_ReviewVO read (int review_no);
  
  
  /**
   * ���� ��� (��ü)
   * @return
   */
  public List<ReviewVO> list();
  
  
  /**
   * ���� ��� (��ǰ��)
   * @param at_no
   * @return
   */
  public List<ReviewVO> list_by_at_no(int at_no);

  
  /**
   * ���� ��� (ȸ����)
   * @param mem_no
   * @return
   */
  public List<ReviewVO> list_by_mem_no(int mem_no);
  
  
  /**
   * ���� ���� (��ǰ��)
   * @param at_no
   * @return
   */
  public int count_by_at_no (int at_no);
  
  
  /**
   * ���� ���� (ȸ����)
   * @param mem_no
   * @return
   */
  public int count_by_mem_no (int mem_no);

  
  /**
   * ���� ����
   * @param reviewVO
   * @return
   */
  public int update (ReviewVO reviewVO);
  
  
  /**
   * ���� ����
   * @param review_no
   * @return
   */
  public int delete(int review_no);
  
  
  /**
   * ������ ��ư ����¡ ���� 
   * <select id="list_by_at_no_join_add_view" resultType="mem_review_VO" parameterType="HashMap" >
   * @param map
   * @return
   */
  public List<Mem_ReviewVO> list_by_at_no_join_add_view(HashMap<String, Object> map);

}
