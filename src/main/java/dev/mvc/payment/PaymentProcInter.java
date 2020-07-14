package dev.mvc.payment;

import java.util.List;

public interface PaymentProcInter {
  /**
   *  <insert id="create" parameterType="PaymentVO">
   */
   public int create(PaymentVO paymentVO);
   
   /**
    * <select id="list" resultType="PaymentVO">
    */
   public List<PaymentVO> list(int mem_no);
   
/*
   public List<At_Payment_VO> at_payment_mem_list(int mem_no);
   
 */

   public PaymentVO read(int payment_no);

   public int delete(PaymentVO paymentVO);
   
}
