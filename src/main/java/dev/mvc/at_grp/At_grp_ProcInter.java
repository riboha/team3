package dev.mvc.at_grp;

import java.util.HashMap;
import java.util.List;

public interface At_grp_ProcInter {

  /**
   * 카테고리 그룹 생성 <xmp> <insert id="create" parameterType="At_grp_VO"> </xmp>
   * 
   * @return 생성된 카테고리 그룹 수(레코드 수)
   */
  public int create(At_grp_VO at_grp_VO);
  
  
  /**
   * 리스트 수
   *  <select id="count" resultType="int">
   * @return
   */
 public int count();
 
  
  
  /**
   * 페이징
   * <select id="list_by_at_grp_paging" resultType="at_grp_VO" parameterType="HashMap">
   * @return
   */
  public List<At_grp_VO> list_by_at_grp_paging(HashMap<String, Object> map);

  /**
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명 
   * @param categrpno 카테고리번호
   * @param search_count 검색 갯수
   * @param nowPage 현재 페이지, nowPage는 1부터 시작
   * @param word 검색어
   * @return
   */
  public String pagingBox(String listFile, int nowPage, int count);

  
  
  /**
   * 카테고리 그룹 리스트(출력순서(seqno) 오름차순) <xmp>
   * <select id="list_seq_asc" resultType="At_grp_VO"> </xmp>
   * 
   * @return
   */
  public List<At_grp_VO> list_seq_asc();
  
  /**
   * 출력 모드 변경<xmp><update id="update_visible" parameterType="At_grp_VO"></xmp>
   * @param at_grp_VO
   * @return
   */
  public int update_visible(At_grp_VO at_grp_VO);

  /**
   * 출력 순서 상향 <xmp> <update id="update_seqno_up" parameterType="int"> </xmp>
   * 
   * @return 처리된 레코드 갯수
   */

  public int update_seqno_up(int at_grp_no);

  /**
   * 출력 순서 하향 <xmp> <update id="update_seqno_down" parameterType="int"> </xmp>
   * 
   * @return 처리된 레코드 갯수
   */
  public int update_seqno_down(int at_grp_no);
  
  
  /**
   * 수정을 위한 조회<xmp><select id="read" resultType="At_grp_VO" parameterType="int"></xmp>
   * @param at_grp_no
   * @return
   */
  public At_grp_VO read(int at_grp_no);
  
  /**
   * 카테고리 그룹 수정 <xmp> <update id="update" parameterType="At_grp_VO"></xmp>
   * 
   * @param ct_grp_VO
   * @return
   */
  public int update(At_grp_VO at_grp_VO);
  
  /**
   * 카테고리 그룹 삭제
   * <xmp>delete id="delete" parameterType="int"></xmp>
   * @param at_grp_no
   * @return
   */
  public int delete(int at_grp_no);
  
  

}
