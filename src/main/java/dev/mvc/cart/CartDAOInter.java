package dev.mvc.cart;

import java.util.HashMap;
import java.util.List;

public interface CartDAOInter {

	 /**
	  * 
	  * <insert id="create" parameterType="CartVO">
	  */
	public int create (CartVO cartVO);
	
	 /**
	  * 
	  * <select id="at_cart_mem_list" parameterType="int" resultMap="At_Cart_VO_Map">
	  */
	public List<At_Cart_VO> at_cart_mem_list(int mem_no);
	
  /**
   * <select id ="read" resultType="At_Cart_Mem_VO" parameterType="int">
   */
  public CartVO read(int cart_no);
  
  /**
   * <delete id="delete" parameterType=""CartVO"">
   */
  public int delete(CartVO cartVO);
  
  /**
   * <update id="update" parameterType="CartVO">
   */
  public int update(CartVO cartVO);
  
  /**
   * <select id ="cart_sum" resultType="int" >
   */
  public int cart_sum(int mem_no);
  
  
}
