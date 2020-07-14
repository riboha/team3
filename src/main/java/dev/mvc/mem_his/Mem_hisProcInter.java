package dev.mvc.mem_his;

import java.util.List;

public interface Mem_hisProcInter {
  
  /**
   * <!-- 등록 -->
   * <insert id="create" parameterType="Mem_hisVO">
   * @param mem_his_no
   * @return
   */
  public int create (int mem_his_no);

  
  /**
   * <!--목록-->
   * <select id="list" resultType="Mem_hisVO">
   * @return
   */
  public List<Mem_hisVO> list ();
  
  
  /**
   * <!-- 조회-->
   * <select id="read" parameterType="int">
   * @param mem_his_no
   * @return
   */
  public Mem_hisVO read (int mem_his_no);
  

  /**
   * <!-- 수정-->
   * <update id="update" parameterType="Mem_hisVO">
   * @param mem_hisVO
   * @return
   */
  public int update (Mem_hisVO mem_hisVO);

  
  /**
   * <!-- 삭제-->
   * <delete id="delete" parameterType="int">
   * @param mem_his_no
   * @return
   */
  public int delete (int mem_his_no);
  

}
