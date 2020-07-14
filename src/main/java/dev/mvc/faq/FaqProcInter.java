package dev.mvc.faq;

import java.util.HashMap;
import java.util.List;

public interface FaqProcInter {
  /**
   * <xmp>
   * FAQ ��� ó��
   * <insert id="create" parameterType="FaqVO"> 
   * @param faqVO
   * @return
   * </xmp>
   */
  public int create(FaqVO faqVO);
  
  /**
   * <xmp>
   * ��� ���� �������� ��ü ���
   * <select id="list" resultType="FaqVO">
   * @return
   * </xmp>
   */
  public List<FaqVO> list_seqno_desc();
  
  /**
   * <xmp>
   * <select id="read" resultType="FaqVO" parameterType="int">  
   * @param faqno FAQ ��ȣ
   * @return
   * </xmp>
   */
  public FaqVO read(int faqno);
  
  /**
   * <xmp>
   * ���� ��
   * <update id="update" parameterType="FaqVO">
   * @param faqno
   * @return
   * </xmp>
   */
  public FaqVO update(int faqno);
  
  /**
   * <xmp>
   * ���� ó��
   * <update id="update" parameterType="FaqVO">
   * @param faqno
   * @return
   * </xmp>
   */
  public int update(FaqVO faqVO);
  
  /**
   * �н����� �˻�
   * <select id="passwd_check" parameterType="HashMap" resultType="int">
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap hashMap);
  
  /**
   * ����
   * <delete id="delete" parameterType="int"> 
   * @param noticeno
   * @return
   */
  public int delete(int faqno);
  
  /**
   * ��� ���� ����
   * <xmp>
   * <update id="update_seqno_up" parameterType="int">
   * </xmp>
   * @param faqno
   * @return ó���� ���ڵ� ����
   */
  public int update_seqno_up(int faqno);
 
  /**
   * ��� ���� ����
   * <xmp>
   * <update id="update_seqno_down" parameterType="int">
   * </xmp>
   * @param faqno
   * @return ó���� ���ڵ� ����
   */
  public int update_seqno_down(int faqno); 
  
}
