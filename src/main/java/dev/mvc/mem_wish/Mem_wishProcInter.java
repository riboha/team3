package dev.mvc.mem_wish;

import java.util.HashMap;
import java.util.List;

public interface Mem_wishProcInter {
  
  /**
   * <!-- 등록 -->  
   * <insert id="create" parameterType="Mem_wishVO">
   * @param mem_wishVO
   * @return
   */
  public int create (Mem_wishVO mem_wishVO);

  

  /**
   * <!-- 목록 --> 
   * <select id="list" parameterType="int" resultType="At_Mem_wishVO">
   * @return
   */
  public List <At_Mem_wishVO> list (int mem_no);
  

  /**
   * <!-- 검색 목록 + 페이징 -->
   * <select id="list_search_paging" resultType="At_Mem_wishVO" parameterType="HashMap">
   * @param map
   * @return
   */
  public List <At_Mem_wishVO> list_search_paging (HashMap<Object, Object> map);
  

  /**
   * 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<Object, Object> hashMap);
  
  
  /**
   * 페이지 목록 문자열 생성, Box 형태 (※ DAO 호출 X ※)
   * @param listFile
   * @param search_count
   * @param nowPage
   * @param word
   * @param mem_no
   * @return
   */
  public String pagingBox (String listFile, int mem_no, int search_count, int nowPage, String word);
  

  
  /**
   * <!-- 조회 -->
   * <select id="read" parameterType="int">
   * @param mem_wish_no
   * @return
   */
   public At_Mem_wishVO  read (int mem_wish_no);
  
   
  /**
   * <!-- 수정 -->
   * <update id="update" parameterType="Mem_wishVO" resultType="At_Mem_wishVO">
   * @param mem_wishVO
   * @return
   */
  public int update (Mem_wishVO mem_wishVO);

  
  /**
   * <!-- 삭제 -->
   * <delete id="delete">
   * @param mem_wish_no
   * @return
   */
  public int delete (int mem_wish_no);

  
  /**
   * <!-- 회원별 삭제 -->
   * <delete id="delete_by_mem_no" parameterType="int">
   * @param mem_no
   * @return
   */
  public int delete_by_mem_no (int mem_no);
}
