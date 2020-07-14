package dev.mvc.payment;

import java.util.List;

public interface PaymentDAOInter {
 /**
  *  <insert id="create" parameterType="PaymentVO">
  */
  public int create(PaymentVO paymentVO);
  
  /**
   * <select id="list" resultType="PaymentVO">
   */
  public List<PaymentVO> list(int mem_no);
  
  /**
   * <select id="at_payment_mem_list" parameterType="int" resultMap="At_Payment_VO_Map">
   */
  public List<At_Payment_VO> at_payment_mem_list(int mem_no);
  
  /**
   * <select id ="read" resultType="PaymentVO" parameterType="int">
   */
  public PaymentVO read(int payment_no);
  
  /**
   * <delete id="delete" parameterType="PaytmentVO">
   */
  public int delete(PaymentVO paymentVO);
  
}
