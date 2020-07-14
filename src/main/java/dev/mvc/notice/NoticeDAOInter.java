package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;


public interface NoticeDAOInter {
  /**
   * 등록 처리
   * <insert id="create" parameterType="AdminVO">
   * @param noticeVO
   * @return
   */
  public int create(NoticeVO noticeVO);
  
  /**
   * 전체 목록
   * <select id="list" resultType="NoticeVO">
   * @return
   */
  public List<NoticeVO> list();

  /**
   * 조회
   * <select id="read" resultType="NoticeVO" parameterType="int">
   * @param noticeno
   * @return
   */
  public NoticeVO read(int noticeno);
  
  /**
   * 수정 폼
   * @param noticeno
   * @return
   */
  public NoticeVO update(int noticeno);
  
  /**
   * 수정 처리
   * <update id="update" parameterType="NoticeVO">
   * @param noticeVO
   * @return
   */
  public int update(NoticeVO noticeVO);
  
  /**
   * 패스워드 검사
   * <select id="passwd_check" parameterType="HashMap" resultType="int">
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap hashMap);
  
  /**
   * 삭제
   * <delete id="delete" parameterType="int"> 
   * @param noticeno
   * @return
   */
  public int delete(int noticeno);
  
  /**
   * 출력 모드의 변경
   * <update id="update_visible" parameterType="NoticeVO">
   * @param noticeVO
   * @return
   */
  public int update_visible(NoticeVO noticeVO);
  
  /**
   * 공지사항 검색 목록
   * <xmp>
   * <select id="list_by_search" resultType="NoticeVO" parameterType="HashMap">
   * </xmp>
   * @param hashMap
   * @return
   */
  public List<NoticeVO> list_by_search(HashMap<String, Object> hashMap);

  /**
   * 공지사항 검색 레코드 갯수
   * <xmp>
   * <select id="search_count" resultType="int" parameterType="HashMap">
   * </xmp>
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * <xmp>
   * 검색 + 페이징 목록
   * <select id="list_by_search_paging" resultType="NoticeVO" parameterType="HashMap">
   * </xmp>
   * @param map
   * @return
   */
  public List<NoticeVO> list_by_search_paging(HashMap<String, Object> map);
  
  /**
   * 조회수
   * <xmp>
   * <update id="notice_cnt" parameterType="int">
   * </xmp> 
   * @param noticeno 공지 번호
   * @return
   */
  public int notice_cnt(int noticeno);
  
  
}
