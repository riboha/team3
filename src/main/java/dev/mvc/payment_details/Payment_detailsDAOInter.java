package dev.mvc.payment_details;

public interface Payment_detailsDAOInter {

  /**
   * <select id ="read" resultType="Payment_detailsVO" parameterType="int">
   */
  public Payment_detailsVO read(int mem_no);
  
  /**
   * <delete id="delete" parameterType="Payment_detailsVO">
   */
  public int delete(Payment_detailsVO payment_detailsVO);
  
  
}
